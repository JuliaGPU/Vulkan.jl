function setup_renderpass(swapchain)
	attachments = create(Vector{api.VkAttachmentDescription}, (
            :format, swapchain.color_format,
            :samples, api.VK_SAMPLE_COUNT_1_BIT,
            :loadOp, api.VK_ATTACHMENT_LOAD_OP_CLEAR,
            :storeOp, api.VK_ATTACHMENT_STORE_OP_STORE,
            :stencilLoadOp, api.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
            :stencilStoreOp, api.VK_ATTACHMENT_STORE_OP_DONT_CARE,
            :initialLayout, api.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
            :finalLayout, api.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
        ),(
            :format, swapchain.depth_format,
            :samples, api.VK_SAMPLE_COUNT_1_BIT,
            :loadOp, api.VK_ATTACHMENT_LOAD_OP_CLEAR,
            :storeOp, api.VK_ATTACHMENT_STORE_OP_STORE,
            :stencilLoadOp, api.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
            :stencilStoreOp, api.VK_ATTACHMENT_STORE_OP_DONT_CARE,
            :initialLayout, api.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
            :finalLayout, api.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
        )
    )

    colorReference = create(Vector{api.VkAttachmentReference}, (
        :attachment, 0,
        :layout, api.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
    ))

    depthReference = create(api.VkAttachmentReference, (
        :attachment, 1,
        :layout, api.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
    ))

    subpass = create(Vector{api.VkSubpassDescription}, (
        :pipelineBindPoint, api.VK_PIPELINE_BIND_POINT_GRAPHICS,
        :colorAttachmentCount, 1,
        :pColorAttachments, colorReference,
        :pDepthStencilAttachment, depthReference,
    ))

    CreateRenderPass(device, C_NULL, (
        :attachmentCount, 2,
        :pAttachments, attachments,
        :subpassCount, 1,
        :pSubpasses, subpass,
    ))
end

function setup_framebuffer(swapchain, depth_stencil, renderpass, width, height)
    attachments = Array(api.VkImageView, 2)

    # Depth/Stencil attachment is the same for all frame buffers
    attachments[2] = depth_stencil.view

    frameBufferCreateInfo = create(api.VkFramebufferCreateInfo, (
        :renderPass, renderpass,
        :attachmentCount, 2,
        :pAttachments, attachments,
        :width, width,
        :height, height,
        :layers, 1
    ))

    # Create frame buffers for every swap chain image
    framebuffers = Array(api.VkFramebuffer, image_count(swapchain))
    for i=1:length(framebuffers)
        attachments[1] = swapchain.buffers[i].view
        fb_ref = Ref(framebuffers, i)
        err = api.vkCreateFramebuffer(device, frameBufferCreateInfo, C_NULL, fb_ref)
        check(err)
    end
    framebuffers
end
