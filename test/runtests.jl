# Set libname for the loader (must be done before importing Vulkan).
# This is mandatory in cases where the default libname used by VulkanCore does not point to a valid Vulkan library.
import SwiftShader_jll
ENV["JULIA_VULKAN_LIBNAME"] = basename(SwiftShader_jll.libvulkan)

using Test
using Vulkan
using Accessors: @set

# Use SwiftShader for testing.
set_driver(:SwiftShader)

@testset "Vulkan.jl" begin
    include("api.jl")
    include("dispatch.jl")
    include("formats.jl")
    @test Vulkan.precompile_workload()
    isdefined(Base, :get_extension) && include("extensions.jl")
    VERSION ≥ v"1.12" && include("doctests.jl")
end;
