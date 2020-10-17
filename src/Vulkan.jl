module Vulkan

using DataStructures
using Parameters
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
include("types.jl")
include("info.jl")
include("blending.jl")
include("setups.jl")
include("app.jl")

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
       default_debug_callback_c,
       VulkanApplication,
       Setup,
       AppSetup,
       Queues,
       DeviceQueue,
       DeviceSetup,
       SwapchainSetup,
       SurfaceSetup,
       PipelineSetup,
       BufferSetup,
       ViewportState,
       RenderState,
       VulkanApplicationSingleDevice,
       PipelineState,
       BlendingMode,
       NoBlending,
       AlphaBlending,
       shutdown_properly!,
       next_frame!,
       initialize_render_state!,
       draw!,
       create_pipeline!,
       create_pipelines!,
       recreate_pipeline!,
       print_info,
       print_info_app,
       print_info_device,
       print_info_physical_device

end # module Vulkan