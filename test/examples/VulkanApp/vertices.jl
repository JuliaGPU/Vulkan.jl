abstract type VertexData end

struct Vertex <: VertexData
    position::NTuple{2, Float32}
    color::NTuple{3, Float32}
end

vertices = [
    Vertex((-0.5, -0.5), (0, 0, 1)),
    Vertex((0.5, -0.5), (0, 1, 0)),
    Vertex((0.5, 0.5), (1, 1, 1)),
    Vertex((-0.5, 0.5), (1, 0, 0)),
]

indices = UInt32[0, 1, 2, 2, 3, 0]

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

function add_buffer!(app, data, symbol; command_pool=:a, usage=nothing)
    device = app.device
    buffer_size = sizeof(data)
    buffer_src = BufferSetup(device, buffer_size, BUFFER_USAGE_TRANSFER_SRC_BIT, |(MEMORY_PROPERTY_HOST_VISIBLE_BIT, MEMORY_PROPERTY_HOST_COHERENT_BIT))
    buffer_dst = BufferSetup(device, buffer_size, (isnothing(usage) ? BUFFER_USAGE_TRANSFER_DST_BIT : |(BUFFER_USAGE_TRANSFER_DST_BIT, usage)), MEMORY_PROPERTY_DEVICE_LOCAL_BIT)
    app.buffers[symbol] = buffer_dst
    copyto!(buffer_src, data, device)
    copyto!(buffer_dst, buffer_src, buffer_size, device, app.command_pools[command_pool])
    finalize(buffer_src)
end

add_vertex_buffer!(app, vertices) = add_buffer!(app, vertices, :vertex, usage=BUFFER_USAGE_VERTEX_BUFFER_BIT)
add_index_buffer!(app, indices) = add_buffer!(app, indices, :index, usage=BUFFER_USAGE_INDEX_BUFFER_BIT)