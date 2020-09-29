function constructor(new_sdef, sdef)
    defs = []
    sname = sdef.name
    if is_handle_with_multiple_create_info(sname)
        ci_indices = findall(x -> x.name == sdef.name, eachrow(vulkan_creation_info))
        for index ∈ ci_indices
            ci = vulkan_creation_info[index, :]
            fun, type, id = (ci.create_function, first(ci.create_info_structs), first(ci.create_info_identifiers))
            cons = constructor(new_sdef, sdef, CreateVkHandle(), fun, type, id; add_create_info_type_annotation=true, is_inner_constructor=false)
            !isnothing(cons) && push!(defs, cons)
            cons = constructor(new_sdef, sdef, CreateVkHandle(), fun, type, id; add_create_info_type_annotation=true, is_inner_constructor=false, add_fun_ptr=true)
            !isnothing(cons) && push!(defs, cons)
        end
    elseif is_handle_with_create_info(sname)
        # new_sdef.inner_constructor = constructor(new_sdef, sdef, CreateVkHandle())
        push!(defs, constructor(new_sdef, sdef, CreateVkHandle()))
        push!(defs, constructor(new_sdef, sdef, CreateVkHandle(), add_fun_ptr=true))
        # push!(defs, constructor(new_sdef, sdef, CreateVkHandleWithCreateInfo()))
    elseif !is_handle(sname) && dfmatch(vulkan_structs, :name, sname).returnedonly
        vk_sig = Signature(sdef)
        args_undropped = [name for (name, type) ∈ zip(argnames(vk_sig), argtypes(vk_sig)) if !drop_field(name, type, sname)]
        body = [Statement("$(new_sdef.name)($(join_args("from_vk(" .* argtypes(Signature(new_sdef)) .* ", vks." .* args_undropped .* ")")))")]
        fdef = FDefinition(new_sdef.name, Signature(new_sdef.name, [PositionalArgument("vks", sname)], KeywordArgument[]), true, body)
        push!(defs, fdef) 
        push!(defs, FDefinition("from_vk", Signature("from_vk", PositionalArgument.(["T::Type{$(new_sdef.name)}", "x::$sname"]), KeywordArgument[]), true, [Statement("$(new_sdef.name)(x)")]))
    elseif !is_handle(sname)
        if keeps_original_layout(sdef)
            push!(defs, constructor(new_sdef, sdef, GenericConstructor(), is_inner_constructor=false, add_type_annotations=false))
            push!(defs, FDefinition("from_vk", Signature("from_vk", PositionalArgument.(["T::Type{$(new_sdef.name)}", "x::$sname"]), KeywordArgument[]), true, [Statement("$(new_sdef.name)($(join_args("x." .* collect(keys(sdef.fields)))))")]))
            if length(Signature(new_sdef).args) == 1
                new_sdef.inner_constructor = FDefinition(new_sdef.name, Signature(new_sdef.name, [PositionalArgument("vks", sname)], KeywordArgument[]), true, [Statement("new(vks)")])
            end
        else
            new_sdef.inner_constructor = constructor(new_sdef, sdef, GenericConstructor(), is_inner_constructor=true)
        end
        # push!(defs, conversion(new_sdef, sdef, ConvertVkStructure()))
        # for dep ∈ vk_dependencies(sname)
        #     if !is_enumerated_property(dep)
        #         push!(defs, conversion(structure(api.structs[dep]), api.structs[dep], ConvertVkStructure()))
        #         push!(defs, constructor(new_sdef, sdef, GenericConstructor()))
        #     end
        # end
    end
    defs
end


function wrap_constructor!(w_api, new_sdef, sdef)
    defs = constructor(new_sdef, sdef)
    for (i, def) ∈ enumerate(defs)
        w_api.funcs[sdef.name * "_$i"] = def
    end
    if !is_handle(sdef.name)
        vk_extended_constructor = constructor(sdef, ExtendVkConstructor())
        length(vk_extended_constructor.signature.args) ≠ length(sdef.fields) && setindex!(w_api.extended_vk_constructors, vk_extended_constructor, sdef.name)
    end
end

"""
Pass type used to build the body of a function.

For each argument of a function, passes are layed out on top of one another to construct statements, that will define a major part of the function body. All passes receive a common set of parameters bundled in a PassArgs argument.

Passes that are triggered upon a field yield one or more statements.
"""
abstract type Pass end

"""
Translate wrapped types to Vulkan types. Triggers on Strings (converted to Cstrings) and Arrays (converted to their Ptr representation).
"""
struct TranslateVkTypesBack <: Pass end

"""
Compute the length of an array (for example, exposed in a wrapped type), which is required for *Count variables.
"""
struct ComputeLengthArgument <: Pass end

"""
Convert arrays to their expected type. For example, converts an Array{Int64} to an Array{UInt32}.
"""
struct ConvertArrays <: Pass end

"""
Translate Vulkan types into wrapped types. For example, takes a Cstring or a NTuple{256, UInt8} and converts it back to a String; or takes a Ptr{T} which encodes an array and converts it back to an array, to be safely stored inside a wrapped struct.
"""
struct TranslateVkTypes <: Pass end

"""
Handle the integration of pNext dependencies. Fill the `extra_bag` field of the struct to be created with either `next.bag` or `EmptyBag` (if `C_NULL`)
"""
struct HandlePNextDeps <: Pass end

"""
Generate a new variable with either a Ref or `C_NULL` for each pointer argument.
"""
struct GenerateRefs <: Pass end

"""
Generate a pointer for any variable beginning with p[A-Z].
"""
struct GeneratePointers <: Pass end

"""
Define a pointer that is to be passed to a Vulkan function for filling it with data.
"""
struct InitializePointers <: Pass end

function has_bag(sname)
    !is_handle(sname) && is_vulkan_struct(sname) && any(map(x -> occursin("Cstring", x) || (is_ptr(x) && !is_extension_ptr(x)), collect(values(api.structs[sname].fields))))
end

function bagtype(sname)
    return "Bag" * name_transform(sname, SDefinition)
end

function steal_bag!(bag_args, name, type, new_name, new_type, last_name, sname)
    conditional_statement = is_optional_parameter(name, sname) ? "$new_name == C_NULL ? EmptyBag : " : ""
        
    if has_bag(type)
        push!(bag_args, conditional_statement * new_name * ".bag")
    elseif is_ptr(type) && has_bag(inner_type(type))
        if is_array_variable(name, sname) || is_array_type(new_name)
            push!(bag_args, conditional_statement * "getproperty.($new_name, :bag)")
        else
            push!(bag_args, conditional_statement * new_name * ".bag")
        end
    end
end

function instantiate_bag(sdef, body)
    !has_bag(sdef.name) && error("Type $(sdef.name) does not have a bag to instantiate.")
    bag_args = String[]
    sname = sdef.name
    if "pNext" ∈ keys(sdef.fields)
        push!(bag_args, "bag_next")
    end
    for (name, type) ∈ sdef.fields
        new_name, new_type = field_transform(name, type, sdef.name)
        tmp_name = tmp_argname(name, type)
        last_name = last_argname(body, tmp_name, new_name)
        if is_array_type(new_type) && inner_type(new_type) == "String"
            push!(bag_args, new_name * "_ptrarray")
        else
            steal_bag!(bag_args, name, type, new_name, new_type, last_name, sname)
        end
        if type == "Cstring" || is_ptr(type)
            push!(bag_args, last_name)
        end
    end
    bag = bagtype(sdef.name)
    Statement("bag = $bag($(join_args(bag_args)))", "bag")
end

# @preprocess_pass struct AutomateCreateInfo <: Pass
#     create_info_sdef
#     create_info_new_sdef
#     pass!
# end

"""
Check whether an argument matches by name a pointer to the type defined in `new_sname`, and returns a default Ref of the corresponding type.
"""
@preprocess_pass struct DefineSelfPointers <: Pass
    new_sname
    pass!
end

# @preprocess_pass struct AddDefaults <: Pass
#     opt_params
#     pass!
# end

"""
Encode possible arguments available for each Pass.
"""
Base.@kwdef mutable struct PassArgs
    name = nothing
    type = nothing
    new_name = nothing
    new_type = nothing
    sdef = nothing
    fdef = nothing
    arg = nothing
    last_name = nothing
    tmp_name = nothing
    passes = nothing
    sname = nothing
end

"""
Store the result of a Pass, recording its triggered state and the PassArgs that was passed to it.
"""
struct PassResult{T <: Pass}
    pass::T
    pass_args::PassArgs
    is_triggered::Bool
end

Base.broadcastable(x::PassResult) = Ref(x)
Base.broadcastable(x::PassArgs) = Ref(x)

PassResult(pass::Pass, pass_args::PassArgs) = PassResult(pass, pass_args, is_triggered(typeof(pass), pass_args))

"""
Return a Vulkan name if assigned from any statement in the body, else take the Julian name

For example, if a statement assigns the name pAllocator from the Julian name allocator, as in 'pAllocator = allocator.vks', then return pAllocator; else, return allocator.
"""
function last_argname(body, id, fallback)
    id_list = getproperty.(body, :assigned_id)
    id ∈ id_list ? id : fallback
end

function last_argname(body, ids::Tuple, fallback)
    id_list = getproperty.(body, :assigned_id)
    for id ∈ ids
        id ∈ id_list && return id
    end
    fallback
end



abstract type ConstructorDefinition end
struct GenericConstructor <: ConstructorDefinition end

"""
Extend the original Vulkan type by adding a constructor with Refs, Strings and arrays instead of pointers and converting them to the expected type. It was added to improve performance, since some keyword arguments (notably, pointers with a default value of `C_NULL`) do not have a stable type.
"""
struct ExtendVkConstructor <: ConstructorDefinition end

"""
It is assumed that the Vk*CreateInfos are provided and that only vkCreate* and vkDestroy* are required in order to build the struct. Therefore, it mainly wraps the vkCreate* function and adds the corresponding vkDestroy* finalizer.
"""
struct CreateVkHandle <: ConstructorDefinition end

"""
Transform only names from the original constructor.
"""
struct ConstructorNoVKS <: ConstructorDefinition end

"""
It add a constructor which exposes the parameters of Vk*CreateInfo fields before calling the handle's inner constructor.
"""
struct CreateVkHandleWithCreateInfo <: ConstructorDefinition end

abstract type ConversionDefinition end

"""
Convert a Vk* struct to its corresponding wrapped struct. It is particularly useful for structs that are returned from a Vulkan function (such as vkEnumeratePhysicalDeviceProperties => VkPhysicalDeviceProperties).
"""
struct ConvertVkStructure <: ConversionDefinition end


preprocess_pass(pass_type::Type{T}; kwargs...) where {T <: Pass} = (pass_args, T) -> pass!(pass_args, T; kwargs...)


function inline_getproperty(type)
    # (name == "sType" || is_enum(type) || is_bitmask(type) || is_base_type(type) || is_base_type(converted_type(fieldtype_transform(name, type, sname))) || is_optional_parameter(name, sname)) && return ""
    is_handle(type) && return ".handle"
    is_vulkan_struct(type) && return ".vks"
    ""
end

"""
Get initialization arguments from the results of `accumulate_passes`.
"""
function init_args(pass_results, body, ::ExtendVkConstructor; use_all_args=true, take_property=true, include_stype=true, name_depth=2)
    args = String[]
    for (name, pr_list) ∈ pass_results
        pass_args = last(pr_list).pass_args
        @unpack tmp_name, new_name, type, new_type, sname = pass_args
        if name == "sType" && include_stype
            push!(args, stypes[sname])
        elseif (!any(values(pass_args.passes)) || use_all_args)
            push!(args, last_argname(body, name_hierarchy(name_depth, name, tmp_name, new_name)...) * (take_property ? inline_getproperty(type) : ""))
        end
    end
    args
end

"""
Get initialization arguments from the results of `accumulate_passes`.
"""
function init_args(pass_results, body, ::GenericConstructor; use_all_args=true, take_property=true, include_stype=true, name_depth=2, sname=nothing)
    args = String[]
    for (name, pr_list) ∈ pass_results
        pass_args = last(pr_list).pass_args
        @unpack tmp_name, new_name, type, new_type, sname = pass_args
        if name == "sType" && include_stype
            push!(args, stypes[sname])
        elseif is_ptr(type) && inner_type(type) == "Cstring"
            push!(args, new_name * "_ptrarray")
        else (!any(values(pass_args.passes)) || use_all_args)
            last_name = last_argname(body, name_hierarchy(name_depth, name, tmp_name, new_name)...)
            if !isnothing(sname) && is_optional_parameter(name, sname)
                default_val = default(name, type)
                name_with_test = "$last_name == $default_val ? $default_val : "
            else
                name_with_test = ""
            end
            first_part = name_with_test * last_name
            push!(args, take_property ? first_part * inline_getproperty(type) : first_part)
        end
    end
    args
end


function name_hierarchy(name_depth, names...)
    length(names) == 1 && return (), names[1]
    @assert name_depth < length(names)
    names[1:name_depth], names[name_depth + 1]
end

is_enabled(::Type{T}, args::PassArgs) where {T <: Pass} = any(T ∈ keys(args.passes))
is_triggered(::Type{T}, args::PassArgs) where {T <: Pass} = is_enabled(T, args) && args.passes[T]

function check_is_default(name, type, action)
    if is_ptr(type)
        predicate = "$name == C_NULL"
    else
        predicate = "$name == 0"
    end
    predicate * " ? $name : $action"
end

pass_new_nametype(::Type{SDefinition}) = (name, type, sname) -> (fieldname_transform(name, type), fieldtype_transform(name, type, sname))

function type_annotate_argument(arg)
    new_type = fieldtype_transform(arg.name, arg.type)
    is_vulkan_struct(arg.type) && return PositionalArgument(arg.name, new_type)
    PositionalArgument(arg.name, "")
end

function constructor(new_sdef, sdef, definition::GenericConstructor; add_type_annotations=false, is_inner_constructor=true)
    vk_sig = Signature(sdef)
    sname = sdef.name
    args, kwargs = arguments(vk_sig), keyword_arguments(vk_sig, expose_create_info_kwargs=false)
    # @info "$(rpad(sdef.name * " ", 60, '\u2015'))" * "→ " * (isempty(kwargs) ? "" : join(kwargs))
    co_sig = Signature(new_sdef.name, add_type_annotations ? type_annotate_argument.(arguments(vk_sig, drop_type=false)) : args, kwargs)
    default_sig = Signature(new_sdef)
    sig_notype = Signature(new_sdef.name, remove_type.(default_sig.args), [])
    args_for_passes = arguments(vk_sig, transform_name=false, transform_type=false, drop_type=false, remove_parameters=false)
    body, pass_results = accumulate_passes(sname, args_for_passes, pass_new_nametype(SDefinition), [ConvertArrays(), GenerateRefs(), HandlePNextDeps()])
    has_bag(sname) && push!(body, instantiate_bag(sdef, body))
    init_vk = init_args(pass_results, body, definition, use_all_args=true, include_stype=false, name_depth=2; sname)
    push!(body, Statement("vks = $sname($(join_args(init_vk)))"))
    init_struct = ["vks"]
    has_bag(sname) && push!(init_struct, "bag")
    push!(body, Statement("$(is_inner_constructor ? "new" : new_sdef.name)($(join_args(init_struct)))"))
    FDefinition(new_sdef.name, co_sig, false, body, "Generic constructor.")
end

function constructor(new_sdef, sdef, definition::ConstructorNoVKS; add_type_annotations=false, is_inner_constructor=true)
    vk_sig = Signature(sdef)
    args = arguments(vk_sig)
    kwargs = keyword_arguments(vk_sig)
    new_sig = Signature(new_sdef.name, args, kwargs)
    body = [Statement("$(is_inner_constructor ? "new" : new_sdef.name)($(join_args(argnames(new_sig))))")]
    FDefinition(new_sdef.name, new_sig, false, body, "Constructor identical to the corresponding $(sdef.name).")
end

function constructor(new_sdef, sdef, def::CreateVkHandle; add_fun_ptr=false)
    ci = dfmatch(vulkan_creation_info, :name, sdef.name)
    create_fun, create_info_struct, create_info_id = (ci.create_function, first(ci.create_info_structs), first(ci.create_info_identifiers))
    constructor(new_sdef, sdef, def, create_fun, create_info_struct, create_info_id; add_create_info_type_annotation=true, is_inner_constructor=false, add_fun_ptr)
end


function constructor(new_sdef, sdef, ::CreateVkHandle, create_fun, create_info_struct, create_info_id; is_inner_constructor=true, add_create_info_type_annotation=false, add_fun_ptr=false)
    create_fun ∉ keys(api.funcs) && (@warn("$create_fun not found. Skipping.") ; return)
    create_fun_fdef = api.funcs[create_fun]
    create_fun_sig = create_fun_fdef.signature
    args = arguments(create_fun_sig)
    has_multiple_create_info = create_info_id ∈ ["pCreateInfos", "pAllocateInfos"] ? true : create_info_id ∈ ["pCreateInfo", "pAllocateInfo"] ? false : error("Unknown create info ID $create_info_id")
    new_create_info_id = has_multiple_create_info ? "create_infos" : "create_info"
    if add_create_info_type_annotation
        args = map(x -> x.name == new_create_info_id ? (has_multiple_create_info ? PositionalArgument(x.name, "AbstractArray{$(name_transform(create_info_struct, SDefinition)), 1}") : PositionalArgument(x.name, name_transform(create_info_struct, SDefinition))) : x, args)
    end
    kwargs = keyword_arguments(create_fun_sig)
    identifier = last(args).name
    add_fun_ptr ? push!(args, PositionalArgument("fun_ptr_create")) : nothing
    new_sig = Signature(new_sdef.name, filter(x -> x.name ≠ identifier, args), kwargs)
    creates_multiple_handles = is_command_type(create_fun, ALLOCATE)
    body = has_multiple_create_info ? [
        Statement("create_info_count = length($new_create_info_id)"),
        Statement("$identifier = Array{$(sdef.name), 1}(undef, create_info_count)", identifier),
    ] : creates_multiple_handles ? [
        Statement("$identifier = Array{$(sdef.name), 1}(undef, n)", identifier),
    ] : [
        Statement("$identifier = Ref{$(sdef.name)}()", identifier),
    ]

    broadcast_if_multiple_create_info = has_multiple_create_info || creates_multiple_handles ? "." : ""
    deref = has_multiple_create_info || creates_multiple_handles ? identifier : "$identifier[]"
    body = [
        body...,
        Statement("@check $(create_fun_sig.name)($(join_args(map(fieldname_transform, argnames(create_fun_sig), argtypes(create_fun_sig))))$(add_fun_ptr ? ", fun_ptr_create" : ""))", nothing),
        Statement("vks = $(is_inner_constructor ? "new" : new_sdef.name)$broadcast_if_multiple_create_info($deref)", "vks"),
    ]
    if is_handle_destructible(sdef.name)
        inf = dfmatch(vulkan_destruction_info, :name, sdef.name)
        destroy_fun = inf.destroy_function
        if !is_command_type(destroy_fun, FREE)
            destroyed_el = inf.identifier
            destroy_fun_fdef = api.funcs[destroy_fun]
            identifiers, types = argnames(destroy_fun_fdef.signature), argtypes(destroy_fun_fdef.signature)
            add_fun_ptr ? push!(args, PositionalArgument("fun_ptr_destroy")) : nothing
            lambda_fun = "x -> $destroy_fun($(join_args(map(x -> x == fieldname_transform(destroyed_el, sdef.name) ? "x" : x, map(fieldname_transform, identifiers, types))))$(add_fun_ptr ? ", fun_ptr_destroy" : ""))"
            push!(body, Statement("finalizer$broadcast_if_multiple_create_info($(has_multiple_create_info ? "Ref($lambda_fun)" : lambda_fun), vks)", nothing))
        end
    end
    new_sig = Signature(new_sdef.name, is_command_type(create_fun, ALLOCATE) ? map(x -> x.name == identifier ? PositionalArgument("n") : x, args) : filter(x -> x.name ≠ identifier, args), kwargs)
    FDefinition(new_sig.name, new_sig, false, body, "")
end


function constructor(new_sdef, sdef, ::CreateVkHandleWithCreateInfo ; create_info_sdef, create_fun_fdef)
    create_info_var = last(handle_creation_info[sdef.name])
    create_fun_sig = create_fun_fdef.signature

    kwargs = [kwargs_info..., KeywordArgument("pAllocator", "C_NULL")]
    new_sig = Signature(new_sdef.name, args_info, kwargs)
    create_info_sig = Signature(create_info_sdef)
    name = nc_convert(SnakeCaseLower, sdef.name)
    body = [
    Statement("$name = Ref{$(sdef.name)}()", name),
    Statement("$create_info_var = $(create_info_sig.name)($(join_args(argnames(create_info_sig))))", nothing),
    Statement("@check $(create_fun_sig.name)($(join_args(argnames(create_fun_sig))))", nothing),
    ]
    FDefinition(new_sig.name, new_sig, false, body, "")
end

function constructor(sdef, def::ExtendVkConstructor)
    sname = sdef.name
    sname_extended = "api." * sname
    vk_sig = Signature(sdef)
    args = arguments(vk_sig, remove_parameters=false)
    # filter!(x -> x.name != "sType", args)
    body, pass_results = accumulate_passes(sname, vk_sig.args, pass_new_nametype(SDefinition), [ComputeLengthArgument(), GeneratePointers(), TranslateVkTypesBack()])
    init = init_args(pass_results, body, def, use_all_args=true, take_property=false)
    push!(body, Statement("api.$(sdef.name)($(join_args(init)))"))
    new_sig = Signature(sname_extended, args, KeywordArgument[])
    FDefinition(sname_extended, new_sig, false, body, "Julian constructor for $(sdef.name). All struct pointers should be replaced by an equivalent Ref or `C_NULL`. The Refs need to be explicitly preserved during and after this call to keep the struct pointers valid.")
end

converted_type(type) = type
converted_type(type::Converted) = type.final_type

function accumulate_passes(sname, args, new_nametype_f, passes; common_pass_kwargs=())
    body = Statement[]
    pass_results = DefaultOrderedDict(() -> [])
    @assert unique(typeof.(passes)) == typeof.(passes) "A Pass type cannot be provided more than once"
    for arg ∈ args
        name, type = arg.name, arg.type
        tmp_name = tmp_argname(name, type)
        new_name, new_type = new_nametype_f(name, type, sname)
        pass_args = PassArgs(; name, type, arg, new_name, new_type, sdef=nothing, fdef=nothing, last_name=last_argname(body, tmp_name, new_name), tmp_name, passes=Dict(typeof.(passes) .=> false), sname)
        setproperty!.(Ref(pass_args), keys(common_pass_kwargs), values(common_pass_kwargs))
        for el ∈ passes
            pass_func = hasfield(typeof(el), :pass!) ? el.pass! : pass! # prioritize preprocessed pass inside struct
            body_statements = pass_func(pass_args, typeof(el))
            if !isnothing(body_statements) && typeof(body_statements) != Bool
                body_statements = typeof(body_statements) <: AbstractArray ? body_statements : Statement[body_statements]
                body_statements = annotate_pass(body_statements, el)
                append!(body, body_statements)
                pass_args.passes[typeof(el)] = true
            end
            pass_args.last_name = last_argname(body, tmp_name, new_name)
            push!(pass_results[name], PassResult(el, deepcopy(pass_args)))
        end
        @assert length(passes) == length(pass_results[name]) "Number of passes ($(length(passes))) and pass_results ($(length(pass_results[name]))) differ for $name ($sname)"
    end
    body, pass_results
end

function conversion(new_sdef, sdef, T::ConvertVkStructure)
    transformed_vars = transform_vars(sdef, T)
    sig = conversion_sig(new_sdef.name, sdef.name, T)
    body = [Statement("$(new_sdef.name)($(join_args(transformed_vars)))", nothing)]
    FDefinition(sig.name, sig, false, body)
end

conversion_sig(new_sname, sname, T::ConvertVkStructure) = conversion_sig(new_sname, sname)
conversion_sig(to, from) = new_sig = Signature("vk_convert", PositionalArgument.(["T::Type{$to}", "var::$from"]), [])

function transform_vars(sdef, T::ConversionDefinition)
    vars = String[]
    for args ∈ Signature(sdef).args
        name, type, sname = args.name, args.type, sdef.name
        res = transform_inline(name, type, sname, T)
        !isnothing(res) && push!(vars, res)
    end
    vars
end

function transform_inline(name, type, sname, ::ConvertVkStructure)
    drop_field(name, type, sname) && return nothing
    new_name, new_type = field_transform(name, type, sname)
    "vk_convert($new_type, $name)"
end

function pass!(args::PassArgs, ::Type{TranslateVkTypes})
    @unpack new_type, name, last_name, tmp_name = args
    new_type isa Converted && return Statement("$name = from_vk($(new_type.final_type), $last_name)", name)
end

function pass!(args::PassArgs, ::Type{TranslateVkTypesBack})
    @unpack new_type, name, last_name, type, tmp_name = args
    new_type isa Converted && return Statement("$name = to_vk($type, $last_name)", name)
end

# function pass!(args::PassArgs, ::Type{AddDefaults}; opt_params)
#     @unpack tmp_name, name, new_name, arg, sname = args
#     if !isempty(opt_params)
#         last_param = last(collect(keys(opt_params)))
#     end
#     if arg ∈ keys(opt_params)
#         default = opt_params[arg]
#         eol = name == last_param.name ? "\n" : ""
#         return Statement("$tmp_name = isnothing($new_name) ? $default : $new_name$eol", tmp_name)
#     end
#     nothing
# end

function pass!(args::PassArgs, ::Type{ComputeLengthArgument})
    @unpack tmp_name, name, sname, type = args
    if is_count_variable(name, sname)
        array_arg = first(associated_array_variables(name, sname))
        array_arg_new_name = fieldname_transform(array_arg, type)
        return Statement("$tmp_name = pointer_length($array_arg_new_name)", tmp_name)
    end
    nothing
end

# function pass!(args::PassArgs, ::Type{ReplaceStructureType})
#     @unpack sdef, name = args
#     name == "sType" && return Statement("sType = $(stypes[sdef.name])\n", "sType")
# end

function pass!(args::PassArgs, ::Type{DefineSelfPointers}; new_sname)
    @unpack name, tmp_name = args
    startswith(name, "p") && lstrip(name, 'p') == new_sname && return Statement("$tmp_name = Ref{$(sdef.name)}()", tmp_name)
end

function pass!(args::PassArgs, ::Type{ConvertArrays})
    @unpack new_type, name, sname, type, last_name, new_name, tmp_name = args
    if !(new_type isa Converted) && is_array_type(new_type)
        if is_ptr(type) && inner_type(type) == "Cstring"
            ptrarr = new_name * "_ptrarray"
            return Statement("$ptrarr = pointer.($new_name)", ptrarr)
        elseif is_array_of_vk_objects(name, type, sname)
            return Statement("$tmp_name = $(check_is_default(new_name, type, "getproperty.($new_name, $(is_handle(inner_type(type)) ? ":handle" : ":vks"))"))", tmp_name)
        else
            eltype = inner_type(new_type)
            if is_base_type(eltype)
                eltype_widen_eval = eval(Meta.parse(widen_type(eltype)))
                isabstracttype(eltype_widen_eval) && return Statement("$new_name = convert(Array{$eltype}, $new_name)", last_name)
            end
        end
    end
end

function pass!(args::PassArgs, ::Type{HandlePNextDeps})
    @unpack name, tmp_name, new_name = args
    if name == "pNext"
        return Statement("bag_next = $new_name == C_NULL ? EmptyBag : $new_name.bag", "bag_next")
    end
end

function pass!(args::PassArgs, ::Type{GenerateRefs})
    @unpack tmp_name, new_name, new_type, last_name, type, sname = args
    if is_ptr(type) && !is_array_type(new_type) && !is_extension_ptr(type)
        return Statement("$tmp_name = $(check_is_default(last_name, type, "Ref($last_name$(inline_getproperty(inner_type(type))))"))", tmp_name)
    end
end

function pass!(args::PassArgs, ::Type{GeneratePointers})
    @unpack type, name, tmp_name, new_name, new_type, last_name, passes = args
    if !any(is_triggered.((DefineSelfPointers, InitializePointers), args)) && startswith(name, r"p{1,2}[A-Z]") && !is_extension_ptr(type)
        Statement("$name = unsafe_pointer($last_name)", name)
    end
end

function pass!(args::PassArgs, ::Type{InitializePointers})
    @unpack name, type, new_name, new_type, sname = args
    matches = info_df(sname)[(parent=sname,)]
    inf = info(name, sname)
    if !inf.constant && is_ptr(type) && !is_array_type(new_type) && name == last(matches.name)
        eltype = inner_type(type)
        return Statement("$name = Ref{$eltype}()", name)
    end
end

# a parameter is a keyword argument that relates to the use of a particular function, e.g. flags or allocators.
# a keyword argument is an argument with a default value.
# all structs have arguments, some of which are turned into keyword arguments if default values are defined

function drop_argument(name, sname)
    is_command(sname) && is_command_type(sname, ENUMERATE) && has_count_to_be_filled(sname) && name == enumeration_command_array_variable(sname).name && return true
    name == "sType" && return true
    is_count_variable(name, sname) && return true
end

function is_parameter(name, sname)
    !drop_argument(name, sname) && is_optional_parameter(name, sname)
end

is_keyword_argument(name, type, sname) = is_parameter(name, sname)

function create_info_arguments(sig, args::AbstractArray{T}) where {T <: Argument}
    nonptr_args = filter(x -> !is_ptr(x.type), sig.args)
    nonptr_types = types(nonptr_args)
    create_info_type_indices = findall(occursin.(Ref("Info"), nonptr_types))
    isempty(create_info_type_indices) && return T[]
    args_f = (T == PositionalArgument ? arguments : T == KeywordArgument ? keyword_arguments : error("Unknown argument type $T"))
    new_args = collect(args_f(Signature(api.structs[type])) for type ∈ getindex.(Ref(nonptr_types), create_info_type_indices))
    map(x -> x.name ∈ getproperty.(args, :name) ? PositionalArgument(x.name * "_create_info", T == PositionalArgument ? x.type : x.default) : x, vcat(new_args)...)
end

function keyword_arguments(sig; expose_create_info_kwargs = false, transform_name=true)
    kwargs = sig.args |> Filter(x -> is_keyword_argument(x.name, x.type, sig.name)) |> Map(x -> KeywordArgument(transform_name ? fieldname_transform(x.name, x.type) : x.name, default(x.name, x.type))) |> collect
    expose_create_info_kwargs ? vcat(kwargs, create_info_arguments(sig, kwargs)) : kwargs
end

function parameters(sig; expose_create_info_kwargs=false)
    param_args = filter(x -> is_parameter(x.name, sig.name), sig.args)
    OrderedDict(name => value for (name, value) ∈ zip(param_args, map(x -> default(x.name, x.type), param_args)))
end

function arguments(sig; expose_create_info_kwargs = false, drop_type=true, transform_type = false, transform_name = true, remove_parameters=true)
    sname = sig.name
    args = sig.args |> Filter(x -> !drop_argument(x.name, sname) && (!remove_parameters || !is_parameter(x.name, sname))) |> Map(x -> PositionalArgument(transform_name ? fieldname_transform(x.name, x.type) : x.name, drop_type ? nothing : transform_type ? fieldtype_transform(x.name, x.type, sname) : x.type)) |> collect
    # for arg ∈ filtered_args
    #     name, type = sig.args
    #     new_name, new_type = field_transform(name, type, sname)
    #     if startswith(new_type, "AbstractArray")
    #         eltype = inner_type(new_type)
    #         if eltype ∈ ["String", "AbstractString"]
    #             new_type_ = "AbstractArray"
    #         else
    #             new_type_ = eltype ∈ base_types ? replace(new_type, Regex("(?<={)(?<include>.*?)$eltype") => string("<:" * widen_type(eltype))) : new_type
    #             # println("$new_type => $eltype => $new_type_")
    #         end
    #     else
    #         new_type_ = new_type ∈ base_types ? widen_type(new_type) : new_type
    #     end
    #     push!(args, PositionalArgument(new_name, new_type_))
    # end
    expose_create_info_kwargs ? vcat(args, create_info_arguments(sig, args)) : args
end

remove_type(arg::PositionalArgument) = PositionalArgument(arg.name)