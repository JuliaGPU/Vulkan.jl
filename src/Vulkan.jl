module Vulkan

import VulkanCore

using VulkanCore.api
const api = VulkanCore.api
using CEnum

include("vk_utils.jl")

include(joinpath(dirname(@__DIR__), "generated", "wrapped_api.jl"))

include("misc.jl")
include("print.jl")

export
       unsafe_pointer,
       unsafe_pointer_load,
       to_vk,
       from_vk,
       VulkanStruct,
       Handle,
       @check,
       SPIRV,
       GLSL,
       HLSL,
       function_pointer

end # module Vulkan