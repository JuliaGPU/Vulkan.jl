module VulkanGen

using Transducers, DataStructures, JuliaFormatter, Parameters, EzXML, AbstractTrees, LightGraphs
using VulkanCore.vk
using VulkanCore:vk
using VulkanCore


include("spec.jl")

include("utils.jl")
include("naming_conventions.jl")
include("signatures.jl")
include("types.jl")
include("codegen.jl")
include("vulkan.jl")
include("parse.jl")

api = API("", OrderedDict.([(), (), (), ()])..., nothing) # this variable is replaced by the api provided in the function wrap

include("dependency_resolution.jl")
include("wrap_api.jl")


export vk,
CamelCaseLower,
CamelCaseUpper,
FDefinition,
SDefinition,
Signature,
SnakeCaseLower,
SnakeCaseUpper,
Statement,
VulkanCore,
argnames,
argtypes,
detect_convention,
enforce_convention,
generate,
prefix_vk,
remove_parts,
remove_prefix,
statements,
vk_prefix,
@sym_str,
remove_prefix,
wrap,
API,
parse_api,
CDefinition,
EDefinition,
PositionalArgument,
KeywordArgument,
StructWrapper,
ConstWrapper,
FuncWrapper,
patterns,
vulkan_to_julia,
nc_convert,
Generated

end # module VulkanGen