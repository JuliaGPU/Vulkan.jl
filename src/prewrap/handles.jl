"""
Opaque handle referring to internal Vulkan data.
Finalizer registration is taken care of by constructors.
"""
abstract type Handle <: VulkanStruct{false} end

Base.show(io::IO, h::Handle) = print(io, typeof(h), '(', h.vks, ')')

const RefCounter = Threads.Atomic{UInt}

increment_refcount!(handle::Handle) = Threads.atomic_add!(handle.refcount, UInt(1))
decrement_refcount!(handle::Handle) = Threads.atomic_sub!(handle.refcount, UInt(1))

function try_destroy(f, handle::Handle, parent)
    decrement_refcount!(handle)
    if iszero(handle.refcount[])
        @pref_log_destruction f(handle)
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

function (T::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor, parent::Handle)
    increment_refcount!(parent)
    init_handle!(T(ptr, parent, RefCounter(UInt(1))), destructor, parent)
end
