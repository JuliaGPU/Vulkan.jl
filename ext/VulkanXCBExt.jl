module VulkanXCBExt

using Vulkan
using XCB: XCBWindow

function Vk.SurfaceKHR(instance, window::XCBWindow)
  unwrap(Vk.create_xcb_surface_khr(instance, Vk.XcbSurfaceCreateInfoKHR(window.conn.h, window.id)))
end

end
