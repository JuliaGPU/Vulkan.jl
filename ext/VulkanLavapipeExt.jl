module VulkanLavapipeExt

import Lavapipe_jll

# Lavapipe_jll's Windows manifest names its library `../../../bin/vulkan_lvp.dll`.
# The Windows loader takes a library path as relative to the manifest only when it
# contains a backslash, so it hands this one to `LoadLibrary` as a bare name, gets
# error 87, and then fails EVERY `vkEnumerateInstanceExtensionProperties` and
# `vkCreateInstance` in the process with `ERROR_OUT_OF_HOST_MEMORY`, the hardware
# driver's and GLFW's included (loader 1.4.341, Lavapipe_jll 26.2.2+0). The loader
# rereads `VK_ADD_DRIVER_FILES` on each of those calls, so pointing it at a copy of
# the manifest with the library's absolute path repairs the process from here on.
function __init__()
    Sys.iswindows() || return
    files = split(get(ENV, "VK_ADD_DRIVER_FILES", ""), ';'; keepempty = false)
    isempty(files) && return
    ENV["VK_ADD_DRIVER_FILES"] = join(map(absolutemanifest, files), ';')
    return
end

"`file`, or a copy of it whose relative `library_path` is made absolute."
function absolutemanifest(file::AbstractString)
    text = read(file, String)
    m = match(r"\"library_path\"\s*:\s*\"([^\"]*)\"", text)
    (m === nothing || isabspath(m[1])) && return file
    lib = normpath(joinpath(dirname(file), m[1]))
    # The manifest's own name: the loader takes only `.json` files.
    path = joinpath(mktempdir(), basename(file))
    # A JSON string: the path's backslashes escaped.
    write(path, replace(text, m.match => "\"library_path\": \"$(replace(lib, '\\' => "\\\\"))\""))
    return path
end

end
