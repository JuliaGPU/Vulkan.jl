is_optional(member::SpecStructMember) = member.name == :pNext || member.requirement ∈ [OPTIONAL, POINTER_OPTIONAL] || is_default_count(member)
is_optional(param::SpecFuncParam) = param.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]

"""
Represent an integer that gives the start of a C pointer.
"""
function is_pointer_start(spec::Spec)
    params = children(parent_spec(spec))
    any(params) do param
        !isempty(param.arglen) &&
            spec.type == :UInt32 &&
            string(spec.name) == string("first", uppercasefirst(replace(string(param.name), r"Count$" => "")))
    end
end

is_semantic_ptr(type) = is_ptr(type) || type == :Cstring
needs_deps(spec::SpecStruct) = any(is_semantic_ptr, spec.members.type) && !spec.is_returnedonly
must_return_success_code(spec::SpecFunc) = length(spec.success_codes) > 1 && :VK_INCOMPLETE ∉ spec.success_codes
must_repeat_while_incomplete(spec::SpecFunc) = !must_return_success_code(spec) && :VK_INCOMPLETE ∈ spec.success_codes
is_data_with_retrievable_size(spec::SpecFuncParam) = is_data(spec) && len(spec).requirement == POINTER_REQUIRED
is_opaque_data(spec) = is_data(spec) && len(spec).requirement ≠ POINTER_REQUIRED
is_implicit_return(spec::SpecFuncParam) =
    !is_opaque_data(spec) &&
    !spec.is_constant &&
    is_ptr(spec.type) &&
    !is_length(spec) &&
    spec.type ∉ extension_types &&
    ptr_type(spec.type) ∉ extension_types
has_implicit_return_parameters(spec::SpecFunc) = any(is_implicit_return, children(spec))

function is_default_count(spec::Spec)
    is_length(spec) && @match parent(spec) begin
        # see `descriptorCount` at https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#VkWriteDescriptorSet
        :VkWriteDescriptorSet => true
        _ => false
    end
end

function default_count(spec::Spec)
    @match parent(spec) begin
        :VkWriteDescriptorSet => :(max($((:(pointer_length($(wrap_identifier(arg)))) for arg in arglen(spec))...)))
    end
end

function is_specific_count(spec::Spec)
    @match spec begin
        GuardBy(is_length) => @match parent(spec) begin
            :VkDescriptorSetLayoutBinding => true
            _ => false
        end
        _ => false
    end
end
