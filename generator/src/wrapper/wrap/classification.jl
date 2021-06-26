is_optional(member::SpecStructMember) = member.name == :pNext || member.requirement ∈ [OPTIONAL, POINTER_OPTIONAL] || is_inferable_length(member)
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
is_opaque_pointer(type) = is_ptr(type) && is_void(ptr_type(type))
is_opaque_pointer(spec::Spec) = is_opaque_pointer(spec.type)
is_opaque(spec) = is_opaque_data(spec) || is_opaque_pointer(spec)
is_implicit_return(spec::SpecFuncParam) =
    !is_opaque_data(spec) &&
    !spec.is_constant &&
    is_ptr(spec.type) &&
    !is_length(spec) &&
    spec.type ∉ extension_types &&
    ptr_type(spec.type) ∉ extension_types
has_implicit_return_parameters(spec::SpecFunc) = any(is_implicit_return, children(spec))
is_flag(type) = type in spec_flags.name
is_flag(spec::Union{SpecFuncParam,SpecStructMember}) = spec.type in spec_flags.name
is_flag_bitmask(type) = type ∈ getproperty.(filter(!isnothing, spec_flags.bitmask), :name)
is_fn_ptr(type) = startswith(string(type), "PFN_")
is_fn_ptr(spec::Spec) = is_fn_ptr(spec.type)

function is_hl(type)
    vktype = Symbol(:Vk, type)
    vktype in spec_structs.name && !struct_by_name(vktype).is_returnedonly
end
