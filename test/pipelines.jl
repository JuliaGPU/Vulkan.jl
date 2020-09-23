abstract type BlendingMode end

struct NoBlending <: BlendingMode end
struct AlphaBlending <: BlendingMode end

Vulkan.PipelineColorBlendAttachmentState(::NoBlending; color_write_mask=|(COLOR_COMPONENT_R_BIT, COLOR_COMPONENT_G_BIT, COLOR_COMPONENT_B_BIT, COLOR_COMPONENT_A_BIT)) = PipelineColorBlendAttachmentState(false, BLEND_FACTOR_ONE, BLEND_FACTOR_ZERO, BLEND_OP_ADD, BLEND_FACTOR_ONE, BLEND_FACTOR_ZERO, BLEND_OP_ADD; color_write_mask)

Vulkan.PipelineColorBlendAttachmentState(::AlphaBlending; color_write_mask=|(COLOR_COMPONENT_R_BIT, COLOR_COMPONENT_G_BIT, COLOR_COMPONENT_B_BIT, COLOR_COMPONENT_A_BIT)) = PipelineColorBlendAttachmentState(true, BLEND_FACTOR_SRC_ALPHA, BLEND_FACTOR_ONE_MINUS_SRC_ALPHA, BLEND_OP_ADD, BLEND_FACTOR_SRC_ALPHA, BLEND_FACTOR_ONE_MINUS_SRC_ALPHA, BLEND_OP_ADD; color_write_mask)


Vulkan.PipelineColorBlendStateCreateInfo(attachments, ::NoBlending) = PipelineColorBlendStateCreateInfo(false, LOGIC_OP_COPY, attachments, (0, 0, 0, 0))

struct PipelineState
    vertex_input_state::PipelineVertexInputStateCreateInfo
    input_assembly_state::PipelineInputAssemblyStateCreateInfo
    shaders::Vector{PipelineShaderStageCreateInfo}
    rasterization::PipelineRasterizationStateCreateInfo
    multisample_state::PipelineMultisampleStateCreateInfo
    color_blend_state::PipelineColorBlendStateCreateInfo
    dynamic_state
end