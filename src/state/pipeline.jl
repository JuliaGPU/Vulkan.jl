struct PipelineState
    vertex_input_state::PipelineVertexInputStateCreateInfo
    input_assembly_state::PipelineInputAssemblyStateCreateInfo
    shaders::Vector{PipelineShaderStageCreateInfo}
    rasterization::PipelineRasterizationStateCreateInfo
    multisample_state::PipelineMultisampleStateCreateInfo
    color_blend_state::PipelineColorBlendStateCreateInfo
    dynamic_state
end
