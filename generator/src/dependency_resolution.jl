raw_dependencies(decl) = []
raw_dependencies(decl::CDefinition) = isalias(decl.name) ? decl.value : is_literal(decl.value) || is_expr(decl.value) ? String[] : type_dependencies(decl.value)
raw_dependencies(decl::SDefinition) = type_dependencies(decl)
raw_dependencies(decl::FDefinition) = type_dependencies(decl)
raw_dependencies(decl::EDefinition) = isnothing(decl.type) ? String[] : type_dependencies(decl.type)

function dependencies(decl)
    deps = raw_dependencies(decl)
    deps |> Filter(!isnothing) |> Filter(!is_base_type) |> Filter(!isalias) |> Filter(!is_vulkan_type) |> collect
end

function write_dependencies(io, decl_list_values, dep_list)
    for decl ∈ decl_list_values
        write(io, "$(lpad(decl.name, 100)) ⟶ $(join(dep_list[decl.name], ", "))\n")
    end 
end

function resolve_dependencies(decl_dict)
    decl_list_keys = keys(decl_dict)
    decl_list_values = values(decl_dict)
    verts = unique(collect(Base.Iterators.flatten(vcat(decl_list_keys, dependencies.(decl_list_values)))))
    g = SimpleDiGraph(length(verts))
    dep_list = DefaultOrderedDict(() -> String[])
    for (j, decl_name) ∈ enumerate(verts)
        !haskey(decl_dict, decl_name) && continue
        decl = decl_dict[decl_name]
        for dep ∈ dependencies(decl)
            i = findfirst(verts .== dep)
            add_edge!(g, i, j)
            push!(dep_list[decl_name], dep)
        end
    end
    # open("resolution_graph.txt", "w") do io
    #     write_dependencies(io, decl_list_values, dep_list)
    # end
    if is_cyclic(g) || !is_directed(g)
        cycles = simplecycles_hadwick_james(g)
        problematic_decls = getindex.(Ref(decl_dict), unique(Iterators.flatten(getindex.(Ref(verts), cycles))))
        error("""
        Dependency graph is not a directed acyclic graph (is $(is_directed(g) ? "directed" : "undirected") and $(is_cyclic(g) ? "cyclic" : "acyclic"))

        $(is_cyclic(g) ? """
        Cycles:

        $(join(generate.(problematic_decls), "\n"^2))""" : "")
        """)
    end
    sorted_decl_names = getindex.(Ref(verts), topological_sort_by_dfs(g))
    sorted_decl_names
end

function check_dependencies(decls, decls_order)
    encountered_deps = []
    for decl_name ∈ decls_order
        decl = decls[decl_name]
        deps = dependencies(decl)
        @assert issubset(deps, encountered_deps) "Unresolved dependencies $deps for declaration $(decls[decl_name])\nKnown dependencies are $encountered_deps"
        push!(encountered_deps, decl_name)
    end
end
