module VulkanXCBExt

using Vulkan
using XCB: XCBWindow

# These methods require the optional Vulkan bindings.
@static if Vulkan.HAS_LOADER


function Vk.SurfaceKHR(instance, window::XCBWindow)
  unwrap(Vk.create_xcb_surface_khr(instance, Vk.XcbSurfaceCreateInfoKHR(window.conn.h, window.id)))
end

end # @static if Vulkan.HAS_LOADER

end
