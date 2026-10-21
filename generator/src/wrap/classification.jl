is_optional(member::SpecStructMember) = member.name == :pNext || member.requirement ∈ [OPTIONAL, POINTER_OPTIONAL] || is_inferable_length(member)
is_optional(param::SpecFuncParam) = param.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]

expose_as_kwarg(x::SpecFuncParam) = state[][:functions][follow_alias(x.parent.name, api.aliases)][x.name][:exposed_as_parameter]
expose_as_kwarg(x::SpecStructMember) = state[][:structs][follow_alias(x.parent.name, api.aliases)][x.name][:exposed_as_parameter]

"""
Represent an integer that gives the start of a C pointer.
"""
function is_pointer_start(spec::Union{SpecStructMember, SpecFuncParam})
    any(spec.parent) do param
        !isempty(param.arglen) &&
            spec.type == :UInt32 &&
            string(spec.name) == string("first", uppercasefirst(replace(string(param.name), r"Count$" => "")))
    end
end

"""
    counts_a_fixed_array(x::SpecStructMember)

Whether `x` is a length member counting a FIXED-SIZE array, so that dropping it
loses the count for good.

`is_inferable_length` means "recoverable from the other members", and for a
pointer array it is: that becomes a `Vector` and `length` gives the count back,
which is why the high-level struct drops such members. A fixed-size array carries
no such information. `memoryTypes` is an `NTuple{32}` whatever `memoryTypeCount`
says, so a high-level `PhysicalDeviceMemoryProperties` without the count reports
32 memory types on a device that has 11, the other 21 zeroed and
indistinguishable from real ones -- and no way left to ask.

Four members in the specification, all of them in returned-only query structs
where the count is the entire answer: both counts of
`VkPhysicalDeviceMemoryProperties`, `VkPhysicalDeviceGroupProperties`'s
`physicalDeviceCount` and `VkQueueFamilyGlobalPriorityProperties`'s
`priorityCount`.
"""
function counts_a_fixed_array(x::SpecStructMember)
    is_length(x) || return false
    members = children(x.parent)
    any(x.arglen) do arrayname
        i = findfirst(==(arrayname), members.name)
        isnothing(i) && return false
        t = members[i].type
        t isa Expr && t.head === :curly && t.args[1] === :NTuple
    end
end
counts_a_fixed_array(::Spec) = false

is_semantic_ptr(type) = is_ptr(type) || type == :Cstring
needs_deps(spec::SpecStruct) = any(is_semantic_ptr, spec.members.type)
"Whether it makes sense to return a success code (i.e. when there are possible errors or non-`SUCCESS` success codes)."
must_return_status_code(spec::SpecFunc) = must_return_success_code(spec) || !isempty(error_codes(spec))
"Whether the success code must be returned because it is informative (e.g. notifying of timeouts)."
must_return_success_code(spec::SpecFunc) = length(spec.success_codes) - in(:VK_INCOMPLETE, spec.success_codes) > 1
success_codes(spec::SpecFunc) = !must_return_status_code(spec) ? Symbol[] : filter(≠(:VK_INCOMPLETE), spec.success_codes)
error_codes(spec::SpecFunc) = spec.error_codes
must_repeat_while_incomplete(spec::SpecFunc) = !must_return_success_code(spec) && :VK_INCOMPLETE ∈ spec.success_codes
is_data_with_retrievable_size(spec::SpecFuncParam) = is_data(spec) && len(spec).requirement == POINTER_REQUIRED
is_opaque_data(spec) = is_data(spec) && len(spec).requirement ≠ POINTER_REQUIRED
is_opaque_pointer(type) = is_ptr(type) && is_void(ptr_type(type))
is_opaque_pointer(spec::Spec) = is_opaque_pointer(spec.type)
is_void(t) = t == :Cvoid || t in [
    :xcb_connection_t,
    :_XDisplay,
    :Display,
    :wl_surface,
    :wl_display,
    :CAMetalLayer,
]
is_opaque(spec) = is_opaque_data(spec) || is_opaque_pointer(spec)
is_implicit_return(spec::SpecFuncParam) =
    !is_opaque_data(spec) &&
    !spec.is_constant &&
    is_ptr(spec.type) &&
    !is_length(spec) &&
    spec.type ∉ extension_types &&
    ptr_type(spec.type) ∉ extension_types
has_implicit_return_parameters(spec::SpecFunc) = any(is_implicit_return, children(spec))
is_flag(type) = type in api.flags.name
is_flag(spec::Union{SpecFuncParam,SpecStructMember}) = spec.type in api.flags.name
is_flag_bitmask(type) = type ∈ getproperty.(filter(!isnothing, api.flags.bitmask), :name)
is_fn_ptr(type) = startswith(string(type), "PFN_")
is_fn_ptr(spec::Spec) = is_fn_ptr(spec.type)

function is_hl(type)
    vktype = Symbol(:Vk, type)
    vktype in [api.structs.name; api.unions.name]
end

is_intermediate(type) = startswith(string(type), '_')

has_intermediate_type(::SpecHandle) = false
has_intermediate_type(spec::Union{SpecStruct,SpecUnion}) = true
