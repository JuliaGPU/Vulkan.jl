struct VulkanWrapper
    handles::Vector{Expr}
    structs::Vector{Expr}
    funcs::Vector{Expr}
    enums::Vector{Expr}
    docs::Vector{Expr}
end

Base.show(io::IO, vw::VulkanWrapper) = print(io, "VulkanWrapper with $(length(vw.handles)) handles, $(length(vw.structs)) structs and $(length(vw.funcs)) functions.")

function wrap(spec::SpecHandle)
    Dict(
        :category => :struct,
        :decl => :($(remove_vk_prefix(spec.name)) <: Handle),
        :is_mutable => true,
        :fields => [
            :(vks::$(spec.name)),
            :(refcount::RefCounter),
            :destructor,
        ],
        :constructors => [
            :($(remove_vk_prefix(spec.name))(vks::$(spec.name), refcount::RefCounter) = new(vks, refcount, undef)),
        ],
    )
end

function wrap(spec::SpecStruct)
    p = Dict(
        :category => :struct,
        :decl => :($(remove_vk_prefix(spec.name)) <: $(spec.is_returnedonly ? :ReturnedOnly : :(VulkanStruct{$(needs_deps(spec))})))
    )
    if spec.is_returnedonly
        p[:fields] = map(x -> :($(nc_convert(SnakeCaseLower, x.name))::$(nice_julian_type(x))), spec.members)
    else
        p[:fields] = [
            :(vks::$(spec.name)),
        ]
        needs_deps(spec) && push!(p[:fields], :(deps::Vector{Any}))
    end

    p
end

function from_vk_call(x::Spec)
    prop = :(x.$(x.name))
    jtype = nice_julian_type(x)
    @match x begin

        # array pointer
        GuardBy(is_arr) => @match jtype begin
            :(Vector{$_}) => :(unsafe_wrap($jtype, $prop, x.$(x.len); own=true))
        end

        GuardBy(is_length) => nothing
        _ => @match t = x.type begin
            :Cstring => :(unsafe_string($prop))
            GuardBy(in(spec_flags.name)) => prop
            GuardBy(in(spec_handles.name)) => :($(remove_vk_prefix(x.type))($prop))
            GuardBy(is_ntuple) && if ntuple_type(x.type) ∈ filter(x -> x.is_returnedonly, spec_structs).name end => :(from_vk.($(remove_vk_prefix(ntuple_type(x.type))), $prop))
            if follow_constant(t) == jtype end => prop
            _ => :(from_vk($jtype, $prop))
        end
    end
end

function vk_call(x::Spec)
    var = wrap_identifier(x.name)
    jtype = nice_julian_type(x)
    @match x begin
        ::SpecStructMember && if x.type == :VkStructureType && parent(x) ∈ keys(structure_types) end => structure_types[parent(x)]
        ::SpecStructMember && if is_semantic_ptr(x.type) end => :(unsafe_convert($(x.type), $var))
        if is_fn_ptr(x.type) end => var
        GuardBy(is_size) && if x.requirement == POINTER_REQUIRED end => x.name # parameter converted to a Ref already
        GuardBy(is_opaque_data) => var
        GuardBy(is_length) => :(pointer_length($(wrap_identifier(first(x.arglen))))) # Julia works with arrays, not pointers, so the length information can directly be retrieved from them
        GuardBy(is_pointer_start) => 0 # always set first* variables to 0, and the user should provide a (sub)array of the desired length
        if x.type ∈ spec_handles.name end => var # handled by unsafe_convert in ccall

        # constant pointer to a unique object
        if is_ptr(x.type) && !is_arr(x) && (x.is_constant || (func = func_by_name(x.func); func.type == QUERY && x ≠ last(children(func)))) end => @match x begin
            if ptr_type(x.type) ∈ spec_structs.name end => var # handled by cconvert and unsafe_convert in ccall
            if x.requirement == OPTIONAL end => :($var == $(default(x)) ? $(default(x)) : Ref($var)) # allow optional pointers to be passed as C_NULL instead of a pointer to a 0-valued integer
            _ => :(Ref($var))
        end
        if x.type ∈ spec_flags.name end => var
        if x.type ∈ extension_types end => var
        _ => @match jtype begin
            :String || :Bool || :(Vector{$et}) || if jtype == follow_constant(x.type) end => var # conversions are already defined
            if jtype == remove_vk_prefix(x.type) && x.type ∈ spec_structs.name end => :($var.vks)
            _ => :(to_vk($(x.type), $var)) # fall back to the to_vk function for conversion
        end
    end
end

wrap_return(ex, type, jtype) = @match t = type begin
    :VkResult => :(@check($ex))
    :Cstring => :(unsafe_string($ex))
    GuardBy(is_opaque_pointer) => ex
    GuardBy(in(spec_handles.name)) => :($(remove_vk_prefix(t))($ex)) # call handle constructor
    GuardBy(in(vcat(spec_enums.name, spec_bitmasks.name))) => ex # don't change enumeration variables since they won't be wrapped under a new name
    if is_fn_ptr(type) || follow_constant(type) == jtype || innermost_type(type) ∈ spec_flags.name end => ex # Vulkan and Julian types are the same (up to aliases)
    _ => :(from_vk($jtype, $ex)) # fall back to the from_vk function for conversion
end

_wrap_implicit_return(params::AbstractVector{SpecFuncParam}; with_func_ptr=false) = length(params) == 1 ? _wrap_implicit_return(first(params); with_func_ptr) : Expr(:tuple, _wrap_implicit_return.(params; with_func_ptr)...)

function is_query_param(param::SpecFuncParam)
    params = func_by_name(param.func).params
    query_param_index = findlast(x -> !x.is_constant && is_ptr(x.type), params)
    query_param_index == findfirst(==(param), params)
end

"""
Build a return expression from an implicit return parameter.
Implicit return parameters are pointers that are mutated by the API, rather than returned directly.
API functions with implicit return parameters return either nothing or a return code, which is
automatically checked and not returned by the wrapper.
Such implicit return parameters are `Ref`s or `Vector`s holding either a base type or an API struct Vk*.
They need to be converted by the wrapper to their wrapping type.
"""
function _wrap_implicit_return(return_param::SpecFuncParam; with_func_ptr = false)
    p = return_param
    @assert is_ptr(p.type) "Invalid implicit return parameter API type. Expected $(p.type) <: Ptr"
    pt = follow_alias(ptr_type(p.type))
    ex = @match p begin

        # array pointer
        GuardBy(is_arr) => @match ex = wrap_return(p.name, pt, innermost_type((nice_julian_type(p)))) begin
            ::Symbol => ex
            ::Expr => broadcast_ex(ex) # broadcast result
        end

        # pointer to a unique object
        GuardBy(is_data_with_retrievable_size) => begin
            @assert has_length(p)
            size = len(p)
            @assert is_size(size)
            :($(size.name)[], $(p.name))
        end
        _ => wrap_return(:($(p.name)[]), pt, innermost_type((nice_julian_type(p)))) # call return_expr on the dereferenced pointer
    end

    @match p begin
        if pt ∈ spec_handles.name end => wrap_implicit_handle_return(parent_spec(return_param), handle_by_name(pt), ex, with_func_ptr)
        _ => ex
    end
end

function wrap_implicit_return(spec::SpecFunc, args...; kwargs...)
    ex = _wrap_implicit_return(args...; kwargs...)
    must_return_success_code(spec) ? :(($ex, _return_code)) : ex
end

function wrap_implicit_handle_return(handle::SpecHandle, ex::Expr, parent_handle::SpecHandle, parent_ex, with_func_ptr)
    @match ex begin
        :($f($v[])) => :($f($v[], $(destructor(handle; with_func_ptr)), $parent_ex))
        :($f.($v)) => :($f.($v, $(destructor(handle; with_func_ptr)), $parent_ex))
    end
end

function wrap_implicit_handle_return(handle::SpecHandle, ex::Expr, with_func_ptr)
    @match ex begin
        :($f($v[])) => :($f($v[], $(destructor(handle; with_func_ptr))))
        :($f.($v)) => :($f.($v, $(destructor(handle; with_func_ptr))))
    end
end

function wrap_implicit_handle_return(spec::SpecFunc, handle::SpecHandle, ex::Expr, with_func_ptr)
    args = @match parent_spec(handle) begin
        ::Nothing => (handle, ex)
        p::SpecHandle => @match spec.type begin
            &CREATE || &ALLOCATE => (handle, ex, p, retrieve_parent_ex(p, create_func(spec)))
            _ => (handle, ex, p, retrieve_parent_ex(p, spec)::Symbol)
        end
    end

    wrap_implicit_handle_return(args..., with_func_ptr)
end

function wrap_return_type(spec::SpecFunc, ret_type)
    if must_return_success_code(spec) && has_implicit_return_parameters(spec)
        ret_type = :(Tuple{$ret_type, VkResult})
    end

    @match spec.return_type begin
        :VkResult => :(Result{$ret_type,VulkanError})
        _ => ret_type
    end
end

"""
Function pointer arguments for a handle.
Includes one `fun_ptr_create` for the constructor (if applicable),
and one `fun_ptr_destroy` for the destructor (if applicable).
"""
function func_ptr_args(spec::SpecHandle)
    args = Expr[]
    spec ∈ spec_create_funcs.handle && push!(args, :(fun_ptr_create::FunctionPtr))
    destructor(spec) ≠ :identity && push!(args, :(fun_ptr_destroy::FunctionPtr))
    args
end

"""
Function pointer arguments for a function.
Takes the function pointers arguments of the underlying handle if it is a Vulkan constructor,
or a unique `fun_ptr` if that's just a normal Vulkan function.
"""
function func_ptr_args(spec::SpecFunc)
    if spec.type ∈ [CREATE, ALLOCATE]
        func_ptr_args(create_func(spec).handle)
    else
        [:(fun_ptr::FunctionPtr)]
    end
end

"""
Corresponding pointer argument for a Vulkan function.
"""
func_ptrs(spec::Spec) = name.(func_ptr_args(spec))

wrap_api_call(spec::SpecFunc, args; with_func_ptr = false) = wrap_return(:($(spec.name)($((with_func_ptr ? [args; first(func_ptrs(spec))] : args)...))), spec.return_type, nice_julian_type(spec.return_type))

init_wrapper_func(spec::SpecFunc) = Dict(:category => :function, :name => nc_convert(SnakeCaseLower, remove_vk_prefix(spec.name)), :short => false)
init_wrapper_func(spec::Spec) = Dict(:category => :function, :name => remove_vk_prefix(spec.name), :short => false)

arg_decl(x::Spec) = :($(wrap_identifier(x.name))::$(signature_type(nice_julian_type(x))))
kwarg_decl(x::Spec) = Expr(:kw, wrap_identifier(x.name), default(x))
drop_arg(x::Spec) = is_length(x) || is_pointer_start(x) || x.type == :(Ptr{Ptr{Cvoid}})

function add_func_args!(p::Dict, spec, params; with_func_ptr=false)
    params = filter(!drop_arg, params)
    arg_filter = if spec.type ∈ [DESTROY, FREE]
        destroyed_type = destroy_func(spec).handle.name
        x -> !is_optional(x) || x.type == destroyed_type
    else
        !is_optional
    end

    p[:args] = map(arg_decl, filter(arg_filter, params))
    p[:kwargs] = map(kwarg_decl, filter(!arg_filter, params))

    with_func_ptr && append!(p[:args], func_ptr_args(spec))
end

function wrap(spec::SpecFunc; with_func_ptr=false)
    p = init_wrapper_func(spec)

    count_ptr_index = findfirst(x -> (is_length(x) || is_size(x)) && x.requirement == POINTER_REQUIRED, children(spec))
    queried_params = getindex(children(spec), findall(is_implicit_return, children(spec)))
    if !isnothing(count_ptr_index)
        count_ptr = children(spec)[count_ptr_index]
        queried_params = getindex(children(spec), findall(x -> x.len == count_ptr.name && !x.is_constant, children(spec)))

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
            wrap_enumeration_api_call(spec,
                wrap_api_call(spec, first_call_args; with_func_ptr),
                (is_length(count_ptr) ? initialize_array : initialize_ptr).(queried_params, count_ptr)...,
                wrap_api_call(spec, second_call_args; with_func_ptr),
                ; free=filter(is_data, queried_params)
            )...,
            wrap_implicit_return(spec, queried_params; with_func_ptr),
        )

        args = filter(!in(vcat(queried_params, count_ptr)), children(spec))

        ret_type = @match length(queried_params) begin
            if any(is_data_with_retrievable_size, queried_params) end => Expr(:curly, :Tuple, nice_julian_type.([unique(len.(queried_params)); queried_params])...)
            1 => :(Vector{$(remove_vk_prefix(ptr_type(first(queried_params).type)))})
            _ => Expr(:curly, :Tuple, (:(Vector{$(remove_vk_prefix(ptr_type(param.type)))}) for param ∈ queried_params)...)
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
    p
end

chain_getproperty(ex, props) = foldl((x, y) -> :($x.$y), props; init=ex)

function retrieve_length(spec)
    chain = length_chain(spec, spec.len)
    @match length(chain) begin
        1 => vk_call(first(chain))
        GuardBy(>(1)) => chain_getproperty(:($(wrap_identifier(first(chain).name)).vks), getproperty.(chain[2:end], :name))
    end
end

function initialize_ptr(param::SpecFuncParam, count_ptr::SpecFuncParam)
    @assert is_data(param) && is_size(count_ptr)
    :($(param.name) = Libc.malloc($(count_ptr.name)[]))
end

function initialize_ptr(param::SpecFuncParam)
    rhs = @match param begin
        GuardBy(is_arr) => :(Vector{$(ptr_type(param.type))}(undef, $(retrieve_length(param))))
        _ => @match param.type begin
            :(Ptr{Cvoid}) => :(Ref{Ptr{Cvoid}}())
            _ => :(Ref{$(ptr_type(param.type))}())
        end
    end
    :($(param.name) = $rhs)
end

function initialize_array(param::SpecFuncParam, count_ptr::SpecFuncParam)
    :($(param.name) = Vector{$(ptr_type(param.type))}(undef, $(count_ptr.name)[]))
end

function wrap_enumeration_api_call(spec::SpecFunc, exs::Expr...; free=[])
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

function retrieve_parent_ex(parent_handle::SpecHandle, func::SpecFunc)
    parent_handle_var = findfirst(==(parent_handle.name), func.params.type)
    @match n = func.name begin
        if !isnothing(parent_handle_var) end => wrap_identifier(func.params[parent_handle_var].name)
        _ => nothing
    end
end

function retrieve_parent_ex(parent_handle::SpecHandle, create::CreateFunc)
    throw_error() = error("Could not retrieve parent ($(parent_handle.name)) variable from the arguments of $create")
    @match retrieve_parent_ex(parent_handle, create.func) begin
        sym::Symbol => sym
        ::Nothing && if !isnothing(create.create_info_param) end => begin
            p = create.create_info_param
            s = create.create_info_struct
            m_index = findfirst(in([parent_handle.name, :(Ptr{$(parent_handle.name)})]), s.members.type)
            if !isnothing(m_index)
                m = s.members[m_index]
                var_p, var_m = wrap_identifier.((p.name, m.name))
                broadcast_ex(:(getproperty($var_p, $(QuoteNode(var_m)))), is_arr(m))
            else
                throw_error()
            end
        end
        _ => throw_error()
    end
end

function assigned_parent_symbol(parent_ex)
    @match parent_ex begin
        ::Symbol => parent_ex
        ::Expr && GuardBy(is_broadcast) => :parents
        ::Expr => :parent
    end
end

assign_parent(parent_ex::Symbol) = nothing
assign_parent(parent_ex::Expr) = :($(assigned_parent_symbol(parent_ex)) = $parent_ex)

function destructor(handle::SpecHandle; with_func_ptr=false)
    destroy = destroy_func(handle)
    if !isnothing(destroy) && isnothing(destroy.destroyed_param.len)
        p = wrap(destroy.func)
        p_call = Dict(
            :name => p[:name],
            :args => Any[name.(p[:args])...],
            :kwargs => name.(p[:kwargs]),
        )
        with_func_ptr && push!(p_call[:args], :fun_ptr_destroy)
        p_call[:args][findfirst(==(remove_vk_prefix(handle.name)), type.(p[:args]))] = :x
        :(x -> $(reconstruct_call(p_call)))
    else
        :identity
    end
end

function add_constructors(spec::SpecHandle; with_func_ptr = false)
    map(wrappable_constructors(spec)) do create

        if isnothing(create.create_info_struct)
            # just pass the arguments as-is
            p_func = wrap(create.func; with_func_ptr)
            args, kwargs = p_func[:args], p_func[:kwargs]
            body = reconstruct_call(p_func; is_decl=false)
        else
            p_func_extended = extend_handle_constructor(create; with_func_ptr)
            body = :(unwrap($(reconstruct_call(p_func_extended; is_decl=false))))
            args, kwargs = p_func_extended[:args], p_func_extended[:kwargs]
        end

        Dict(
            :category => :function,
            :name => remove_vk_prefix(spec.name),
            :args => args,
            :kwargs => kwargs,
            :short => true,
            :body => body,
        )
    end
end

"""
Extend functions that create (or allocate) one or several handles,
by exposing the parameters of the associated CreateInfo structures.
`spec` must have one or several CreateInfo arguments.
"""
function extend_handle_constructor(spec::CreateFunc; with_func_ptr = false)
    p_func = wrap(spec.func)
    @assert !isnothing(spec.create_info_param) "Cannot extend handle constructor with no create info parameter."
    p_info = add_constructor(spec.create_info_struct)

    args = [p_func[:args]; p_info[:args]]
    kwargs = [p_func[:kwargs]; p_info[:kwargs]]

    info_expr = reconstruct_call(p_info; is_decl=false)
    info_index = findfirst(==(p_info[:name]), innermost_type.(type.(p_func[:args])))
    deleteat!(args, info_index)

    func_call_args = Vector{Any}(name.(p_func[:args]))
    func_call_args[info_index] = info_expr

    if with_func_ptr
        append!(args, func_ptr_args(spec.func))
        append!(func_call_args, name.(func_ptrs(spec.func)))
    end

    body = reconstruct_call(Dict(:name => p_func[:name], :args => func_call_args, :kwargs => name.(p_func[:kwargs])))

    Dict(
        :category => :function,
        :name => p_func[:name],
        :args => args,
        :kwargs => kwargs,
        :short => true,
        :body => body,
    )
end

function add_constructor(spec::SpecStruct)
    cconverted_members = getindex(spec.members, findall(is_semantic_ptr, spec.members.type))
    p = init_wrapper_func(spec)
    if needs_deps(spec)
        p[:body] = quote
            $((:($(wrap_identifier(m.name)) = cconvert($(m.type), $(wrap_identifier(m.name)))) for m ∈ cconverted_members)...)
            deps = [$((wrap_identifier(m.name) for m ∈ cconverted_members)...)]
            vks = $(spec.name)($(map(vk_call, spec.members)...))
            $(p[:name])(vks, deps)
        end
    else
        p[:body] = :($(p[:name])($(spec.name)($(map(vk_call, spec.members)...))))
    end
    potential_args = filter(x -> x.type ≠ :VkStructureType, spec.members)
    add_func_args!(p, spec, potential_args)
    p
end

function extend_from_vk(spec::SpecStruct)
    p = Dict(:category => :function, :name => :from_vk, :args => [:(T::Type{$(remove_vk_prefix(spec.name))}), :(x::$(spec.name))], :short => true)
    p[:body] = :(T($(filter(!isnothing, from_vk_call.(spec.members))...)))
    p
end

function to_expr(p::Dict)
    p[:category] == :function && relax_function_signature!(p)
    reconstruct(p)
end

function wrap(spec::SpecBitmask)
    name = bitmask_flag_type(spec.name)
    Dict(
        :category => :enum,
        :macro => Symbol("@bitmask_flag"),
        :values => map(x -> :($(remove_vk_prefix(x.name)) = $(2^(x.position))), spec.bits),
        :decl => :($name::UInt32),
    )
end

function VulkanWrapper()
    handles = to_expr.(wrap.(spec_handles))
    structs = to_expr.(wrap.(spec_structs))
    returnedonly_structs = filter(x -> x.is_returnedonly, spec_structs)
    api_structs = filter(!in(returnedonly_structs), spec_structs)
    funcs = to_expr.(vcat(
        wrap.(spec_funcs),
        add_constructor.(api_structs),
        extend_from_vk.(returnedonly_structs),
        add_constructors.(spec_handles_with_wrappable_constructors)...,
        extend_handle_constructor.(filter(x -> !isnothing(x.create_info_param), create_func.(spec_handles_with_wrappable_constructors))),
        wrap.(spec_funcs; with_func_ptr=true),
        add_constructors.(spec_handles_with_wrappable_constructors; with_func_ptr=true)...,
        extend_handle_constructor.(filter(x -> !isnothing(x.create_info_param), create_func.(spec_handles_with_wrappable_constructors)); with_func_ptr=true),
    ))

    enums = to_expr.(wrap.(spec_bitmasks))
    docs = vcat(document.(spec_funcs, wrap.(spec_funcs)), document.(api_structs, add_constructor.(api_structs)), document.(spec_handles_with_wrappable_constructors)...)
    VulkanWrapper(handles, structs, funcs, enums, docs)
end

is_optional(member::SpecStructMember) = member.name == :pNext || member.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]
is_optional(param::SpecFuncParam) = param.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]

"""
Represent an integer that gives the start of a C pointer.
"""
function is_pointer_start(spec::Spec)
    params = children(parent_spec(spec))
    any(params) do param
        !isempty(param.arglen) && spec.type == :UInt32 && string(spec.name) == string("first", uppercasefirst(replace(string(param.name), r"Count$" => "")))
    end
end

is_semantic_ptr(type) = is_ptr(type) || type == :Cstring
needs_deps(spec::SpecStruct) = any(is_semantic_ptr, spec.members.type) && !spec.is_returnedonly
must_return_success_code(spec::SpecFunc) = length(spec.success_codes) > 1 && :VK_INCOMPLETE ∉ spec.success_codes
must_repeat_while_incomplete(spec::SpecFunc) = !must_return_success_code(spec) && :VK_INCOMPLETE ∈ spec.success_codes
is_data_with_retrievable_size(spec::SpecFuncParam) = is_data(spec) && len(spec).requirement == POINTER_REQUIRED
is_opaque_data(spec) = is_data(spec) && len(spec).requirement ≠ POINTER_REQUIRED
is_implicit_return(spec::SpecFuncParam) = !is_opaque_data(spec) && !spec.is_constant && is_ptr(spec.type) && !is_length(spec) && spec.type ∉ extension_types && ptr_type(spec.type) ∉ extension_types
has_implicit_return_parameters(spec::SpecFunc) = any(is_implicit_return, children(spec))
