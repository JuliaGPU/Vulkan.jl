default(::SpecHandle) = :C_NULL
function default(spec::Union{SpecStructMember,SpecFuncParam})
    is_length_exception(spec) && return default_length_exception(spec)
    @match spec.requirement begin
        if spec.type ∈ spec_handles.name
        end => default(handle_by_name(spec.type))
        &POINTER_OPTIONAL || &POINTER_REQUIRED || if is_ptr(spec.type) || spec.type == :Cstring
        end => :C_NULL
        &OPTIONAL || &REQUIRED => 0
    end
end

function default_length_exception(spec::Spec)
    @match parent(spec) begin
        :VkWriteDescriptorSet => :(max($((:(pointer_length($(wrap_identifier(arg)))) for arg in arglen(spec))...)))
    end
end
