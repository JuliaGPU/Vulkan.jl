mutable struct VulkanApplicationSingleDevice <: VulkanApplication
    instance::InstanceSetup
    device
    surface
    swapchain
    framebuffers
    command_pools::Dict{Symbol, CommandPool}
    descriptor_pools::Dict{Symbol, DescriptorPool}
    viewport
    render_pass
    render_state
    pipelines::Dict{Symbol, PipelineSetup}
    buffers::Dict{Symbol, BufferSetup}
    function VulkanApplicationSingleDevice(
                                        instance::InstanceSetup;
                                        device           = nothing,
                                        surface          = nothing,
                                        swapchain        = nothing,
                                        framebuffers     = Framebuffer[],
                                        command_pools    = Dict{Symbol, CommandPool}(),
                                        descriptor_pools = Dict{Symbol, DescriptorPool}(),
                                        viewport         = nothing,
                                        render_pass      = nothing,
                                        render_state     = nothing,
                                        pipelines        = Dict{Symbol, Pipeline}(),
                                        buffers          = Dict{Symbol, BufferSetup}(),
                                        )
        vasg = new(instance, device, surface, swapchain, framebuffers, command_pools, descriptor_pools, viewport, render_pass, render_state, pipelines, buffers)
        finalizer(vasg) do x
            # !isnothing(x.device) && (device_wait_idle(x.device.handle); @debug("Device idle"))
            finalize.(values(x.pipelines))
            finalize.(values(x.buffers))
            !isempty(x.framebuffers) && finalize.(x.framebuffers)
            finalize.(values(x.command_pools))
            finalize.(values(x.descriptor_pools))
                # finalize.(command_pool, pipeline, framebuffers..., pipeline_layout, render_pass, image_views..., swapchain, surface, sem_image_available..., sem_render_finished..., fen_wait_images_drawn..., device, dbg, instance)
            finalize.(getproperty.(x, (:render_pass, :render_state, :swapchain, :surface, :device, :instance)))
        end
    end
end

function safe_shutdown!(app::VulkanApplicationSingleDevice)
    !isnothing(app.device) && (device_wait_idle(app.device); @debug("Device shut down"))
    finalize(app)
end

include("single_device/surface.jl")
include("single_device/swapchain.jl")
include("single_device/command_pools.jl")
include("single_device/descriptor_pools.jl")
include("single_device/buffers.jl")
include("single_device/viewport.jl")
include("single_device/pipeline.jl")
include("single_device/rendering.jl")
