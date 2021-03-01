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
    is_arr(spec) && push!(props, "with length $(spec.len)")
    !isempty(spec.arglen) && push!(props, "length of $(join(spec.arglen, ' '))")

    print(io, join(string.(vcat(typeof(spec), spec.type, spec.name, props)), ' '))
end

function SpecStructMember(node::Node)
    id = extract_identifier(node)
    SpecStructMember(parent_name(node), id == :module ? :_module : id, extract_type(node), is_constant(node), externsync(node), PARAM_REQUIREMENT(node), len(node), arglen(node, neighbor_type="member"))
end

function SpecStruct(node::Node)
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

SpecFuncParam(node::Node) = SpecFuncParam(parent_name(node), extract_identifier(node), extract_type(node), is_constant(node), externsync(node), PARAM_REQUIREMENT(node), len(node), arglen(node))

function SpecFunc(node::Node)
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
        if any(startswith.(string(name), ["vkGet", "vkEnumerate"])) end => QUERY
        _ => OTHER
    end
    return_type = extract_type(findfirst("./proto", node))
    codes(type) = Symbol.(filter(!isempty, split(getattr(node, type; default="", symbol=false), ',')))
    SpecFunc(name, ctype, return_type, rp_reqs, queues, StructVector(SpecFuncParam.(findall("./param", node))), codes("successcodes"), codes("errorcodes"))
end

SpecEnum(node::Node) = SpecEnum(Symbol(node["name"]), StructVector(SpecConstant.(findall("./enum[@name and not(@alias)]", node))))

SpecBit(node::Node) = SpecBit(Symbol(node["name"]), parse(Int, something(getattr(node, "value", symbol=false), getattr(node, "bitpos", symbol=false))))

SpecBitmask(node::Node) = SpecBitmask(Symbol(node["name"]), StructVector(SpecBit.(findall("./enum[not(@alias)]", node))))

function SpecFlag(node::Node)
    name = Symbol(findfirst("./name", node).content)
    typealias = Symbol(findfirst("./type", node).content)
    bitmask = if haskey(node, "requires")
        bitmask_name = Symbol(node["requires"])
        if bitmask_name ∈ disabled_specs
            nothing
        else
            spec_bitmasks[findfirst(==(bitmask_name), spec_bitmasks.name)]
        end
    else
        nothing
    end

    SpecFlag(name, typealias, bitmask)
end

function SpecHandle(node::Node)
    is_dispatchable = findfirst("./type", node).content == "VK_DEFINE_HANDLE"
    name = Symbol(findfirst("./name", node).content)
    SpecHandle(name, getattr(node, "parent"), is_dispatchable)
end

function SpecConstant(node::Node)
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
                ::Node => translate_c_type(Symbol(type.content))
            end
        end
    else
        error("Unknown constant specification for node $node")
    end
    SpecConstant(name, value)
end

function SpecAlias(node::Node)
    name = Symbol(node["name"])
    alias = follow_alias(name)
    spec_names = getproperty.(spec_all_noalias, :name)
    alias_spec = spec_all_noalias[findfirst(==(alias), spec_names)]
    SpecAlias(name, alias_spec)
end

function CreateFunc(spec::SpecFunc)
    created_param = last(spec.params)
    handle = spec_handles[findfirst(==(follow_alias(innermost_type(created_param.type))), spec_handles.name)]
    create_info_params = getindex.(Ref(spec.params), findall(in(spec_create_info_structs.name), innermost_type.(spec.params.type)))
    @assert length(create_info_params) <= 1 "Found $(length(create_info_params)) create info types from the parameters of $spec:\n    $create_info_params"
    if length(create_info_params) == 0
        CreateFunc(spec, handle, nothing, nothing, false)
    else
        create_info_param = first(create_info_params)
        create_info_struct = spec_create_info_structs[findfirst(==(innermost_type(create_info_param.type)), spec_create_info_structs.name)]
        batch = is_arr(created_param)
        CreateFunc(spec, handle, create_info_struct, create_info_param, batch)
    end
end

function DestroyFunc(spec::SpecFunc)
    destroyed_param = spec.params[findlast(spec.params.is_externsync)]
    handle = spec_handles[findfirst(==(innermost_type(destroyed_param.type)), spec_handles.name)]
    DestroyFunc(spec, handle, destroyed_param, is_arr(destroyed_param))
end

function queue_compatibility(node::Node)
    @when let _ = node, if haskey(node, "queues") end
        queue.(split(node["queues"], ','))
    end
end

externsync(node::Node) = haskey(node, "externsync") && node["externsync"] ≠ "false"

function len(node::Node)
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

function arglen(node::Node; neighbor_type="param")
    neighbors = findall("../$neighbor_type", node)
    arg_name = name(node)
    map(name, filter(x -> len(x) == arg_name, neighbors))
end

is_arr(spec::Union{SpecStructMember, SpecFuncParam}) = has_length(spec) && innermost_type(spec.type) ≠ :Cvoid
is_length(spec::Union{SpecStructMember, SpecFuncParam}) = !isempty(spec.arglen) && !endswith(string(spec.name), "Size")
is_size(spec::Union{SpecStructMember, SpecFuncParam}) = !isempty(spec.arglen) && endswith(string(spec.name), "Size")
has_length(spec::Union{SpecStructMember, SpecFuncParam}) = !isnothing(spec.len)
has_computable_length(spec::Union{SpecStructMember, SpecFuncParam}) = !spec.is_constant && spec.requirement == POINTER_REQUIRED && is_arr(spec)
is_data(spec::Union{SpecStructMember, SpecFuncParam}) = has_length(spec) && spec.type == :(Ptr{Cvoid})
is_version(spec::Union{SpecStructMember, SpecFuncParam}) = contains(lowercase(string(spec.name)), "version") && (follow_constant(spec.type) == :UInt32 || is_ptr(spec.type) && !is_arr(spec) && !spec.is_constant && follow_constant(ptr_type(spec.type)) == :UInt32)

"""
Iterate through function or struct specification fields from a list of fields.
`list` is a sequence of fields to get through from `root`.
"""
struct FieldIterator
    root
    list
end

function Base.iterate(f::FieldIterator)
    spec = field(f.root, popfirst!(f.list))
    root = struct_by_name(innermost_type(spec.type))
    if isnothing(root)
        isempty(f.list) || error("Failed to retrieve a struct from $spec to continue the list $(f.list)")
        (spec, nothing)
    else
        (spec, FieldIterator(root, f.list))
    end
end

Base.iterate(_, f::FieldIterator) = iterate(f)
Base.iterate(f::FieldIterator, ::Nothing) = nothing
Base.length(f::FieldIterator) = length(f.list)

function field(spec, name)
    index = findfirst(==(name), children(spec).name)
    !isnothing(index) || error("Failed to retrieve field $name in $spec")
    children(spec)[index]
end

function field_struct(spec::Union{SpecStructMember, SpecFuncParam}, name)
    field_spec = field(parent_spec(spec), name)
    @match t = innermost_type(field_spec) begin
        GuardBy(in(spec_structs.name)) => struct_by_name(t)
        _ => field
    end
end

function length_chain(spec::Union{SpecStructMember, SpecFuncParam}, chain)
    parts = Symbol.(split(string(chain), "->"))
    collect(FieldIterator(parent_spec(spec), parts))
end

"""
Some specifications are disabled in the Vulkan headers (see https://github.com/KhronosGroup/Vulkan-Docs/issues/1225).
"""
const disabled_specs = map(x -> Symbol(x["name"]), findall("//extension[@supported = 'disabled']//*[@name]", xroot))

enabled_specs(specs) = filter(x -> x.name ∉ disabled_specs, specs)

"""
Specification constants, usually defined in C with #define.
"""
const spec_constants = enabled_specs(StructVector(SpecConstant.(vcat(
    findall("//enums[@name = 'API Constants']/*[@value and @name]", xroot),
    findall("//extension/require/enum[not(@extends) and not(@alias) and @value]", xroot),
    findall("/registry/types/type[@category = 'basetype' or @category = 'bitmask' and not(@alias)]", xroot)))))

"""
Specification enumerations, excluding bitmasks.
"""
const spec_enums = enabled_specs(StructVector(SpecEnum.(findall("//enums[@type = 'enum' and not(@alias)]", xroot))))

"""
Specification bitmask enumerations.
"""
const spec_bitmasks = enabled_specs(StructVector(SpecBitmask.(findall("//enums[@type = 'bitmask' and not(@alias)]", xroot))))

"""
Flag types.
"""
const spec_flags = enabled_specs(StructVector(SpecFlag.(findall("//type[@category = 'bitmask' and not(@alias)]", xroot))))

"""
Specification functions.
"""
const spec_funcs = enabled_specs(StructVector(SpecFunc.(findall("//command[not(@name)]", xroot))))

"""
Specification structures.
"""
const spec_structs = enabled_specs(StructVector(SpecStruct.(findall("//type[(@category = 'union' or @category = 'struct') and not(@alias)]", xroot))))

"""
Specification handle types.
"""
const spec_handles = enabled_specs(StructVector(SpecHandle.(findall("//type[@category = 'handle' and not(@alias)]", xroot))))

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
const spec_aliases = StructVector(SpecAlias.(filter(x -> (par = x.parentnode.parentnode; par.name ≠ "extension" || getattr(par, "supported") ≠ :disabled), findall("//*[@alias and @name]", xroot))))
const spec_func_params = collect(Iterators.flatten(spec_funcs.params))
const spec_struct_members = collect(Iterators.flatten(spec_structs.members))
const spec_create_info_structs = filter(x -> x.type ∈ [CREATE_INFO, ALLOCATE_INFO], spec_structs)

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

flag_by_name(name) = spec_by_name(spec_flags, name)

enum_by_name(name) = spec_by_name(spec_enums, name)

constant_by_name(name) = spec_by_name(spec_constants, name)

Base.parent(spec::SpecFuncParam) = spec.func
Base.parent(spec::SpecStructMember) = spec.parent
Base.parent(spec::SpecHandle) = spec.parent

parent_spec(spec::SpecFuncParam) = func_by_name(parent(spec))
parent_spec(spec::SpecStructMember) = struct_by_name(parent(spec))
parent_spec(spec::SpecHandle) = handle_by_name(parent(spec))

function len(spec::Union{SpecFuncParam,SpecStructMember})
    params = children(parent_spec(spec))
    params[findfirst(x -> x.name == spec.len, params)]
end

function arglen(spec::Union{SpecFuncParam,SpecStructMember})
    params = children(parent_spec(spec))
    params[findall(x -> x.name ∈ spec.arglen, params)]
end

const spec_create_funcs = StructVector(CreateFunc.(filter(x -> x.type ∈ [CREATE, ALLOCATE], spec_funcs)))
const spec_destroy_funcs = StructVector(DestroyFunc.(filter(x -> x.type ∈ [DESTROY, FREE], spec_funcs)))
const spec_handles_with_single_constructor = filter(x -> length(something(findall(==(x), filter(x -> !x.batch, spec_create_funcs).handle), 0)) == 1, spec_handles)

is_destructible(spec::SpecHandle) = spec ∈ spec_destroy_funcs.handle

default(spec::SpecHandle) = :C_NULL
default(spec::Union{SpecStructMember, SpecFuncParam}) = @match spec.requirement begin
    if spec.type ∈ spec_handles.name end => default(handle_by_name(spec.type))
    &POINTER_OPTIONAL || &POINTER_REQUIRED || if is_ptr(spec.type) || spec.type == :Cstring end => :C_NULL
    &OPTIONAL || &REQUIRED => 0
end

create_func(func::SpecFunc) = spec_by_field(spec_create_funcs, :func, func)
create_func(handle::SpecHandle) = spec_by_field(spec_create_funcs, :handle, handle)
create_func(name) = spec_by_field(spec_create_funcs, :func, func_by_name(name))
create_func_no_batch(handle::SpecHandle) = spec_create_funcs[findfirst(x -> !x.batch && x.handle == handle, spec_create_funcs)]

destroy_func(func::SpecFunc) = spec_by_field(spec_destroy_funcs, :func, func)
destroy_func(handle::SpecHandle) = spec_by_field(spec_destroy_funcs, :handle, handle)
destroy_func(name) = spec_by_field(spec_destroy_funcs, :func, func_by_name(name))

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
