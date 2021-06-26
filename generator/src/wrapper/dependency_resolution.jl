const known_dependencies = [:FunctionPtr, :RefCounter]

function field_deps(ex)
    @match ex begin
        :($_::$T) => innermost_type(T)
        _ => nothing
    end
end

function raw_dependencies(ex)
    p = deconstruct(ex)
    deps = @match category(ex) begin
        :struct => field_deps.(p[:fields])
        :function => vcat(map.(Ref(@λ(begin
            :($arg::$type) => inner_type(type)
            :(::$type) => inner_type(type)
            arg => nothing
        end)), [p[:args], p[:kwargs]])...)
        :const => isalias(p[:name]) ? p[:value] : p[:value] isa Symbol ? p[:value] : []
        :enum => p[:type]
    end
    deps isa Vector ? deps : [deps]
end

function dependencies(ex)
    deps = raw_dependencies(ex)
    filter!.(
        [
            !isalias,
            x -> !startswith(string(x), r"(?:Vk|VK_|StdVideo)"),
            !is_vulkan_type,
            !in(known_dependencies),
            !in(extension_types),
            !in(names(Core)),
            !in(names(Base)),
            x -> x isa Symbol,
        ],
        Ref(deps),
    )
    deps
end

function check_is_dag(g, decls)
    if is_cyclic(g) || !is_directed(g)
        cycles = simplecycles_hadwick_james(g)
        inds = unique(vcat(cycles...))
        problematic_decls = getindex.(Ref(decls), inds)
        error(
            """
      Dependency graph is not a directed acyclic graph (is $(is_directed(g) ? "directed" : "undirected") and $(is_cyclic(g) ? "cyclic" : "acyclic"))

      $(is_cyclic(g) ? """
      Cycles:

      $(join(generate.(problematic_decls), "\n"^2))""" : "")
      """,
        )
    end
end

function resolve_dependencies(decl_names, decls)
    g = SimpleDiGraph(length(decl_names))

    for (j, (decl_name, decl)) ∈ enumerate(zip(decl_names, decls))
        for dep ∈ dependencies(decl)
            i = findfirst(x -> x == dep, decl_names)
            isnothing(i) && error("Could not find dependency '$dep' for $decl")
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
    decls
end
