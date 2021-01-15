const code_object_to_vk_prefix = Dict(
    :struct => "Vk",
    :function => "vk",
    :constant => "VK",
)
const vulkan_convention_rev = Dict(v => k for (k, v) in vulkan_convention)

"""
Prefix used by Vulkan as part of its naming conventions.
"""
vk_prefix(::Type{T}) where {T <: NamingConvention} = code_object_to_vk_prefix[vulkan_convention_rev[T]]

"""Prefix a function with the Vulkan convention prefix vk, Vk or VK_ depending on the code object.
"""
function prefix_vk(name)
   convention = detect_convention(name)
   prefix(convention(name), vk_prefix(convention)).value
end

prefix_vk(name::T) where {T <: NamingConvention} = prefix(name, vk_prefix(typeof(name)))

remove_vk_prefix(name) = replace(name, r"^(?:vk|Vk|VK_)" => "")
remove_vk_prefix(name::Symbol) = Symbol(remove_vk_prefix(string(name)))

function remove_vk_prefix(ex::Expr)
    postwalk(ex) do ex
        ex isa Symbol ? Symbol(remove_vk_prefix(string(ex))) : ex
    end
end

const convention_exceptions = Dict(
    :textureCompressionASTC_LDR => :texture_compression_astc_ldr,
    :textureCompressionASTC_HDR => :texture_compression_astc_hdr,
    :formatA4R4G4B4 => :format_a4r4g4b4,
    :formatA4B4G4R4 => :format_a4b4g4r4,
)

function var_from_vk(name)
    name ∈ keys(convention_exceptions) && return convention_exceptions[name]
    var_str = @match s = string(name) begin
        GuardBy(startswith(r"p+[A-Z]")) => remove_prefix(convert(SnakeCaseLower, CamelCaseLower(s))).value
        _ => nc_convert(SnakeCaseLower, s)
    end
    Symbol(var_str)
end
