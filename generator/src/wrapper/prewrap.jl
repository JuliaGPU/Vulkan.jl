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
Base.cconvert(T::Type{<: Ptr}, x::AbstractVector{<: VulkanStruct}) = (x, getproperty.(x, :vks))
Base.cconvert(T::Type{<: Ptr}, x::AbstractVector{<: Handle}) = getproperty.(x, :handle)
Base.cconvert(T::Type{<: Ptr}, x::VulkanStruct) = (x, Ref(x.vks))
Base.cconvert(T::Type{<: Ptr}, x::Handle) = x

Base.unsafe_convert(T::Type, x::VulkanStruct) = x.vks
Base.unsafe_convert(T::Type, x::Tuple{<:VulkanStruct, <:Ref}) = Base.unsafe_convert(T, last(x))
Base.unsafe_convert(T::Type, x::Tuple{<:AbstractVector{<:VulkanStruct}, <:Any}) = Base.unsafe_convert(T, last(x))
Base.unsafe_convert(T::Type{Ptr{Nothing}}, x::Handle) = x.handle

Base.broadcastable(x::VulkanStruct) = Ref(x)
