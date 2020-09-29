function wrap!(w_api, fdef::FDefinition)
    if is_command_type(fdef.name, ENUMERATE)
        new_fdef = wrap_enumeration_command(typed_fdef(fdef))
    elseif startswith(fdef.name, "vkDestroy")
        return
    elseif !is_command_type(fdef.name, CREATE)
        # name = name_transform(fdef)
        # body = statements(patterns(fdef))
        # new_fdef = FDefinition(name, Signature(name, args, kwargs), fdef.short, body)
        new_fdef = wrap_generic(typed_fdef(fdef))
    else
        return
    end
    w_api.funcs[new_fdef.name] = new_fdef
end

function typed_fdef(fdef::FDefinition)
    @assert startswith(fdef.body[1].body, "ccall")
    called_fun, ret_type, types, names = deconstruct_ccall(fdef.body[1].body)
    FDefinition(called_fun, Signature(called_fun, PositionalArgument.(names, types), KeywordArgument[]), fdef.short, fdef.body, "", ret_type)
end

function arg_transform(arg::PositionalArgument)
    PositionalArgument(argname_transform(arg), argtype_transform(arg))
end


argname_transform(arg::PositionalArgument) = fieldname_transform(arg.name, arg.type)
argtype_transform(arg::PositionalArgument) = fieldtype_transform(arg.name, arg.type)


function name_transform(str, ::Type{FDefinition})
    nc_convert(SnakeCaseLower, str[3:end])
end

pass_new_nametype(::Type{FDefinition}) = (x, y, z) -> (arg = arg_transform(PositionalArgument(x, y)) ; (arg.name, arg.type))

"""
Get initialization arguments from the results of `accumulate_passes`.
"""
function init_args(pass_results, body, fdef::FDefinition; use_all_args=true, name_depth=2)
    args = String[]
    for (name, pr_list) ∈ pass_results
        pass_args = last(pr_list).pass_args
        @unpack tmp_name, new_name, type, new_type, sname = pass_args
        # if is_ptr(type) && inner_type(type) == "Cstring"
        #     push!(args, new_name * "_ptrarray")
        if (!any(values(pass_args.passes)) || use_all_args)
            last_name = last_argname(body, name_hierarchy(name_depth, name, tmp_name, new_name)...)
            push!(args, last_name)
        end
    end
    args
end


function wrap_enumeration_command(fdef)
    sig = fdef.signature
    fname = fdef.name
    !has_count_to_be_filled(fname) && return wrap_generic(fdef)
    arr_row = enumeration_command_array_variable(fname)
    count_row = enumeration_command_count_variable(fname)
    count_new_name = fieldname_transform(count_row.name, count_row.type)
    arr_new_name = fieldname_transform(arr_row.name, arr_row.type)
    enumerated_type = inner_type(arr_row.type)
    args = arguments(sig)
    kwargs = keyword_arguments(sig)
    new_fname = name_transform(fdef)
    new_sig = Signature(new_fname, args, kwargs)
    # body, pass_results = accumulate_passes(fname, sig.args, pass_new_nametype(FDefinition), [ComputeLengthArgument(), InitializePointers()])
    body = Statement[]
    command_args = []
    call_args = map(x -> fieldname_transform(x.name, x.type), sig.args)
    first_call_args = replace(join_args(call_args), arr_new_name => "C_NULL")
    second_call_args = join_args(call_args)
    body = [
        body...,
        Statement("$(count_new_name) = Ref{UInt32}(0)", count_new_name),
        Statement("$(checked_function_call(fdef))($first_call_args)"),
        Statement("$(arr_new_name) = Array{$(enumerated_type)}(undef, $(count_new_name)[])", arr_new_name),
        Statement("$(checked_function_call(fdef))($second_call_args)"),
    ]
    enumerated_type_new = name_transform(enumerated_type, SDefinition)
    convert_statement = Statement(enumerated_type == "void" ? arr_new_name : "$enumerated_type_new.($(arr_new_name))")
    push!(body, convert_statement)
    FDefinition(new_fname, new_sig, false, body)
end

deconstruct_ccall(fdef::FDefinition) = deconstruct_ccall(fdef.body[1].body)
function deconstruct_ccall(expr)
    matches = match(r"ccall\(\(:(.*?),.*?\), (\w+), \((.*?)\), (.*?)\)", expr)
    called_fun, ret_type, types_unsplit, names_unsplit = matches.captures
    called_fun, ret_type, split(types_unsplit, ", "), split(names_unsplit, ", ")
end

function skip_wrap(fdef; warn=true)
    warn ? @warn("Skipping creation command $(fdef.name)") : nothing
    name = name_transform(fdef)
    FDefinition(name, Signature(name, fdef.signature.args, fdef.signature.kwargs), fdef.short, fdef.body)
end

checked_function_call(fdef) = (fdef.return_type == "VkResult" ? "@check " : "") * fdef.name

function wrap_generic(fdef)
    sig = fdef.signature
    args, kwargs = arguments(sig, transform_name=true), keyword_arguments(sig, transform_name=true)
    new_fname = name_transform(fdef.name, FDefinition)
    # body = [Statement("$(sig.name)($(join_args(argnames(new_sig))))")]
    # kept_args = arguments(sig, transform_name=false, drop_type=false)
    # fname = name_transform(fdef.name, FDefinition)
    body, pass_results = accumulate_passes(fdef.name, fdef.signature.args, pass_new_nametype(FDefinition), [ComputeLengthArgument(), InitializePointers()])
    # new_sig = Signature(fname, remove_type.(args), kwargs)
    last_args_used = init_args(pass_results, body, fdef)
    triggered_vars_ip = [x.first for x ∈ pass_results if x.second[2].is_triggered]
    triggered_vars_ip_new = fieldname_transform.(triggered_vars_ip, nothing)
    new_sig = Signature(new_fname, filter(x -> x.name ∉ triggered_vars_ip_new, args), kwargs)
    # for (i, arg) ∈ enumerate(sig.args)
    #     tmp_argname(arg.name, arg.type) ∉ last_args_used && arg.name ∉ last_args_used && insert!(last_args_used, i, arg.name)
    # end
    _m = fdef.return_type == "VkResult" ? "@check " : ""
    push!(body, Statement("$(checked_function_call(fdef))($(join_args(last_args_used)))"))
    @assert length(triggered_vars_ip) <= 1
    if !isempty(triggered_vars_ip)
        var = first(triggered_vars_ip)
        type = inner_type(last(pass_results[var]).pass_args.type)
        push!(body, Statement(is_vulkan_struct(type) ? "$(name_transform(type, SDefinition))($var[])" : "$var[]", var))
    end
    FDefinition(new_fname, new_sig, false, body, "Generic definition")
end

function type_dependencies(fdef::FDefinition)
    types = filter(!isnothing, argtypes(fdef.signature))
    isempty(types) ? String[] : unique(vcat(type_dependencies.(types))...)
end