module VulkanStaticArraysCoreExt

using Vulkan
using StaticArraysCore: SVector

# generated by `ext/generate_formats.jl`.

Vk.Format(::Type{SVector{2, Float16}}) = FORMAT_R16G16_SFLOAT
Vk.Format(::Type{SVector{3, Float16}}) = FORMAT_R16G16B16_SFLOAT
Vk.Format(::Type{SVector{4, Float16}}) = FORMAT_R16G16B16A16_SFLOAT
Vk.Format(::Type{SVector{2, Float32}}) = FORMAT_R32G32_SFLOAT
Vk.Format(::Type{SVector{3, Float32}}) = FORMAT_R32G32B32_SFLOAT
Vk.Format(::Type{SVector{4, Float32}}) = FORMAT_R32G32B32A32_SFLOAT
Vk.Format(::Type{SVector{2, Float64}}) = FORMAT_R64G64_SFLOAT
Vk.Format(::Type{SVector{3, Float64}}) = FORMAT_R64G64B64_SFLOAT
Vk.Format(::Type{SVector{4, Float64}}) = FORMAT_R64G64B64A64_SFLOAT

Vk.format_type(::Val{FORMAT_R16G16_SFLOAT}) = SVector{2, Float16}
Vk.format_type(::Val{FORMAT_R32G32_SFLOAT}) = SVector{2, Float32}
Vk.format_type(::Val{FORMAT_R64G64_SFLOAT}) = SVector{2, Float64}

end