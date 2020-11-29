module VulkanGen

using Transducers
using DataStructures
using JuliaFormatter
using Parameters
using EzXML
using AbstractTrees
using LightGraphs
using VulkanCore.vk
using VulkanCore: VulkanCore, vk
using MacroTools
using MacroTools: rmlines

include("utils.jl")
include("naming_conventions.jl")
include("vulkan.jl")
include("signatures.jl")
include("types.jl")
include("codegen.jl")
include("parse.jl")

api = API("", OrderedDict.([(), (), (), ()])..., nothing) # this variable is replaced by the api provided in the function wrap

include("dependency_resolution.jl")
include("wrap_api.jl")


export
        # Naming Conventions
        ### Convention types
        CamelCaseLower,
        CamelCaseUpper,
        SnakeCaseLower,
        SnakeCaseUpper,

        ### Convention utilities
        detect_convention,
        enforce_convention,
        nc_convert,
        remove_parts,
        remove_prefix,

        # Signatures
        Argument,
        PositionalArgument,
        KeywordArgument,
        decompose_field_decl,
        types,
        typed_field,

        Signature,
        argnames,
        argtypes,
        
        # Code Generation
        Declaration,
        Statement,
        FDefinition,
        SDefinition,
        CDefinition,
        EDefinition,
        generate,

        # API parsing and wrapping
        parse_text,
        API,
        parse_api,
        wrap,

        # Vulkan-specific
        vulkan_to_julia,
        prefix_vk,
        vk_prefix

end # module VulkanGen
