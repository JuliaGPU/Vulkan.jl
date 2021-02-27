"""
Represents any kind of wrapper structure that was generated from a Vulkan structure.
`D` is a `Bool` parameter indicating whether the structure has specific dependencies or not.
"""
abstract type VulkanStruct{D} end

Base.broadcastable(x::VulkanStruct) = Ref(x)

"""
Represents a structure that will never be requested by API functions.
"""
abstract type ReturnedOnly <: VulkanStruct{false} end

const FunctionPtr = Union{Ptr{Cvoid}, Base.CFunction}
