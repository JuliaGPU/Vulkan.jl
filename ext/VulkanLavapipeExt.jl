module VulkanLavapipeExt

import Lavapipe_jll

# The Windows loader needs absolute paths for manifests using forward slashes.
function __init__()
    Sys.iswindows() || return
    files = split(get(ENV, "VK_ADD_DRIVER_FILES", ""), ';'; keepempty = false)
    isempty(files) && return
    ENV["VK_ADD_DRIVER_FILES"] = join(map(absolutemanifest, files), ';')
    return
end

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
