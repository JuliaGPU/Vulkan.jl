abstract type VertexData end

struct Vertex <: VertexData
    position::NTuple{2, Float32}
    color::NTuple{3, Float32}
end

vertices = [
    Vertex((0, -0.5), (1, 1, 0)),
    Vertex((0.5, 0.5), (0, 1, 1)),
    Vertex((-0.5, 0.5), (1, 0, 1))
]

binding_description(::Type{T}, binding; input_rate=VERTEX_INPUT_RATE_VERTEX) where {T <: VertexData} = VertexInputBindingDescription(binding, sizeof(T), input_rate)

formats = Dict(
    Float32 => FORMAT_R32_SFLOAT,
    NTuple{2, Float32} => FORMAT_R32G32_SFLOAT,
    NTuple{3, Float32} => FORMAT_R32G32B32_SFLOAT,
    NTuple{4, Float32} => FORMAT_R32G32B32A32_SFLOAT,
)

attribute_descriptions(::Type{T}, binding) where {T <: VertexData} = VertexInputAttributeDescription.(0:fieldcount(T)-1, binding, getindex.(Ref(formats), fieldtypes(T)), fieldoffset.(T, 1:fieldcount(T)))
binding_description(Vertex, 0)
attribute_descriptions(Vertex, 0)

function add_vertex_buffer!(app, vertices)
    device = app.device
    vertex_data_size = sizeof(vertices)
    vertex_buffer_src = BufferSetup(device, vertex_data_size, BUFFER_USAGE_TRANSFER_SRC_BIT, |(MEMORY_PROPERTY_HOST_VISIBLE_BIT, MEMORY_PROPERTY_HOST_COHERENT_BIT))
    # verts = similar(vertices)
    ptr_ref = Ref{Ptr{Cvoid}}()
    #TODO: Make a Ref{Ptr{Cvoid}} rather than Ref{Cvoid} for ppData
    @check vkMapMemory(device, vertex_buffer_src.memory, 0, WHOLE_SIZE, 0, ptr_ref)
    ptr_deref = ptr_ref[]
    GC.@preserve vertices unsafe_copyto!(reinterpret(Ptr{Vertex}, ptr_deref), pointer(vertices), length(vertices))
    unmap_memory(device, vertex_buffer_src.memory)
    vertex_buffer_dst = BufferSetup(device, vertex_data_size, BUFFER_USAGE_TRANSFER_DST_BIT | BUFFER_USAGE_VERTEX_BUFFER_BIT, MEMORY_PROPERTY_DEVICE_LOCAL_BIT)
    app.buffers[:vertex] = vertex_buffer_dst
    copyto!(vertex_buffer_dst, vertex_buffer_src, vertex_data_size, device, app.command_pools[:a])
    finalize(vertex_buffer_src)
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