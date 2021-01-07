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
