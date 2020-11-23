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

Shader(device, shader::ShaderFile, resources=ShaderResource[]; kwargs...) = Shader(mod=ShaderModule(device, shader), stage=shader.stage; resources, kwargs...)

has_resources(shader::Shader) = !isempty(shader.resources)

PipelineShaderStageCreateInfo(shader::Shader) = PipelineShaderStageCreateInfo(shader.stage, shader.mod, string(shader.entry_point))

function DescriptorSetLayout(device, shader::Shader)
    ds_bindings = map(enumerate(shader.resources)) do (i, resource)
        DescriptorSetLayoutBinding(i-1, resource, shader.stage)
    end
    DescriptorSetLayout(device, DescriptorSetLayoutCreateInfo(ds_bindings))
end
