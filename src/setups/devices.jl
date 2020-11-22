Base.@kwdef struct Queues
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
