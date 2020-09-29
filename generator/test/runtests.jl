using VulkanGen
using JuliaFormatter:format_text
using Test

const vg = VulkanGen

include("naming_conventions.jl")
include("parsing.jl")
include("signatures.jl")
include("codegen.jl")
include("spec.jl")