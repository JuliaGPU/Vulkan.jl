Base.broadcastable(x::VulkanApplication) = Ref(x)
Base.convert(T::Type{<: Handle}, x::Setup) = x.handle

mutable struct VulkanApplicationSingleGPU <: VulkanApplication
    app::AppSetup
    device
    surface
    swapchain
    framebuffers
    command_pools::Dict{Symbol, CommandPool}
    viewport
    render_pass
    render_state
    pipelines::Dict{Symbol, PipelineSetup}
    buffers::Dict{Symbol, BufferSetup}
    function VulkanApplicationSingleGPU(
                                        app::AppSetup;
                                        device           = nothing,
                                        surface          = nothing,
                                        swapchain        = nothing,
                                        framebuffers     = Framebuffer[],
                                        command_pools    = Dict{Symbol, CommandPool}(),
                                        viewport         = nothing,
                                        render_pass      = nothing,
                                        render_state     = nothing,
                                        pipelines        = Dict{Symbol, Pipeline}(),
                                        buffers          = Dict{Symbol, BufferSetup}(),
                                        )
        vasg = new(app, device, surface, swapchain, framebuffers, command_pools, viewport, render_pass, render_state, pipelines, buffers)
        finalizer(vasg) do x
            # !isnothing(x.device) && (device_wait_idle(x.device.handle); @debug("Device idle"))
            finalize.(values(x.pipelines))
            finalize.(values(x.buffers))
            !isempty(x.framebuffers) && finalize.(x.framebuffers)
            finalize.(values(x.command_pools))
                # finalize.(command_pool, pipeline, framebuffers..., pipeline_layout, render_pass, image_views..., swapchain, surface, sem_image_available..., sem_render_finished..., fen_wait_images_drawn..., device, dbg, instance)
            finalize.(getproperty.(x, (:render_pass, :render_state, :swapchain, :surface, :device, :app)))
        end
    end
end

function shutdown_properly!(app)
    !isnothing(app.device) && (device_wait_idle(app.device); @debug("Device shut down"))
    finalize(app)
end

mutable struct RenderState
    frame
    frame_index
    arr_sem_image_available
    arr_sem_render_finished
    arr_fen_image_drawn
    arr_fen_acquire_image
    arr_command_buffers
    max_simultaneously_drawn_frames
    function RenderState(args...)
        rs = new(args...)
        finalizer(rs) do x
            finalize.(x.arr_sem_image_available)
            finalize.(x.arr_sem_render_finished)
            finalize.(x.arr_fen_acquire_image)
            finalize.(x.arr_fen_image_drawn)
        end
    end
end

mutable struct ViewportState
    viewport
    scissor
end

function next_frame!(rs::RenderState)
    rs.frame += 1
    rs.frame_index = mod(rs.frame - 1, rs.max_simultaneously_drawn_frames) + 1
end

next_frame!(app::VulkanApplication) = next_frame!(app.render_state)

function initialize_render_state!(app::VulkanApplication, command_buffers; max_simultaneously_drawn_frames = 2, frame=1)
    @unpack device = app
    arr_sem_image_available = [Semaphore(device, SemaphoreCreateInfo()) for _ ∈ 1:max_simultaneously_drawn_frames]
    arr_sem_render_finished = [Semaphore(device, SemaphoreCreateInfo()) for _ ∈ 1:max_simultaneously_drawn_frames]
    arr_fen_image_drawn = [Fence(device, FenceCreateInfo(flags=FENCE_CREATE_SIGNALED_BIT)) for _ ∈ 1:max_simultaneously_drawn_frames]
    arr_fen_acquire_image = Array{Union{Fence, Nothing}, 1}(nothing, length(app.swapchain.images))
    app.render_state = RenderState(frame, 1, arr_sem_image_available, arr_sem_render_finished, arr_fen_image_drawn, arr_fen_acquire_image, command_buffers, max_simultaneously_drawn_frames)
end

function draw!(app::VulkanApplication)
    @unpack device, swapchain, render_state = app
    @unpack frame_index, arr_command_buffers, arr_sem_render_finished, arr_sem_image_available, arr_fen_image_drawn, arr_fen_acquire_image = render_state

    wait_for_fences(device, [arr_fen_image_drawn[frame_index]], true, typemax(UInt64))
    index = acquire_next_image_khr(device, swapchain, typemax(UInt64); semaphore=arr_sem_image_available[frame_index])
    index_jl = index + 1
    if !isnothing(arr_fen_acquire_image[index_jl])
        wait_for_fences(device, [arr_fen_acquire_image[index_jl]], true, typemax(UInt64))
    end
    render_state.arr_fen_acquire_image[index_jl] = arr_fen_image_drawn[frame_index]
    submit_info = SubmitInfo([arr_sem_image_available[frame_index]], [PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT], [arr_command_buffers[index_jl]], [arr_sem_render_finished[frame_index]])
    reset_fences(device, [arr_fen_image_drawn[frame_index]])
    queue_submit(app.device.queues.graphics, [submit_info], fence=arr_fen_image_drawn[frame_index])
    present_info = PresentInfoKHR([arr_sem_render_finished[frame_index]], [swapchain.handle], [index])
    queue_present_khr(app.device.queues.present, present_info)
end