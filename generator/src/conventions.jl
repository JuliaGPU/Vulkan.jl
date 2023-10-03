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
