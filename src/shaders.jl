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

function descriptor_set_layouts(device, shaders::AbstractVector{Shader})
    map(shaders) do shader
        if has_resources(shader)
            ds_bindings = map(enumerate(shader.resources)) do (i, resource)
                DescriptorSetLayoutBinding(i-1, resource, shader.stage)
            end
        end
        DescriptorSetLayout(device, DescriptorSetLayoutCreateInfo(ds_bindings))
    end
end
