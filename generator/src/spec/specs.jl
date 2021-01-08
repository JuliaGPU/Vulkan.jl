abstract type QueueType end

struct QueueCompute <: QueueType end
struct QueueGraphics <: QueueType end
struct QueueTransfer <: QueueType end
struct QueueSparseBinding <: QueueType end

abstract type RenderPassRequirement end

struct RenderPassInside <: RenderPassRequirement end
struct RenderPassOutside <: RenderPassRequirement end

const queue_map = Dict(
    :compute => QueueCompute(),
    :graphics => QueueGraphics(),
    :transfer => QueueTransfer(),
    :sparse_binding => QueueSparseBinding(),
)

const render_pass_compatibiltiy_map = Dict(
    :both => [RenderPassInside(), RenderPassOutside()],
    :inside => [RenderPassInside()],
    :outside => [RenderPassOutside()],
)

@enum FUNC_TYPE CREATE=1 DESTROY ALLOCATE FREE COMMAND ENUMERATE

@enum STRUCT_TYPE CREATE_INFO=1 ALLOCATE_INFO GENERIC_INFO DATA PROPERTY

@enum PARAM_REQUIREMENT OPTIONAL=1 REQUIRED POINTER_OPTIONAL POINTER_REQUIRED

PARAM_REQUIREMENT(node::EzXML.Node) = !haskey(node, "optional") || node["optional"] == "false" ? REQUIRED : PARAM_REQUIREMENT(findfirst(node["optional"] .== ["true", "false", "true,false", "false,true"]))

abstract type Spec end

Base.broadcastable(spec::Spec) = Ref(spec)

struct SpecFuncParam <: Spec
    func::Symbol
    name::Symbol
    type::ExprLike
    is_constant::Bool
    is_externsync::Bool
    requirement::PARAM_REQUIREMENT
    len::Optional{Symbol}
    arglen::Vector{Symbol}
end

struct SpecFunc <: Spec
    name::Symbol
    type::Optional{FUNC_TYPE}
    return_type::Optional{ExprLike}
    render_pass_compatibility::Vector{RenderPassRequirement}
    queue_compatibility::Vector{QueueType}
    params::StructVector{SpecFuncParam}
end

struct SpecStructMember <: Spec
    parent::Symbol
    name::Symbol
    type::ExprLike
    is_constant::Bool
    is_externsync::Bool
    requirement::PARAM_REQUIREMENT
    len::Optional{ExprLike}
    arglen::Vector{ExprLike}
end

struct SpecStruct <: Spec
    name::Symbol
    type::STRUCT_TYPE
    is_returnedonly::Bool
    extends::Vector{Symbol}
    members::StructVector{SpecStructMember}
end

struct SpecType <: Spec
    name::Symbol
    category::Symbol
end

struct SpecConstant <: Spec
    name::Symbol
    value
end

struct SpecEnum <: Spec
    name::Symbol
    enums::StructVector{SpecConstant}
end

struct SpecBit <: Spec
    name::Symbol
    position::Int
end

struct SpecBitmask <: Spec
    name::Symbol
    bits::StructVector{SpecBit}
end

"""
Specification for handle types.

A handle may possess a parent. In this case, the handle can only be valid if its parent is valid.

Some handles are dispatchable, which means that they are represented as opaque pointers.
Non-dispatchable handles are 64-bit integer types, and may encode information directly into their value.
"""
struct SpecHandle <: Spec
    name::Symbol
    parent::Optional{Symbol}
    is_dispatchable::Bool
end

"""
Specification for aliases.
"""
struct SpecAlias{S<:Spec} <: Spec
    name::Symbol
    alias::S
end

"""
Specification for a function `func` that creates a `handle` from a create info structure `create_info_struct`.

If `batch` is true, then `func` expects a list of multiple create info structures.
"""
struct SpecCreateFunc <: Spec
    func::SpecFunc
    handle::SpecHandle
    create_info_struct::Optional{SpecStruct}
    create_info_param::Optional{SpecFuncParam}
    batch::Bool
end

struct SpecDestroyFunc <: Spec
    func::SpecFunc
    handle::SpecHandle
    destroyed_param::SpecFuncParam
    batch::Bool
end

"""
Check if `x` and `y` are equal, except for vectors which are tested element-wise.
"""
eq(x::T, y::T) where {T<:AbstractVector} = length(x) == length(y) && all(x .== y)
eq(x, y) = x == y

Base.:(==)(x::S, y::S) where {S<:Spec} = all(name -> eq(getproperty(x, name), getproperty(y, name)), fieldnames(S))

print_parent_info(io::IO, spec::Union{SpecStruct, SpecFunc}, props) = println(io, join(string.(vcat(typeof(spec), spec.name, props)), ' '))

children(spec::SpecStruct) = spec.members
children(spec::SpecFunc) = spec.params

print_children(io::IO, spec::Union{SpecStruct, SpecFunc}) = println.(Ref(io), string.("    ", children(spec)))

function Base.show(io::IO, spec::SpecStruct)
    props = string.([spec.type])
    spec.is_returnedonly && push!(props, "returnedonly")
    !isempty(spec.extends) && push!(props, "extends $(spec.extends)")

    print_parent_info(io, spec, props)
    print_children(io, spec)
end

function Base.show(io::IO, spec::SpecFunc)
    props = string.([spec.type, spec.return_type])
    !isempty(spec.render_pass_compatibility) && push!(props, string("to be executed ", join(map(spec.render_pass_compatibility) do compat
        @match compat begin
            ::RenderPassInside => "inside"
            ::RenderPassOutside => "outside"
        end
    end, " and "), " render passes"))
    !isempty(spec.queue_compatibility) && push!(props, string(" (compatible with $(join(string.(spec.queue_compatibility), ", ")) queues)"))

    print_parent_info(io, spec, props)
    print_children(io, spec)
end

function Base.show(io::IO, spec::Union{SpecStructMember, SpecFuncParam})
    props = string.([spec.requirement])
    spec.is_constant && push!(props, "constant")
    spec.is_externsync && push!(props, "externsync")
    !isnothing(spec.len) && push!(props, "with length $(spec.len)")
    !isempty(spec.arglen) && push!(props, "length of $(join(spec.arglen, ' '))")

    print(io, join(string.(vcat(typeof(spec), spec.type, spec.name, props)), ' '))
end

SpecEnum(node::EzXML.Node) = SpecEnum(Symbol(node["name"]), StructVector(SpecConstant.(findall("./enum[@name and not(@alias)]", node))))
SpecBit(node::EzXML.Node) = SpecBit(Symbol(node["name"]), parse(Int, something(getattr(node, "value", symbol=false), getattr(node, "bitpos", symbol=false))))
SpecBitmask(node::EzXML.Node) = SpecBitmask(Symbol(node["name"]), StructVector(SpecBit.(findall("./enum[not(@alias)]", node))))

SpecFuncParam(node::EzXML.Node) = SpecFuncParam(parent_name(node), extract_identifier(node), extract_type(node), is_constant(node), externsync(node), PARAM_REQUIREMENT(node), len(node), arglen(node))

function SpecFunc(node::EzXML.Node)
    name = command_name(node)
    queues = @match getattr(node, "queues", symbol=false) begin
        qs::String => [queue_map[Symbol(q)] for q ∈ split(qs, ',')]
        ::Nothing => []
    end
    rp_reqs = @match getattr(node, "renderpass") begin
        x::Symbol => render_pass_compatibiltiy_map[x]
        ::Nothing => []
    end
    ctype = @match findfirst(startswith.(string(name), ["vkCreate", "vkDestroy", "vkAllocate", "vkFree", "vkCmd"])) begin
        i::Integer => FUNC_TYPE(i)
        _ => nothing
    end
    return_type = extract_type(findfirst("./proto", node))
    SpecFunc(name, ctype, return_type, rp_reqs, queues, StructVector(SpecFuncParam.(findall("./param", node))))
end

function SpecStructMember(node::EzXML.Node)
    id = extract_identifier(node)
    SpecStructMember(parent_name(node), id == :module ? :_module : id, extract_type(node), is_constant(node), externsync(node), PARAM_REQUIREMENT(node), len(node), arglen(node, neighbor_type="member"))
end

function SpecStruct(node::EzXML.Node)
    name_str = node["name"]
    returnedonly = haskey(node, "returnedonly")
    type = @match returnedonly begin
        true => PROPERTY
        _ && if occursin("CreateInfo", name_str) end => CREATE_INFO
        _ && if occursin("AllocateInfo", name_str) end => ALLOCATE_INFO
        _ && if occursin("Info", name_str) end => GENERIC_INFO
        _ => DATA
    end
    extends = @match struct_csv = getattr(node, "structextends", symbol=false) begin
        ::String => Symbol.(split(struct_csv, ','))
        ::Nothing => []
    end
    SpecStruct(Symbol(name_str), type, returnedonly, extends, StructVector(SpecStructMember.(findall("./member", node))))
end

function SpecType(node::EzXML.Node)
    name = Symbol(haskey(node, "name") ? node["name"] : findfirst("./name", node).content)
    SpecType(name, Symbol(node["category"]))
end

function SpecHandle(node::EzXML.Node)
    is_dispatchable = findfirst("./type", node).content == "VK_DEFINE_HANDLE"
    name = Symbol(findfirst("./name", node).content)
    SpecHandle(name, getattr(node, "parent"), is_dispatchable)
end

function SpecConstant(node::EzXML.Node)
    name = Symbol(haskey(node, "name") ? node["name"] : findfirst("./name", node).content)
    value = if haskey(node, "offset")
        ext_value = parse(Int, something(getattr(node, "extnumber", symbol=false), getattr(node.parentnode.parentnode, "number", symbol=false))) - 1
        offset = parse(Int, node["offset"])
        sign = (1 - 2 * (getattr(node, "dir", default="", symbol=false) == "-"))
        sign * Int(1e9 + ext_value * 1e3 + offset)
    elseif haskey(node, "value")
        @match node["value"] begin
            "(~0U)" => :(typemax(UInt32))
            "(~0ULL)" => :(typemax(UInt64))
            "(~0U-1)" => :(typemax(UInt32) - 1)
            "(~0U-2)" => :(typemax(UInt32) - 2)
            "1000.0f" => :(1000f0)
            str::String && if contains(str, "&quot;") end => replace(str, "&quot;" => "")
            str => Meta.parse(str)
        end
    elseif haskey(node, "category")
        @match cat = node["category"] begin
            "basetype" || "bitmask" => @match type = findfirst("./type", node) begin
                ::Nothing && if cat == "basetype" end => :Cvoid
                ::EzXML.Node => translate_c_type(Symbol(type.content))
            end
        end
    else
        error("Unknown constant specification for node $node")
    end
    SpecConstant(name, value)
end

function SpecAlias(node::EzXML.Node)
    name = Symbol(node["name"])
    alias = follow_alias(name)
    spec_names = getproperty.(spec_all_noalias, :name)
    alias_spec = spec_all_noalias[findfirst(==(alias), spec_names)]
    SpecAlias(name, alias_spec)
end

function SpecCreateFunc(spec::SpecFunc)
    created_param = last(spec.params)
    handle = spec_handles[findfirst(==(follow_alias(innermost_type(created_param.type))), spec_handles.name)]
    create_info_params = getindex.(Ref(spec.params), findall(in(spec_create_info_structs.name), innermost_type.(spec.params.type)))
    @assert length(create_info_params) <= 1 "Found $(length(create_info_params)) create info types from the parameters of $spec:\n    $create_info_params"
    if length(create_info_params) == 0
        SpecCreateFunc(spec, handle, nothing, nothing, false)
    else
        create_info_param = first(create_info_params)
        create_info_struct = spec_create_info_structs[findfirst(==(innermost_type(create_info_param.type)), spec_create_info_structs.name)]
        batch = !isnothing(created_param.len)
        SpecCreateFunc(spec, handle, create_info_struct, create_info_param, batch)
    end
end

function SpecDestroyFunc(spec::SpecFunc)
    destroyed_param = spec.params[findlast(spec.params.is_externsync)]
    handle = spec_handles[findfirst(==(innermost_type(destroyed_param.type)), spec_handles.name)]
    SpecDestroyFunc(spec, handle, destroyed_param, !isnothing(destroyed_param.len))
end

function queue_compatibility(node::EzXML.Node)
    @when let _ = node, if haskey(node, "queues") end
        queue.(split(node["queues"], ','))
    end
end

externsync(node::EzXML.Node) = haskey(node, "externsync") && node["externsync"] ≠ "false"

function len(node::EzXML.Node)
    @match node begin
        _ && if haskey(node, "altlen") end => Meta.parse(node["altlen"])
        _ => @match getattr(node, "len", symbol=false) begin
            val::Nothing => nothing
            val => begin
                val_arr = filter(≠("null-terminated"), split(val, ','))
                @assert length(val_arr) <= 1
                isempty(val_arr) ? nothing : Symbol(first(val_arr))
            end
        end
    end
end

function arglen(node::EzXML.Node; neighbor_type="param")
    neighbors = findall("../$neighbor_type", node)
    arg_name = name(node)
    map(name, filter(x -> len(x) == arg_name, neighbors))
end

is_len(spec::SpecStructMember) = spec.name ∈ spec_structs[findfirst(==(spec.parent), spec_structs.name)].members.len
is_len(spec::SpecFuncParam) = spec.name ∈ spec_funcs[findfirst(==(spec.parent), spec_funcs.name)].params.len
is_computable_len(spec::Union{SpecStructMember, SpecFuncParam}) = !spec.is_constant && spec.requirement == POINTER_REQUIRED && is_len(spec)

"""
Specification constants, usually defined in C with #define.
"""
const spec_constants = StructVector(SpecConstant.(vcat(
    findall("//enums[@name = 'API Constants']/*[@value and @name]", xroot),
    findall("//extension/require/enum[not(@extends) and not(@alias) and @value]", xroot),
    findall("/registry/types/type[@category = 'basetype' or @category = 'bitmask' and not(@alias)]", xroot))))

"""
Specification enumerations, excluding bitmasks.
"""
const spec_enums = StructVector(SpecEnum.(findall("//enums[@type = 'enum' and not(@alias)]", xroot)))

"""
Specification bitmask enumerations.
"""
const spec_bitmasks = StructVector(SpecBitmask.(findall("//enums[@type = 'bitmask' and not(@alias)]", xroot)))

"""
Specification functions.
"""
const spec_funcs = StructVector(SpecFunc.(findall("//command[not(@name)]", xroot)))

"""
Specification structures.
"""
const spec_structs = StructVector(SpecStruct.(findall("//type[(@category = 'union' or @category = 'struct') and not(@alias)]", xroot)))

"""
Specification handle types.
"""
const spec_handles = StructVector(SpecHandle.(findall("//type[@category = 'handle' and not(@alias)]", xroot)))

"""
All enumerations, regardless of them being bitmasks or regular enum values.
"""
const spec_all_semantic_enums = [spec_enums..., spec_bitmasks...]

# extend all types with core and extension values
let nodes = findall("//*[@extends and not(@alias)]", xroot)
    database = vcat(spec_all_semantic_enums, spec_structs)
    foreach(nodes) do node
        spec = database[findfirst(x -> x.name == Symbol(node["extends"]), database)]
        @switch spec begin
            @case ::SpecBitmask
                push!(spec.bits, SpecBit(node))
            @case ::SpecEnum
                push!(spec.enums, SpecConstant(node))
        end
    end
end

"""
All specifications except aliases.
"""
const spec_all_noalias = [spec_funcs..., spec_structs..., spec_handles..., spec_constants..., spec_enums..., (spec_enums.enums...)..., spec_bitmasks..., (spec_bitmasks.bits...)...]

"""
All specification aliases.
"""
const spec_aliases = StructVector(SpecAlias.(findall("//*[@alias and @name]", xroot)))

const spec_func_params = collect(Iterators.flatten(spec_funcs.params))
const spec_struct_members = collect(Iterators.flatten(spec_structs.members))
const spec_create_info_structs = filter(x -> x.type ∈ [CREATE_INFO, ALLOCATE_INFO], spec_structs)
const spec_create_funcs = StructVector(SpecCreateFunc.(filter(x -> x.type ∈ [CREATE, ALLOCATE], spec_funcs)))
const spec_destroy_funcs = StructVector(SpecDestroyFunc.(filter(x -> x.type ∈ [DESTROY, FREE], spec_funcs)))

is_destructible(spec::SpecHandle) = spec ∈ spec_destroy_funcs.handle

default(spec::SpecHandle) = :C_NULL
default(spec::Union{SpecStructMember, SpecFuncParam}) = @match spec.requirement begin
    &POINTER_OPTIONAL || &POINTER_REQUIRED || if is_ptr(spec.type) || spec.type == :Cstring end => :C_NULL
    &OPTIONAL || &REQUIRED => 0
end

function spec_by_field(specs, field, value)
    i = findfirst(==(value), getproperty(specs, field))
    if isnothing(i)
        nothing
    else
        specs[i]
    end
end

spec_by_name(specs, name) = spec_by_field(specs, :name, name)

func_by_name(name) = spec_by_name(spec_funcs, name)

struct_by_name(name) = spec_by_name(spec_structs, name)

handle_by_name(name) = spec_by_name(spec_handles, name)

bitmask_by_name(name) = spec_by_name(spec_bitmasks, name)

enum_by_name(name) = spec_by_name(spec_enums, name)

constant_by_name(name) = spec_by_name(spec_constants, name)

function follow_constant(spec::SpecConstant)
    @match val = spec.value begin
        ::Symbol && if val ∈ spec_constants.name end => follow_constant(constant_by_name(val))
        val => val
    end
end

function follow_constant(name)
    constant = constant_by_name(name)
    isnothing(constant) ? name : follow_constant(constant)
end
