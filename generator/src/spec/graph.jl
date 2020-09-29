struct_nodes = findall("//type[@category='struct']", xroot)
ignored_types = [
    "VkBaseInStructure",
    "VkBaseOutStructure",
]

vk_structs_graph_base = vulkan_types |> @filter(_.category ∈ ["struct", "handle"] && _.name ∉ ignored_types) |> DataFrame
vk_structs_graph = vk_structs_graph_base.name

function remove_pointer(type)
    ptr_match = match(r"Ptr{(.*)}", type)
    isnothing(ptr_match) && return type
    first(ptr_match.captures)
end

function adj_list()
    adjl = Edge{Int}[]
    for (i, row) ∈ enumerate(eachrow(vk_structs_graph_base))
        name = row.name
        name ∈ ignored_types && continue
        if !isnothing(row.alias) 
            push!(adjl, Edge(i, findfirst(x -> x == row.alias, vk_structs_graph)))
        elseif row.category == "handle"
            handle_info = vulkan_handles[findfirst(x -> x == name, vulkan_handles.name), :]
            !isnothing(handle_info.parent) && push!(adjl, Edge(i, findfirst(x -> x == handle_info.parent, vk_structs_graph)))
        else
            types = remove_pointer.(vulkan_fields.type[findall(x -> x == name, vulkan_fields.parent)])
            append!(adjl, Edge.(filter(!isnothing, indexin(unique(types), vk_structs_graph)), i))
        end
    end

    adjl
end

check_acyclic(g) = !is_cyclic(g) || error("Cycles: $(getindex.(Ref(vk_structs_graph), simplecycles_hawick_james(g)))")

adj = adj_list()

deps_g = SimpleDiGraph(adj)

# add verts to fill the graph with isolated types (avoid bound errors for isolated types)
nv(deps_g) < length(vk_structs_graph) && add_vertices!(deps_g, length(vk_structs_graph) - nv(deps_g))
check_acyclic(deps_g)

macro check_in_graph(type) :($(esc(type)) ∉ vk_structs_graph && error(string($(esc(type))) * " not in graph")) end

macro graph_index(type)
    quote
        @check_in_graph $(esc(type))
        $(esc(type)) = findfirst(vk_structs_graph .== $(esc(type)))
    end
end

macro graph_index(id, type)
    quote
        @check_in_graph $(esc(type))
        $(esc(id)) = findfirst(vk_structs_graph .== $(esc(type)))
    end
end

"""
    depends_on(a, b)

Returns whether b depends on a

# Examples
```
julia> depends_on("VkPhysicalDeviceProperties", "VkPhysicalDeviceLimits")
false
julia> depends_on("VkPhysicalDeviceLimits", "VkPhysicalDeviceProperties")
true
```
"""
function depends_on(a, b)
    @graph_index a
    @graph_index b
    a ∈ inneighbors(deps_g, b)
end



"""
    vk_dependencies(a)

# Examples
```
julia> vk_dependencies("VkPhysicalDeviceProperties")
2-element Array{String,1}:
 "VkPhysicalDeviceSparseProperties"
 "VkPhysicalDeviceLimits"
```
"""
function vk_dependencies(a)
    @graph_index a
    getindex.(Ref(vk_structs_graph), inneighbors(deps_g, a))
end

@assert vk_dependencies("VkPhysicalDeviceProperties") == ["VkPhysicalDeviceSparseProperties", "VkPhysicalDeviceLimits"]