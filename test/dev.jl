using Vulkan
using StaticArrays
import XCB
using XCB:Connection, run_window, xcb_setup_roots_iterator, xcb_map_window, flush, getkey, KeyAction, KeyCombination, KeyContext, KeyEvent, KeyModifierState, KeyPressed, KeyReleased, CloseWindow, Button, ButtonState, @key_str
using VulkanCore.vk
using Parameters

using BenchmarkTools

ENV["JULIA_DEBUG"] = Main


include("debug.jl")
include("validation.jl")
include("window.jl")
include("features.jl")

include("shaders.jl")
include("pipelines.jl")
include("setups.jl")
include("app.jl")


function get_physical_device_properties(pdevices)
    pdps = PhysicalDeviceProperties[]
    for pdevice ∈ pdevices
        pdps_ref = Ref{VkPhysicalDeviceProperties}()
        get_physical_device_properties(pdevice, pdps_ref)
        push!(pdps, pdps_ref[])
    end
    pdps
end

function _get_physical_device_surface_capabilities_khr(physical_device, surface)
    psurfacecapabilities = Ref{VkSurfaceCapabilitiesKHR}()
    @check vkGetPhysicalDeviceSurfaceCapabilitiesKHR(
        physical_device,
        surface,
        psurfacecapabilities
    )

    SurfaceCapabilitiesKHR(psurfacecapabilities[])
end

function acquire_next_image_khr(device, swapchain; timeout=0, semaphore=C_NULL, fence=C_NULL)
    image_index = Ref{UInt32}(0)
    @check vkAcquireNextImageKHR(device, swapchain, timeout, semaphore, fence, image_index)
    image_index[] + 1
end

function create_render_pass(device, color_attachment)
    color_attachment_ref = AttachmentReference(0, IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL)
    subpass = SubpassDescription(PIPELINE_BIND_POINT_GRAPHICS, [], [color_attachment_ref], [])
    # RenderPass(device, RenderPassCreateInfo([color_attachment], [subpass], AttachmentReference[]))
    RenderPass(device, RenderPassCreateInfo([color_attachment], [subpass], [SubpassDependency(SUBPASS_EXTERNAL, 0, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT; src_access_mask=0, dst_access_mask=ACCESS_COLOR_ATTACHMENT_WRITE_BIT)]))
end

function recreate_swapchain!(app, new_extent)
    @unpack device, surface, swapchain = app
    @unpack buffering, format, colorspace, layers, usage, sharing_mode, present_mode, clipped = swapchain
    
    wait_device_idle(device)
    new_swapchain_handle = SwapchainKHR(device, SwapchainCreateInfoKHR(surface, buffering, format, colorspace, new_extent, layers, usage, sharing_mode, Int[], SURFACE_TRANSFORM_IDENTITY_BIT_KHR, COMPOSITE_ALPHA_OPAQUE_BIT_KHR, present_mode, clipped, swapchain.handle))
    images = get_swapchain_images_khr(device, new_swapchain_handle)
    image_views = ImageView.(device, ImageViewCreateInfo.(images, IMAGE_VIEW_TYPE_2D, output_format, ComponentMapping(COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY), ImageSubresourceRange(IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1)))
    app.swapchain = SwapchainSetup(swapchain, new_extent, format, colorspace, extent, layers, usage, sharing_mode, present_mode, clipped, images, image_views)
end

function add_device!(app::VulkanApplicationSingleGPU)
    pdevices = enumerate_physical_devices(app.app)
    pdevice = first(pdevices)
    device = Device(pdevice, DeviceCreateInfo([DeviceQueueCreateInfo(0, [1.0])], String[], @MVector(["VK_KHR_swapchain"]), enabled_features=PhysicalDeviceFeatures(values(DEFAULT_VK_PHYSICAL_DEVICE_FEATURES)...)))
    queue = Ref{VkQueue}()
    get_device_queue(device, 0, 0, queue)
    queues = Queues(NamedTuple{(:present, :graphics, :compute)}(DeviceQueue.((queue[], queue[], queue[]), (0, 0, 0), (0, 0, 0)))...)
    app.device = DeviceSetup(device, pdevice, queues)
end

function add_surface!(app::VulkanApplication, window::XCB.Window)
    app.surface = SurfaceSetup(SurfaceKHR(app.app, XcbSurfaceCreateInfoKHR(window.conn.h, window.id)); window)
end

function add_swapchain!(app::VulkanApplication, extent, format; buffering=3, colorspace=COLOR_SPACE_SRGB_NONLINEAR_KHR, layers=1, usage=IMAGE_USAGE_COLOR_ATTACHMENT_BIT, sharing_mode=SHARING_MODE_EXCLUSIVE, present_mode=PRESENT_MODE_IMMEDIATE_KHR, clipped=false)
    @unpack device, surface = app
    physical_device = device.physical_device_handle
    supported_formats = get_physical_device_surface_formats_khr(physical_device, surface)
    supported_capabilities = _get_physical_device_surface_capabilities_khr(physical_device, surface)
    supported_present_modes = get_physical_device_surface_present_modes_khr(physical_device, surface)
    
    #TODO: wrap in VulkanGen
    pSupported = Ref{UInt32}()
    @check get_physical_device_surface_support_khr(physical_device, device.queues.present.queue_index, surface, pSupported)
    @assert Bool(pSupported[])
    
    @info "Supported formats: $supported_formats"
    @info "Supported capabilities: $supported_capabilities"
    @info "Supported presentation modes: $supported_present_modes"

    swapchain = SwapchainKHR(device, SwapchainCreateInfoKHR(surface.handle, buffering, format, colorspace, extent, layers, UInt32(usage), sharing_mode, Int[], SURFACE_TRANSFORM_IDENTITY_BIT_KHR, COMPOSITE_ALPHA_OPAQUE_BIT_KHR, present_mode, clipped))
    images = get_swapchain_images_khr(device, swapchain)
    image_views = ImageView.(device, ImageViewCreateInfo.(images, IMAGE_VIEW_TYPE_2D, format, ComponentMapping(COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY, COMPONENT_SWIZZLE_IDENTITY), ImageSubresourceRange(IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1)))
    app.swapchain = SwapchainSetup(swapchain, buffering, format, colorspace, extent, layers, usage, sharing_mode, present_mode, clipped, images, image_views)
end

function add_render_pass!(app::VulkanApplication, output_format)
    color_attachment = AttachmentDescription(output_format, SAMPLE_COUNT_1_BIT, ATTACHMENT_LOAD_OP_CLEAR, ATTACHMENT_STORE_OP_STORE, ATTACHMENT_LOAD_OP_DONT_CARE, ATTACHMENT_STORE_OP_DONT_CARE, IMAGE_LAYOUT_UNDEFINED, IMAGE_LAYOUT_PRESENT_SRC_KHR)
    app.render_pass = create_render_pass(app.device, color_attachment)
end

function add_framebuffers!(app::VulkanApplication)
    framebuffer_cis = FramebufferCreateInfo.(app.render_pass, [[view] for view ∈ app.swapchain.image_views], app.swapchain.extent.vks.width, app.swapchain.extent.vks.height, 1)
    framebuffers = Framebuffer.(app.device, framebuffer_cis)
    app.framebuffers = framebuffers
end

function setup_viewport!(app::VulkanApplication)
    scissor = Rect2D(Offset2D(0., 0.), app.swapchain.extent)
    viewport = Viewport(0., 0., app.swapchain.extent.vks.width, app.swapchain.extent.vks.height, 0., 1.) 
    app.viewport = ViewportState(viewport, scissor)
end

function setup_pipeline!(app::VulkanApplication)
    @unpack device = app
    vert_shader_module = ShaderModule(device, joinpath(@__DIR__, "triangle_vert.spv"), SPIRV())
    frag_shader_module = ShaderModule(device, joinpath(@__DIR__, "triangle_frag.spv"), SPIRV())
    shaders = [vert_shader_module, frag_shader_module]
    shader_stage_cis = PipelineShaderStageCreateInfo.([SHADER_STAGE_VERTEX_BIT, SHADER_STAGE_FRAGMENT_BIT], shaders, "main")
    
    layout = PipelineLayout(device, PipelineLayoutCreateInfo([], []))
    
    vertex_input_state = PipelineVertexInputStateCreateInfo([], [])
    input_assembly_state = PipelineInputAssemblyStateCreateInfo(PRIMITIVE_TOPOLOGY_TRIANGLE_LIST, false)
    rasterizer = PipelineRasterizationStateCreateInfo(false, false, POLYGON_MODE_FILL, FRONT_FACE_CLOCKWISE, false, 0., 0., 0., 1., cull_mode=CULL_MODE_BACK_BIT)
    multisample_state = PipelineMultisampleStateCreateInfo(SAMPLE_COUNT_1_BIT, false, 1., false, false)
    color_blend_attachment = PipelineColorBlendAttachmentState(NoBlending())
    color_blend_state = PipelineColorBlendStateCreateInfo([color_blend_attachment], NoBlending())
    viewport_state = PipelineViewportStateCreateInfo(viewports=[app.viewport.viewport], scissors=[app.viewport.scissor])
    stages = PipelineState(vertex_input_state, input_assembly_state, shader_stage_cis, rasterizer, multisample_state, color_blend_state, C_NULL)

    # pipeline_cis = [GraphicsPipelineCreateInfo(shader_stage_cis, rasterizer, layout, render_pass, 0, 0; vertex_input_state, input_assembly_state, color_blend_state, viewport_state, multisample_state, dynamic_state=PipelineDynamicStateCreateInfo([DYNAMIC_STATE_LINE_WIDTH]))]
    app.pipelines[:main] = PipelineSetup(shaders, stages; layout)
end

function record_render_pass(app, command_buffers)
    renderpass_infos = RenderPassBeginInfo.(app.render_pass, app.framebuffers, Rect2D(Offset2D(0, 0), app.swapchain.extent), Ref([ClearValue(ClearColorValue((0., 0, 0., 1)))]))
    begin_command_buffer.(command_buffers, CommandBufferBeginInfo())
    cmd_begin_render_pass.(command_buffers, renderpass_infos, SUBPASS_CONTENTS_INLINE)
    cmd_bind_pipeline.(command_buffers, PIPELINE_BIND_POINT_GRAPHICS, app.pipelines[:main])
    cmd_draw.(command_buffers, 3, 1, 0, 0)
    cmd_end_render_pass.(command_buffers)
    end_command_buffer.(command_buffers)
end

function recreate_draw_command_buffers!(app)
    @unpack device, render_state = app
    @unpack command_buffers = render_state

    reset_command_buffer.(command_buffers)
    record_render_pass(app, command_buffers)
end

function main()
    # @debug join(["Available instance layers:", string.(enumerate_instance_layer_properties())...], "\n    ")
    # @debug join(["Available extensions:", string.(enumerate_instance_extension_properties())...], "\n    ")
    # instance = Instance(InstanceCreateInfo(@MVector(["VK_LAYER_KHRONOS_validation", "VK_LAYER_NV_nomad_release_public_2020_5_0"]), @MVector(["VK_KHR_xcb_surface", "VK_KHR_surface", "VK_EXT_debug_utils"]); application_info=ApplicationInfo(v"0.1", v"0.1", v"1.2.133", application_name = "JuliaGameEngine", engine_name = "CryEngine")))
    instance = Instance(InstanceCreateInfo(@MVector(["VK_LAYER_KHRONOS_validation"]), @MVector(["VK_KHR_xcb_surface", "VK_KHR_surface", "VK_EXT_debug_utils"]); application_info=ApplicationInfo(v"0.1", v"0.1", v"1.2.133", application_name = "JuliaGameEngine", engine_name = "CryEngine")))
    # instance = Instance(InstanceCreateInfo([], @MVector(["VK_KHR_xcb_surface", "VK_KHR_surface", "VK_EXT_debug_utils"]); application_info=ApplicationInfo(v"0.1", v"0.1", v"1.2.133", application_name = "JuliaGameEngine", engine_name = "CryEngine")))
    dbg = DebugUtilsMessengerEXT(instance; severity="debug")
    # pdps = get_physical_device_properties(pdevices)
    # @debug join(["Available devices:", pdps...], "\n    ")
    # @debug join(["Available device layers:", string.(enumerate_device_layer_properties(first(pdevices)))...], "\n    ")
    # @info join(["Available device extensions:", string.(enumerate_device_extension_properties(first(pdevices)))...], "\n    ")

    app = VulkanApplicationSingleGPU(AppSetup(instance; debug_messenger=dbg))
    add_device!(app)
    
    width, height = 1200, 1200
    output_format = FORMAT_B8G8R8A8_SRGB
    
    window = create_window(; width, height)
    
    add_surface!(app, window)
    add_swapchain!(app, Extent2D(width, height), output_format)
    add_render_pass!(app, output_format)
    add_framebuffers!(app)
    setup_viewport!(app)
    setup_pipeline!(app)
    ps = app.pipelines[:main]
    viewport_state = PipelineViewportStateCreateInfo(viewports=[app.viewport.viewport], scissors=[app.viewport.scissor])
    create_pipeline!(ps, app.device, app.render_pass, viewport_state)
    app.command_pools[:a] = CommandPool(app.device, CommandPoolCreateInfo(0, flags=COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT))
    command_buffers_info = CommandBufferAllocateInfo(app.command_pools[:a], COMMAND_BUFFER_LEVEL_PRIMARY, length(app.framebuffers))
    command_buffers = CommandBuffer(app.device, command_buffers_info, length(app.framebuffers))

    record_render_pass(app, command_buffers)

    initialize_render_state!(app, command_buffers, max_simultaneously_drawn_frames = length(app.framebuffers) - 1)

    function resize_callback(window, width, height)
        @unpack device, render_state = app
        @unpack arr_sem_image_available, arr_sem_render_finished, arr_fen_image_drawn, arr_fen_acquire_image = render_state

        recreate_swapchain!(app, Extent2D(width, height))
        reset_fences.(device, arr_fen_image_drawn)
        reset_fences.(device, arr_fen_acquire_image)
        arr_sem_image_available, arr_sem_render_finished # reset semaphores ?
        recreate_draw_command_buffers!(app)
    end

    try
        run_window(window, nothing, process_event_vulkan; resize_callback=(win, x, y) -> nothing, vulkan_app=app)
    catch e
        rethrow(e) # terminate the event loop from run_window
    finally
        finalize(app)
    end
end

main()