module Vulkan

using DocStringExtensions
using VulkanCore
using VulkanCore.vk
using Base: cconvert, unsafe_convert, RefArray
using MLStyle

@template (FUNCTIONS, METHODS, MACROS) =
    """
    $(DOCSTRING)
    $(TYPEDSIGNATURES)
    """

@template TYPES =
    """
    $(DOCSTRING)
    $(TYPEDEF)
    $(TYPEDSIGNATURES)
    $(TYPEDFIELDS)
    $(SIGNATURES)
    """

# generated wrapper
include("../generated/vulkan_wrapper.jl")

include("utils.jl")
include("validation.jl")
include("device.jl")
include("print.jl")

for sym ∈ names(vk)
    if startswith(string(sym), "VK_")
        @eval export $sym
    end
end

export
        vk,

        # Wrapper
        VulkanStruct,
        ReturnedOnly,
        Handle,
        VulkanError,
        @check,
        to_vk,
        from_vk,

        # device
        physical_device_features,
        find_queue_index,
        includes_bits,

        # debugging
        default_debug_callback,

        # Pointer utilities
        function_pointer

end # module Vulkan
