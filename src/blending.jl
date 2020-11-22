abstract type BlendingMode end

struct NoBlending <: BlendingMode end

Base.@kwdef struct AlphaBlending <: BlendingMode
    factor = 1
end

PipelineColorBlendAttachmentState(::Type{NoBlending}; color_write_mask=|(COLOR_COMPONENT_R_BIT, COLOR_COMPONENT_G_BIT, COLOR_COMPONENT_B_BIT, COLOR_COMPONENT_A_BIT)) = PipelineColorBlendAttachmentState(false, BLEND_FACTOR_ONE, BLEND_FACTOR_ZERO, BLEND_OP_ADD, BLEND_FACTOR_ONE, BLEND_FACTOR_ZERO, BLEND_OP_ADD; color_write_mask)

PipelineColorBlendAttachmentState(::Type{AlphaBlending}; color_write_mask=|(COLOR_COMPONENT_R_BIT, COLOR_COMPONENT_G_BIT, COLOR_COMPONENT_B_BIT, COLOR_COMPONENT_A_BIT)) = PipelineColorBlendAttachmentState(true, BLEND_FACTOR_SRC_ALPHA, BLEND_FACTOR_ONE_MINUS_SRC_ALPHA, BLEND_OP_ADD, BLEND_FACTOR_SRC_ALPHA, BLEND_FACTOR_ONE_MINUS_SRC_ALPHA, BLEND_OP_ADD; color_write_mask)

PipelineColorBlendStateCreateInfo(attachments, rgba_blending_constants) = PipelineColorBlendStateCreateInfo(false, LOGIC_OP_COPY, attachments, rgba_blending_constants)
PipelineColorBlendStateCreateInfo(attachments, ::NoBlending) = PipelineColorBlendStateCreateInfo(attachments, (1, 1, 1, 1))
PipelineColorBlendStateCreateInfo(attachments, b::AlphaBlending) = PipelineColorBlendStateCreateInfo(attachments, (1, 1, 1, b.factor))
