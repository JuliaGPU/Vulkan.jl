using Test
using Lavapipe_jll
using Vulkan
using Accessors: @set

@testset "Vulkan.jl" begin
    include("compat.jl")
    include("handles.jl")
    include("api.jl")
    include("dispatch.jl")
    include("formats.jl")
    @test Vulkan.precompile_workload()
    include("extensions.jl")
    include("external_fd.jl")
    include("host_pointer.jl")
    VERSION ≥ v"1.12" && include("doctests.jl")
end;
