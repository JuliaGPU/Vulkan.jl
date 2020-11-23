function PipelineLayout(device, shaders::AbstractVector{Shader})
    ds_layouts = DescriptorSetLayout[]
    for shader ∈ shaders
        if has_resources(shader)
            ds_bindings = map(enumerate(shader.resources)) do (i, resource)
                DescriptorSetLayoutBinding(i-1, resource, shader.stage)
            end
        end
        ds_layout = DescriptorSetLayout(device, DescriptorSetLayoutCreateInfo(ds_bindings))
        push!(ds_layouts, ds_layout)
    end
    PipelineLayout(device, PipelineLayoutCreateInfo(ds_layouts, []))
end
