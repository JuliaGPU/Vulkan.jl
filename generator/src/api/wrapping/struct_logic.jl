struct MemberDetails
    new_ex::Expr
    name::Symbol
    type
    parent::Symbol
    innermost_type::Symbol
    is_vulkan_struct::Bool
    is_optional::Bool
    is_array_variable::Bool
    is_count_variable::Bool
    associated_array_variables
    associated_count_variable
    default
    drop::Bool
    new_name::Symbol
    new_type
end

function MemberDetails(p::Dict, ex)
    n = name(ex)
    type = ex isa Symbol ? :Any : ex.args[2]
    sn = p[:name]
    new_name, new_type = field_transform(n, type, sn)
    MemberDetails(
        :($new_name::$new_type),
        n,
        type,
        sn,
        innermost_type(type),
        is_vulkan_struct(type),
        is_optional_parameter(n, sn),
        is_array_variable(n, sn),
        is_count_variable(n, sn),
        is_count_variable(n, sn) ? associated_array_variables(n, sn) : nothing,
        is_array_variable(n, sn) ? associated_count_variable(n, sn) : nothing,
        default(n, type),
        drop_field(n, sn),
        new_name,
        new_type,
    )
end

struct StructWrapDetails
    p::Dict
    name::Symbol
    new_name::Symbol
    is_handle::Bool
    is_returnedonly::Bool
    is_alias::Bool
    has_alias::Bool
    has_deps::Bool
    has_create::Bool
    has_create_info::Bool
    has_multiple_create_info::Bool
    has_destroy::Bool
    keeps_original_layout::Bool
    members::Vector{MemberDetails}
end

function StructWrapDetails(p::Dict)
    n = p[:name]
    members = MemberDetails.(Ref(p), p[:fields])

    StructWrapDetails(
        p,
        n,
        name_transform(n, :struct),
        is_handle(n),
        is_returnedonly(n),
        isalias(n),
        hasalias(n),
        has_deps(p),
        is_handle_with_create_info(n) || is_handle_with_multiple_create_info(n),
        is_handle_with_create_info(n),
        is_handle_with_multiple_create_info(n),
        is_handle_destructible(n),
        keeps_original_layout(p),
        members,
    )
end

function has_deps(p)
    sname = p[:name]
    :pNext ∈ name.(p[:fields]) || (!is_handle(sname) && is_vulkan_struct(sname) && any(map(x -> :Cstring ∈ symbols(x) || (is_ptr(x) && !is_extension_ptr(x)), p[:fields])))
end

"""
Produce a temporary name that will not conflict with its Julian or Vulkan version.
"""
tmp_argname(name, type) = Symbol("_", name)

optional_create_info_types = Dict(
    :VkImage => :VkImageCreateInfo
)

drop_field(name, sname) = name == :sType || is_count_variable(name, sname)
keeps_original_layout(p) = !has_deps(p) && :sType ∉ name.(p[:fields])

field_transform(name, type, sname) = (fieldname_transform(name, type), fieldtype_transform(name, type, sname))

const convention_exceptions = Dict(
    :textureCompressionASTC_LDR => :texture_compression_astc_ldr,
    :textureCompressionASTC_HDR => :texture_compression_astc_hdr,
    :formatA4R4G4B4 => :format_a4r4g4b4,
    :formatA4B4G4R4 => :format_a4b4g4r4,
)

function fieldname_transform(name, type)
    name ∈ keys(convention_exceptions) && return convention_exceptions[name]
    str = string(name)
    startswith(str, "pfn") && return Symbol(nc_convert(SnakeCaseLower, str[4:end]) )
    if !isnothing(match(r"^\s*p+[A-Z]", str))
        cc = CamelCaseUpper(lstrip(str, 'p'))
    else
        cc = detect_convention(str, instance=true)
    end
    Symbol(convert(VulkanGen.julia_convention[:variable], cc).value)
end

function fieldtype_transform(name, type, sname = nothing)
    @match type begin
        t && if is_fn_ptr(t) end => :Function
        :UInt32 && if !isnothing(name) && is_version(name) end => :VersionNumber
        :(NTuple{$a, UInt8}) => :String
        t && if haskey(type_conversions, t) end => type_conversions[t]
        t && if !isnothing(sname) && !isnothing(name) && is_array_variable(name, sname) end => :(Vector{$(fieldtype_transform(nothing, first(inner_type(t)), sname))})
        t && if is_vulkan_type(t) end => remove_vk_prefix(type)
        t && if is_ptr(t) end => @match (t, ptr_type(t)) begin
                                     (_t, et) && if is_vulkan_type(et) end => fieldtype_transform(nothing, et)
                                     (_t, et) => :(Ptr{$(fieldtype_transform(nothing, et))})
                                 end
        t => t
    end
end

name_transform(sym, category) = @match category begin
    :struct => remove_vk_prefix(sym)
    :function => nc_convert(SnakeCaseLower, remove_vk_prefix(sym))
end

function wrapped_structure(sd::StructWrapDetails)
    sname = sd.name
    pn = Dict(:category => :struct,
              :fields => Expr[],
              :is_mutable => false)

    if sd.is_returnedonly
        abstract_type = :ReturnedOnly
        append!(pn[:fields], getproperty.(filter(x -> !x.drop, sd.members), :new_ex))
    else
        abstract_type = :VulkanStruct
        push!(pn[:fields], :(vks::$sname))
        sd.has_deps && push!(pn[:fields], :(deps::Vector{Any}))
    end

    pn[:decl] = :($(sd.new_name) <: $abstract_type)

    reconstruct(pn)
end
