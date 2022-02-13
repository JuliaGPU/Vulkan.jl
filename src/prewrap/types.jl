"""
Represents any kind of wrapper structure that was generated from a Vulkan structure.
`D` is a `Bool` parameter indicating whether the structure has specific dependencies or not.
"""
abstract type VulkanStruct{D} end

Base.broadcastable(x::VulkanStruct) = Ref(x)

const FunctionPtr = Union{Ptr{Cvoid}, Base.CFunction}
const OptionalPtr{T} = Union{T, Ptr{Cvoid}}

"""
High-level structure with idiomatic Julia types.
"""
abstract type HighLevelStruct end

"""
Represents a structure that will never be requested by API functions.
"""
abstract type ReturnedOnly <: HighLevelStruct end

Base.broadcastable(x::HighLevelStruct) = Ref(x)

hl_type(T::Type{<:HighLevelStruct}) = T
intermediate_type(T::Type{<:VulkanStruct}) = T
