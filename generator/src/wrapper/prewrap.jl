"""
Represents any kind of wrapper structure that was generated from a Vulkan structure.
"""
abstract type VulkanStruct end

"""
Opaque handle referring to internal Vulkan data.
Finalizer registration is taken care of by constructors.
"""
abstract type Handle <: VulkanStruct end

"""
Represents a structure that will never be requested by API functions.
"""
abstract type ReturnedOnly <: VulkanStruct end

Base.cconvert(T::Type, x::VulkanStruct) = x
Base.cconvert(T::Type{<: Ptr}, x::AbstractArray{<: VulkanStruct}) = getproperty.(x, :vks)
Base.cconvert(T::Type{<: Ptr}, x::AbstractArray{<: Handle}) = getproperty.(x, :handle)
Base.cconvert(T::Type{<: Ptr}, x::VulkanStruct) = Ref(x.vks)
Base.cconvert(T::Type{<: Ptr}, x::Handle) = x

Base.unsafe_convert(T::Type, x::VulkanStruct) = x.vks
Base.unsafe_convert(T::Type{Ptr{Nothing}}, x::Handle) = x.handle

Base.broadcastable(x::VulkanStruct) = Ref(x) # indicate that VulkanStructs behave as scalars for broadcasting
