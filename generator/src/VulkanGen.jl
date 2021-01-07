module VulkanGen

using StructArrays
using JuliaFormatter
using UnPack
using LightGraphs
using VulkanCore.vk
using VulkanCore: VulkanCore, vk
using MLStyle
using MLStyle.Modules.AST

include("naming_conventions.jl")

include("types.jl")
include("exprs.jl")
include("macros.jl")

include("vulkan/spec.jl")
include("vulkan/conventions.jl")

# include("api/parse.jl")
# include("api/wrap.jl")
# include("api/write.jl")

# include("dependency_resolution.jl")

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

        # Expr
        name,
        category,
        deconstruct,
        reconstruct,
        rmlines,
        striplines,
        unblock,

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
