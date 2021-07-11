"""
$(README)
Depends on:
$(IMPORTS)
"""
module Vulkan

using Reexport
using DocStringExtensions

using VulkanCore: vk
using .vk
const core = vk
export vk, core

using Base: RefArray
import Base: convert, cconvert, unsafe_convert, &, |, xor, isless, ==, typemax, in, parent
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
    $(TYPEDFIELDS)
    """

include("preferences.jl")

# generated wrapper
include("prewrap.jl")

include("CEnum/CEnum.jl")
using .CEnum

@static if Sys.islinux()
    include("../generated/linux.jl")
elseif Sys.isapple()
    include("../generated/macos.jl")
elseif Sys.isbsd()
    include("../generated/bsd.jl")
elseif Sys.iswindows()
    include("../generated/windows.jl")
end

include("utils.jl")
include("driver.jl")
include("validation.jl")
include("instance.jl")
include("device.jl")
include("dispatch.jl")
include("print.jl")

const global_dispatcher = APIDispatcher()

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
