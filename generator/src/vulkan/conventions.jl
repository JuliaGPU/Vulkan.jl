const code_object_to_vk_prefix = Dict(
    :struct => "Vk",
    :function => "vk",
    :constant => "VK",
)
const vulkan_convention_rev = Dict(v => k for (k, v) in vulkan_convention)

vk_prefix(::Type{T}) where {T <: NamingConvention} = code_object_to_vk_prefix[vulkan_convention_rev[T]]

"""Prefix a function with the Vulkan convention prefix vk, Vk or VK_ depending on the code object.
"""
function prefix_vk(name)
   convention = detect_convention(name)
   prefix(convention(name), vk_prefix(convention)).value
end
prefix_vk(name::T) where {T <: NamingConvention} = prefix(name, vk_prefix(typeof(name)))

# remove_vk_prefix(name) = replace(name, Regex("^" * prefix_vk(name)) => "")
remove_vk_prefix(name) = replace(name, r"^(?:vk|Vk|VK_)" => "")