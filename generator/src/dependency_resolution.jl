raw_dependencies(decl) = []
raw_dependencies(decl::CDefinition) = isalias(name(decl)) ? value(decl) : is_literal(value(decl)) || is_expr(value(decl)) ? String[] : type_dependencies(value(decl))
raw_dependencies(decl::SDefinition) = type_dependencies(decl)
raw_dependencies(decl::FDefinition) = type_dependencies(decl)
raw_dependencies(decl::EDefinition) = @capture(decl.ex, @m_ E_::T_ rest__) ? type_dependencies(string(T)) : String[]

function dependencies(decl)
    deps = raw_dependencies(decl)
    filter!.([!isnothing, !is_base_type, !isalias, !is_vulkan_type], Ref(deps))
    deps
end

function check_is_dag(g, decls)
    if is_cyclic(g) || !is_directed(g)
        cycles = simplecycles_hadwick_james(g)
        problematic_decls = unique(vcat(decls[cycles]...))
        error("""
        Dependency graph is not a directed acyclic graph (is $(is_directed(g) ? "directed" : "undirected") and $(is_cyclic(g) ? "cyclic" : "acyclic"))

        $(is_cyclic(g) ? """
        Cycles:

        $(join(generate.(problematic_decls), "\n"^2))""" : "")
        """)
    end
end

function resolve_dependencies(decl_names, decls)
    g = SimpleDiGraph(length(decl_names))

    for (j, (decl_name, decl)) ∈ enumerate(zip(decl_names, decls))
        for dep ∈ dependencies(decl)
            i = findfirst(decl_names .== dep)
            add_edge!(g, i, j)
        end
    end

    check_is_dag(g, decls)
    topological_sort_by_dfs(g)
end

function check_dependencies(decls)
    encountered_deps = []
    for decl ∈ decls
        deps = dependencies(decl)
        if deps ⊈ encountered_deps
            error("Unsolved dependencies $deps for declaration $decl")
        end
        push!(encountered_deps, name(decl))
    end
end
