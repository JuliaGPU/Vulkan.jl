module Vulkan

import VulkanCore

using VulkanCore.vk
const libvulkan = VulkanCore.vk.libvulkan
using CEnum

include("ccall_twin.jl")
include("vk_utils.jl")

include(joinpath(dirname(@__DIR__), "generated", "wrapped_api.jl"))

include("print.jl")

export
       unsafe_pointer,
       unsafe_pointer_load

end # module Vulkan