"""
Convert a type into its corresponding Vulkan type.

### Examples
```jldoctest
julia> to_vk(UInt32, v"1")
0x00400000

julia> to_vk(NTuple{6, UInt8}, "hello")
(0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x00)
```
"""
function to_vk end

to_vk(T, x) = convert(T, x)
to_vk(T::Type{<:NTuple}, x) = to_vk.(eltype(T), x)
to_vk(T::Type{UInt32}, version::VersionNumber) = VK_MAKE_VERSION(version.major, version.minor, version.patch)
to_vk(T::Type{NTuple{N,UInt8}}, s::AbstractString) where {N} = T(s * '\0' ^ (N - length(s)))

"""
Convert a Vulkan type into its corresponding Julia type.

### Examples
```jldoctest
julia> from_vk(VersionNumber, UInt32(vk.VK_MAKE_VERSION(1, 2, 3)))
v"1.2.3"

julia> from_vk(String, (0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x00))
"hello"

julia> from_vk(Bool, UInt32(1))
true
```
"""
function from_vk end

from_vk(T::Type{<:VulkanStruct{false}}, x) = T(x)
from_vk(T::Type{<:VulkanStruct{true}}, x) = T(x, [])
from_vk(T, x) = convert(T, x)
from_vk(T::Type{<:NTuple}, x) = from_vk.(eltype(T), x)
from_vk(T::Type{VersionNumber}, version::UInt32) = T(VK_VERSION_MAJOR(version), VK_VERSION_MINOR(version), VK_VERSION_PATCH(version))

function from_vk(T::Type{S}, str::NTuple{N,UInt8}) where {N,S <: AbstractString}
    nullchar = findfirst(iszero, str)
    if isnothing(nullchar)
        T(collect(str))
    else
        T(collect(str[1:nullchar - 1]))
    end
end
