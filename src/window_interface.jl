using .WindowAbstractions: AbstractWindow, extent

function target!(app, target::AbstractWindow; format=FORMAT_B8G8R8A8_SRGB)
    add_surface!(app, SurfaceSetup(app, target))
    create_swapchain!(app, Extent2D(extent(target)...), format)
    prepare_rendering_to_target!(app, Target{Swapchain}())
end

export target!