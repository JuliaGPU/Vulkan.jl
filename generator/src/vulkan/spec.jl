using EzXML
using DataStructures
using LightGraphs
using Vulkan_Headers_jll:vk_xml
using DataFrames
using Query

spec_include(x...) = include(joinpath(@__DIR__, "spec", x...))

xdoc = readxml(vk_xml)
xroot = xdoc.root

spec_include("utils.jl")
spec_include("aliases.jl")
spec_include("dataframes.jl")
spec_include("graph.jl")
spec_include("structure_types.jl")
