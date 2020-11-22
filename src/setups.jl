function GraphicsPipelineCreateInfo(ps::PipelineSetup, render_pass, viewport_state)
    s = ps.stages
    @unpack vertex_input_state, input_assembly_state, color_blend_state, multisample_state, dynamic_state = s
    GraphicsPipelineCreateInfo(s.shaders, s.rasterization, ps.layout, render_pass, 0, 0; vertex_input_state, input_assembly_state, color_blend_state, viewport_state, multisample_state, dynamic_state)
end

PipelineViewportStateCreateInfo(app::VulkanApplication) = PipelineViewportStateCreateInfo(viewports=[app.viewport.viewport], scissors=[app.viewport.scissor])
create_pipeline!(ps::PipelineSetup, device, render_pass, viewport_state) = setproperty!(ps, :handle, first(Pipeline(device, [GraphicsPipelineCreateInfo(ps, render_pass, viewport_state)])))
create_pipeline!(ps::PipelineSetup, app::VulkanApplication) = create_pipeline!(ps, app.device, app.render_pass, PipelineViewportStateCreateInfo(app))
create_pipelines!(device, render_pass, viewport_state, pss::PipelineSetup...) = setproperty!.(pss, :handle, Pipeline(GraphicsPipelineCreateInfo.(pss, render_pass, viewport_state)))


function recreate_pipeline!(ps::PipelineSetup, app)
    finalize(ps.handle)
    create_pipeline!(ps, app)
end

"""
By default, the extent is taken as the application swapchain extent, but a custom value can be provided instead.
"""
setup_viewport!(app::VulkanApplication; offset=(0, 0), custom_extent=nothing) = setup_viewport!(app, isnothing(custom_extent) ? (app.swapchain.extent.vks.width, app.swapchain.extent.vks.height) : custom_extent; offset)

"""
Setup the application viewport.
"""
function setup_viewport!(app::VulkanApplication, extent; offset=(0, 0))
    scissor = Rect2D(Offset2D(offset...), Extent2D(extent...))
    viewport = Viewport(0., 0., extent..., 0., 1.) 
    app.viewport = ViewportState(viewport, scissor)
end

function add_render_pass!(app::VulkanApplication, render_pass_type::RenderPassPresent{Target{Swapchain}})
    color_attachment = AttachmentDescription(app.swapchain.format, SAMPLE_COUNT_1_BIT, ATTACHMENT_LOAD_OP_CLEAR, ATTACHMENT_STORE_OP_STORE, ATTACHMENT_LOAD_OP_DONT_CARE, ATTACHMENT_STORE_OP_DONT_CARE, IMAGE_LAYOUT_UNDEFINED, IMAGE_LAYOUT_PRESENT_SRC_KHR)
    add_render_pass!(app, create_render_pass(app.device, color_attachment))
end

function add_framebuffers!(app::VulkanApplication, ::Target{Swapchain})
    framebuffer_cis = FramebufferCreateInfo.(app.render_pass, [[view] for view ∈ app.swapchain.image_views], app.swapchain.extent.vks.width, app.swapchain.extent.vks.height, 1)
    framebuffers = Framebuffer.(app.device, framebuffer_cis)
    add_framebuffers!(app, framebuffers)
end

function create_render_pass(device, color_attachment)
    color_attachment_ref = AttachmentReference(0, IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL)
    subpass = SubpassDescription(PIPELINE_BIND_POINT_GRAPHICS, [], [color_attachment_ref], [])
    RenderPass(device, RenderPassCreateInfo([color_attachment], [subpass], [SubpassDependency(SUBPASS_EXTERNAL, 0, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT; src_access_mask=0, dst_access_mask=ACCESS_COLOR_ATTACHMENT_WRITE_BIT)]))
end

function create_swapchain!(app::VulkanApplication, extent, format; buffering=3, colorspace=COLOR_SPACE_SRGB_NONLINEAR_KHR, layers=1, usage=IMAGE_USAGE_COLOR_ATTACHMENT_BIT, sharing_mode=SHARING_MODE_EXCLUSIVE, present_mode=PRESENT_MODE_IMMEDIATE_KHR, clipped=false, composite_alpha_mode=COMPOSITE_ALPHA_OPAQUE_BIT_KHR)
    @unpack device, surface = app
    physical_device = device.physical_device_handle
    if !Bool(get_physical_device_surface_support_khr(physical_device, device.queues.present.queue_index, surface))
        error("Surface not supported on queue index $(device.queues.present.queue_index) for physical device $physical_device")
    end

    capabilities = get_physical_device_surface_capabilities_khr(physical_device, surface)
    swapchain = SwapchainKHR(device, SwapchainCreateInfoKHR(surface.handle, buffering, format, colorspace, extent, layers, UInt32(usage), sharing_mode, Int[], capabilities.current_transform, composite_alpha_mode, present_mode, clipped))
    images = get_swapchain_images_khr(device, swapchain)
    image_views = ImageView.(device, ImageViewCreateInfo.(images, IMAGE_VIEW_TYPE_2D, format, ComponentMapping(COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY), ImageSubresourceRange(IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1)))
    app.swapchain = SwapchainSetup(swapchain, buffering, format, colorspace, extent, layers, usage, sharing_mode, present_mode, clipped, images, image_views)
end

add_render_pass!(app::VulkanApplication, render_pass::RenderPass) = app.render_pass = render_pass
add_framebuffers!(app::VulkanApplication, framebuffers::Vector{Framebuffer}) = app.framebuffers = framebuffers
add_surface!(app::VulkanApplication, surface::SurfaceSetup) = app.surface = surface
