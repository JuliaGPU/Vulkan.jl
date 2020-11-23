mutable struct BufferSetup <: Setup
    handle::Buffer
    memory::DeviceMemory
    payload_size
    size
    device_local::Bool
    function BufferSetup(device::DeviceSetup, size, usage, memory_properties; sharing_mode=SHARING_MODE_EXCLUSIVE, queue_families=[], flags=0, next=C_NULL)
        buffer = Buffer(device, BufferCreateInfo(size, usage, sharing_mode, queue_families; flags, next))
        mem_reqs = get_buffer_memory_requirements(device, buffer)
        physical_device = device.physical_device_handle
        index = find_memory_type(physical_device, mem_reqs.memory_type_bits, memory_properties)
        buffer_memory = allocate_memory(device, MemoryAllocateInfo(mem_reqs.size, index))
        finalizer(x -> free_memory(device, memory=x), buffer_memory)
        bind_buffer_memory(device, buffer, buffer_memory, 0)
        bs = new(buffer, buffer_memory, size, mem_reqs.size, DeviceLocal() ∈ memory_properties)
        finalizer(x -> finalize.(getproperty.(x, [:handle, :memory])), bs)
    end
end

BufferSetup(device::DeviceSetup, size, usage, memory_property::MemoryProperty; kwargs...) = BufferSetup(device::DeviceSetup, size, usage, @SVector([memory_property]); kwargs...)

function Base.copyto!(dest::BufferSetup, src, device::DeviceSetup)
    ptr_ref = Ref{Ptr{Cvoid}}()
    #TODO: Make a Ref{Ptr{Cvoid}} rather than Ref{Cvoid} for ppData inside wrapped_api.jl
    @check vkMapMemory(device, dest.memory, 0, dest.payload_size, 0, ptr_ref)
    GC.@preserve src unsafe_copyto!(reinterpret(Ptr{eltype(src)}, ptr_ref[]), pointer(src), length(src))
    unmap_memory(device, dest.memory)
end

function Base.copyto!(dest::BufferSetup, src::BufferSetup, device::DeviceSetup, command_pool::CommandPool)
    cmd_buffer = first(CommandBuffer(device, CommandBufferAllocateInfo(command_pool, COMMAND_BUFFER_LEVEL_PRIMARY, 1)))
    begin_command_buffer(cmd_buffer, CommandBufferBeginInfo(flags=COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT))
    cmd_copy_buffer(cmd_buffer, src, dest, [BufferCopy(0, 0, src.payload_size)])
    end_command_buffer(cmd_buffer)
    queue_submit(device.queues.graphics, [SubmitInfo([], [], [cmd_buffer], [])])
    queue_wait_idle(device.queues.graphics)
    free_command_buffers(device, command_pool, [cmd_buffer])
end

function stage_buffer!(buffer::BufferSetup, data, device, command_pool)
    staging_buffer = BufferSetup(device, buffer.payload_size, usage=BUFFER_USAGE_TRANSFER_SRC_BIT)
    copyto!(staging_buffer, data, device)
    copyto!(buffer, staging_buffer, device, command_pool)
    finalize(staging_buffer)
end


function Base.fill!(buffer::BufferSetup, data, device; command_pool=nothing)
    if buffer.device_local
        @assert !isnothing(command_pool) "A command pool must be provided to fill a device local buffer."
        stage_buffer!(buffer, data, device, command_pool)
    else
        copyto!(buffer, data, device)
    end
end

function BufferSetup(device, size; usage=nothing, device_local=false)
    if device_local
        BufferSetup(device, size, bitwise_or_optional(BUFFER_USAGE_TRANSFER_DST_BIT, usage), DeviceLocal())
    else
        BufferSetup(device, size, (isnothing(usage) ? BUFFER_USAGE_TRANSFER_DST_BIT : usage), @SVector([HostVisible(), HostCoherent()]))
    end
end
