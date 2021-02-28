using VulkanGen
using Test
using SafeTestsets
using StructArrays

@testset "VulkanGen.jl" begin
    include("spec.jl")
    include("wrapper.jl")
end
