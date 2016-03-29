

"""
Gets the present modes a surface supports
"""
function present_modes(physical_device, surface)
    presentModeCount = Ref{UInt32}()
    err = fpGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, presentModeCount, C_NULL)
    check(err)
    if presentModeCount[] < 1
        error("No present modes found")
    end
    present_modes = Array(api.VkPresentModeKHR, presentModeCount[])
    err = fpGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, presentModeCount, present_modes)
    check(err)
    present_modes
end

"""
Gets the capabilities of a surface
"""
function surface_capabilities(physical_device, surface)
    surface_capabilities = Ref{api.VkSurfaceCapabilitiesKHR}()
    err = fpGetPhysicalDeviceSurfaceCapabilitiesKHR(physical_device, surface, surface_capabilities)
    check(err)
    surface_capabilities[]
end

function get_images(device, swapchain)
    imageCount = Ref{UInt32}()
    err = fpGetSwapchainImagesKHR(device, swapchain.ref[], imageCount, C_NULL)
    check(err)
    # Get the swap chain images
    images = Array(api.VkImage, imageCount[])
    err = fpGetSwapchainImagesKHR(device, swapchain.ref[], imageCount, images)
    check(err)
    images
end
"""
Get list of supported surface formats
"""
function surface_formats(physical_device, surface)
    formatCount = Ref{UInt32}()
    err = fpGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, formatCount, C_NULL)
    check(err)
    if formatCount[] < 1
        error("No formats found!")
    end
    surface_formats = Array(api.VkSurfaceFormatKHR, formatCount[])
    err = fpGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, formatCount, surface_formats)
    check(err)
    surface_formats
end

function acquireNextImage(presentCompleteSemaphore::api.VkSemaphore, currentBuffer, swapchain, device)
    return fpAcquireNextImageKHR(device, swapchain.ref[], typemax(UInt64), presentCompleteSemaphore, Ptr{api.VkFence}(C_NULL), currentBuffer)
end

function present(queue::Queue, currentBuffer_ref, swapchain)
    presentInfo = create(api.VkPresentInfoKHR, (
        :waitSemaphoreCount, 0,
        :swapchainCount, 1,
        :pSwapchains, swapchain.ref,
        :pImageIndices, currentBuffer_ref
    ))
    err = fpQueuePresentKHR(queue, presentInfo)
    check(err)
end
function present(queue::Queue, currentBuffer_ref, waitsemaphore, swapchain)
    waitsemaphore_ref = [waitsemaphore]
    presentInfo = create(api.VkPresentInfoKHR, (
        :swapchainCount, 1,
        :pSwapchains, swapchain.ref,
        :pImageIndices, currentBuffer_ref,
        :waitSemaphoreCount, 1,
        :pWaitSemaphores, waitsemaphore_ref
    ))
    err = fpQueuePresentKHR(queue, presentInfo)
    check(err)
end


image_count(swapchain::SwapChain) = length(swapchain.images)

function supported_depth_format(physicalDevice)
    # Since all depth formats may be optional, we need to find a suitable depth format to use
    # Start with the highest precision packed format
    depthFormats = (
        api.VK_FORMAT_D32_SFLOAT_S8_UINT,
        api.VK_FORMAT_D32_SFLOAT,
        api.VK_FORMAT_D24_UNORM_S8_UINT,
        api.VK_FORMAT_D16_UNORM_S8_UINT,
        api.VK_FORMAT_D16_UNORM
    )
    for format in depthFormats # form enum gues from 1-184
        formatProps = Ref{api.VkFormatProperties}()
        api.vkGetPhysicalDeviceFormatProperties(physicalDevice, format, formatProps)
        #Format must support depth stencil attachment for optimal tiling
        if (UInt32(formatProps[].optimalTilingFeatures) & UInt32(api.VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT)) != UInt32(0)
            return true, format
        end
    end

    return false, api.VK_FORMAT_UNDEFINED
end
