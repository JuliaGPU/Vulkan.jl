struct VulkanWrapper
    handles::Vector{Expr}
    structs::Vector{Expr}
    funcs::Vector{Expr}
    misc::Vector{Expr}
end

Base.show(io::IO, vw::VulkanWrapper) = print(io, "VulkanWrapper with $(length(vw.handles)) handles, $(length(vw.structs)) structs, $(length(vw.funcs)) functions and $(length(vw.misc)) others.")

function wrap(spec::SpecHandle)
    :(mutable struct $(remove_vk_prefix(spec.name)) <: Handle
         handle::$(spec.name)
     end)
end

function wrap(spec::SpecStruct)
    p = Dict(
        :category => :struct,
        :decl => :($(remove_vk_prefix(spec.name)) <: $(spec.is_returnedonly ? :ReturnedOnly : :VulkanStruct)),
    )
    if spec.is_returnedonly
        p[:fields] = map(x -> :($(nc_convert(SnakeCaseLower, x.name))::$(nice_julian_type(x))), spec.members)
    else
        p[:fields] = [
            :(vks::$(spec.name)),
        ]
    end
    (any(!isnothing, spec.members.len) || any(spec.members.type .== :Cstring)) && push!(p[:fields], :(deps::Vector{Any}))
    reconstruct(p)
end

check_return_code(spec::SpecFunc, args) = spec.return_type == :VkResult ? :(@check $(spec.name)(($(args...)))) : :($(spec.name)(($(args...))))

function vk_call(x::Spec)
    var = var_from_vk(x.name)
    jtype = nice_julian_type(x)
    @match x begin
        if !isempty(x.arglen) end => :(length($(var_from_vk(first(x.arglen)))))
        if x.type ∈ spec_handles.name end => var
        if is_ptr(x.type) && isnothing(x.len) && (x.is_constant || (func = func_by_name(x.func); func.type == QUERY && x ≠ last(func.params))) end => @match x begin
            if ptr_type(x.type) ∈ spec_structs.name end => var
            if x.requirement == OPTIONAL end => :($var == $(default(x)) ? $(default(x)) : Ref($var))
            _ => :(Ref($var))
        end
        _ => @match jtype begin
            :String || :Bool || :(Vector{$et}) || if jtype == follow_constant(x.type) end => var
            _ => :(to_vk($(x.type), $var))
        end
    end
end

return_expr(var, type, jtype) = @match t = type begin
    GuardBy(in(spec_handles.name)) => :($(remove_vk_prefix(t))($var))
    GuardBy(in(vcat(spec_enums.name, spec_bitmasks.name))) => var
    _ => :(from_vk($jtype, $var))
end

return_expr(params::AbstractVector{SpecFuncParam}) = length(params) == 1 ? return_expr(first(params)) : Expr(:tuple, return_expr.(params)...)

function is_query_param(param::SpecFuncParam)
    params = func_by_name(param.func).params
    query_param_index = findlast(x -> !x.is_constant && is_ptr(x.type), params)
    query_param_index == findfirst(==(param), params)
end

function return_expr(param::SpecFuncParam)
    @match p = param begin
        if is_ptr(p.type) end => @match pt = ptr_type(p.type) begin
            if !isnothing(p.len) end => @match ex = return_expr(p.name, pt, innermost_type((nice_julian_type(p)))) begin
                ::Symbol => ex
                ::Expr => Expr(:., ex.args[1], Expr(:tuple, ex.args[2:end]...))
            end
            if pt ∈ spec_constants.name || is_query_param(p) && pt == innermost_type(nice_julian_type(p)) end => :($(p.name)[])
            if !p.is_constant end => return_expr(:($(p.name)[]), pt, innermost_type((nice_julian_type(p))))
        end
        _ => return_expr(p.name, p.type, nice_julian_type(p))
    end
end

function wrap(spec::SpecFunc)
    p = Dict(:category => :function, :name => nc_convert(SnakeCaseLower, remove_vk_prefix(spec.name)), :short => false)
    @match spec.type begin
        &QUERY || &OTHER || &CREATE => begin
            count_param_index = findfirst(x -> x.requirement == POINTER_REQUIRED && x.type == :(Ptr{UInt32}) && contains(lowercase(string(x.name)), "count"), spec.params)
            query_param_index = findlast(x -> !x.is_constant && is_ptr(x.type), spec.params)
            if !isnothing(count_param_index)
                count_param = spec.params[count_param_index]
                queried_params = getindex(spec.params, findall(x -> x.len == count_param.name && !x.is_constant, spec.params))

                first_call_args = map(@λ(begin
                        &count_param => count_param.name
                        GuardBy(in(queried_params)) => :C_NULL
                        x => vk_call(x)
                end), spec.params)

                i = 0
                second_call_args = map(@λ(begin
                        :C_NULL && Do(i += 1) => queried_params[i].name
                        x => x
                    end), first_call_args)

                p[:body] = quote
                    $(count_param.name) = Ref{UInt32}(0)
                    $(check_return_code(spec, first_call_args))
                    $((:($(param.name) = Vector{$(ptr_type(param.type))}(undef, $(count_param.name)[])) for param ∈ queried_params)...)
                    $(check_return_code(spec, second_call_args))
                    $(return_expr(queried_params))
                end

                param_args = filter(≠(count_param), spec.params)
                param_kwargs = filter(!in(queried_params), spec.params)
            elseif !isnothing(query_param_index)
                query_param = spec.params[query_param_index]
                call_args = map(@λ(begin
                        &query_param => query_param.name
                        x => vk_call(x)
                    end), spec.params)

                p[:body] = quote
                    $(query_param.name) = Ref{$(ptr_type(query_param.type))}()
                    $(check_return_code(spec, call_args))
                    $(return_expr(query_param))
                end

                param_args = filter(≠(query_param), spec.params)
                param_kwargs = spec.params
            else
                p[:short] = true
                p[:body] = :($(check_return_code(spec, map(vk_call, spec.params))))

                param_args = param_kwargs = spec.params
            end

            p[:args] = map(x -> :($(var_from_vk(x.name))::$(signature_type(nice_julian_type(x)))), filter(x -> !is_optional(x) && isempty(x.arglen), param_args))
            p[:kwargs] = map(x -> Expr(:kw, var_from_vk(x.name), default(x)), filter(x -> is_optional(x) && isempty(x.arglen), param_kwargs))
            reconstruct(p)
        end
        _ => nothing
    end
end

function VulkanWrapper()
    handles = wrap.(spec_handles)
    structs = wrap.(spec_structs)
    funcs = filter(!isnothing, wrap.(spec_funcs))
    misc = []
    VulkanWrapper(handles, structs, funcs, misc)
end

is_optional(member::SpecStructMember) = member.name == :pNext || member.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]
is_optional(param::SpecFuncParam) = param.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]
