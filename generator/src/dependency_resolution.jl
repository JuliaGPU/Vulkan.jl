const known_dependencies = [:FunctionPtr, :RefCounter]

function resolve_type(type)
    if type isa Symbol
        type in extension_types ? :(vk.$type) : type
    else
        postwalk(type) do ex
            ex isa Symbol ? resolve_type(ex) : ex
        end
    end
end

resolve_types(ex) = postwalk(resolve_type, ex)

function field_deps(ex)
    @match ex begin
        :($_::$T) => innermost_type(T)
        _ => nothing
    end
end

function raw_dependencies(ex)
    p = deconstruct(ex)
    @match category(ex) begin
        :struct => begin
            # handle structs wrapped with @struct_hash_equal
            p = haskey(p, :macro) ? deconstruct(p[:decl]) : p
            field_deps.(p[:fields])
        end
        :function => vcat(map.(Ref(@λ(begin
            :($arg::$type) => inner_type(type)
            :(::$type) => inner_type(type)
            arg => nothing
        end)), [p[:args], p[:kwargs]])...)
        :const => p[:value] isa Symbol ? [p[:value]] : Symbol[]
        :enum => [p[:type]]
        :doc => raw_dependencies(p[:ex])
    end
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
            !in(Base.names(Core)),
            !in(Base.names(Base)),
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

function resolve_dependencies(decls)
    defined_names = names.(decls)
    g = SimpleDiGraph(length(decls))

    for (j, decl) ∈ enumerate(decls)
        for dep ∈ dependencies(decl)
            i = findfirst(Base.Fix1(in, dep), defined_names)
            !isnothing(i) || error("Could not find dependency '$dep' for $decl")
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
        append!(encountered_deps, names(decl))
    end
    decls
end
