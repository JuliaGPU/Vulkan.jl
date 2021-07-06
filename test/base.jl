# set libname for the loader (must be done before importing Vulkan)
# this is mandatory in cases where the default libname used by VulkanCore does not point to a valid Vulkan library
if get(ENV, "JULIA_GITHUB_ACTIONS_CI", "OFF") == "ON"
    import SwiftShader_jll
    ENV["JULIA_VULKAN_LIBNAME"] = basename(SwiftShader_jll.libvulkan)
end

using Test
using Vulkan
using Documenter

# use SwiftShader for testing
if get(ENV, "JULIA_GITHUB_ACTIONS_CI", "OFF") == "ON"
    @set_driver :SwiftShader
end

include("bitmasks.jl")
include("api.jl")
include("dispatch.jl")

DocMeta.setdocmeta!(Vulkan, :DocTestSetup, quote
    using Vulkan
    instance = unwrap(Instance([], []))
    physical_device = first(unwrap(enumerate_physical_devices(instance)))
end)

doctest(Vulkan)
