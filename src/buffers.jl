function add_buffer!(app, data, symbol; from_pool=:a, usage=nothing)
    device = app.device
    buffer_size = sizeof(data)
    buffer_src = BufferSetup(device, buffer_size, BUFFER_USAGE_TRANSFER_SRC_BIT, |(MEMORY_PROPERTY_HOST_VISIBLE_BIT, MEMORY_PROPERTY_HOST_COHERENT_BIT))
    buffer_dst = BufferSetup(device, buffer_size, (isnothing(usage) ? BUFFER_USAGE_TRANSFER_DST_BIT : |(BUFFER_USAGE_TRANSFER_DST_BIT, usage)), MEMORY_PROPERTY_DEVICE_LOCAL_BIT)
    app.buffers[symbol] = buffer_dst
    copyto!(buffer_src, data, device)
    copyto!(buffer_dst, buffer_src, buffer_size, device, app.command_pools[from_pool])
    finalize(buffer_src)
end

add_vertex_buffer!(app, vertices; buffer_symbol=:vertex) = add_buffer!(app, vertices, buffer_symbol, usage=BUFFER_USAGE_VERTEX_BUFFER_BIT)
add_index_buffer!(app, indices; buffer_symbol=:index) = add_buffer!(app, indices, buffer_symbol, usage=BUFFER_USAGE_INDEX_BUFFER_BIT)

function Base.copyto!(dest::BufferSetup, src, device::DeviceSetup; size=WHOLE_SIZE)
    ptr_ref = Ref{Ptr{Cvoid}}()
    #TODO: Make a Ref{Ptr{Cvoid}} rather than Ref{Cvoid} for ppData inside wrapped_api.jl
    @check vkMapMemory(device, dest.memory, 0, size, 0, ptr_ref)
    ptr_deref = ptr_ref[]
    GC.@preserve src unsafe_copyto!(reinterpret(Ptr{eltype(src)}, ptr_deref), pointer(src), length(src))
    unmap_memory(device, dest.memory)
end

function Base.copyto!(dest::BufferSetup, src::BufferSetup, size, device::DeviceSetup, command_pool)
    cmd_buffer = first(CommandBuffer(device, CommandBufferAllocateInfo(command_pool, COMMAND_BUFFER_LEVEL_PRIMARY, 1)))
    begin_command_buffer(cmd_buffer, CommandBufferBeginInfo(flags=COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT))
    cmd_copy_buffer(cmd_buffer, src, dest, [BufferCopy(0, 0, size)])
    end_command_buffer(cmd_buffer)
    queue_submit(device.queues.graphics, [SubmitInfo([], [], [cmd_buffer], [])])
    queue_wait_idle(device.queues.graphics)
    free_command_buffers(device, command_pool, [cmd_buffer])
end