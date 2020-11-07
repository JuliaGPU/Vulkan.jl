abstract type VertexData end

binding_description(::Type{T}, binding; input_rate=VERTEX_INPUT_RATE_VERTEX) where {T <: VertexData} = VertexInputBindingDescription(binding, sizeof(T), input_rate)

formats = Dict(
    Point{1, Float32} => FORMAT_R32_SFLOAT,
    Point{2, Float32} => FORMAT_R32G32_SFLOAT,
    Point{3, Float32} => FORMAT_R32G32B32_SFLOAT,
    Point{4, Float32} => FORMAT_R32G32B32A32_SFLOAT,
)

attribute_descriptions(::Type{T}, binding) where {T <: VertexData} = VertexInputAttributeDescription.(0:fieldcount(T)-1, binding, getindex.(Ref(formats), fieldtypes(T)), fieldoffset.(T, 1:fieldcount(T)))
invert_y_axis(p::P) where {P <: Point{2, T}} where {T} = P(p.coords[1], -p.coords[2])