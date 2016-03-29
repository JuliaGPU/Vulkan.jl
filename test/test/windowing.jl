function create_window(name, w, h)
    GLFW.WindowHint(GLFW.CLIENT_API, GLFW.NO_API)
    window = GLFW.CreateWindow(w,h, utf8(name))
    GLFW.ShowWindow(window)
    window
end

function create_surface(instance::Instance, window)
    err, surface = GLFW.CreateWindowSurface(instance, window)
    check(api.VkResult(err))
    surface
end
