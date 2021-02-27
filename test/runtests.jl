@static if get(ENV, "JULIA_GITHUB_ACTIONS_CI", "OFF") == "ON"
    using SwiftShader_jll: libvulkan
    ENV["JULIA_VULKAN_LIBNAME"] = basename(libvulkan)
    libdir = dirname(libvulkan)

    sep = Sys.iswindows() ? ';' : ':'
    old_vk_icd_filenames = get(ENV, "VK_ICD_FILENAMES", [])
    ENV["VK_ICD_FILENAMES"] = join([old_vk_icd_filenames; joinpath(libdir, "vk_swiftshader_icd.json")], sep)
end

using Test
using Documenter
using Vulkan

DocMeta.setdocmeta!(Vulkan, :DocTestSetup, quote
    using Vulkan
    instance = unwrap(Instance(String[], String[]))
    physical_device = first(unwrap(enumerate_physical_devices(instance)))
end)

@testset "Vulkan.jl" begin
    include("bitmasks.jl")
    include("api.jl")
    doctest(Vulkan)
end
