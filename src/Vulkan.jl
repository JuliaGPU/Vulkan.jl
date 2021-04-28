module Vulkan

using DocStringExtensions
using VulkanCore
using VulkanCore.vk
using Base: RefArray
import Base: convert, cconvert, unsafe_convert, &, |, xor, isless
using MLStyle

using Reexport
@reexport using ResultTypes
using ResultTypes: iserror

Base.broadcastable(r::Result) = Ref(r)

const core = vk

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

include("preferences.jl")

# generated wrapper
include("prewrap.jl")
include("../generated/vulkan_wrapper.jl")
include("../generated/vulkan_docs.jl")

include("utils.jl")
include("driver.jl")
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

        # Driver
        set_driver,
        @set_driver,

        # Printing
        print_app_info,
        print_available_devices,
        print_device_info,
        print_devices,

        # Device
        physical_device_features,
        find_queue_family,

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
