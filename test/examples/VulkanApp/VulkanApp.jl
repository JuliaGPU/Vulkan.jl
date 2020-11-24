module VulkanAppExample

using Vulkan
using XCB
using WindowAbstractions
using VulkanCore.vk
using Parameters
using BenchmarkTools
using Meshes
using LinearAlgebra

#= Logging =#
using TerminalLoggers
using ProgressLogging
using REPL
using REPL:Terminals
using Logging: global_logger
using StaticArrays

include(joinpath(@__DIR__, "..", "common", "logging.jl"))
include(joinpath(@__DIR__, "..", "common", "geometry.jl"))
include("window.jl")
include("features.jl")
include("vertex_attributes.jl")
include("vertices.jl")

shader_log_f(format, file) = replprint("$(typeof(format)) shader $file", log_term, prefix="Compiling ")
shader_log_f() = replprint("Shaders compiled", log_term, newline=1, color=:green, bold=true)

function add_device!(app::VulkanApplicationSingleDevice)
    pdevices = enumerate_physical_devices(app.instance)
    pdevice = first(pdevices)
    device = Device(pdevice, DeviceCreateInfo([DeviceQueueCreateInfo(0, [1.0])], String[], ["VK_KHR_swapchain"], enabled_features=PhysicalDeviceFeatures(values(physical_device_features)...)))
    queue = get_device_queue(device, 0, 0).handle
    queues = Queues(NamedTuple{(:present, :graphics, :compute)}(DeviceQueue.((queue, queue, queue), (0, 0, 0), (0, 0, 0)))...)
    app.device = DeviceSetup(device, pdevice, queues)
end

function setup_pipeline!(app::VulkanApplication, vertex_data_type::T; pipeline_symbol=:main) where {T <: Type{<: VertexData}}
    @unpack device = app

    shaders = Shader.(device, ShaderFile.(joinpath.(Ref(@__DIR__), ["triangle.vert", "triangle.frag"]), GLSL()), [[ResourceBinding(UniformBuffer(), 0, 0)], ResourceBinding[]])
    shader_stage_cis = PipelineShaderStageCreateInfo.(shaders)
    
    vertex_input_state = PipelineVertexInputStateCreateInfo([binding_description(vertex_data_type, 0)], attribute_descriptions(vertex_data_type, 0))
    input_assembly_state = PipelineInputAssemblyStateCreateInfo(PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP, false)
    rasterizer = PipelineRasterizationStateCreateInfo(false, false, POLYGON_MODE_FILL, FRONT_FACE_CLOCKWISE, false, 0., 0., 0., 1., cull_mode=CULL_MODE_BACK_BIT)
    multisample_state = PipelineMultisampleStateCreateInfo(SAMPLE_COUNT_1_BIT, false, 1., false, false)
    color_blend_attachment = PipelineColorBlendAttachmentState(AlphaBlending)
    color_blend_state = PipelineColorBlendStateCreateInfo([color_blend_attachment], (0.0, 1.0, 1.0, 0.01))
    stages = PipelineState(vertex_input_state, input_assembly_state, shader_stage_cis, rasterizer, multisample_state, color_blend_state, C_NULL)

    setup = PipelineSetup(device, stages, shaders)
    create_pipeline!(setup, app)
    app.pipelines[pipeline_symbol] = setup
end

function record_render_pass(app, data, command_buffers)
    renderpass_infos = RenderPassBeginInfo.(app.render_pass, app.framebuffers, Rect2D(Offset2D(0, 0), app.swapchain.extent), Ref([ClearValue(ClearColorValue((0., 0.01, 0.015, 1)))]))
    begin_command_buffer.(command_buffers, CommandBufferBeginInfo())
    cmd_begin_render_pass.(command_buffers, renderpass_infos, SUBPASS_CONTENTS_INLINE)
    cmd_bind_index_buffer.(command_buffers, app.buffers[:index], 0, INDEX_TYPE_UINT32)
    cmd_bind_vertex_buffers.(command_buffers, 0, Ref([app.buffers[:vertex].handle]), Ref(DeviceSize[0]))
    cmd_bind_pipeline.(command_buffers, PIPELINE_BIND_POINT_GRAPHICS, app.pipelines[:main])
    cmd_draw_indexed.(command_buffers, length(indices(data)), 1, 0, 0, 0)
    cmd_end_render_pass.(command_buffers)
    end_command_buffer.(command_buffers)
end

#TODO: is unsued, do something about it
function recreate_draw_command_buffers!(app, data)
    @unpack device, render_state = app
    @unpack arr_command_buffers = render_state

    reset_command_buffer.(arr_command_buffers)
    record_render_pass.(app, data, arr_command_buffers)
end

function create_application(; validate=true)
    layers = validate ? ["VK_LAYER_KHRONOS_validation"] : String[]
    instance = Instance(InstanceCreateInfo(layers, ["VK_KHR_xcb_surface", "VK_KHR_surface", "VK_EXT_debug_utils"]; application_info=ApplicationInfo(v"0.1", v"0.1", v"1.2.133", application_name = "JuliaGameEngine", engine_name = "CryEngine")))
    callback = @cfunction(default_debug_callback, UInt32, (Vulkan.DebugUtilsMessageSeverityFlagBitsEXT, Vulkan.DebugUtilsMessageTypeFlagBitsEXT, Ptr{Vulkan.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))
    VulkanApplicationSingleDevice(InstanceSetup(instance; debug_messenger=(validate ? DebugUtilsMessengerEXT(instance, callback; severity="debug") : nothing)))
end

function handle_resize!(app, data)
    @unpack device, surface, render_state = app
    @unpack arr_sem_image_available, arr_sem_render_finished, arr_fen_image_drawn, arr_fen_acquire_image, max_simultaneously_drawn_frames = render_state

    device_wait_idle(device)

    recreate_swapchain!(app)
    finalize.(app.framebuffers)
    finalize(app.render_pass)
    free_command_buffers(device, app.command_pools[:a], render_state.arr_command_buffers)
    finalize(render_state)
    prepare_rendering_to_target!(app, Target{SwapchainKHR}())
    recreate_pipeline!(app.pipelines[:main], app)
    command_buffers_info = CommandBufferAllocateInfo(app.command_pools[:a], COMMAND_BUFFER_LEVEL_PRIMARY, length(app.framebuffers))
    command_buffers = CommandBuffer(app.device, command_buffers_info, length(app.framebuffers))
    record_render_pass(app, data, command_buffers)
    initialize_render_state!(app, command_buffers; frame=render_state.frame, max_simultaneously_drawn_frames=render_state.max_simultaneously_drawn_frames)
end

function render!(app, data)
    try
        draw!(app)
        next_frame!(app)
    catch e
        if e isa VulkanError && e.return_code == VK_ERROR_OUT_OF_DATE_KHR
            handle_resize!(app, data)
            @warn "Out of date swapchain was recreated"
        end
    end
end

function on_key_pressed(event, app)
    key = KeyCombination(event.data.key, event.data.modifiers)
    window = event.window
    set_title(window, "Random title $(rand())")
    if key ∈ [key"q", key"ctrl+q", key"f4"]
        println()
        throw(CloseWindow(event.window_handler, window))
    elseif key == key"b"
        println()
        display(@benchmark(render!($app)))
    elseif key == key"s"
        curr_extent = extent(window)
        set_extent(window, (curr_extent[1] + 1, curr_extent[2]))
    end
end

function main()
    local app
    try
        app = create_application(validate=isempty(ARGS) || ARGS[1] ≠ "--novalidate")
        print_available_devices(app.instance)
        add_device!(app)
        
        window = create_window(width=512, height=512)
        target!(app, window)
        
        create_command_pool!(app, :a)

        data = pos_color(q, colors)
        add_vertex_buffer!(app, data, device_local=true, from_pool=:a)
        add_index_buffer!(app, indices(data), device_local=true, from_pool=:a)
        
        m = v = p = SMatrix{4,4,Float32}(Diagonal([1, 1, 1, 1]))
        mvp = ModelViewProjection(m, v, p)
        add_uniform_buffer!(app, 4*4*3, :mvp, fill_with=MMatrix{12,4}(vcat(mvp.model, mvp.view, mvp.proj)))
        
        setup_pipeline!(app, eltype(data))
        command_buffers_info = CommandBufferAllocateInfo(app.command_pools[:a], COMMAND_BUFFER_LEVEL_PRIMARY, length(app.framebuffers))
        command_buffers = CommandBuffer(app.device, command_buffers_info, length(app.framebuffers))

        record_render_pass(app, data, command_buffers)

        initialize_render_state!(app, command_buffers, max_simultaneously_drawn_frames = length(app.framebuffers) - 1)

        window_handler = XWindowHandler(window.conn, [window])
        event_loop = EventLoop(;
            window_handler,
            callbacks=Dict(
                :window_1 => WindowCallbacks(;
                    on_key_pressed = x -> on_key_pressed(x, app),
                    on_expose = x -> replprint("window exposed", log_term; prefix="Frame " * string(app.render_state.frame) * " "),
                    on_resize = x -> handle_resize!(app, data),
                ),
            ),
            on_iter_first = () -> replprint("", log_term, prefix="Frame " * string(app.render_state.frame) * " "),
            on_iter_last = () -> render!(app, data),
        )
        run(event_loop, Synchronous(); warn_unknown=false, poll=false)
    catch e
        rethrow(e) # terminate the event loop from run_window
    finally
        safe_shutdown!(app)
    end
end

function test_enumerated_properties()
    app = create_application()
    instance = app.instance.handle
    add_device!(app)
    physical_device = app.device.physical_device_handle
    window = create_window()
    add_surface!(app, window)
    surface = app.surface.handle
    println.(enumerate_device_extension_properties(physical_device))
    println.(enumerate_instance_layer_properties())
    println.(get_physical_device_surface_formats_khr(physical_device, surface))
    println.(get_physical_device_surface_present_modes_khr(physical_device, surface))
    println(get_physical_device_surface_capabilities_khr(physical_device, surface))
    try
        println(get_physical_device_properties(physical_device))
    finally
        finalize(app)
        finalize.([window, window.conn])
    end
end

#TODO: add flags extraction from bitmasks

export main,
       test_enumerated_properties

end # module
