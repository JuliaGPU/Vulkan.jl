using VulkanGen
using Test
using StructArrays

@testset "VulkanGen.jl" begin
    include("spec.jl")
    include("wrapper.jl")
end
