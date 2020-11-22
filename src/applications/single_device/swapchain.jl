function create_swapchain!(app::VulkanApplication; kwargs...)
    @unpack device, surface = app
    app.swapchain = SwapchainSetup(device, surface; kwargs...)
end
