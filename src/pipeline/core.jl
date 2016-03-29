

function GraphicsPipeline(layout, renderpass, stages)

    CreateGraphicsPipelines(device, pipelineCache, 1, create_info_arr, C_NULL, (
        # The layout used for this pipeline
        :layout, layout,
        # Renderpass this pipeline is attached to
        :renderPass, renderpass,
        # Assign states
        # Two shader stages
        :stageCount, length(stages),
        :pStages, stages,
        :pVertexInputState, vertices,
        # Assign pipeline state create information
        :pInputAssemblyState, inputAssemblyState,
        :pRasterizationState, rasterizationState,
        :pColorBlendState, colorBlendState,
        :pMultisampleState, multisampleState,
        :pViewportState, viewportState,
        :pDepthStencilState, depthStencilState,
        :pDynamicState, dynamicState,
    ))

end
