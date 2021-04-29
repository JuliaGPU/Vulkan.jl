function retrieve_parent_ex(parent_handle::SpecHandle, func::SpecFunc)
    parent_handle_var = findfirst(==(parent_handle.name), func.params.type)
    @match n = func.name begin
        if !isnothing(parent_handle_var)
        end => wrap_identifier(func.params[parent_handle_var])
        _ => nothing
    end
end

function retrieve_parent_ex(parent_handle::SpecHandle, create::CreateFunc)
    throw_error() = error("Could not retrieve parent ($(parent_handle.name)) variable from the arguments of $create")
    @match retrieve_parent_ex(parent_handle, create.func) begin
        sym::Symbol => sym
        ::Nothing && if !isnothing(create.create_info_param)
        end => begin
            p = create.create_info_param
            s = create.create_info_struct
            m_index = findfirst(in([parent_handle.name, :(Ptr{$(parent_handle.name)})]), s.members.type)
            if !isnothing(m_index)
                m = s.members[m_index]
                var_p, var_m = wrap_identifier.((p, m))
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

assign_parent(::Symbol) = nothing
assign_parent(parent_ex::Expr) = :($(assigned_parent_symbol(parent_ex)) = $parent_ex)

function parent_handles(spec::SpecStruct)
    filter(x -> x.type ∈ spec_handles.name, children(spec))
end

"""
These handle types are consumed by whatever command uses them. From the specification: "The following object types are consumed when they are passed into a Vulkan command and not further accessed by the objects they are used to create.".
"""
const consumed_handles = handle_by_name.([:VkShaderModule, :VkPipelineCache, :VkValidationCacheEXT])

is_consumed(spec::SpecHandle) = spec ∈ consumed_handles
is_consumed(name::Symbol) = is_consumed(handle_by_name(name))
is_consumed(spec::Union{SpecFuncParam,SpecStructMember}) = is_consumed(spec.type)
