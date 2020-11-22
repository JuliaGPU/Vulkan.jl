function create_swapchain!(app::VulkanApplication; kwargs...)
    @unpack device, surface = app
    app.swapchain = SwapchainSetup(device, surface; kwargs...)
end

function recreate_swapchain!(app::VulkanApplication)
    @unpack device, surface, swapchain = app
    app.swapchain = SwapchainSetup(device, surface, swapchain)
end
