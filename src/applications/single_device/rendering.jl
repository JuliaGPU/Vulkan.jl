add_render_pass!(app::VulkanApplication, render_pass::RenderPass) = app.render_pass = render_pass

function add_render_pass!(app::VulkanApplication, render_pass_type::RenderPassPresent{Target{Swapchain}})
    color_attachment = AttachmentDescription(app.swapchain.format, SAMPLE_COUNT_1_BIT, ATTACHMENT_LOAD_OP_CLEAR, ATTACHMENT_STORE_OP_STORE, ATTACHMENT_LOAD_OP_DONT_CARE, ATTACHMENT_STORE_OP_DONT_CARE, IMAGE_LAYOUT_UNDEFINED, IMAGE_LAYOUT_PRESENT_SRC_KHR)
    add_render_pass!(app, create_render_pass(app.device, color_attachment))
end

function prepare_rendering_to_target!(app::VulkanApplication, t::Target)
    add_render_pass!(app, RenderPassPresent(t))
    add_framebuffers!(app, t)
    setup_viewport!(app)
end
