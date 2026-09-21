module VulkanXCBExt

using Vulkan
using XCB: XCBWindow

# No bindings to extend when Vulkan compiled none — see `VulkanCore.HAS_LOADER`.
# `Vk.Format` does not exist then, and an extension that referenced it was the
# last thing on a driverless machine still failing to precompile.
@static if Vulkan.HAS_LOADER


function Vk.SurfaceKHR(instance, window::XCBWindow)
  unwrap(Vk.create_xcb_surface_khr(instance, Vk.XcbSurfaceCreateInfoKHR(window.conn.h, window.id)))
end

end # @static if Vulkan.HAS_LOADER

end
