mutable struct VulkanApplicationSingleDevice <: VulkanApplication
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
    function VulkanApplicationSingleDevice(
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

function safe_shutdown!(app::VulkanApplicationSingleDevice)
    !isnothing(app.device) && (device_wait_idle(app.device); @debug("Device shut down"))
    finalize(app)
end

include("single_device/buffers.jl")
include("single_device/pipeline.jl")
include("single_device/rendering.jl")
include("single_device/swapchain.jl")
include("single_device/surface.jl")
include("single_device/viewport.jl")
