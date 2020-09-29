"""
Produce a temporary name that will not conflict with its Julian or Vulkan version.
"""
function tmp_argname(name, type)
    "_" * name
end

function wrap!(w_api, sdef::SDefinition)
    new_sdef = structure(sdef)
    has_bag(sdef.name) && setindex!(w_api.bags, create_bag(sdef), bagtype(sdef.name))
    wrap_structure!(w_api, new_sdef)
    wrap_constructor!(w_api, new_sdef, sdef)
end

function wrap_structure!(w_api, new_sdef)
    if new_sdef.name ∉ keys(w_api.structs)
        w_api.structs[new_sdef.name] = new_sdef # add to wrapped structs
    else
        @warn "Wrapped type $(new_sdef.name) but was already processed"
    end
end

optional_create_info_types = Dict(
    "VkImage" => "VkImageCreateInfo"
)

function structure(sdef)
    sname = sdef.name
    new_fields = OrderedDict()
    if is_handle(sname)
        new_fields["handle"] = sname
        abstract_type = "Handle"
    elseif dfmatch(vulkan_structs, :name, sname).returnedonly
        abstract_type = "ReturnedOnly"
        for (name, type) ∈ sdef.fields
            drop_field(name, type, sname) && continue
            new_name, new_type = field_transform(name, type, sname)
            new_fields[new_name] = new_type
        end
    else
        abstract_type = "VulkanStruct"
        new_fields["vks"] = sname
        has_bag(sname) && setindex!(new_fields, bagtype(sname), "bag")
    end
    new_name = name_transform(sdef)
    SDefinition(new_name, is_handle(sdef.name), new_fields, abstract_type, nothing)
end

# parameters to keep in a constructor rather than in a struct
# const parameters_dict = Dict(
#     "pNext" => KeywordArgument("next", "C_NULL"),
#     "flags" => KeywordArgument("flags", "0"),
#     "pAllocator" => KeywordArgument("pAllocator", "C_NULL"),
# )

drop_field(name, type, sname) = name == "sType" || is_count_variable(name, sname)
keeps_original_layout(sdef) = !has_bag(sdef.name) && "sType" ∉ keys(sdef.fields)

instance_name(sdef) = convert(SnakeCaseLower, sdef.name)

function create_bag(sdef)
    sname = sdef.name
    fields = OrderedDict()
    for (name, type) ∈ sdef.fields
        new_name, new_type = field_transform(name, type, sname)
        tmp_name = tmp_argname(name, type)
        if is_ptr(type)
            eltype = inner_type(type)
            has_bag(eltype) && setindex!(fields, "", "bag_" * new_name)
            name == "pNext" && setindex!(fields, "", "bag_next")
            eltype == "Cstring" && setindex!(fields, "", new_name * "_ptrarray")
        end
        if is_ptr(type) || type == "Cstring"
            field_name = (type ≠ "Cstring" && is_vulkan_struct(inner_type(type))) || name == "pNext" ? new_name * "_ref" : new_name
            fields[field_name] = ""
        end
    end
    SDefinition(bagtype(sname), false, fields, "Bag", nothing)
end

"Convert a Ptr{T} to a fetch_known_type(T)."
function convert_nested_type(type)
    eltype = inner_type(type)
    is_ptr(type) && is_vulkan_type(eltype) && return fieldtype_transform("", eltype)
    is_ptr(type) && return "Ptr{$(fieldtype_transform("", eltype))}"
    is_ntuple(type) && return replace(type, eltype => fieldtype_transform("", eltype))
    error("Nested type $type is neither a pointer nor an array (pointer to pointer) type")
end

function type_dependencies(sdef::SDefinition)
    type_deps = filter(x -> x ≠ sdef.name, map((x, y) -> isempty(x) ? [y] : x, type_dependencies.(values(sdef.fields)), values(sdef.fields)))
    isempty(type_deps) ? String[] : unique(vcat(type_deps...))
end

function field_transform(name, type, sname)
    new_type = fieldtype_transform(name, type, sname)
    fieldname_transform(name, type) => new_type isa Converted ? new_type.final_type : new_type
end

convention_exceptions = Dict(
    "textureCompressionASTC_LDR" => "texture_compression_astc_ldr",
    "textureCompressionASTC_HDR" => "texture_compression_astc_hdr",
    "formatA4R4G4B4" => "format_a4r4g4b4",
    "formatA4B4G4R4" => "format_a4b4g4r4",
)

function fieldname_transform(name, type)
    name ∈ keys(convention_exceptions) && return convention_exceptions[name]
    startswith(name, "pfn") && return convert(SnakeCaseLower, CamelCaseUpper(name[4:end])).value
    if !isnothing(match(r"^\s*p+[A-Z]", name))
        cc = CamelCaseUpper(lstrip(name, 'p'))
    else
        cc = detect_convention(name, instance=true)
    end
    convert(VulkanGen.julia_convention[:variable], cc).value
end

function fieldtype_transform(name, type, sname = nothing)
    (isnothing(type) || type == "Any") && return "Any"
    startswith(type, "PFN_") && return "Function"
    occursin("version", lowercase(name)) && type == "UInt32" && return Converted(type, "VersionNumber")
    is_ntuple(type) && inner_type(type) == "UInt8" && return Converted(type, "String")
    @return_value_if_key_exists type_conversions type
    !isnothing(sname) && !isempty(name) && is_array_variable(name, sname) && return "Array{$(fieldtype_transform("", inner_type(type), sname))}"
    is_vulkan_type(type) && return remove_vk_prefix(type)
    is_ptr(type) && return convert_nested_type(type)
    type
end

name_transform(str, ::Type{SDefinition}) = str[3:end]