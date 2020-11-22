import .XCB: XCBWindow

SurfaceSetup(app::VulkanApplication, window::XCBWindow) = SurfaceSetup(SurfaceKHR(app.instance, XcbSurfaceCreateInfoKHR(window.conn.h, window.id)); window)
