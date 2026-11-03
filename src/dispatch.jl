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
    if !haskey(t.pointers, key) && !VkCore.loaded()
        error("Vulkan loader '$(VkCore.libvulkan)' is unavailable; cannot resolve '$key'.")
    end
    fptr = t.pointers[key]
    if fptr == C_NULL && !allow_null
        error(
            "Could not retrieve function pointer for '$key'. This can be caused by an extension not being enabled for a function that needs it; see the help with `?` or the documentation for more information.",
        )
    end
    fptr
end

# Bare ICDs may export only vk_icdGetInstanceProcAddr.
function instance_proc_addr()
    ptr = INSTANCE_PROC_ADDR[]
    ptr === C_NULL || return ptr
    handle = VkCore.libvulkan_handle[]
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
# Resolve device lookup through its instance, which also works with bare ICDs.
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
    # Device table initialization needs this instance-level lookup first.
    handle isa Instance && add_fptr!(t, handle, :vkGetDeviceProcAddr)
    nothing
end
