module Vulkan

using DocStringExtensions
using VulkanCore
using VulkanCore.vk
using Base: RefArray
import Base: convert, cconvert, unsafe_convert, &, |, xor
using MLStyle

using Reexport
@reexport using ResultTypes
using ResultTypes: iserror

Base.broadcastable(r::Result) = Ref(r)

const core = VulkanCore

@static if VERSION < v"1.6.0-DEV"
    macro load_preference(name, default)
        esc(default)
    end
else
    using Preferences: @load_preference
end

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
include("prewrap.jl")
include("../generated/vulkan_wrapper.jl")
include("../generated/vulkan_docs.jl")

include("utils.jl")
include("bitmasks.jl")
include("validation.jl")
include("device.jl")
include("print.jl")

for sym ∈ names(vk)
    if startswith(string(sym), "VK_") && !contains(string(sym), "FlagBits")
        @eval export $sym
    end
end

export
        vk,

        # Wrapper
        VulkanStruct,
        ReturnedOnly,
        Handle,
        to_vk,
        from_vk,

        # Printing
        print_app_info,
        print_available_devices,
        print_device_info,
        print_devices,

        # Device
        physical_device_features,
        find_queue_index,

        # Debugging
        default_debug_callback,

        # Pointer utilities
        function_pointer,
        pointer_length,

        # Bitmask manipulation utilities
        includes_bits,
        optional_bitwise_op,
        optional_bitwise_or,
        optional_bitwise_and,
        optional_bitwise_xor,
        BitMask,
        @bitmask_flag,

        # Error handling
        VulkanError,
        @check,
        iserror

end # module Vulkan
