struct DispatchTable
    pointers::Dict{Symbol,Ptr{Cvoid}}
end

DispatchTable() = DispatchTable(Dict())

function add_fptr!(dtable::DispatchTable, handle, f::Symbol)
    fptr = function_pointer(handle, string(f))
    dtable.pointers[f] = fptr
end

struct APIDispatcher
    loader_table::DispatchTable
    instance_tables::Dict{Instance,DispatchTable}
    device_tables::Dict{Device,DispatchTable}
end

APIDispatcher() = APIDispatcher(DispatchTable(), Dict(), Dict())

table(disp::APIDispatcher, ::Nothing) = disp.loader_table
function table(disp::APIDispatcher, x)
    h = handle(x)
    h isa Instance || h isa Device || error("Expected instance or device handle, got $h")
    table(disp, h)
end

function table(disp::APIDispatcher, instance::Instance)
    get!(DispatchTable, disp.instance_tables, instance)
end

function table(disp::APIDispatcher, device::Device)
    get!(DispatchTable, disp.device_tables, device)
end

"""
Query a function pointer for an API function.
"""
function function_pointer end

function function_pointer(disp::APIDispatcher, handle, key::Symbol; allow_null::Bool = false)::Ptr{Cvoid}
    t = table(disp, handle)
    # A missing key on a machine with no loader is not a missing extension, it is
    # no Vulkan at all — `__init__` left the table empty on purpose so that
    # depending on this package stays cheap. Say which of the two it is; the
    # check costs nothing on the path that finds its pointer.
    if !haskey(t.pointers, key) && !VkCore.loaded()
        error("no Vulkan loader: `$(VkCore.libvulkan)` was not found when Vulkan.jl " *
              "loaded, so no function pointers were resolved and '$key' cannot be " *
              "called. Depending on this package is fine without a driver; using " *
              "the API is not.")
    end
    fptr = t.pointers[key]
    if fptr == C_NULL && !allow_null
        error(
            "Could not retrieve function pointer for '$key'. This can be caused by an extension not being enabled for a function that needs it; see the help with `?` or the documentation for more information.",
        )
    end
    fptr
end

"""
`vkGetInstanceProcAddr`, found by `dlsym` rather than called by name.

Which symbol a Vulkan implementation exports is not the same everywhere. A
Khronos loader and MoltenVK export `vkGetInstanceProcAddr`. A bare Mesa ICD
exports only the three `vk_icd*` entry points -- lavapipe's version script
exports exactly `vk_icdGetInstanceProcAddr`, `vk_icdGetPhysicalDeviceProcAddr`
and `vk_icdNegotiateLoaderICDInterfaceVersion`, and nothing else, so a named
`ccall` to `vkGetInstanceProcAddr` cannot load its symbol at all. That is every
Mesa driver -- lavapipe, RADV, ANV -- used without a loader in between.

`vk_icdGetInstanceProcAddr` answers the same question, so take whichever the
library has. An ICD that is never told otherwise assumes loader interface
version 0, where the two behave identically, so there is nothing to negotiate.
"""
function instance_proc_addr()
    ptr = INSTANCE_PROC_ADDR[]
    ptr === C_NULL || return ptr
    handle = VkCore.LibVulkan.libvulkan_handle[]
    handle === C_NULL &&
        error("no Vulkan loader: `$(VkCore.libvulkan)` was not found when Vulkan.jl " *
              "loaded, so no function pointers can be resolved.")
    for name in (:vkGetInstanceProcAddr, :vk_icdGetInstanceProcAddr)
        ptr = Libdl.dlsym_e(handle, name)
        ptr === C_NULL || return INSTANCE_PROC_ADDR[] = ptr
    end
    error("`$(VkCore.libvulkan)` exports neither `vkGetInstanceProcAddr` nor " *
          "`vk_icdGetInstanceProcAddr`, so it is not a Vulkan implementation this " *
          "package can call.")
end

const INSTANCE_PROC_ADDR = Ref(C_NULL)

instance_proc_addr(instance, name::AbstractString) =
    ccall(instance_proc_addr(), Ptr{Cvoid}, (VkCore.VkInstance, Cstring), instance, name)

function_pointer(name::AbstractString) = instance_proc_addr(C_NULL, name)
function_pointer(::Nothing, name::AbstractString) = function_pointer(name)
function_pointer(instance::Instance, name::AbstractString) = instance_proc_addr(instance, name)
# `vkGetDeviceProcAddr` asked of the INSTANCE, not of the library by name.
#
# It is the one entry point the dispatch table has to bootstrap, and a driver on
# its own does not export it: SwiftShader, lavapipe and MoltenVK export
# `vkGetInstanceProcAddr` and `vk_icdGetInstanceProcAddr` and nothing else,
# because supplying the rest is the Khronos loader's job. Calling it by name
# therefore fails with `could not load symbol "vkGetDeviceProcAddr"` against any
# driver used WITHOUT a loader in between -- which is how MoltenVK is meant to be
# used on macOS, and how `JULIA_VULKAN_LIBNAME` pointed straight at an ICD
# behaves everywhere.
#
# `vkGetInstanceProcAddr` is the one function a Vulkan implementation must
# export, and the specification has it answer for device-level commands too. So
# ask it, once per instance, and call the pointer. With a loader present this is
# the same pointer by a different route, so nothing changes there.
function function_pointer(device::Device, name::AbstractString)
    instance = device.physical_device.instance
    fptr = function_pointer(global_dispatcher[], instance, :vkGetDeviceProcAddr)
    ccall(fptr, Ptr{Cvoid}, (VkCore.VkDevice, Cstring), device, name)
end
function_pointer(x, name::AbstractString) = function_pointer(handle(x), name)

dispatchable_functions(::Nothing) = CORE_FUNCTIONS
dispatchable_functions(::Instance) = INSTANCE_FUNCTIONS
dispatchable_functions(::Device) = DEVICE_FUNCTIONS

function fill_dispatch_table(handle = nothing)
    disp = global_dispatcher[]
    t = table(disp, handle)
    for f in dispatchable_functions(handle)
        add_fptr!(t, handle, f)
    end
    # `vkGetDeviceProcAddr` is a DEVICE-level command, so it cannot come out of
    # the device table it is needed to fill. It is kept on the instance, which is
    # both what `vkGetInstanceProcAddr` needs to answer for it and a lifetime
    # that already ends with the instance. See `function_pointer(::Device, ...)`.
    handle isa Instance && add_fptr!(t, handle, :vkGetDeviceProcAddr)
    nothing
end
