const alias_dict = Dict(Symbol(alias.parentelement["name"]) => Symbol(alias.parentelement["alias"]) for alias ∈ findall("//@alias", xroot))

"""
Whether this type is an alias for another name.
"""
isalias(name) = name ∈ keys(alias_dict)

"""
Whether an alias was built from this name.
"""
hasalias(name) = name ∈ values(alias_dict)

alias_verts = unique(vcat(collect(keys(alias_dict)), collect(values(alias_dict))))

function build_alias_graph(alias_verts, alias_dict)
    g = SimpleDiGraph(length(alias_verts))
    
    for (j, (src, dst)) ∈ enumerate(alias_dict)
        i = findfirst(==(dst), alias_verts)
        add_edge!(g, i, j)
    end

    g
end

const alias_graph = build_alias_graph(alias_verts, alias_dict)

aliases(alias_graph::SimpleDiGraph, index) = getindex.(Ref(alias_verts), outneighbors(alias_graph, index))

function aliases(name)
    index = findfirst(==(name), alias_verts)
    isnothing(index) ? Symbol[] : aliases(alias_graph, index)
end

function follow_alias(alias_graph::SimpleDiGraph, index)
    indices = inneighbors(alias_graph, index)
    if isempty(indices)
        alias_verts[index]
    elseif length(indices) > 1
        error("More than one indices returned for $(alias_verts[index]) when following alias $(getindex.(Ref(alias_verts), indices))")
    else
        i = first(indices)
        if i == index
            alias_verts[i]
        else
            follow_alias(alias_graph, i)
        end
    end
end

function follow_alias(name)
    index = findfirst(==(name), alias_verts)
    isnothing(index) ? name : follow_alias(alias_graph, index)
end
