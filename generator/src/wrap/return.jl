wrap_return(ex, type, jtype, next_types = nothing) = @match t = type begin
    :VkResult => :(@check($ex))
    :Cstring => :(unsafe_string($ex))
    GuardBy(is_opaque_pointer) => ex

    # Call handle constructor.
    GuardBy(in(api.handles.name)) => :($(remove_vk_prefix(t))($ex))
    # Don't change enumeration variables since they won't be wrapped under a new name
    GuardBy(in(api.enums.name)) => ex
    # Vulkan and idiomatic Julia types are the same (up to aliases).
    if is_fn_ptr(type) || follow_constant(type, api.constants) == jtype || innermost_type(type) ∈ api.flags.name
    end => ex
    # Fall back to the from_vk function for conversion.
    _ => isnothing(next_types) ? :(from_vk($jtype, $ex)) : :(from_vk($jtype, $ex, $next_types))
end

_wrap_implicit_return(params::AbstractVector{SpecFuncParam}; with_func_ptr = false) =
    length(params) == 1 ? _wrap_implicit_return(first(params); with_func_ptr) :
    Expr(:tuple, _wrap_implicit_return.(params; with_func_ptr)...)


"""
Build a return expression from an implicit return parameter.
Implicit return parameters are pointers that are mutated by the API, rather than returned directly.
API functions with implicit return parameters return either nothing or a return code, which is
automatically checked and not returned by the wrapper.
Such implicit return parameters are `Ref`s or `Vector`s holding either a base type or a core struct Vk*.
They need to be converted by the wrapper to their wrapping type.
"""
function _wrap_implicit_return(return_param::SpecFuncParam, next_types = nothing; with_func_ptr = false)
    p = return_param
    @assert is_ptr(p.type) "Invalid core type for an implicit return. Expected $(p.type) <: Ptr"
    pt = follow_alias(ptr_type(p.type), api.aliases)
    ex = @match p begin

        # array pointer
        GuardBy(is_arr) => @match ex = wrap_return(p.name, pt, innermost_type((idiomatic_julia_type(p))), next_types) begin
            ::Symbol => ex
            ::Expr => broadcast_ex(ex) # broadcast result
        end

        # pointer to a unique object
        GuardBy(is_data_with_retrievable_size) => begin
            @assert !isnothing(p.len)
            size = len(p)
            @assert is_size(size)
            :($(size.name)[], $(p.name))
        end
        _ => wrap_return(:($(p.name)[]), pt, innermost_type((idiomatic_julia_type(p))), next_types) # call return_expr on the dereferenced pointer
    end

    @match p begin
        if pt ∈ api.handles.name
        end => wrap_implicit_handle_return(return_param.parent, api.handles[pt], ex, with_func_ptr)
        _ => ex
    end
end

function wrap_implicit_return(spec::SpecFunc, args...; kwargs...)
    ex = _wrap_implicit_return(args...; kwargs...)
    if spec.name == :vkCreateInstance || spec.name == :vkCreateDevice
        # Insert an expression for the automatic dispatch.
        ex = :(@fill_dispatch_table $ex)
    end
    must_return_success_code(spec) ? :(($ex, _return_code)) : ex
end

function wrap_implicit_handle_return(handle::SpecHandle, ex::Expr, parent_handle::SpecHandle, parent_ex, destroy::Bool, with_func_ptr)
    @match ex begin
        :($f($v[])) => :($f($v[], $(!destroy ? :identity : destructor(handle, with_func_ptr)), $parent_ex))
        :($f.($v)) => :($f.($v, $(!destroy ? :identity : destructor(handle, with_func_ptr)), $parent_ex))
    end
end

function wrap_implicit_handle_return(handle::SpecHandle, ex::Expr, destroy::Bool, with_func_ptr)
    @match ex begin
        :($f($v[])) => :($f($v[], $(!destroy ? :identity : destructor(handle, with_func_ptr))))
        :($f.($v)) => :($f.($v, $(!destroy ? :identity : destructor(handle, with_func_ptr))))
    end
end

function wrap_implicit_handle_return(spec::SpecFunc, handle::SpecHandle, ex::Expr, with_func_ptr)
    destroy = spec.type ≠ FTYPE_QUERY
    args = @match handle.parent begin
        ::Nothing => (handle, ex)
        name::Symbol && Do(parent = api.handles[name]) => @match spec.type begin
            &FTYPE_CREATE || &FTYPE_ALLOCATE => (handle, ex, parent, retrieve_parent_ex(parent, api.constructors[spec]))
            _ => (handle, ex, parent, retrieve_parent_ex(parent, spec)::Symbol)
        end
    end

    wrap_implicit_handle_return(args..., destroy, with_func_ptr)
end

function wrap_return_type(spec::SpecFunc, ret_type)
    if must_return_success_code(spec) && has_implicit_return_parameters(spec)
        ret_type = :(Tuple{$ret_type,$(enum_type(:VkResult))})
    end

    @match spec.return_type begin
        :VkResult => :(ResultTypes.Result{$ret_type,VulkanError})
        _ => ret_type
    end
end
