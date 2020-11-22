include("shaders/stages.jl")
include("shaders/formats.jl")
include("shaders/resources.jl")
include("shaders/conversions.jl")
include("shaders/compilation.jl")

struct Shader
    mod::ShaderModule
    stage::ShaderStage
    entry_point::Symbol
end

Shader(mod, stage) = Shader(mod, stage, :main)
Shader(device, shader::ShaderFile) = Shader(ShaderModule(device, shader), shader.stage)

const stage_to_bits = Dict(
    VertexStage => SHADER_STAGE_VERTEX_BIT,
    TessellationControlStage => SHADER_STAGE_TESSELLATION_CONTROL_BIT,
    TessellationEvaluationStage => SHADER_STAGE_TESSELLATION_EVALUATION_BIT,
    GeometryStage => SHADER_STAGE_GEOMETRY_BIT,
    FragmentStage => SHADER_STAGE_FRAGMENT_BIT,
)

PipelineShaderStageCreateInfo(shader::Shader) = PipelineShaderStageCreateInfo(stage_to_bits[typeof(shader.stage)], shader.mod, string(shader.entry_point))
