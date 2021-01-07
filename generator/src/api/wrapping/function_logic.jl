struct ParamDetails
    ex
    name::Symbol
    type
    parent::Symbol
    innermost_type::Symbol
    is_vulkan_struct::Bool
    is_optional::Bool
    is_array_variable::Bool
    is_count_variable::Bool
    is_count_inferable::Bool
    associated_array_variables
    associated_count_variable
    default
    new_name::Symbol
    new_type
    requirement::PARAM_REQUIREMENT
end

function ParamDetails(ex::Expr)
    n = name(ex)
    row = dfmatch(vulkan_params, :name, n)
    t = row.type
    fn = row.parent
    ParamDetails(
        ex,
        n,
        t,
        fn,
        innermost_type(t),
        is_vulkan_struct(n),
        row.param_requirement == OPTIONAL,
        is_array_variable(n, fn),
        is_count_variable(n, fn),
        is_count_to_be_filled(n, fn),
        is_count_variable(n, fn) ? associated_array_variables(n, fn) : nothing,
        is_array_variable(n, fn) ? associated_count_variable(n, fn) : nothing,
        default(n, t),
        fieldname_transform(n, t),
        fieldtype_transform(n, t, fn),
        row.param_requirement,
    )
end

fieldname_transform(pd::ParamDetails) = fieldname_transform(pd.name, pd.type)

fieldtype_transform(pd::ParamDetails) = fieldname_transform(pd.name, pd.type, pd.parent)

field_transform(pd::ParamDetails) = :($(fieldname_transform(pd))::$(fieldtype_transform(pd)))

struct FunctionWrapDetails
    ex
    p::Dict
    returns_code::Bool
    is_alias::Bool
    has_alias::Bool
    has_count_to_be_filled::Bool
    type::COMMAND_TYPE
    params::Vector{ParamDetails}
    ccall_info::Dict
end

function FunctionWrapDetails(ex::Expr)
    p = deconstruct(ex)
    row = dfmatch(vulkan_functions, :name, fname)
    params = ParamDetails.(p[:args])
    FunctionWrapDetails(
        ex,
        p,
        row.return_type == :VkResult,
        p[:name],
        p[:name],
        row.type,
        any(getproperty.(params, :is_count_to_be_filled)),
        deconstruct_ccall(ex),
    )
end

args(fd::FunctionWrapDetails) = getproperty.(fd.params, :name)

function wrapped_enumeration_command(fd::FunctionWrapDetails)
    fname = fd.name
    fn_call = fd.p[:call]
    !fd.has_count_to_be_filled && return wrapped_generic(fd)
    arr_row = enumeration_command_array_variable(fname)
    count_row = enumeration_command_count_variable(fname)
    count_new_name = fieldname_transform(count_row.name, count_row.type)
    arr_new_name = fieldname_transform(arr_row.name, arr_row.type)
    enumerated_type = inner_type(arr_row.type)
    new_sig = Signature(new_fname, args, kwargs)
    # body, pass_results = accumulate_passes(fname, sig.args, pass_new_nametype(FDefinition), [ComputeLengthArgument(), InitializePointers()])
    body = []
    command_args = []
    call_args = map(x -> fieldname_transform(x.name, x.type), sig.args)
    first_call_args = replace(join_args(call_args), arr_new_name => "C_NULL")
    second_call_args = join_args(call_args)
    body = [
        :($count_new_name = Ref{UInt32}(0)),
        :($(checked_function_call(fdef))($first_call_args)),
        :($arr_new_name = Vector{$enumerated_type}(undef, $count_new_name[])),
        :($(checked_function_call(fdef))($second_call_args)),
    ]
    enumerated_type_new = name_transform(enumerated_type, SDefinition)
    convert_statement = enumerated_type == "void" ? :(arr_new_name) :  :($enumerated_type_new.($arr_new_name))
    push!(body, convert_statement)
    FDefinition(new_fname, new_sig, false, body)

    reconstruct(Dict(
        :name => name_transform(fname, :function),
        :args => field_transform.(fd.params),
        :body => body,
        :short => false,
    ))
end

deconstruct_ccall(ex::Expr) = @match ex begin
                                 :(ccall(($sym, $lib), $ret_type, ($arg_types...,), $args...))       => Dict(
                                                                                                          :name => sym,
                                                                                                          :return_type => ret_type,
                                                                                                          :params => collect(zip(args, arg_types)),
                                                                                                        )
                                 Expr(:function, $_, $body_1, $_...) && if body_1.head == :ccall end => deconstruct_ccall(body_1)
                                 x                                                                   => error("Expression $x is not a ccall")
                              end


function skip_wrap(fdef; warn=true)
    warn ? @warn("Skipping creation command $(fdef.name)") : nothing
    name = name_transform(fdef)
    FDefinition(name, Signature(name, fdef.signature.args, fdef.signature.kwargs), fdef.short, fdef.body)
end

checked_function_call(fdef) = (fdef.return_type == "VkResult" ? "@check " : "") * fdef.name

function wrapped_generic(fd::FunctionWrapDetails)
    sig = fdef.signature
    args, kwargs = arguments(sig, transform_name=true), keyword_arguments(sig, transform_name=true)
    new_fname = name_transform(fdef.name, FDefinition)
    body, pass_results = accumulate_passes(fdef.name, fdef.signature.args, pass_new_nametype(FDefinition), [ComputeLengthArgument(), InitializePointers()])
    last_args_used = init_args(pass_results, body, fdef)
    triggered_vars_ip = [x.first for x ∈ pass_results if x.second[2].is_triggered]
    triggered_vars_ip_new = fieldname_transform.(triggered_vars_ip, nothing)
    new_sig = Signature(new_fname, filter(x -> x.name ∉ triggered_vars_ip_new, args), kwargs)
    _m = fdef.return_type == "VkResult" ? "@check " : ""
    push!(body, Statement("$(checked_function_call(fdef))($(join_args(last_args_used)))"))
    @assert length(triggered_vars_ip) <= 1
    if !isempty(triggered_vars_ip)
        var = first(triggered_vars_ip)
        type = inner_type(last(pass_results[var]).pass_args.type)
        push!(body, Statement(is_vulkan_struct(type) ? "$(name_transform(type, SDefinition))($var[])" : "$var[]"))
    end
    FDefinition(new_fname, new_sig, false, body, "Generic definition")
end

function type_dependencies(fdef::FDefinition)
    types = filter(!isnothing, argtypes(fdef.signature))
    isempty(types) ? String[] : unique(vcat(type_dependencies.(types))...)
end

function drop_argument(name, sname)
    is_command(sname) && is_command_type(sname, ENUMERATE) && has_count_to_be_filled(sname) && name == enumeration_command_array_variable(sname).name && return true
    name == "sType" && return true
    is_count_variable(name, sname) && return true
end

function is_parameter(name, sname)
    !drop_argument(name, sname) && is_optional_parameter(name, sname)
end

is_keyword_argument(name, type, sname) = is_parameter(name, sname)
