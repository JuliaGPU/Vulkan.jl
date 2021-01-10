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
        needs_deps(spec) && push!(p[:fields], :(deps::Vector{Any}))
    end

    reconstruct(p)
end

function vk_call(x::Spec)
    var = var_from_vk(x.name)
    jtype = nice_julian_type(x)
    @match x begin
        ::SpecStructMember && if x.type == :VkStructureType && parent(x) ∈ keys(stypes) end => stypes[parent(x)]
        ::SpecStructMember && if is_semantic_ptr(x.type) end => :(unsafe_convert($(x.type), $var))
        GuardBy(is_count_variable) => :(length($(var_from_vk(first(x.arglen))))) # Julia works with arrays, not pointers, so the length information can directly be retrieved from them
        GuardBy(is_pointer_start) => 0 # always set first* variables to 0, and the user should provide a (sub)array of the desired length
        if x.type ∈ spec_handles.name end => var # handled by unsafe_convert in ccall

        # constant pointer to a unique object
        if is_ptr(x.type) && isnothing(x.len) && (x.is_constant || (func = func_by_name(x.func); func.type == QUERY && x ≠ last(children(func)))) end => @match x begin
            if ptr_type(x.type) ∈ spec_structs.name end => var # handled by cconvert and unsafe_convert in ccall
            if x.requirement == OPTIONAL end => :($var == $(default(x)) ? $(default(x)) : Ref($var)) # allow optional pointers to be passed as C_NULL instead of a pointer to a 0-valued integer
            _ => :(Ref($var))
        end
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
    GuardBy(in(spec_handles.name)) => :($(remove_vk_prefix(t))($ex)) # call handle constructor
    GuardBy(in(vcat(spec_enums.name, spec_bitmasks.name))) => ex # don't change enumeration variables since they won't be wrapped under a new name
    if is_fn_ptr(type) || follow_constant(type) == jtype end => ex # Vulkan and Julian types are the same (up to aliases)
    _ => :(from_vk($jtype, $ex)) # fall back to the from_vk function for conversion
end

wrap_implicit_return(params::AbstractVector{SpecFuncParam}) = length(params) == 1 ? wrap_implicit_return(first(params)) : Expr(:tuple, wrap_implicit_return.(params)...)

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
function wrap_implicit_return(return_param::SpecFuncParam)
    p = return_param
    @assert is_ptr(p.type) "Invalid implicit return parameter API type. Expected $(p.type) <: Ptr"
    @match pt = ptr_type(p.type) begin

        # array pointer
        if !isnothing(p.len) end => @match ex = wrap_return(p.name, pt, innermost_type((nice_julian_type(p)))) begin
            ::Symbol => ex
            ::Expr => Expr(:., ex.args[1], Expr(:tuple, ex.args[2:end]...)) # broadcast result
        end

        # pointer to a unique object
        _ => wrap_return(:($(p.name)[]), pt, innermost_type((nice_julian_type(p)))) # call return_expr on the dereferenced pointer
    end
end

wrap_api_call(spec::SpecFunc, args) = wrap_return(:($(spec.name)($(args...))), spec.return_type, nice_julian_type(spec.return_type))

init_wrapper_func(spec::SpecFunc) = Dict(:category => :function, :name => nc_convert(SnakeCaseLower, remove_vk_prefix(spec.name)), :short => false)
init_wrapper_func(spec::Spec) = Dict(:category => :function, :name => remove_vk_prefix(spec.name), :short => false)

function add_func_args!(p::Dict, args, kwargs)
    p[:args] = map(x -> :($(var_from_vk(x.name))::$(signature_type(nice_julian_type(x)))), filter(x -> !is_optional(x) && isempty(x.arglen) && !is_pointer_start(x), args))
    p[:kwargs] = map(x -> Expr(:kw, var_from_vk(x.name), default(x)), filter(x -> is_optional(x) && isempty(x.arglen), kwargs))
end

function wrap(spec::SpecFunc)
    p = init_wrapper_func(spec)

    count_ptr_index = findfirst(x -> x.requirement == POINTER_REQUIRED && x.type == :(Ptr{UInt32}) && contains(lowercase(string(x.name)), "count"), children(spec))
    query_param_index = findlast(x -> !x.is_constant && is_ptr(x.type), children(spec))
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

        p[:body] = quote
            $(count_ptr.name) = Ref{UInt32}(0)
            $(wrap_api_call(spec, first_call_args))
            $((:($(param.name) = Vector{$(ptr_type(param.type))}(undef, $(count_ptr.name)[])) for param ∈ queried_params)...)
            $(wrap_api_call(spec, second_call_args))
            $(wrap_implicit_return(queried_params))
        end

        args = filter(≠(count_ptr), children(spec))
        kwargs = filter(!in(queried_params), children(spec))
    elseif !isnothing(query_param_index)
        query_param = children(spec)[query_param_index]
        call_args = map(@λ(begin
                &query_param => query_param.name
                x => vk_call(x)
            end), children(spec))

        p[:body] = quote
            $(query_param.name) = Ref{$(ptr_type(query_param.type))}()
            $(wrap_api_call(spec, call_args))
            $(wrap_implicit_return(query_param))
        end

        args = filter(≠(query_param), children(spec))
        kwargs = children(spec)
    else
        p[:short] = true
        p[:body] = :($(wrap_api_call(spec, map(vk_call, children(spec)))))

        args = kwargs = children(spec)
    end

    add_func_args!(p, args, kwargs)
    reconstruct(p)
end

# function add_constructor(spec::SpecHandle)
#     create_func::SpecCreateFunc = spec_by_field(spec_create_funcs, :handle, spec)
#     func = create_func.func
#     @unpack create_info_struct, create_info_param = create_func
#     p = init_wrapper_func(spec)
#     if create_func.batch
#         []
#     else
#         if isnothing(create_info_struct)
#             potential_args = children(func)
#             p[:body] = :nothing
#         else
#             potential_args = vcat(collect(children(func)), collect(create_info_struct.members))
#             p[:body] = :($(create_info_param.name) = $(remove_vk_prefix(create_info_struct.name))($(var_from_vk.(create_info_struct.members.name)...)))
#         end
#         potential_args = filter(x -> x.type ≠ :VkStructureType && x.type ≠ :(Ptr{$(spec.name)}) && x ≠ create_info_param, potential_args)
#         add_func_args!(p, potential_args, potential_args)
#         reconstruct(p)
#     end
# end

function preserve(var, member::SpecStructMember)
    spec = parent(member)
    if is_ptr(member.type)
        if !isnothing(member.len) # array pointer
            @match pt = ptr_type(member.type) begin
                GuardBy(in(spec_structs.name)) => :(push!($var.deps, $(var_from_vk(member.name))))
            end
        else # pointer to a unique object
            
        end
    end
end

function add_constructor(spec::SpecStruct)
    cconverted_members = getindex(spec.members, findall(is_semantic_ptr, spec.members.type))
    p = init_wrapper_func(spec)
    if needs_deps(spec)
        p[:body] = quote
            $((:($(var_from_vk(m.name)) = cconvert($(m.type), $(var_from_vk(m.name)))) for m ∈ cconverted_members)...)
            deps = [$((var_from_vk(m.name) for m ∈ cconverted_members)...)]
            vks = $(spec.name)($(map(vk_call, spec.members)...))
            $(p[:name])(vks, deps)
        end
    else
        p[:body] = :($(p[:name])($(spec.name)($(map(vk_call, spec.members)...))))
    end
    potential_args = filter(x -> x.type ≠ :VkStructureType, spec.members)
    add_func_args!(p, potential_args, potential_args)
    reconstruct(p)
    # :(function $(remove_vk_prefix(spec.name))()
    #     error("Not implemented")
    # end)
end

function extend_from_vk(spec::SpecStruct)
    :(function from_vk(::Type{$(remove_vk_prefix(spec.name))}, vks::$(spec.name)) 
        error("Not implemented")
    end)
end

function VulkanWrapper()
    handles = wrap.(spec_handles)
    structs = wrap.(spec_structs)
    handles_with_constructors = filter(in(spec_create_funcs.handle), spec_handles)
    returnedonly_structs = filter(x -> x.is_returnedonly, spec_structs)
    # funcs = vcat(wrap.(spec_funcs), reduce(vcat, add_constructor.(handles_with_constructors)))
    funcs = vcat(wrap.(spec_funcs), add_constructor.(filter(x -> !x.is_returnedonly, spec_structs)), extend_from_vk.(returnedonly_structs))
    misc = []
    VulkanWrapper(handles, structs, funcs, misc)
end

is_optional(member::SpecStructMember) = member.name == :pNext || member.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]
is_optional(param::SpecFuncParam) = param.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]
is_count_variable(spec::Spec) = spec.type == :UInt32 && !isempty(spec.arglen)

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
needs_deps(spec::SpecStruct) = any(is_semantic_ptr, spec.members.type)
