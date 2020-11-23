include("shaders/stages.jl")
include("shaders/formats.jl")
include("shaders/resources.jl")
include("shaders/conversions.jl")
include("shaders/compilation.jl")

@with_kw struct Shader
    mod::ShaderModule
    stage::ShaderStage
    entry_point::Symbol = :main
    resources::AbstractVector{<:ShaderResource} = ShaderResource[]
end

Shader(device, shader::ShaderFile; kwargs...) = Shader(mod=ShaderModule(device, shader), stage=shader.stage; kwargs...)

has_resources(shader::Shader) = !isempty(shader.resources)

PipelineShaderStageCreateInfo(shader::Shader) = PipelineShaderStageCreateInfo(shader.stage, shader.mod, string(shader.entry_point))
