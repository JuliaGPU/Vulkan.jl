module VulkanGen

using StructArrays
using UnPack
using LightGraphs
using MLStyle
using MLStyle.Modules.AST

include("types.jl")
include("spec.jl")
include("wrapper.jl")

end # module VulkanGen
