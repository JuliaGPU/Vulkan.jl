"""
While handles are primordial for executing Vulkan API calls, they usually involve a lot more information that is intrinsically linked with the handle itself. A setup wraps a `Handle` by gathering the information that is required for a given piece of the application to work. For a logical device, that would include the physical device and the device itself (as a `Handle`), as well as its queues, semaphores and fences. A swapchain is also bound to a `Handle`, covers a certain extent of a surface and possesses images. When performing API calls, since a `Setup` object is bound to a handle, there is no need to specify the handle manually. The `Setup` object will automatically be converted to its handle when such call is performed.
"""
abstract type Setup end

# to avoid having to specify the handle every time an API call is made
Base.cconvert(T::Type{<: Ptr}, x::Setup) = x.handle
Base.convert(T::Type{<: Handle}, x::Setup) = x.handle

Base.broadcastable(x::Setup) = Ref(x)

mutable struct AppSetup <: Setup
    handle::Instance
    debug_messenger
    function AppSetup(instance::Instance; debug_messenger = nothing)
        as = new(instance, debug_messenger)
        finalizer(as) do x
            finalize.(getproperty.(x, (:debug_messenger, :handle)))
        end
    end
end

@with_kw struct Queues
    present = nothing
    graphics = nothing
    compute = nothing
end

struct DeviceQueue <: Setup
    handle
    queue_index
    queue_family_index
end

mutable struct DeviceSetup <: Setup
    handle::Device
    physical_device_handle::PhysicalDevice
    queues::Queues
    semaphores::Dict{Symbol, Semaphore}
    fences::Dict{Symbol, Fence}
    function DeviceSetup(handle, physical_device_handle, queues; semaphores = Dict{Symbol, Semaphore}(), fences = Dict{Symbol, Fence}())
        ds = new(handle, physical_device_handle, queues, semaphores, fences)
        finalizer(ds) do x
            finalize.(values(x.semaphores))
            finalize.(values(x.fences))
            finalize(x.handle)
        end
    end
end

mutable struct SwapchainSetup <: Setup
    handle::SwapchainKHR
    extent::Extent2D
    images::Array{Image, 1}
    image_views::Array{ImageView, 1}
    function SwapchainSetup(args...)
        ss = new(args...)
        finalizer(ss) do x
            finalize.(x.image_views)
            finalize(x.handle)
        end
    end
end

mutable struct SurfaceSetup <: Setup
    handle::SurfaceKHR
    window
    function SurfaceSetup(handle; window = nothing)
        ss = new(handle, window)
        finalizer(ss) do x
            finalize(x.handle)
        end
    end
end

mutable struct PipelineSetup <: Setup
    handle
    shader_modules
    layout
    cache
    stages
    function PipelineSetup(shader_modules, stages; layout = C_NULL, cache = C_NULL)
        ps = new(C_NULL, shader_modules, layout, cache, stages)
        finalizer(ps) do x
            finalize.(x.shader_modules)
            finalize.(getproperty.(x, (:handle, :layout, :cache)))
        end
    end
end

function Vulkan.GraphicsPipelineCreateInfo(ps::PipelineSetup, render_pass, viewport_state)
    s = ps.stages
    @unpack vertex_input_state, input_assembly_state, color_blend_state, multisample_state, dynamic_state = s
    GraphicsPipelineCreateInfo(s.shaders, s.rasterization, ps.layout, render_pass, 0, 0; vertex_input_state, input_assembly_state, color_blend_state, viewport_state, multisample_state, dynamic_state)
end

function create_pipeline!(ps::PipelineSetup, device, render_pass, viewport_state)
    ps.handle = first(Pipeline(device, [GraphicsPipelineCreateInfo(ps, render_pass, viewport_state)]))
end

function create_pipelines!(device, render_pass, viewport_state, pss::PipelineSetup...)
    setproperty!.(pss, :handle, Pipeline(GraphicsPipelineCreateInfo.(pss, render_pass, viewport_state)))
end

function recreate_pipeline!(ps::PipelineSetup, app)
    create_pipeline!(ps, app.render_pass.handle, app.viewport.state)
end