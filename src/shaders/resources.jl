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

struct UniformBuffer <: ShaderResource end

Base.convert(::Type{VkDescriptorType}, ::UniformBuffer) = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER
