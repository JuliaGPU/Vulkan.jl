struct ModelViewProjection{T}
    model::SMatrix{4,4,T}
    view::SMatrix{4,4,T}
    proj::SMatrix{4,4,T}
end
