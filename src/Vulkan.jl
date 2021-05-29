module Vulkan

using Reexport
using DocStringExtensions
@reexport using VulkanCore: vk
using .vk
using Base: RefArray
import Base: convert, cconvert, unsafe_convert, &, |, xor, isless, ==, typemax, in
using MLStyle

@reexport using ResultTypes: unwrap, unwrap_error, iserror
using ResultTypes: ResultTypes

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

include("CEnum/CEnum.jl")
using .CEnum

include("../generated/vulkan_wrapper.jl")
include("../generated/vulkan_docs.jl")
include("../generated/vulkan_wrapper_hl.jl")

include("utils.jl")
include("driver.jl")
include("validation.jl")
include("device.jl")
include("print.jl")

export
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
        find_queue_family,

        # Debugging
        default_debug_callback,

        # Pointer utilities
        function_pointer,
        pointer_length,

        # Bitmask manipulation utilities
        BitMask,
        @bitmask_flag,

        # Error handling
        VulkanError,
        @check,
        iserror

end # module Vulkan
