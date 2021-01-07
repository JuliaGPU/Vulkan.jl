using EzXML
using StructArrays
using MLStyle
using LightGraphs
using Vulkan_Headers_jll:vk_xml

const ExprLike = Union{Symbol, Expr}
const Optional{T} = Union{Nothing, T}

xdoc = readxml(vk_xml)
xroot = xdoc.root

include("spec/utils.jl")
include("spec/aliases.jl")
include("spec/specs.jl")
include("spec/structure_types.jl")

for name ∈ names(@__MODULE__, all=true)
    if any(startswith.(string(name), ["spec_", "Spec"]))
        @eval export $name
    end
end

export
        # alias manipulation
        follow_alias,
        isalias,
        hasalias,

        # specs
        default,
        func_by_name,
        struct_by_name,
        handle_by_name,
        bitmask_by_name,
        enum_by_name
