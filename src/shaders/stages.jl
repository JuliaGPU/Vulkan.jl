abstract type ShaderStage end

struct VertexStage <: ShaderStage end
struct TessellationControlStage <: ShaderStage end
struct TessellationEvaluationStage <: ShaderStage end
struct GeometryStage <: ShaderStage end
struct FragmentStage <: ShaderStage end

stage_file_ext(::Type{GLSL}, ::Type{VertexStage}) = "vert"
stage_file_ext(::Type{GLSL}, ::Type{TessellationControlStage}) = "tesc"
stage_file_ext(::Type{GLSL}, ::Type{TessellationEvaluationStage}) = "tese"
stage_file_ext(::Type{GLSL}, ::Type{GeometryStage}) = "geom"
stage_file_ext(::Type{GLSL}, ::Type{FragmentStage}) = "frag"
stage_file_ext(::Type{HLSL}, stage) = stage_file_ext(GLSL, stage)

const stage_from_file_ext_dict = Dict(
    "vert" => VertexStage,
    "tesc" => TessellationControlStage,
    "tese" => TessellationEvaluationStage,
    "geom" => GeometryStage,
    "frag" => FragmentStage,
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
function stage_from_file_ext(file)
    if startswith(file, ".")
        stage_from_file_ext_dict[stage[2:end]]
    elseif !occursin(".", file)
        stage_from_file_ext_dict[stage]
    else
        stage_from_file_ext_dict[last(splitext(stage))]
    end
end
