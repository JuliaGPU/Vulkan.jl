function constructor(new_sdef::SDefinition, sdef::SDefinition)
    defs = []
    sname = sdef.name
    new_sname = new_sdef.name
    new_sname_sym = Symbol(new_sname)
    if is_handle_with_multiple_create_info(sname)
        ci_indices = findall(x -> x.name == sdef.name, eachrow(vulkan_creation_info))
        for index ∈ ci_indices
            ci = vulkan_creation_info[index, :]
            create_fun = ci.create_function
            if create_fun ∉ keys(api.funcs)
                @warn "$create_fun not found. Skipping."
            else
                fun, type, id = (create_fun, first(ci.create_info_structs), first(ci.create_info_identifiers))
                push!(defs, constructor(new_sdef, sdef, CreateVkHandle(), fun, type, id; add_create_info_type_annotation=true, is_inner_constructor=false))
                push!(defs, constructor(new_sdef, sdef, CreateVkHandle(), fun, type, id; add_create_info_type_annotation=true, is_inner_constructor=false, add_fun_ptr=true))
            end
        end
    elseif is_handle_with_create_info(sname)
        push!(defs, constructor(new_sdef, sdef, CreateVkHandle()))
        push!(defs, constructor(new_sdef, sdef, CreateVkHandle(), add_fun_ptr=true))
    elseif !is_handle(sname) && is_returnedonly(sname)
        vk_sig = Signature(sdef)
        args_undropped = [name for (name, type) ∈ zip(argnames(vk_sig), argtypes(vk_sig)) if !drop_field(name, type, sname)]
        from_vk_calls = [:(from_vk($(Meta.parse(type)), vks.$arg)) for (type, arg) ∈ zip(values(new_sdef.fields), Symbol.(args_undropped))]
        from_vk_body = Statement(:($new_sname_sym($(from_vk_calls...))))
        fdef = FDefinition(new_sname, Signature(new_sname, [PositionalArgument("vks", sname)], KeywordArgument[]), true, [from_vk_body])
        push!(defs, fdef) 
        push!(defs, FDefinition("from_vk", Signature("from_vk", PositionalArgument.(["T::Type{$new_sname}", "x::$sname"]), KeywordArgument[]), true, [Statement(:($new_sname_sym(x)))]))
    elseif !is_handle(sname)
        if keeps_original_layout(sdef)
            push!(defs, constructor(new_sdef, sdef, GenericConstructor(), is_inner_constructor=false, add_type_annotations=false))
            unpacked_fields = [:(x.$a) for a ∈ Symbol.(keys(sdef.fields))]
            statement = Statement(:($new_sname_sym($(unpacked_fields...))))
            push!(defs, FDefinition("from_vk", Signature("from_vk", PositionalArgument.(["T::Type{$new_sname}", "x::$sname"]), KeywordArgument[]), true, [statement]))
            if length(Signature(new_sdef).args) == 1
                new_sdef.inner_constructor = FDefinition(new_sname, Signature(new_sname, [PositionalArgument("vks", sname)], KeywordArgument[]), true, [Statement(:(new(vks)))])
            end
        else
            new_sdef.inner_constructor = constructor(new_sdef, sdef, GenericConstructor(), is_inner_constructor=true)
        end
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

function api_ex(sym, category)
    prop = Symbol(sym, "s")
    exs = getproperty(api, prop)
    i = findfirst(x -> x == sym, name.(exs))
    @assert !isnothing(i) "Could not fetch API expression for $sym with category $category"
    exs[i]
end

# function steal_bag!(p, bag_args, n, t, new_name, new_type, last_name, sname)
#     var = Symbol(new_name)
#     value = nothing
#     pt = ptr_type(t)
#     if needs_bag(p)
#         value = :($var.bag)
#     elseif is_ptr(type) && is_vulkan_struct(pt) && needs_bag(deconstruct(api_ex(pt, :struct)))
#         if is_array_variable(n, sname) || is_array_type(new_name)
#             value = :(getproperty.($var, $(QuoteNode(:bag))))
#         else
#             value = :($var.bag)
#         end
#     end
#     !isnothing(value) && push!(bag_args, is_optional_parameter(n, sname) ? :($var == C_NULL ? EmptyBag : $value) : value)
# end

# function instantiate_bag(p, body)
#     sname = p[:name]
#     !needs_bag(p) && error("Type $sname does not have a bag to instantiate.")
#     bag_args = []
#     sname = sdef.name
#     if "pNext" ∈ keys(sdef.fields)
#         push!(bag_args, :bag_next)
#     end
#     for (name, type) ∈ sdef.fields
#         new_name, new_type = field_transform(name, type, sdef.name)
#         tmp_name = tmp_argname(name, type)
#         last_name = last_argname(body, tmp_name, new_name)
#         if is_array_type(new_type) && inner_type(new_type) == "String"
#             push!(bag_args, Symbol(new_name, "_ptrarray"))
#         else
#             steal_bag!(bag_args, name, type, new_name, new_type, last_name, sname)
#         end
#         if type == "Cstring" || is_ptr(type)
#             push!(bag_args, last_name)
#         end
#     end
#     bag = Symbol(bagtype(sdef.name))
#     Statement(:(bag = $bag($(bag_args...))))
# end

"""
Check whether an argument matches by name a pointer to the type defined in `new_sname`, and returns a default Ref of the corresponding type.
"""
@preprocess_pass struct DefineSelfPointers <: Pass
    new_sname
    pass!
end

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
    id_list = assigned_id.(body)
    id ∈ id_list ? id : fallback
end

function last_argname(body, ids::Tuple, fallback)
    id_list = assigned_id.(body)
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


function inline_getproperty(var, type)
    var = Symbol(var)
    is_handle(type) && return :($var.handle)
    is_vulkan_struct(type) && return :($var.vks)
    var
end

"""
Get initialization arguments from the results of `accumulate_passes`.
"""
function init_args(pass_results, body, ::ExtendVkConstructor; use_all_args=true, take_property=true, include_stype=true, name_depth=2)
    args = []
    for (name, pr_list) ∈ pass_results
        pass_args = last(pr_list).pass_args
        @unpack tmp_name, new_name, type, new_type, sname = pass_args
        if name == "sType" && include_stype
            push!(args, stypes[sname])
        elseif (!any(values(pass_args.passes)) || use_all_args)
            var = Symbol(last_argname(body, name_hierarchy(name_depth, name, tmp_name, new_name)...))
            push!(args, take_property ? inline_getproperty(var, type) : var)
        end
    end
    args
end

"""
Get initialization arguments from the results of `accumulate_passes`.
"""
function init_args(pass_results, body, ::GenericConstructor; use_all_args=true, take_property=true, include_stype=true, name_depth=2, sname=nothing)
    args = []
    for (name, pr_list) ∈ pass_results
        pass_args = last(pr_list).pass_args
        @unpack tmp_name, new_name, type, new_type, sname = pass_args
        if name == "sType" && include_stype
            push!(args, Symbol(stypes[sname]))
        elseif is_ptr(type) && inner_type(type) == "Cstring"
            push!(args, Symbol(new_name, "_ptrarray"))
        else (!any(values(pass_args.passes)) || use_all_args)
            last_name = last_argname(body, name_hierarchy(name_depth, name, tmp_name, new_name)...)
            expr = take_property ? inline_getproperty(last_name, type) : last_name

            final_expr = if !isnothing(sname) && is_optional_parameter(name, sname)
                default_val = default(name, type)
                 :($(Symbol(last_name)) == $default_val ? $default_val : $expr)
            else
                expr
            end

            push!(args, final_expr)
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
    needs_bag(sname) && push!(body, instantiate_bag(sdef, body))
    init_vk = init_args(pass_results, body, definition, use_all_args=true, include_stype=false, name_depth=2; sname)
    push!(body, Statement(:(vks = $(Symbol(sname))($(init_vk...)))))
    init_struct = [:vks]
    needs_bag(sname) && push!(init_struct, :bag)
    push!(body, Statement(:($(is_inner_constructor ? :new : Symbol(new_sdef.name))($(init_struct...)))))
    FDefinition(new_sdef.name, co_sig, false, body, "Generic constructor.")
end

function constructor(new_sdef, sdef, definition::ConstructorNoVKS; add_type_annotations=false, is_inner_constructor=true)
    vk_sig = Signature(sdef)
    args = arguments(vk_sig)
    kwargs = keyword_arguments(vk_sig)
    new_sig = Signature(new_sdef.name, args, kwargs)
    body = Statement(:($(is_inner_constructor ? :new : Symbol(new_sdef.name))($(Symbol.(argnames(new_sig))))))
    FDefinition(new_sdef.name, new_sig, false, body, "Constructor identical to the corresponding $(sdef.name).")
end

function constructor(new_sdef, sdef, def::CreateVkHandle; add_fun_ptr=false)
    ci = dfmatch(vulkan_creation_info, :name, sdef.name)
    create_fun, create_info_struct, create_info_id = (ci.create_function, first(ci.create_info_structs), first(ci.create_info_identifiers))
    constructor(new_sdef, sdef, def, create_fun, create_info_struct, create_info_id; add_create_info_type_annotation=true, is_inner_constructor=false, add_fun_ptr)
end

maybe_broadcast(f::Symbol, broadcast::Bool, args...) = broadcast ? :($f.($(args...))) : :($f($(args...)))

function finalizer_statement(info, broadcast, has_multiple_create_info, add_fun_ptr)
    @unpack destroy_function, identifier = info
    identifier = Symbol(identifier)
    destroy_fun_fdef = api.funcs[destroy_function]
    identifiers, types = Symbol.(argnames(destroy_fun_fdef.signature)), argtypes(destroy_fun_fdef.signature)
    destroy_fun_sym = Symbol(destroy_function)
    finalize_f_args = Symbol.(map(fieldname_transform, string.(identifiers), types))
    finalize_f_args[findfirst(identifier .== identifiers)] = :x

    add_fun_ptr && push!(finalize_f_args, :fun_ptr_destroy)
    finalizer_f = :(x -> $destroy_fun_sym($(finalize_f_args...)))

    Statement(maybe_broadcast(:finalizer, broadcast, has_multiple_create_info ? :(Ref($finalizer_f)) : finalizer_f, :vks))
end

function constructor(new_sdef, sdef, ::CreateVkHandle, create_fun, create_info_struct, create_info_id; is_inner_constructor=true, add_create_info_type_annotation=false, add_fun_ptr=false)
    create_fun_fdef = api.funcs[create_fun]
    create_fun_sym = Symbol(create_fun)
    create_fun_sig = create_fun_fdef.signature
    sname = sdef.name
    new_sname = new_sdef.name
    sname_sym = Symbol(sname)
    new_sname_sym = Symbol(new_sname)
    args = arguments(create_fun_sig)
    has_multiple_create_info = create_info_id ∈ ["pCreateInfos", "pAllocateInfos"] ? true : create_info_id ∈ ["pCreateInfo", "pAllocateInfo"] ? false : error("Unknown create info ID $create_info_id")
    new_create_info_id = has_multiple_create_info ? :create_infos : :create_info
    if add_create_info_type_annotation
        args = map(x -> x.name == string(new_create_info_id) ? (has_multiple_create_info ? PositionalArgument(x.name, "AbstractArray{$(name_transform(create_info_struct, SDefinition)), 1}") : PositionalArgument(x.name, name_transform(create_info_struct, SDefinition))) : x, args)
    end
    kwargs = keyword_arguments(create_fun_sig)
    identifier = Symbol(last(args).name)
    add_fun_ptr ? push!(args, PositionalArgument("fun_ptr_create")) : nothing
    new_sig = Signature(new_sname, filter(x -> x.name ≠ string(identifier), args), kwargs)
    creates_multiple_handles = is_command_type(create_fun, ALLOCATE)

    body = has_multiple_create_info ? [
        Statement(:(create_info_count = length($new_create_info_id))),
        Statement(:($identifier = Array{$sname_sym, 1}(undef, create_info_count))),
    ] : creates_multiple_handles ? [
        Statement(:($identifier = Array{$sname_sym, 1}(undef, n))),
    ] : [
        Statement(:($identifier = Ref{$sname_sym}())),
    ]

    vk_create_args = map(Symbol ∘ fieldname_transform, argnames(create_fun_sig), argtypes(create_fun_sig))
    add_fun_ptr && push!(vk_create_args, :fun_ptr_create)

    broadcast = has_multiple_create_info || creates_multiple_handles
    deref = has_multiple_create_info || creates_multiple_handles ? identifier : :($identifier[])
    constructing_fun = is_inner_constructor ? :new : new_sname_sym

    append!(body, [
        Statement(:(@check $create_fun_sym($(vk_create_args...)))),
        Statement(:(vks = $(maybe_broadcast(constructing_fun, broadcast, deref))))
    ])

    if is_handle_destructible(sname)
        info = dfmatch(vulkan_destruction_info, :name, sname)
        destroy_fun = info.destroy_function
        if !is_command_type(destroy_fun, FREE)
            add_fun_ptr && push!(args, PositionalArgument("fun_ptr_destroy"))
            push!(body, finalizer_statement(info, broadcast, has_multiple_create_info, add_fun_ptr))
        end
    end
    new_sig = Signature(new_sname, is_command_type(create_fun, ALLOCATE) ? map(x -> x.name == string(identifier) ? PositionalArgument("n") : x, args) : filter(x -> x.name ≠ string(identifier), args), kwargs)
    FDefinition(new_sname, new_sig, false, body, "")
end


function constructor(new_sdef, sdef, ::CreateVkHandleWithCreateInfo ; create_info_sdef, create_fun_fdef)
    create_info_var = Symbol(last(handle_creation_info[sdef.name]))
    create_fun_sig = create_fun_fdef.signature

    name = nc_convert(SnakeCaseLower, sdef.name)
    var = Symbol(name)
    sdef_sym = Symbol(sdef.name)

    kwargs = [kwargs_info..., KeywordArgument("pAllocator", "C_NULL")]
    new_sig = Signature(new_sdef.name, args_info, kwargs)
    create_info_sig = Signature(create_info_sdef)
    create_info_args = Symbol.(argnames(create_info_sig))
    create_fun_args = Symbol.(argnames(create_fun_sig))
    body = [
    Statement(:($var = Ref{$sdef_sym}())),
    Statement(:($create_info_var = $(Symbol(create_info_sig.name))($(create_info_args...)))),
    Statement(:(@check $(Symbol(create_fun_sig.name))($(create_fun_args...)))),
    ]
    FDefinition(new_sig.name, new_sig, false, body, "")
end

function constructor(sdef, def::ExtendVkConstructor)
    sname = sdef.name
    sdef_sym = Symbol(sname)
    sname_prefixed = "api." * sname
    vk_sig = Signature(sdef)
    args = arguments(vk_sig, remove_parameters=false)
    body, pass_results = accumulate_passes(sname, vk_sig.args, pass_new_nametype(SDefinition), [ComputeLengthArgument(), GeneratePointers(), TranslateVkTypesBack()])
    init = init_args(pass_results, body, def, use_all_args=true, take_property=false)
    push!(body, Statement(:(api.$sdef_sym($(init...)))))
    new_sig = Signature(sname_prefixed, args, KeywordArgument[])
    FDefinition(sname_prefixed, new_sig, false, body, "Julian constructor for $(sdef.name). All struct pointers should be replaced by an equivalent Ref or `C_NULL`. The Refs need to be explicitly preserved during and after this call to keep the struct pointers valid.")
end

converted_type(type) = type
converted_type(type::Converted) = type.final_type

function accumulate_passes(sname, args, new_nametype_f, passes; common_pass_kwargs=())
    body = Statement[]
    pass_results = DefaultOrderedDict(() -> [])
    @assert unique(typeof.(passes)) == typeof.(passes) "A Pass type cannot be provided more than once"
    for arg ∈ args
        name, type = Symbol(arg.name), arg.type
        tmp_name = tmp_argname(name, type)
        new_name, new_type = new_nametype_f(name, type, sname)
        new_name = Symbol(new_name)
        pass_args = PassArgs(; name, type, arg, new_name, new_type, sdef=nothing, fdef=nothing, last_name=last_argname(body, tmp_name, new_name), tmp_name, passes=Dict(typeof.(passes) .=> false), sname)
        setproperty!.(Ref(pass_args), keys(common_pass_kwargs), values(common_pass_kwargs))
        for el ∈ passes
            pass_func = hasfield(typeof(el), :pass!) ? el.pass! : pass! # prioritize preprocessed pass inside struct
            body_statements = pass_func(pass_args, typeof(el))
            if !isnothing(body_statements) && typeof(body_statements) != Bool
                body_statements = typeof(body_statements) <: AbstractArray ? body_statements : Statement[body_statements]
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
    transformed_vars = Symbol.(transform_vars(sdef, T))
    sig = conversion_sig(new_sdef.name, sdef.name, T)
    body = Statement(:($(Symbol(new_sdef.name))($(transformed_vars...))))
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
    new_type isa Converted && return Statement(:($(Symbol(name)) = from_vk($(Meta.parse(new_type.final_type)), $(Symbol(last_name)))))
end

function pass!(args::PassArgs, ::Type{TranslateVkTypesBack})
    @unpack new_type, name, last_name, type, tmp_name = args
    new_type isa Converted && return Statement(:($(Symbol(name)) = to_vk($(Meta.parse(type)), $(Symbol(last_name)))))
end

function pass!(args::PassArgs, ::Type{ComputeLengthArgument})
    @unpack tmp_name, name, sname, type = args
    tmp_var = Symbol(tmp_name)
    if is_count_variable(name, sname)
        array_arg = first(associated_array_variables(name, sname))
        array_arg_new_name = Symbol(fieldname_transform(array_arg, type))
        return Statement(:($tmp_var = pointer_length($array_arg_new_name)))
    end
    nothing
end

function pass!(args::PassArgs, ::Type{DefineSelfPointers}; new_sname)
    @unpack name, tmp_name = args
    startswith(name, "p") && lstrip(name, 'p') == new_sname && return Statement(:($(Symbol(tmp_name)) = Ref{$(Symbol(sdef.name))}()))
end

function pass!(args::PassArgs, ::Type{ConvertArrays})
    @unpack new_type, name, sname, type, last_name, new_name, tmp_name = args
    new_var = Symbol(new_name)
    tmp_var = Symbol(tmp_name)
    if !(new_type isa Converted) && is_array_type(new_type)
        if is_ptr(type) && inner_type(type) == "Cstring"
            ptrarr = Symbol(new_name, "_ptrarray")
            return Statement(:($ptrarr = pointer.($new_var)))
        elseif is_array_of_vk_objects(name, type, sname)
            action_not_default = :(getproperty.($new_var, $(QuoteNode(is_handle(inner_type(type)) ? :handle : :vks))))
            return Statement(:($tmp_var = $(check_is_default(new_var, type, action_not_default))))
        else
            eltype = inner_type(new_type)
            eltype_sym = Symbol(eltype)
            if is_base_type(eltype)
                eltype_widen_eval = eval(Meta.parse(widen_type(eltype)))
                isabstracttype(eltype_widen_eval) && return Statement(:($new_var = convert(Array{$eltype_sym}, $new_var)))
            end
        end
    end
end

check_is_default(var::AbstractString, type, action) = check_is_default(Symbol(var), type, action)
check_is_default(var::Symbol, type::AbstractString, action) = :($var == $(default(var, type)) ? $var : $action)

function pass!(args::PassArgs, ::Type{HandlePNextDeps})
    @unpack name, tmp_name, new_name = args
    var = Symbol(name)
    new_var = Symbol(new_name)
    if var == :pNext
        return Statement(:(bag_next = $new_var == C_NULL ? EmptyBag : $new_var.bag))
    end
end

function pass!(args::PassArgs, ::Type{GenerateRefs})
    @unpack tmp_name, new_name, new_type, last_name, type, sname = args
    tmp_var = Symbol(tmp_name)
    if is_ptr(type) && !is_array_type(new_type) && !is_extension_ptr(type)
        action_not_default = :(Ref($(inline_getproperty(last_name, inner_type(type)))))
        return Statement(:($tmp_var = $(check_is_default(last_name, type, action_not_default))))
    end
end

function pass!(args::PassArgs, ::Type{GeneratePointers})
    @unpack type, name, tmp_name, new_name, new_type, last_name, passes = args
    var = Symbol(name)
    last_var = Symbol(last_name)
    if !any(is_triggered.((DefineSelfPointers, InitializePointers), args)) && startswith(name, r"p{1,2}[A-Z]") && !is_extension_ptr(type)
        Statement(:($var = unsafe_pointer($last_var)))
    end
end

function pass!(args::PassArgs, ::Type{InitializePointers})
    @unpack name, type, new_name, new_type, sname = args
    var = Symbol(name)
    matches = info_df(sname)[(parent=sname,)]
    inf = info(name, sname)
    if !inf.constant && is_ptr(type) && !is_array_type(new_type) && name == last(matches.name)
        eltype = Symbol(inner_type(type))
        return Statement(:($var = Ref{$eltype}()))
    end
end

# a parameter is a keyword argument that relates to the use of a particular function, e.g. flags or allocators.
# all structs have arguments, some of which are turned into keyword arguments if default values are defined in the specification

function create_info_arguments(sig, args::AbstractArray{T}) where {T <: Argument}
    nonptr_args = filter(x -> !is_ptr(x.type), sig.args)
    nonptr_types = types(nonptr_args)
    create_info_type_indices = findall(occursin.(Ref("Info"), nonptr_types))
    isempty(create_info_type_indices) && return T[]
    args_f = (T == PositionalArgument ? arguments : T == KeywordArgument ? keyword_arguments : error("Unknown argument type $T"))
    new_args = collect(args_f(Signature(api.structs[type])) for type ∈ getindex.(Ref(nonptr_types), create_info_type_indices))
    map(x -> x.name ∈ getproperty.(args, :name) ? PositionalArgument(x.name * "_create_info", T == PositionalArgument ? x.type : string(x.default)) : x, vcat(new_args)...)
end

function keyword_arguments(sig; expose_create_info_kwargs = false, transform_name=true)
    kwargs = @pipe sig.args |> filter(x -> is_keyword_argument(x.name, x.type, sig.name), _) |> map(x -> KeywordArgument(transform_name ? fieldname_transform(x.name, x.type) : x.name, default(x.name, x.type)), _)
    expose_create_info_kwargs ? vcat(kwargs, create_info_arguments(sig, kwargs)) : kwargs
end

function parameters(sig; expose_create_info_kwargs=false)
    param_args = filter(x -> is_parameter(x.name, sig.name), sig.args)
    OrderedDict(name => value for (name, value) ∈ zip(param_args, map(x -> default(x.name, x.type), param_args)))
end

function arguments(sig; expose_create_info_kwargs = false, drop_type=true, transform_type = false, transform_name = true, remove_parameters=true)
    sname = sig.name
    args = @pipe sig.args |> filter(x -> !drop_argument(x.name, sname) && (!remove_parameters || !is_parameter(x.name, sname)), _) |> map(x -> PositionalArgument(transform_name ? fieldname_transform(x.name, x.type) : x.name, drop_type ? nothing : transform_type ? fieldtype_transform(x.name, x.type, sname) : x.type), _)
    expose_create_info_kwargs ? vcat(args, create_info_arguments(sig, args)) : args
end

remove_type(arg::PositionalArgument) = PositionalArgument(arg.name)
