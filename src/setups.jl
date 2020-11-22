function GraphicsPipelineCreateInfo(ps::PipelineSetup, render_pass, viewport_state)
    s = ps.stages
    @unpack vertex_input_state, input_assembly_state, color_blend_state, multisample_state, dynamic_state = s
    GraphicsPipelineCreateInfo(s.shaders, s.rasterization, ps.layout, render_pass, 0, 0; vertex_input_state, input_assembly_state, color_blend_state, viewport_state, multisample_state, dynamic_state)
end

create_pipeline!(ps::PipelineSetup, device, render_pass, viewport_state) = setproperty!(ps, :handle, first(Pipeline(device, [GraphicsPipelineCreateInfo(ps, render_pass, viewport_state)])))
create_pipelines!(device, render_pass, viewport_state, pss::PipelineSetup...) = setproperty!.(pss, :handle, Pipeline(GraphicsPipelineCreateInfo.(pss, render_pass, viewport_state)))


function recreate_pipeline!(ps::PipelineSetup, app)
    finalize(ps.handle)
    create_pipeline!(ps, app)
end

"""
By default, the extent is taken as the application swapchain extent, but a custom value can be provided instead.
"""

function create_render_pass(device, color_attachment)
    color_attachment_ref = AttachmentReference(0, IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL)
    subpass = SubpassDescription(PIPELINE_BIND_POINT_GRAPHICS, [], [color_attachment_ref], [])
    RenderPass(device, RenderPassCreateInfo([color_attachment], [subpass], [SubpassDependency(SUBPASS_EXTERNAL, 0, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT; src_access_mask=0, dst_access_mask=ACCESS_COLOR_ATTACHMENT_WRITE_BIT)]))
end
