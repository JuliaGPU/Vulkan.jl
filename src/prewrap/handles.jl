"""
Opaque handle referring to internal Vulkan data.
Finalizer registration is taken care of by constructors.
"""
abstract type Handle <: VulkanStruct{false} end

Base.show(io::IO, h::Handle) = print(io, typeof(h), '(', h.vks, ')')

const RefCounter = Threads.Atomic{UInt}

increment_refcount!(handle::Handle) = Threads.atomic_add!(handle.refcount, UInt(1))
decrement_refcount!(handle::Handle) = Threads.atomic_sub!(handle.refcount, UInt(1))

function try_destroy(f, handle::Handle)
    decrement_refcount!(handle)
    if handle.refcount == 0
        f(handle)
    end
end

function (T::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor)
    handle = T(ptr, RefCounter(UInt(1)))
    handle.destructor = () -> try_destroy(destructor, handle)
    finalizer(x -> handle.destructor(), handle)
end

function (T::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor, parent::Handle)
    increment_refcount!(parent)
    finalizer(x -> parent.destructor(), T(ptr, destructor))
end
