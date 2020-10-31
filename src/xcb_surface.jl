import .XCB: XCBWindow

SurfaceSetup(app::VulkanApplication, window::XCBWindow) = SurfaceSetup(SurfaceKHR(app.app, XcbSurfaceCreateInfoKHR(window.conn.h, window.id)); window)

