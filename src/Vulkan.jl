module Vulkan

using DataStructures
using Parameters
using Requires: @require
import VulkanCore
import glslang_jll
glslangValidator = glslang_jll.glslangValidator(x -> x)

using VulkanCore.api
const api = VulkanCore.api
using CEnum

include("wrap_utils.jl")
include(joinpath(dirname(@__DIR__), "generated", "wrapped_api.jl"))
include("aliases.jl")

include("types.jl")
include("misc.jl")
include("print.jl")
include("validation.jl")
include("command_pools.jl")
include("shaders.jl")
include("buffers.jl")
include("info.jl")
include("blending.jl")
include("setups.jl")
include("app.jl")
include("targets.jl")

function __init__()
    @require WindowAbstractions="e18202ca-4a7d-4de8-b056-fa6bbd7de157" include("window_interface.jl")
    @require XCB="16167f82-ea26-5cba-b1de-ed6fd5e30a10" include("xcb_surface.jl")
end

export
       Swapchain,
       
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
       setup_viewport!,
       create_render_pass,
       create_swapchain!,
       create_command_pool!,
       create_pipeline!,
       create_pipelines!,
       recreate_pipeline!,
       print_info,
       print_info_app,
       print_devices,
       print_available_devices,
       print_device_info,
       Target,
       RenderPassPresent,
       RenderPassType,
       add_buffer!,
       add_index_buffer!,
       add_vertex_buffer!,
       add_surface!,
       add_render_pass!,
       add_framebuffers!,
       prepare_rendering_to_target!

end # module Vulkan