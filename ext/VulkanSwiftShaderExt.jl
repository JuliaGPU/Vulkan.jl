module VulkanSwiftShaderExt

using Vulkan, SwiftShader_jll

function __init__()
    SwiftShader_jll.is_available() || return nothing
    Vulkan.register_icd!(joinpath(dirname(SwiftShader_jll.libvk_swiftshader_path), "vk_swiftshader_icd.json"))
end

end
