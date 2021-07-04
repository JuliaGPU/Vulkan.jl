using VulkanGen
using Test
using StructArrays

files = [
    "spec.jl",
    "wrapper.jl",
]

@testset "VulkanGen.jl" begin
    foreach(files) do file
        dir = if basename(@__DIR__) == "generator"
            joinpath(@__DIR__, "test")
        else
            @__DIR__
        end
        include(joinpath(dir, file))
    end
end
