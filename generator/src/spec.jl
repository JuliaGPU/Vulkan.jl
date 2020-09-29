using EzXML
using DataStructures
using LightGraphs
using Vulkan_Headers_jll:vk_xml
using DataFrames
using Query

xdoc = readxml(vk_xml)
xroot = xdoc.root

include("spec/utils.jl")
include("spec/aliases.jl")
include("spec/dataframes.jl")
include("spec/graph.jl")
include("spec/structure_types.jl")