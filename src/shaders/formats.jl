abstract type ShaderFormat end

Base.broadcastable(x::ShaderFormat) = Ref(x)

abstract type TextFormat <: ShaderFormat end
abstract type BinaryFormat <: ShaderFormat end

struct GLSL <: TextFormat end
struct HLSL <: TextFormat end

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
    `stage_from_file_ext(shader_file)`

Return a [`ShaderStage`](@ref) type from a given file extension

## Examples

```julia
julia> stage_from_file_ext("my_shader.frag")
  FragmentStage

julia> stage_from_file_ext("geom")
  GeometryStage

julia> stage_from_file_ext(".tesc")
  TessellationControlStage
```

"""
stage_from_file_ext(file, ::GLSL) = stage_from_file_ext_glsl_dict[file]
stage_from_file_ext(file, ::HLSL) = stage_from_file_ext(file, GLSL())

function format_from_file_ext(file_ext)
    ext == ".spv" && return SPIRV()
    ext == ".glsl" && return GLSL()
    ext == ".hlsl" && return HLSL()
    error("Cannot retrieve shader format from filename $file; please specify it manually.")
end
