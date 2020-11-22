"""
Setup the application viewport.

By default, the extent is taken as the application swapchain extent, but a custom value can be provided instead.
"""
setup_viewport!(app::VulkanApplication; offset=(0, 0), custom_extent=nothing) = setup_viewport!(app, isnothing(custom_extent) ? (app.swapchain.extent.vks.width, app.swapchain.extent.vks.height) : custom_extent; offset)

function setup_viewport!(app::VulkanApplication, extent; offset=(0, 0))
    scissor = Rect2D(Offset2D(offset...), Extent2D(extent...))
    viewport = Viewport(0., 0., extent..., 0., 1.) 
    app.viewport = ViewportState(viewport, scissor)
end
