module VulkanColorTypesExt

using Vulkan: Vk
using ColorTypes
using ColorTypes.FixedPointNumbers

# DataType <-> Vk.Format conversions were generated with ./generate_formats.jl

Vk.Format(::Type{RGB{N0f8}}) = Vk.FORMAT_R8G8B8_UNORM
Vk.Format(::Type{RGB{Q0f7}}) = Vk.FORMAT_R8G8B8_SNORM
Vk.Format(::Type{BGR{N0f8}}) = Vk.FORMAT_B8G8R8_UNORM
Vk.Format(::Type{BGR{Q0f7}}) = Vk.FORMAT_B8G8R8_SNORM
Vk.Format(::Type{RGBA{N0f8}}) = Vk.FORMAT_R8G8B8A8_UNORM
Vk.Format(::Type{RGBA{Q0f7}}) = Vk.FORMAT_R8G8B8A8_SNORM
Vk.Format(::Type{BGRA{N0f8}}) = Vk.FORMAT_B8G8R8A8_UNORM
Vk.Format(::Type{BGRA{Q0f7}}) = Vk.FORMAT_B8G8R8A8_SNORM
Vk.Format(::Type{RGB{N0f16}}) = Vk.FORMAT_R16G16B16_UNORM
Vk.Format(::Type{RGB{Q0f15}}) = Vk.FORMAT_R16G16B16_SNORM
Vk.Format(::Type{RGB{Float16}}) = Vk.FORMAT_R16G16B16_SFLOAT
Vk.Format(::Type{RGBA{N0f16}}) = Vk.FORMAT_R16G16B16A16_UNORM
Vk.Format(::Type{RGBA{Q0f15}}) = Vk.FORMAT_R16G16B16A16_SNORM
Vk.Format(::Type{RGBA{Float16}}) = Vk.FORMAT_R16G16B16A16_SFLOAT
Vk.Format(::Type{RGB{Float32}}) = Vk.FORMAT_R32G32B32_SFLOAT
Vk.Format(::Type{RGBA{Float32}}) = Vk.FORMAT_R32G32B32A32_SFLOAT
Vk.Format(::Type{RGB{Float64}}) = Vk.FORMAT_R64G64B64_SFLOAT
Vk.Format(::Type{RGBA{Float64}}) = Vk.FORMAT_R64G64B64A64_SFLOAT

Vk.format_type(::Val{Vk.FORMAT_R8G8B8_UNORM}) = RGB{N0f8}
Vk.format_type(::Val{Vk.FORMAT_R8G8B8_SNORM}) = RGB{Q0f7}
Vk.format_type(::Val{Vk.FORMAT_B8G8R8_UNORM}) = BGR{N0f8}
Vk.format_type(::Val{Vk.FORMAT_B8G8R8_SNORM}) = BGR{Q0f7}
Vk.format_type(::Val{Vk.FORMAT_R8G8B8A8_UNORM}) = RGBA{N0f8}
Vk.format_type(::Val{Vk.FORMAT_R8G8B8A8_SNORM}) = RGBA{Q0f7}
Vk.format_type(::Val{Vk.FORMAT_B8G8R8A8_UNORM}) = BGRA{N0f8}
Vk.format_type(::Val{Vk.FORMAT_B8G8R8A8_SNORM}) = BGRA{Q0f7}
Vk.format_type(::Val{Vk.FORMAT_R16G16B16_UNORM}) = RGB{N0f16}
Vk.format_type(::Val{Vk.FORMAT_R16G16B16_SNORM}) = RGB{Q0f15}
Vk.format_type(::Val{Vk.FORMAT_R16G16B16_SFLOAT}) = RGB{Float16}
Vk.format_type(::Val{Vk.FORMAT_R16G16B16A16_UNORM}) = RGBA{N0f16}
Vk.format_type(::Val{Vk.FORMAT_R16G16B16A16_SNORM}) = RGBA{Q0f15}
Vk.format_type(::Val{Vk.FORMAT_R16G16B16A16_SFLOAT}) = RGBA{Float16}
Vk.format_type(::Val{Vk.FORMAT_R32G32B32_SFLOAT}) = RGB{Float32}
Vk.format_type(::Val{Vk.FORMAT_R32G32B32A32_SFLOAT}) = RGBA{Float32}
Vk.format_type(::Val{Vk.FORMAT_R64G64B64_SFLOAT}) = RGB{Float64}
Vk.format_type(::Val{Vk.FORMAT_R64G64B64A64_SFLOAT}) = RGBA{Float64}

end
