using Test
using Vulkan
using Accessors: @set

@testset "Vulkan.jl" begin
    include("generated_scope.jl")
    include("handles.jl")
    include("api.jl")
    include("dispatch.jl")
    include("formats.jl")
    @test Vulkan.precompile_workload()
    include("extensions.jl")
    VERSION ≥ v"1.12" && include("doctests.jl")
end;
