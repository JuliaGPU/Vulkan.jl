function wrap_api_call(spec::SpecFunc, args; with_func_ptr = false)
    ex = :($(spec.name)($((with_func_ptr ? [args; first(func_ptrs(spec))] : args)...)))
    ex = if with_func_ptr
        ex
    else
        dispatch_call(spec, ex)
    end
    wrap_return(
        ex,
        spec.return_type,
        idiomatic_julia_type(spec.return_type),
    )
end

function dispatch_handle(spec::SpecFunc)
    maybe_handle = !isempty(children(spec)) ? first(children(spec)).type : nothing
    if maybe_handle in spec_handles.name
        handle = handle_by_name(maybe_handle)
        handle_id = wrap_identifier(handle)
        hierarchy = parent_hierarchy(handle)
        if handle.name == :VkDevice || handle.name == :VkInstance
            # to avoid name conflicts
            handle_id
        elseif :VkDevice in hierarchy
            :(device($handle_id))
        elseif :VkInstance in hierarchy
            :(instance($handle_id))
        end
    else
        nothing
    end
end

dispatch_call(spec::SpecFunc, ex) = spec.name in (:vkGetInstanceProcAddr, :vkGetDeviceProcAddr) ? ex : :(@dispatch $(dispatch_handle(spec)) $ex)

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
    p = Dict(
        :category => :function,
        :name => function_name(spec),
        :relax_signature => true,
    )

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
            end => Expr(:curly, :Tuple, idiomatic_julia_type.([unique(len.(queried_params)); queried_params])...)
            1 => idiomatic_julia_type(first(queried_params))
            _ => Expr(
                :curly,
                :Tuple,
                (idiomatic_julia_type(param) for param ∈ queried_params)...,
            )
        end
    elseif !isempty(queried_params)
        call_args = map(@λ(begin
            x && GuardBy(in(queried_params)) => x.name
            x => vk_call(x)
        end), children(spec))

        args = filter(!in(filter(x -> x.requirement ≠ POINTER_REQUIRED, queried_params)), children(spec))

        ret_type = @match length(queried_params) begin
            1 => idiomatic_julia_type(first(queried_params))
            _ => Expr(:curly, :Tuple, (idiomatic_julia_type(param) for param ∈ queried_params)...)
        end

        if spec.type == FTYPE_QUERY && length(queried_params) == 1 && begin
                t = ptr_type(only(queried_params).type)
                is_vulkan_type(t) && !in(t, spec_handles.name) && any(Base.Fix1(in, t), spec_structs.extends)
            end

            param = only(queried_params)
            t = ptr_type(param.type)
            intermediate_t = struct_name(t)
            var = wrap_identifier(param.name)
            p[:body] = quote
                $var = initialize($intermediate_t, next_types...)
                $(param.name) = Ref(Base.unsafe_convert($t, $var))
                GC.@preserve $var begin
                    $(wrap_api_call(spec, call_args; with_func_ptr))
                    $intermediate_t($(param.name)[], Any[$var])
                end
            end

            add_func_args!(p, spec, args; with_func_ptr)
            push!(p[:args], :(next_types::Type...))
            p[:return_type] = wrap_return_type(spec, ret_type)
            return APIFunction(spec, with_func_ptr, p)
        else
            p[:body] = concat_exs(
                map(initialize_ptr, queried_params)...,
                wrap_api_call(spec, call_args; with_func_ptr),
                wrap_implicit_return(spec, queried_params; with_func_ptr),
            )
        end
    else
        p[:short] = true
        p[:body] = :($(wrap_api_call(spec, map(vk_call, children(spec)); with_func_ptr)))

        args = children(spec)

        ret_type = idiomatic_julia_type(spec.return_type)
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
    @assert !isnothing(spec.create_info_param) "Cannot extend handle constructor with no create info parameter."
    def = APIFunction(spec.func, false)
    p_func = def.p
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
        append!(func_call_args, func_ptrs(spec.func))
    end

    body = reconstruct_call(Dict(:name => name(def), :args => func_call_args, :kwargs => name.(p_func[:kwargs])))

    p = Dict(
        :category => :function,
        :name => p_func[:name],
        :args => args,
        :kwargs => kwargs,
        :short => true,
        :body => body,
        :relax_signature => true,
        # Do not include the return type in generated code, but keep the return type information for the promotion to a high-level function.
        :_return_type => p_func[:return_type],
    )
    APIFunction(spec, with_func_ptr, p)
end

function contains_api_structs(def::Union{APIFunction,Constructor})
    any(x -> x ≠ promote_hl(x), def.p[:args])
end

is_promoted(ex) = ex == promote_hl(ex)

function promote_hl(def::APIFunction)
    promoted = APIFunction(def, def.with_func_ptr, promote_hl(def.p))
    type = def.p[def.spec isa CreateFunc ? :_return_type : :return_type]
    wrap_body = :(next_types::Type...) in promoted.p[:args] ? promote_return_hl_next_types : promote_return_hl
    merge!(promoted.p,
        Dict(
            :short => false,
            :body => wrap_body(type, promoted.p[:body])
        )
    )
    promote_return_type_hl!(promoted, type)
    promoted
end

function promote_return_type_hl!(promoted, type)
    T = hl_type(type)
    include_rtype = false
    rtype = @match type begin
        :(ResultTypes.Result{$S,$E}) => (include_rtype = true; :(ResultTypes.Result{$(promote_return_type_hl!(nothing, S)), $E}))
        :(Vector{$_T}) => :(Vector{$(promote_return_type_hl!(nothing, _T))})
        _ => T
    end
    include_rtype && (promoted.p[:return_type] = rtype)
    rtype
end

function promote_hl(def::Constructor)
    Constructor(promote_hl(def.p), def.to, def.from)
end

function promote_hl(arg::ExprLike)
    id, type = @match arg begin
        :($id::$t) => (id, t)
        _ => return arg
    end
    type = postwalk(type) do ex
        if ex isa Symbol && startswith(string(ex), '_')
            Symbol(string(ex)[2:end]) # remove underscore prefix
        else
            ex
        end
    end
    :($id::$type)
end

function promote_hl(p::Dict)
    args = promote_hl.(p[:args])
    modified_args = [arg for (arg, new_arg) in zip(p[:args], args) if arg ≠ new_arg]
    call_args = map(p[:args]) do arg
        id, type = @match arg begin
            :($id::$t) => (id, t)
            :($id::$t...) => (:($id...), nothing)
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
        :name => promote_name_hl(p[:name]),
        :args => args,
        :kwargs => p[:kwargs],
        :body => reconstruct_call(Dict(:name => p[:name], :args => call_args, :kwargs => name.(p[:kwargs]))),
        :short => true,
        :relax_signature => true,
    )
end

function function_name(sym::Symbol, is_high_level = false)
    sym = nc_convert(SnakeCaseLower, remove_vk_prefix(sym))
    is_high_level ? sym : Symbol('_', sym)
end
function_name(spec::Spec, is_high_level = false) = function_name(spec.name, is_high_level)

function promote_name_hl(name)
    str = String(name)
    startswith(str, '_') ? Symbol(str[2:end]) : name
end

function promote_return_hl_next_types(type, ex)
    rex = promote_return_hl(type, ex)
    call = isexpr(rex, :block) ? last(rex.args) : rex
    push!(call.args, :(next_types_hl...))
    quote
        next_types_hl = next_types
        next_types = intermediate_type.(next_types)
        $((isexpr(rex, :block) ? rex.args : [rex])...)
    end
end

function promote_return_hl(type, ex)
    T = hl_type(type)
    @match type begin
        :Cvoid => ex
        :(ResultTypes.Result{$S,$E}) => Expr(:block, :(val = @propagate_errors $ex), promote_return_hl(S, :val))
        :(Vector{$T}) => begin
            rex = promote_return_hl(T, ex)
            rex isa Symbol ? rex : broadcast_ex(rex)
        end
        GuardBy(is_intermediate) => :($T($ex))
        _ => ex
    end
end
