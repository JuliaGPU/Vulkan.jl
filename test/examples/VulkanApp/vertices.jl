struct PosColor{PDim, CDim, T <: Number} <: VertexData
    position::Point{PDim, T}
    color::Point{CDim, T}
end

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