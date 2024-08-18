"""
$(README)
Depends on:
$(IMPORTS)
"""
module Vulkan

using Reexport
using DocStringExtensions
using StructEquality: @struct_hash_equal
using Accessors: @set, setproperties
using PrecompileTools
using Libdl: Libdl
using BitMasks

using VulkanCore: VulkanCore, vk
using .vk
const Vk = Vulkan
const VkCore = vk
export VkCore, Vk

using Base: RefArray
import Base: convert, unsafe_convert, &, |, xor, isless, ==, typemax, in, parent
using MLStyle

const Optional{T} = Union{T, Nothing}

@reexport using ResultTypes: unwrap, unwrap_error, iserror
using ResultTypes: ResultTypes

@template FUNCTIONS =
    """
    $(DOCSTRING)
    $(METHODLIST)
    """

@template (METHODS, MACROS) =
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
include("debug.jl")
include("driver.jl")
include("validation.jl")
include("instance.jl")
include("device.jl")
include("dispatch.jl")
include("formats.jl")
include("show.jl")

const global_dispatcher = Ref{APIDispatcher}()

include("precompile_workload.jl")
include("precompile.jl")

function __init__()
    global_dispatcher[] = APIDispatcher()
    fill_dispatch_table()
end

# Extensions.
# Turn these into extensions when precompilation issues raised in
# in https://github.com/JuliaLang/julia/issues/52511 are addressed.
include("../ext/VulkanFixedPointNumbersExt.jl")
include("../ext/VulkanColorTypesExt.jl")
include("../ext/VulkanFixedPointNumbersColorTypesExt.jl")
include("../ext/VulkanStaticArraysCoreExt.jl")
include("../ext/VulkanFixedPointNumbersStaticArraysCoreExt.jl")

export
        # Wrapper
        VulkanStruct,
        ReturnedOnly,
        Handle,
        to_vk,
        from_vk,
        structure_type,
        SpecExtensionSPIRV, SpecCapabilitySPIRV,
        PropertyCondition, FeatureCondition,

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
        set_debug_name,

        # Pointer utilities
        function_pointer,
        pointer_length,
        chain, unchain,

        # Bitmask manipulation utilities
        BitMask,
        @bitmask_flag,

        # Error handling
        VulkanError,
        @check,
        iserror,

        # Formats
        format_type

end # module Vulkan
