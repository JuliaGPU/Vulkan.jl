"""
Opaque handle referring to internal Vulkan data.
Finalizer registration is taken care of by constructors.
"""
abstract type Handle <: VulkanStruct{false} end

Base.:(==)(x::H, y::H) where {H<:Handle} = x.vks == y.vks
Base.hash(handle::Handle, h::UInt) = hash(handle.vks, h)

Base.show(io::IO, h::Handle) = print(io, typeof(h), '(', h.vks, ')')

handle(h::Handle) = h

const RefCounter = Threads.Atomic{UInt}

function increment_refcount!(handle::Handle)
    @pref_log_refcount Threads.atomic_add!(handle.refcount, UInt(1))
end

function decrement_refcount!(handle::Handle)
    @pref_log_refcount Threads.atomic_sub!(handle.refcount, UInt(1))
end

function try_destroy(f, handle::Handle, parent)
    decrement_refcount!(handle)
    if iszero(handle.refcount[])
        @pref_log_destruction handle f(handle) ≠ handle
        if !isnothing(parent) && !isa(parent.destructor, UndefInitializer)
            parent.destructor()
        end
        return true
    end
    handle.refcount[]
end

function init_handle!(handle::Handle, destructor, parent=nothing)
    handle.destructor = () -> try_destroy(destructor, handle, parent)
    finalizer(x -> handle.destructor(), handle)
end

function (T::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor)
    init_handle!(T(ptr, RefCounter(UInt(1))), destructor)
end

function (T::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor, parent)
    parent = handle(parent)
    increment_refcount!(parent)
    init_handle!(T(ptr, parent, RefCounter(UInt(1))), destructor, parent)
end

"""
    depends_on(x, handle::Handle)

Make reference counting aware that `x` depends on `handle`.

This ensures that `handle` is destroyed *after* `x`, and not the other way around.

This may notably be used to encode dependencies that fall out of Vulkan's handle hierarchy,
such as between a `SurfaceKHR` and a `SwapchainKHR`.

If `x` is not a `Handle`, it must be a mutable object; in this case, a finalizer will be added
which decrements the `handle`'s reference count (and destroys them if it reaches zero).

`depends_on(x, handle)` is idempotent: multiple calls to it will simply incur needless incrementing/decrementing and finalizer registrations, possibly harming performance, but will not cause bugs.

If one is a parent handle of the other (i.e. `Vk.parent(x) === handle`), `depends_on(x, handle)` is already implicit, and needs not be used.

!!! warning
    `depends_on` must not be used in a circular manner: using both `depends_on(x, y)` and `depends_on(y, x)` will prevent both `x` and `y` from ever being destroyed. Same for `depends_on(x, y)`, `depends_on(y, z)`, `depends_on(z, x)` and so on.
"""
function depends_on end

function depends_on(x::Vk.Handle, handle::Vk.Handle)
  Vk.increment_refcount!(handle)
  prev_destructor = x.destructor
  x.destructor = () -> begin
    prev_destructor()
    iszero(x.refcount[]) && handle.destructor()
  end
  nothing
end

function depends_on(x, handle::Vk.Handle)
    T = typeof(x)
    ismutabletype(T) || error("`x` must be a mutable object or a `Vk.Handle`")
    finalizer(_ -> handle.destructor(), x)
    nothing
end

macro dispatch(handle, expr)
    if @load_preference("USE_DISPATCH_TABLE", "true") == "true"
        @match expr begin
            :($f($(args...))) => begin
                quote
                    fptr = function_pointer(global_dispatcher[], $(esc(handle)), $(QuoteNode(f)))
                    $f($(esc.(args)...), fptr)
                end
            end
            _ => error("Expected a function call, got $expr")
        end
    else
        esc(expr)
    end
end

"""
Obtain a function pointer from `source` and `handle`, and append the retrieved pointer to the function call arguments of `expr`.

No effect if the preference "USE_DISPATCH_TABLE" is not enabled.
"""
macro dispatch(source, handle, expr)
    handle = esc(handle)
    if @load_preference("USE_DISPATCH_TABLE", "true") == "true"
        @match expr begin
            :($f($(args...); $(kwargs...))) => quote
                fptr = function_pointer(global_dispatcher[], $handle, $(QuoteNode(source)))
                $f($(esc.(args)...), fptr; $(esc.(kwargs)...))
            end
            _ => error("Expected a function call, got $expr")
        end
    else
        esc(expr)
    end
end

macro fill_dispatch_table(handle)
    handle = esc(handle)
    @load_preference("USE_DISPATCH_TABLE", "true") ≠ "true" && return handle
    quote
        handle = $handle
        fill_dispatch_table(handle)
        handle
    end
end
