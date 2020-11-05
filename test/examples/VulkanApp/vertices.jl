using Meshes

abstract type VertexData end

struct PosColor{PDim, CDim, T <: Number} <: VertexData
    position::Point{PDim, T}
    color::Point{CDim, T}
end

invert_y_axis(p::P) where {P <: Point{2, T}} where {T} = P(p.coords[1], -p.coords[2])

indices(q::Quadrangle) = collect(0:3)
indices(q) = collect(0:(length(q)-1))
pos_color(q::Quadrangle, colors) = PosColor.(invert_y_axis.(vertices(q)), colors)
q = Quadrangle(Point.(Float32[-0.5, -0.5, 0.5, 0.5], Float32[-0.5, 0.5, -0.5, 0.5]))
colors = Point{4, Float32}[
    Point(0., 0., 1., 0.7),
    Point(0., 1., 0., 0.05),
    Point(1., 0., 0., 1.),
    Point(1., 1., 1., 0.4),
]
# colors = [
#     (0, 0.2, 1),
#     (0, 0.2, 1),
#     (0, 0.2, 1),
#     (0, 0.2, 1),
# ]

binding_description(::Type{T}, binding; input_rate=VERTEX_INPUT_RATE_VERTEX) where {T <: VertexData} = VertexInputBindingDescription(binding, sizeof(T), input_rate)

formats = Dict(
    Point{1, Float32} => FORMAT_R32_SFLOAT,
    Point{2, Float32} => FORMAT_R32G32_SFLOAT,
    Point{3, Float32} => FORMAT_R32G32B32_SFLOAT,
    Point{4, Float32} => FORMAT_R32G32B32A32_SFLOAT,
)

attribute_descriptions(::Type{T}, binding) where {T <: VertexData} = VertexInputAttributeDescription.(0:fieldcount(T)-1, binding, getindex.(Ref(formats), fieldtypes(T)), fieldoffset.(T, 1:fieldcount(T)))