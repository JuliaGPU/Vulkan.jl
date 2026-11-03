module VulkanXCBExt

using Vulkan
using XCB: XCBWindow

# VulkanCore omits these types when compiled without a loader.
@static if Vulkan.HAS_LOADER

function Vk.SurfaceKHR(instance, window::XCBWindow)
  unwrap(Vk.create_xcb_surface_khr(instance, Vk.XcbSurfaceCreateInfoKHR(window.conn.h, window.id)))
end

end # @static if Vulkan.HAS_LOADER

end
