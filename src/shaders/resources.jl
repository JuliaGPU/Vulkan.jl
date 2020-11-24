"""
    ShaderFile(file, format)
    ShaderFile(file, stage)

Shader resource as a file.
If one of the format or stage is not provided but the other is, then the former
will be retrieved from the file extension, if possible, or an error will be thrown.

## Examples

```julia
julia> ShaderFile("my_shader.geom", GLSL())
ShaderFile{GLSL}

julia> ShaderFile("my_shader.glsl", GeometryStage())
ShaderFile{GLSL}
```
"""
struct ShaderFile{F<:ShaderFormat}
    file::String
    format::F
    stage::ShaderStage
end

ShaderFile(file, format::TextFormat) = ShaderFile(file, format, stage_from_file_ext(last(splitext(file)), format))
ShaderFile(file, stage::ShaderStage) = ShaderFile(file, format_from_file_ext(last(splitext(file))), stage)

"""
External resource to be used by shader programs.
Comprises uniform buffers, samplers, and textures.
"""
abstract type ShaderResource end

Base.broadcastable(x::ShaderResource) = Ref(x)

struct SampledImage <: ShaderResource end
struct ImageSampler <: ShaderResource end
struct CombinedImageSampler <: ShaderResource end
struct UniformBuffer <: ShaderResource end
struct UniformBufferDynamic <: ShaderResource end
struct UniformTexelBuffer <: ShaderResource end
struct StorageImage <: ShaderResource end
struct StorageBuffer <: ShaderResource end
struct StorageBufferDynamic <: ShaderResource end
struct StorageTexelBuffer <: ShaderResource end
struct InputAttachment <: ShaderResource end

Base.convert(::Type{VkDescriptorType}, ::SampledImage) =  DESCRIPTOR_TYPE_SAMPLED_IMAGE
Base.convert(::Type{VkDescriptorType}, ::ImageSampler) =  DESCRIPTOR_TYPE_SAMPLER
Base.convert(::Type{VkDescriptorType}, ::CombinedImageSampler) =  DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER
Base.convert(::Type{VkDescriptorType}, ::UniformBuffer) = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER
Base.convert(::Type{VkDescriptorType}, ::UniformBufferDynamic) =  DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC
Base.convert(::Type{VkDescriptorType}, ::UniformTexelBuffer) =  DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER
Base.convert(::Type{VkDescriptorType}, ::StorageImage) =  DESCRIPTOR_TYPE_STORAGE_IMAGE
Base.convert(::Type{VkDescriptorType}, ::StorageBuffer) =  DESCRIPTOR_TYPE_STORAGE_BUFFER
Base.convert(::Type{VkDescriptorType}, ::StorageBufferDynamic) =  DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC
Base.convert(::Type{VkDescriptorType}, ::StorageTexelBuffer) =  DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER
Base.convert(::Type{VkDescriptorType}, ::InputAttachment) =  DESCRIPTOR_TYPE_INPUT_ATTACHMENT

struct ResourceBinding{R<:ShaderResource}
    resource::R
    set
    binding
end

Base.broadcastable(x::ResourceBinding) = Ref(x)
