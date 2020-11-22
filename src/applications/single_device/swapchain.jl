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
