module Vulkan

using DocStringExtensions
using DataStructures
using Parameters
using Requires: @require
using CEnum
using StaticArrays
using VulkanCore.api

import glslang_jll
import VulkanCore

@template (FUNCTIONS, METHODS, MACROS) =
    """
    $(DOCSTRING)
    $(TYPEDSIGNATURES)
    """

@template TYPES =
    """
    $(DOCSTRING)
    $(TYPEDEF)
    $(TYPEDSIGNATURES)
    $(TYPEDFIELDS)
    """

const glslangValidator = glslang_jll.glslangValidator(x -> x)
const api = VulkanCore.api
const core = VulkanCore.api

# generated wrapper
include("wrap_utils.jl")
include(joinpath(dirname(@__DIR__), "generated", "wrapped_api.jl"))

include("shaders.jl")
include("buffers.jl")
include("pipelines.jl")
include("renderpass.jl")
include("instance.jl")
include("devices.jl")
include("setups.jl")
include("info.jl")
include("print.jl")
include("blending.jl")
include("state.jl")
include("applications.jl")

function __init__()
    @require WindowAbstractions="e18202ca-4a7d-4de8-b056-fa6bbd7de157" include("window_interface.jl")
    @require XCB="16167f82-ea26-5cba-b1de-ed6fd5e30a10" include("xcb_surface.jl")
end

export

        # Low-level abstractions (core wrapper)
        ### Supertypes
        VulkanStruct,
        Handle,

        ### Pointer utilities
        unsafe_pointer,
        unsafe_pointer_load,
        function_pointer,

        ### Type conversions
        to_vk,
        from_vk,

        ### Error handling
        VulkanError,
        @check,

        # Higher-level abstractions
        ### Setups
        Setup,
        InstanceSetup,
        DeviceSetup,
        SwapchainSetup,
        SurfaceSetup,
        PipelineSetup,
        BufferSetup,

        ### Devices
        ##### Queues
        Queues,
        DeviceQueue,

        ### Information printing
        print_info,
        print_app_info,
        print_devices,
        print_device_info,
        print_available_devices,

        ### Color operations
        ##### Blending
        BlendingMode,
        NoBlending,
        AlphaBlending,
        AlphaCompositing,
        AlphaOpaque,
        AlphaPreMultiplied,
        AlphaPostMultiplied,
        AlphaInherit,


        ### Debugging
        DebugUtilsMessengerEXT,
        default_debug_callback,
        default_debug_callback_c,

        ### Buffers
        ##### Memory
        MemoryProperty,
        DeviceLocal,
        HostCoherent,
        HostVisible,
        HostCached,

        ### Shaders
        Shader,
        ShaderFile,

        ##### Stages
        ShaderStage,
        VertexStage,
        TessellationControlStage,
        TessellationEvaluationStage,
        GeometryStage,
        FragmentStage,
        stage_from_file_ext,
        stage_file_ext,

        ##### Formats
        ShaderFormat,
        TextFormat,
        SPIRV,
        GLSL,
        HLSL,
        BinaryFormat,

        ##### Resources
        ShaderResource,
        ResourceBinding,
        UniformBuffer,
        ImageSampler,
        CombinedImageSampler,
        StorageBuffer,
        StorageBufferDynamic,
        StorageImage,
        StorageTexelBuffer,
        UniformBufferDynamic,
        UniformTexelBuffer,
        descriptor_set_layouts,

        ##### Compilation
        ShaderCompilationError,
        compile,

        ### Pipelines
        ##### Creation
        create_pipeline!,
        create_pipelines!,
        recreate_pipeline!,

        ### Rendering
        Target,
        RenderPassType,
        RenderPassPresent,
        create_render_pass,

        # Applications
        ### Application types
        VulkanApplication,
        VulkanApplicationSingleDevice,

        ### Setup
        setup_viewport!,

        ### Buffer creation
        create_command_pool!,
        add_buffer!,
        add_index_buffer!,
        add_vertex_buffer!,
        add_uniform_buffer!,
        add_framebuffers!,

        ### Surface creation
        add_surface!,

        ### Swapchain creation
        create_swapchain!,
        recreate_swapchain!,

        ### Application state
        ViewportState,
        RenderState,
        PipelineState,

        ### Rendering
        add_render_pass!,
        prepare_rendering_to_target!,
        next_frame!,
        initialize_render_state!,
        draw!,
        
        ### Finalization
        safe_shutdown!

end # module Vulkan
