default(::SpecHandle) = :C_NULL
function default(spec::Union{SpecStructMember,SpecFuncParam})
    is_length_exception(spec) && return default_length_exception(spec)
    @match spec.requirement begin
        if spec.type ∈ api.handles.name
        end => default(api.handles[spec.type])
        &POINTER_OPTIONAL || &POINTER_REQUIRED || if is_ptr(spec.type) || spec.type == :Cstring
        end => :C_NULL
        &OPTIONAL || &REQUIRED => 0
    end
end

function default_length_exception(spec::Spec)
    @match spec.parent.name begin
        :VkWriteDescriptorSet => :(max($((:(pointer_length($(wrap_identifier(arg)))) for arg in arglen(spec))...)))
    end
end
