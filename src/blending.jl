PipelineColorBlendAttachmentState(::NoBlending; color_write_mask=|(COLOR_COMPONENT_R_BIT, COLOR_COMPONENT_G_BIT, COLOR_COMPONENT_B_BIT, COLOR_COMPONENT_A_BIT)) = PipelineColorBlendAttachmentState(false, BLEND_FACTOR_ONE, BLEND_FACTOR_ZERO, BLEND_OP_ADD, BLEND_FACTOR_ONE, BLEND_FACTOR_ZERO, BLEND_OP_ADD; color_write_mask)

PipelineColorBlendAttachmentState(::AlphaBlending; color_write_mask=|(COLOR_COMPONENT_R_BIT, COLOR_COMPONENT_G_BIT, COLOR_COMPONENT_B_BIT, COLOR_COMPONENT_A_BIT)) = PipelineColorBlendAttachmentState(true, BLEND_FACTOR_SRC_ALPHA, BLEND_FACTOR_ONE_MINUS_SRC_ALPHA, BLEND_OP_ADD, BLEND_FACTOR_SRC_ALPHA, BLEND_FACTOR_ONE_MINUS_SRC_ALPHA, BLEND_OP_ADD; color_write_mask)

PipelineColorBlendStateCreateInfo(attachments, ::NoBlending) = PipelineColorBlendStateCreateInfo(false, LOGIC_OP_COPY, attachments, (0, 0, 0, 0))

