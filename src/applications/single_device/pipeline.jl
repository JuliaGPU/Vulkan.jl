PipelineViewportStateCreateInfo(app::VulkanApplication) = PipelineViewportStateCreateInfo(viewports=[app.viewport.viewport], scissors=[app.viewport.scissor])

create_pipeline!(ps::PipelineSetup, app::VulkanApplication) = create_pipeline!(ps, app.device, app.render_pass, PipelineViewportStateCreateInfo(app))

function recreate_pipeline!(ps::PipelineSetup, app::VulkanApplication)
    finalize(ps.handle)
    create_pipeline!(ps, app)
end
