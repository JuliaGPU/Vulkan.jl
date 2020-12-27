using .WindowAbstractions: AbstractWindow, extent

function target!(app::VulkanApplication, target::AbstractWindow; format=FORMAT_B8G8R8A8_SRGB, swapchain_kwargs...)
    add_surface!(app, SurfaceSetup(app, target))
    create_swapchain!(app; format, swapchain_kwargs...)
    prepare_rendering_to_target!(app, Target{SwapchainKHR}())
end
