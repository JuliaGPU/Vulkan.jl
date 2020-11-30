abstract type QueueType end

struct QueueCompute <: QueueType end
struct QueueGraphics <: QueueType end
struct QueueTransfer <: QueueType end
struct QueueSparseBinding <: QueueType end

const ExprLike = Union{Symbol, Expr}

@enum COMMAND_TYPE CREATE=1 DESTROY ALLOCATE FREE COMMAND ENUMERATE

@enum STRUCT_TYPE CREATE_INFO=1 ALLOCATE_INFO GENERIC_INFO DATA PROPERTY

@enum PARAM_REQUIREMENT OPTIONAL=1 REQUIRED POINTER_OPTIONAL POINTER_REQUIRED

PARAM_REQUIREMENT(node::EzXML.Node) = !haskey(node, "optional") || node["optional"] == "false" ? REQUIRED : PARAM_REQUIREMENT(findfirst(node["optional"] .== ["true", "false", "true,false", "false,true"]))

queue_maps = OrderedDict(
    "compute" => QueueCompute,
    "graphics" => QueueGraphics,
    "transfer" => QueueTransfer,
    "sparse_binding" => QueueSparseBinding,
)

function queue(x)
    x ∈ keys(queue_maps) && return queue_maps[x]()
    error("Unknown queue type $x")
end

abstract type RenderPassRequirement end

struct RenderPassInside <: RenderPassRequirement end
struct RenderPassOutside <: RenderPassRequirement end

function queue_compatibility(node)
    !haskey(node, "queues") && return nothing
    queues = split(node["queues"], ",")
    queue.(queues)
end

render_pass_compatibility(node) = (nr = node["renderpass"]; nr == "both" ? [RenderPassInside(), RenderPassOutside()] : nr == "inside" ? [RenderPassInside()] : nr == "outside" ? [RenderPassOutside()] : error("Unknown render pass compatibility"))

function externsync(node)
    !haskey(node, "externsync") && return false
    node["externsync"] ≠ "false"
end

function fetch_parameters()
    nodes = findall("//command[not(@name)]", xroot)
    df = DataFrame([Symbol, Symbol, Union{Expr, Symbol}, Bool, Bool, PARAM_REQUIREMENT, Union{Nothing, ExprLike}, Array{ExprLike, 1}], [:parent, :name, :type, :constant, :externsync, :param_requirement, :len, :arglen])
    for node ∈ nodes
        for x ∈ findall("./param", node)
            push!(df, (parent_name(x), extract_identifier(x), extract_type(x), is_constant(x), externsync(x), PARAM_REQUIREMENT(x), len(x), arglen(x)))
        end
    end
    df
end

function fetch_struct_fields()
    nodes = findall("//type[@category='union' or @category='struct']", xroot)
    df = DataFrame([Symbol, Symbol, Union{Expr, Symbol}, Bool, Bool, PARAM_REQUIREMENT, Union{Nothing, ExprLike}, Array{ExprLike, 1}], [:parent, :name, :type, :constant, :externsync, :param_requirement, :len, :arglen])
    for node ∈ nodes
        for x ∈ findall("./member", node)
            id = extract_identifier(x)
            push!(df, (parent_name(x), id == :module ? :_module : id, extract_type(x), is_constant(x), externsync(x), PARAM_REQUIREMENT(x), len(x), arglen(x, neighbor_type="member")))
        end
    end
    df
end

function len(node)
    if haskey(node, "altlen")
        return Meta.parse(node["altlen"])
    end
    val = getattr(node, "len", symbol=false)
    isnothing(val) && return val
    val_arr = filter(x -> x ≠ "null-terminated", split(val, ","))
    @assert length(val_arr) <= 1
    isempty(val_arr) ? nothing : Symbol(first(val_arr))
end

function arglen(node; neighbor_type="param")
    neighbors = findall("../$neighbor_type", node)
    name = Symbol(findfirst("./name", node).content)
    arglens = Symbol[]
    for node ∈ neighbors
        len(node) == name ? push!(arglens, Symbol(findfirst("./name", node).content)) : nothing
    end
    arglens
end

function fetch_types()
    nodes = findall("//type[@category and @category != 'include' and @category != 'define' and (@name or @category = 'handle' or @category='bitmask')]", xroot)
    df = DataFrame([Symbol, Symbol, Union{Symbol, Nothing}], [:name, :category, :alias])
    for node ∈ nodes
        name = Symbol(haskey(node, "name") ? node["name"] : findfirst("./name", node).content)
        push!(df, (name, Symbol(node["category"]), getattr(node, "alias")))
    end
    df
end

function fetch_structs()
    nodes = findall("//type[(@category='union' or @category='struct')]", xroot)
    df = DataFrame([Symbol, STRUCT_TYPE, Bool, Union{Nothing, Array{Symbol, 1}}], [:name, :type, :returnedonly, :extends])
    for node ∈ nodes
        name = Symbol(getattr(node, "name"))
        @assert !isnothing(name) "Found the following structure without name:\n    $node"
        returnedonly = haskey(node, "returnedonly")
        name_str = string(name)
        type = returnedonly ? PROPERTY : occursin("CreateInfo", name_str) ? CREATE_INFO : occursin("AllocateInfo", name_str) ? ALLOCATE_INFO : occursin("Info", name_str) ? GENERIC_INFO : DATA
        push!(df, (name, type, returnedonly, (haskey(node, "structextends") ? Symbol.(split(node["structextends"], ",")) : nothing)))
    end
    df
end

function is_struct_returnedonly(t)
    match = findfirst(x -> x == t, vulkan_structs.name)
    isnothing(match) ? false : vulkan_structs.returnedonly[match]
end

function fetch_handles()
    nodes = findall("//type[@category='handle' and not(@alias)]", xroot)
    df = DataFrame([Symbol, Union{Nothing, Symbol}, Bool], [:name, :parent, :dispatchable])
    for node ∈ nodes
        is_dispatchable = findfirst("./type", node).content == "VK_DEFINE_HANDLE"
        name = Symbol(findfirst("./name", node).content)
        push!(df, (name, getattr(node, "parent"), is_dispatchable))
    end
    df
end

function fetch_functions()
    nodes = findall("//command[not(@name) or (@name and @alias)]", xroot)
    df = DataFrame([Symbol, Union{Nothing, COMMAND_TYPE}, Union{Nothing, ExprLike}, Union{Nothing, Array{RenderPassRequirement, 1}}, Union{Nothing, Array{QueueType, 1}}, Union{Nothing, Symbol}], [:name, :type, :return_type, :render_pass_compatibility, :queue_compatibilty, :alias])
    for node ∈ nodes
        alias = getattr(node, "alias")
        name = Symbol(!isnothing(alias) ? node["name"] : command_name(node))
        types = extract_type.(findall("./param", node), include_pointer=false)
        names = extract_identifier.(findall("./param", node))
        is_enum = any(is_struct_returnedonly(t) for t ∈ types) || any(is_count_to_be_filled.(names, name))
        queues = queue_compatibility(node)
        rp_reqs = getattr(node, "renderpass")
        if !isnothing(rp_reqs)
            rp_reqs = render_pass_compatibility(node)
        end
        ctype = findfirst(startswith.(string(name), ["vkCreate", "vkDestroy", "vkAllocate", "vkFree", "vkCmd"]))
        ctype = is_enum ? ENUMERATE : isnothing(ctype) ? nothing : COMMAND_TYPE(ctype)
        return_type = isnothing(alias) ? Meta.parse(findfirst("./proto/type", node).content) : nothing
        push!(df, (name, ctype, return_type, rp_reqs, queues, alias))
    end
    df
end

function fetch_creation_info()
    nodes = findall("//command/proto[contains(./child::name, 'vkCreate') or contains(./child::name, 'vkAllocate')]", xroot)
    df = DataFrame([Symbol, Symbol, Symbol, Array{Symbol, 1}, Array{Symbol, 1}], [:name, :create_function, :identifier, :create_info_structs, :create_info_identifiers])
    vulkan_create_info_structs = (vulkan_structs |> @filter(_.type ∈ [CREATE_INFO, ALLOCATE_INFO]) |> DataFrame).name
    for node ∈ nodes
        create_el_node = findlast("../param", node)
        name = findfirst("./type", create_el_node).content
        create_fun = findfirst("./name", node).content
        create_info_nodes = filter!(x -> findfirst("./type", x).content ∈ vulkan_create_info_structs, findall("../param", node))
        create_info_structs = getproperty.(findfirst.("./type", create_info_nodes), :content)
        create_info_identifiers = getproperty.(findfirst.("./name", create_info_nodes), :content)
        identifier = findfirst("./name", create_el_node).content
        push!(df, (Symbol.((name, create_fun, identifier))..., Symbol.(create_info_structs), Symbol.(create_info_identifiers)))
    end
    df
end

function fetch_destruction_info()
    nodes = findall("//command/proto[contains(./child::name, 'vkDestroy') or contains(./child::name, 'vkFree')]", xroot)
    df = DataFrame([Symbol, Symbol, Symbol], [:name, :destroy_function, :identifier])
    for node ∈ nodes
        destroy_fun = findfirst("./name", node).content
        destroy_el_node = findlast("../param[@externsync]", node)
        name = findfirst("./type", destroy_el_node).content
        identifier = findfirst("./name", destroy_el_node).content
        push!(df, Symbol.((name, destroy_fun, identifier)))
    end
    df
end

is_command(name) = startswith(string(name), "vk")

is_struct(name) = startswith(string(name), "Vk")

info_df(sname) = is_command(sname) ? grouped_vulkan_params : grouped_vulkan_fields

info(name, sname) = dfmatch(info_df(sname)[(parent=sname,)], :name, name)

function is_count_to_be_filled(name, fname)
    group = info_df(fname)[(parent=fname,)]
    row = info(name, fname)
    !row.constant && row.param_requirement == POINTER_REQUIRED && any(name .== group.len)
end

const vulkan_params = fetch_parameters()
const vulkan_fields = fetch_struct_fields()
const grouped_vulkan_fields = groupby(vulkan_fields, :parent)
const grouped_vulkan_params = groupby(vulkan_params, :parent)
const vulkan_structs = fetch_structs()
const vulkan_functions = fetch_functions()
const vulkan_types = fetch_types()
const vulkan_handles = fetch_handles()
const vulkan_creation_info = fetch_creation_info()
const vulkan_destruction_info = fetch_destruction_info()

is_handle(type) = follow_alias(type) ∈ (vulkan_handles.name..., "HANDLE")

is_returnedonly(type) = dfmatch(vulkan_structs, :name, type).returnedonly

is_handle_with_create_info(type) = type ∈ vulkan_creation_info.name && !any(isempty.(getproperty.(dfmatches(vulkan_creation_info, :name, type), :create_info_structs)))

is_handle_destructible(type) = type ∈ vulkan_destruction_info.name

function is_handle_with_multiple_create_info(type)
    index = findall(vulkan_creation_info.name .== type)
    !isnothing(index) && length(index) > 1
end

is_category(type, cat) = type ∈ (vulkan_types |> @filter(_.category == cat) |> DataFrame).name

is_enum(type) = is_category(type, "enum")

is_bitmask(type) = is_category(type, "bitmask")

is_command_type(fname, val::COMMAND_TYPE) = dfmatch(vulkan_functions, :name, fname).type == val

is_array_variable(name, sname) = !isnothing(info(name, sname).len)

is_count_variable(name, sname) = !isempty(info(name, sname).arglen)

"""
    associated_array_variables(count_var_name, sname)

# Examples
```
julia> associated_array_variables("enabledLayerCount", "VkInstanceCreateInfo")
1-element Array{String,1}:
 "ppEnabledLayerNames"
```
"""
associated_array_variables(count_var_name, sname) = info(count_var_name, sname).arglen

"""
    associated_count_variable(array_var_name, sname)

# Examples
```
julia> associated_count_variable("ppEnabledLayerNames", "VkInstanceCreateInfo")
"enabledLayerCount"
```
"""
associated_count_variable(array_var_name, sname) = info(array_var_name, sname).len

function enumeration_command_count_variable(fname)
    group = grouped_vulkan_params[(parent=fname,)]
    index = findfirst(x -> is_count_to_be_filled(x, fname), group.name)
    isnothing(index) && error("$fname has no count argument to be filled")
    group[index, :]
end

function enumeration_command_array_variable(fname)
    group = grouped_vulkan_params[(parent=fname,)]
    arglen = first(enumeration_command_count_variable(fname).arglen)
    group[findfirst(x -> x == arglen, group.name), :]
end

is_optional_parameter(name, sname) = name == "pNext" || info(name, sname).param_requirement ∈ [OPTIONAL, POINTER_OPTIONAL]

function default(name, type)
    (is_handle(type) || startswith(string(name), "p") || (type isa Expr && type.head == :curly)) && return :C_NULL
    0
end

has_count_to_be_filled(fname) = any(is_count_to_be_filled(row.name, fname) for row ∈ eachrow(grouped_vulkan_params[(parent=fname,)]))
