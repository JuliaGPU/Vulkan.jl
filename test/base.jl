# set libname for the loader (must be done before importing Vulkan)
# this is mandatory in cases where the default libname used by VulkanCore does not point to a valid Vulkan library
is_ci = get(ENV, "JULIA_GITHUB_ACTIONS_CI", "OFF") == "ON"
if is_ci
    import SwiftShader_jll
    ENV["JULIA_VULKAN_LIBNAME"] = basename(SwiftShader_jll.libvulkan)
end

using Test
using Vulkan
using Accessors: @set
using Documenter

# use SwiftShader for testing
if get(ENV, "JULIA_GITHUB_ACTIONS_CI", "OFF") == "ON"
    @set_driver :SwiftShader
end

include("api.jl")
include("dispatch.jl")
@test Vulkan.precompile_workload() broken = is_ci

DocMeta.setdocmeta!(Vulkan, :DocTestSetup, quote
    using Vulkan
    instance = unwrap(Instance([], []))
    physical_device = first(unwrap(enumerate_physical_devices(instance)))
end)

doctest(Vulkan)
