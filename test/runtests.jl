@static if get(ENV, "JULIA_GITHUB_ACTIONS_CI", "OFF") == "ON"
    using SwiftShader_jll: libvulkan
    ENV["JULIA_VULKAN_LIBNAME"] = basename(libvulkan)
    libdir = dirname(libvulkan)

    sep = Sys.iswindows() ? ';' : ':'
    old_vk_icd_filenames = get(ENV, "VK_ICD_FILENAMES", [])
    ENV["VK_ICD_FILENAMES"] = join([old_vk_icd_filenames; joinpath(libdir, "vk_swiftshader_icd.json")], sep)
end

using Test
using Vulkan

include("bitmasks.jl")
include("api.jl")
