module Vulkan

import VulkanCore

using VulkanCore.vk
const libvulkan = VulkanCore.vk.libvulkan
using CEnum

include("vk_utils.jl")
include("ref_utils.jl")

include(joinpath(dirname(@__DIR__), "generated", "wrapped_api.jl"))

include("devices/physical.jl")
include("devices/logical.jl")

export REFERENCE_DICT,
       clear_refs,
       is_referenceable,
       preserve,
       preserved_ref

end # module Vulkan