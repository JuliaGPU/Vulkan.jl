module VulkanGen

using StructArrays
using UnPack
using LightGraphs
using MLStyle
using DocStringExtensions

@template (FUNCTIONS, METHODS, MACROS) =
    """
    $(DOCSTRING)
    $(TYPEDSIGNATURES)
    """

@template TYPES =
    """
    $(DOCSTRING)
    $(TYPEDEF)
    $(TYPEDSIGNATURES)
    $(TYPEDFIELDS)
    $(SIGNATURES)
    """

include("types.jl")
include("spec.jl")
include("wrapper.jl")

end # module VulkanGen
