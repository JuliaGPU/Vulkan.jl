module VulkanGen

using StructArrays: StructVector
using LightGraphs
using MLStyle
using DocStringExtensions
using Reexport

@template (FUNCTIONS, METHODS, MACROS) = """
                                         $(DOCSTRING)
                                         $(TYPEDSIGNATURES)
                                         """

@template TYPES = """
                  $(DOCSTRING)
                  $(TYPEDEF)
                  $(TYPEDSIGNATURES)
                  $(TYPEDFIELDS)
                  $(SIGNATURES)
                  """

include("types.jl")

include("spec/VulkanSpec.jl")
@reexport using .VulkanSpec

include("wrapper.jl")

end # module VulkanGen
