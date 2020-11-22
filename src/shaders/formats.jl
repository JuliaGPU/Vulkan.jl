"""
Format to which the shader conforms. It can be a text format (with a language such as GLSL or HLSL),
or a binary format (such as SPIR-V).
"""
abstract type ShaderFormat end

Base.broadcastable(x::ShaderFormat) = Ref(x)

"""
Human-readable shader format, usually written in a shading language
such as GLSL or HLSL.
"""
abstract type TextFormat <: ShaderFormat end

"""
Efficient format that requires disassembly by a specialized program to be human-readable.
"""
abstract type BinaryFormat <: ShaderFormat end

"""
OpenGL Shading Language format.
"""
struct GLSL <: TextFormat end

"""
High Level Shading Language format, used by DirectX.
"""
struct HLSL <: TextFormat end

"""
Standard Portable Intermediate Representation format, from The Khronos Group.
"""
struct SPIRV <: BinaryFormat end

stage_file_ext(::Type{GLSL}, ::Type{VertexStage}) = "vert"
stage_file_ext(::Type{GLSL}, ::Type{TessellationControlStage}) = "tesc"
stage_file_ext(::Type{GLSL}, ::Type{TessellationEvaluationStage}) = "tese"
stage_file_ext(::Type{GLSL}, ::Type{GeometryStage}) = "geom"
stage_file_ext(::Type{GLSL}, ::Type{FragmentStage}) = "frag"
stage_file_ext(::Type{HLSL}, stage) = stage_file_ext(GLSL, stage)

const stage_from_file_ext_glsl_dict = Dict(
    ".vert" => VertexStage(),
    ".tesc" => TessellationControlStage(),
    ".tese" => TessellationEvaluationStage(),
    ".geom" => GeometryStage(),
    ".frag" => FragmentStage(),
)

const format_from_file_ext_dict = Dict(
    ".spv" => SPIRV(),
    ".glsl" => GLSL(),
    ".hlsl" => HLSL(),
)

"""
    stage_from_file_ext(shader_file, GLSL())

Automatically detect a [`ShaderStage`](@ref) from the file extension.
Can only be used with [`GLSL`](@ref) and [`HLSL`](@ref).

## Examples

```julia
julia> stage_from_file_ext("my_shader.frag", GLSL())
FragmentStage()

julia> stage_from_file_ext("my_shader.geom", HLSL())
GeometryStage()
```
"""
stage_from_file_ext(file, ::GLSL) = stage_from_file_ext_glsl_dict[file]
stage_from_file_ext(file, ::HLSL) = stage_from_file_ext(file, GLSL())

"""
    format_from_file_ext(file_ext)

Automatically detect a [`ShaderFormat`](@ref) from the file extension.
Currently, only .spv, .glsl and .hlsl are recognized, mapping to
`SPIRV()`, `GLSL()` and `HLSL()`. 

## Examples

```julia
julia> format_from_file_ext("my_shader.glsl")
GLSL()
julia> format_from_file_ext("my_shader.spv")
SPIRV()
```
"""
function format_from_file_ext(file_ext)
    ext == ".spv" && return SPIRV()
    ext == ".glsl" && return GLSL()
    ext == ".hlsl" && return HLSL()
    error("Cannot retrieve shader format from filename $file; please specify it manually.")
end
