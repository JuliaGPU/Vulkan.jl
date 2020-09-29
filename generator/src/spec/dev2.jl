using EzXML
using DataStructures
using LightGraphs
using Vulkan_Headers_jll:vk_xml

xdoc = readxml(vk_xml)
xroot = xdoc.root

include("utils.jl")
include("handles.jl")
include("graph.jl")


base_types_exceptions = Dict(
    "CAMetalLayer" => "void",
    "ANativeWindow" => "void",
    "AHardwareBuffer" => "void",
)

vk_base_types_mapping = Dict(
    ("uint$(size)_t" => "UInt$size" for size ∈ (8, 16, 32, 64))...,
    ("int$(size)_t" => "Int$size" for size ∈ (8, 16, 32, 64))...,
    "float" => "Float32",
    "double" => "Float64",
    "void" => "Cvoid",
)

function translate_base_type_c(base_type)
    base_type ∉ keys(vk_base_types_mapping) && error("Unknown base type $base_type")
    vk_base_types_mapping[base_type]
end

function fetch_base_types(xroot)
    vk_base_types_nodes = findall("//type[@category='basetype']", xroot)
    names = member_attr.(vk_base_types_nodes, "name")
    println.(vk_base_types_nodes)
    res = Dict()
    for (i, name) ∈ enumerate(names)
        res[name] = translate_base_type_c(name ∈ keys(base_types_exceptions) ? base_types_exceptions[name] : member_attr(vk_base_types_nodes[i], "type"))
    end
    res
end


base_types_vk = fetch_base_types(xroot)

function translate_base_type_vk(base_type)
    base_type ∉ keys(base_types_vk) && error("Unknown vulkan type $base_type")
    base_types_vk[base_type]
end

"""
    translate_type(base_type)

Translates a type from available C-based or Vulkan-based definitions.

# Examples
```
julia> translate_type("uint_32_t")
"UInt32"
julia> translate_type("VkBool32")
"UInt32"
```
"""
function translate_type(base_type)
    base_type ∈ keys(base_types_vk) && return translate_base_type_vk(base_type)
    base_type ∈ keys(vk_base_types_mapping) && return translate_base_type_c(base_type)
    error("Unknown type $base_type")
end