"""
Represents any kind of wrapper structure that was generated from a Vulkan structure.
`D` is a `Bool` parameter indicating whether the structure has specific dependencies or not.
"""
abstract type VulkanStruct{D} end

"""
Opaque handle referring to internal Vulkan data.
Finalizer registration is taken care of by constructors.
"""
abstract type Handle <: VulkanStruct{false} end

"""
Represents a structure that will never be requested by API functions.
"""
abstract type ReturnedOnly <: VulkanStruct{false} end

Base.cconvert(T::Type, x::VulkanStruct) = x
Base.cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{false}}) = getproperty.(x, :vks)
Base.cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{true}}) = (x, getproperty.(x, :vks))
Base.cconvert(T::Type{<:Ptr}, x::VulkanStruct{false}) = Ref(x.vks)
Base.cconvert(T::Type{<:Ptr}, x::VulkanStruct{true}) = (x, Ref(x.vks))
Base.cconvert(T::Type{<:Ptr}, x::Handle) = x

Base.unsafe_convert(T::Type, x::VulkanStruct) = x.vks
Base.unsafe_convert(T::Type, x::Tuple{<:VulkanStruct{true}, <:Ref}) = Base.unsafe_convert(T, last(x))
Base.unsafe_convert(T::Type, x::Tuple{<:AbstractVector{<:VulkanStruct{true}}, <:Any}) = Base.unsafe_convert(T, last(x))

Base.broadcastable(x::VulkanStruct) = Ref(x)

from_vk(T::Type{<:VulkanStruct{false}}, x) = T(x)
from_vk(T::Type{<:VulkanStruct{true}}, x) = T(x, [])
