wrap_api_call(spec::SpecFunc, args; with_func_ptr = false) = wrap_return(
    :($(spec.name)($((with_func_ptr ? [args; first(func_ptrs(spec))] : args)...))),
    spec.return_type,
    nice_julian_type(spec.return_type),
)

function wrap_enumeration_api_call(spec::SpecFunc, exs::Expr...; free = [])
    if must_repeat_while_incomplete(spec)
        if !isempty(free)
            free_block = quote
                if _return_code == VK_INCOMPLETE
                    $(map(x -> :(Libc.free($(x.name))), free)...)
                end
            end
            [:(@repeat_while_incomplete $(Expr(:block, exs..., free_block)))]
        else
            [:(@repeat_while_incomplete $(Expr(:block, exs...)))]
        end
    else
        exs
    end
end

function APIFunction(spec::SpecFunc, with_func_ptr)
    p = init_wrapper_func(spec)

    count_ptr_index = findfirst(x -> (is_length(x) || is_size(x)) && x.requirement == POINTER_REQUIRED, children(spec))
    queried_params = getindex(children(spec), findall(is_implicit_return, children(spec)))
    if !isnothing(count_ptr_index)
        count_ptr = children(spec)[count_ptr_index]
        queried_params =
            getindex(children(spec), findall(x -> x.len == count_ptr.name && !x.is_constant, children(spec)))

        first_call_args = map(@λ(begin
            &count_ptr => count_ptr.name
            GuardBy(in(queried_params)) => :C_NULL
            x => vk_call(x)
        end), children(spec))

        i = 0
        second_call_args = map(@λ(begin
            :C_NULL && Do(i += 1) => queried_params[i].name
            x => x
        end), first_call_args)

        p[:body] = concat_exs(
            initialize_ptr(count_ptr),
            wrap_enumeration_api_call(
                spec,
                wrap_api_call(spec, first_call_args; with_func_ptr),
                (is_length(count_ptr) ? initialize_array : initialize_ptr).(queried_params, count_ptr)...,
                wrap_api_call(spec, second_call_args; with_func_ptr),
                ;
                free = filter(is_data, queried_params),
            )...,
            wrap_implicit_return(spec, queried_params; with_func_ptr),
        )

        args = filter(!in(vcat(queried_params, count_ptr)), children(spec))

        ret_type = @match length(queried_params) begin
            if any(is_data_with_retrievable_size, queried_params)
            end => Expr(:curly, :Tuple, nice_julian_type.([unique(len.(queried_params)); queried_params])...)
            1 => nice_julian_type(first(queried_params))
            _ => Expr(
                :curly,
                :Tuple,
                (nice_julian_type(param) for param ∈ queried_params)...,
            )
        end
    elseif !isempty(queried_params)
        call_args = map(@λ(begin
            x && GuardBy(in(queried_params)) => x.name
            x => vk_call(x)
        end), children(spec))

        p[:body] = concat_exs(
            map(initialize_ptr, queried_params)...,
            wrap_api_call(spec, call_args; with_func_ptr),
            wrap_implicit_return(spec, queried_params; with_func_ptr),
        )

        args = filter(!in(filter(x -> x.requirement ≠ POINTER_REQUIRED, queried_params)), children(spec))

        ret_type = @match length(queried_params) begin
            1 => nice_julian_type(first(queried_params))
            _ => Expr(:curly, :Tuple, (nice_julian_type(param) for param ∈ queried_params)...)
        end
    else
        p[:short] = true
        p[:body] = :($(wrap_api_call(spec, map(vk_call, children(spec)); with_func_ptr)))

        args = children(spec)

        ret_type = nice_julian_type(spec.return_type)
    end

    add_func_args!(p, spec, args; with_func_ptr)
    p[:return_type] = wrap_return_type(spec, ret_type)
    APIFunction(spec, with_func_ptr, p)
end

"""
Extend functions that create (or allocate) one or several handles,
by exposing the parameters of the associated CreateInfo structures.
`spec` must have one or several CreateInfo arguments.
"""
function APIFunction(spec::CreateFunc, with_func_ptr)
    p_func = APIFunction(spec.func, false).p
    @assert !isnothing(spec.create_info_param) "Cannot extend handle constructor with no create info parameter."
    p_info = Constructor(StructDefinition{false}(spec.create_info_struct)).p

    args = [p_func[:args]; p_info[:args]]
    kwargs = [p_func[:kwargs]; p_info[:kwargs]]

    info_expr = reconstruct_call(p_info; is_decl = false)
    info_index = findfirst(==(spec.create_info_param), filter(!is_optional, children(spec.func)))
    deleteat!(args, info_index)

    func_call_args::Vector{ExprLike} = name.(p_func[:args])
    func_call_args[info_index] = info_expr

    if with_func_ptr
        append!(args, func_ptr_args(spec.func))
        append!(func_call_args, name.(func_ptrs(spec.func)))
    end

    body = reconstruct_call(Dict(:name => p_func[:name], :args => func_call_args, :kwargs => name.(p_func[:kwargs])))

    p = Dict(
        :category => :function,
        :name => p_func[:name],
        :args => args,
        :kwargs => kwargs,
        :short => true,
        :body => body,
        :relax_signature => false,
    )
    APIFunction(spec, with_func_ptr, p)
end

function contains_api_structs(def::Union{APIFunction,Constructor})
    any(x -> x ≠ promote_hl(x), def.p[:args])
end

function promote_hl(def::APIFunction)
    APIFunction(def, def.with_func_ptr, promote_hl(def.p))
end

function promote_hl(def::Constructor)
    Constructor(def, promote_hl(def.p))
end

function promote_hl(arg::ExprLike)
    id, type = @match arg begin
        :($id::$t) => (id, t)
        _ => return arg
    end
    type = postwalk(type) do ex
        if ex isa Symbol && startswith(string(ex), '_')
            Symbol(string(type)[2:end]) # remove underscore prefix
        else
            ex
        end
    end
    new_arg = :($id::$type)
end

function promote_hl(p::Dict)
    args = promote_hl.(p[:args])
    modified_args = [arg for (arg, new_arg) in zip(p[:args], args) if arg ≠ new_arg]
    !isempty(modified_args) || error("Cannot define high-level function for $(reconstruct_call(p)): there are no arguments to adjust, so the low-level function is enough.")
    call_args = map(p[:args]) do arg
        id, type = @match arg begin
            :($id::$t) => (id, t)
            id => (id, nothing)
        end
        if arg in modified_args
            T = @match type begin
                :(AbstractArray{<:$t}) => :(Vector{$t})
                t => t
            end
            :(convert($T, $id))
        else
            id
        end
    end
    p = Dict(
        :category => :function,
        :name => p[:name],
        :args => args,
        :kwargs => p[:kwargs],
        :body => reconstruct_call(Dict(:name => p[:name], :args => call_args, :kwargs => name.(p[:kwargs]))),
        :short => true,
        :relax_signature => true,
    )
end
