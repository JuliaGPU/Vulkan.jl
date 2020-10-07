module Vulkan

using DataStructures
import VulkanCore
import glslang_jll
glslangValidator = glslang_jll.glslangValidator(x -> x)

using VulkanCore.api
const api = VulkanCore.api
using CEnum

include("wrap_utils.jl")
include(joinpath(dirname(@__DIR__), "generated", "wrapped_api.jl"))

include("misc.jl")
include("validation.jl")
include("shaders.jl")
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
       function_pointer,
       VulkanError,
       shader_modules,
       compile,
       DebugUtilsMessengerEXT,
       default_debug_callback,
       default_debug_callback_c

end # module Vulkan