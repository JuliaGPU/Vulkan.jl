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
        @pref_log_destruction f(handle) ≠ handle
        if !isnothing(parent)
            parent.destructor()
        end
    end
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
