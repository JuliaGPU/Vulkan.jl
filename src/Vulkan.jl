"""
$(README)
Depends on:
$(IMPORTS)
"""
module Vulkan

using Reexport
using DocStringExtensions
using StructEquality: @struct_hash_equal
using Accessors: Accessors, @set, setproperties
# `setproperties` is ConstructionBase's, re-exported by Accessors. Reached
# through Accessors rather than added as a direct dependency: the blob-struct
# methods in prewrap/pointers.jl must extend it on its OWNING module, and
# Accessors already depends on it, so this needs no manifest change.
const ConstructionBase = Accessors.ConstructionBase
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

"""Whether this package compiled its bindings — see `VulkanCore.HAS_LOADER`.

OUTSIDE the gate below, so a dependent can ask without first checking whether
there is anything to ask.
"""
const HAS_LOADER = VulkanCore.HAS_LOADER

using Preferences: Preferences
include("driver.jl")

# ── Everything below is gated on a Vulkan loader existing ────────────────────
#
# 127,000 generated lines of wrappers, a dispatch table and an 8,573-name export
# list, none of which can do anything without a driver. Compiling them anyway
# cost 13 s of precompile on every Mac in this tree, for a package Mantle
# declares and — on Apple — never imports.
#
# The inner text is UNCHANGED and unindented on purpose: with a loader present
# this module is byte-for-byte the one it was, so the only thing this can break
# is the empty case.
#
# See `VulkanCore.HAS_LOADER` for why the answer is fixed at precompile time.
@static if VulkanCore.HAS_LOADER

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

# After the generated code: needs the high-level types to exist so the
# conversions it delegates to are resolvable.
include("opaque_struct_ctors.jl")
include("utils.jl")
include("debug.jl")
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
    # Only when there IS a loader. `fill_dispatch_table` asks
    # `vkGetInstanceProcAddr` for every core entry point, which dlopens
    # `libvulkan` — so on a machine without one this threw from `__init__`, and a
    # package that merely DEPENDS on Vulkan could not be precompiled, let alone
    # loaded. VulkanCore already answers the question rather than failing on it;
    # this is the same answer one level up.
    #
    # The table is then empty, and `function_pointer` says so by name. Nothing
    # else changes: with a loader present this is the call it always was.
    VkCore.loaded() || return nothing
    fill_dispatch_table()
end

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

end # @static if VulkanCore.HAS_LOADER

end # module Vulkan
