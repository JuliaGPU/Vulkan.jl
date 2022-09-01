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

function function_pointer(disp::APIDispatcher, handle, key::Symbol)::Ptr{Cvoid}
    t = table(disp, handle)
    fptr = t.pointers[key]
    if fptr == C_NULL
        error(
            "Could not retrieve function pointer for '$key'. This can be caused by an extension not being enabled for a function that needs it; see the help with `?` or the documentation for more information.",
        )
    end
    fptr
end

function_pointer(name::AbstractString) = get_instance_proc_addr(name)
function_pointer(::Nothing, name::AbstractString) = function_pointer(name)
function_pointer(instance::Instance, name::AbstractString) = get_instance_proc_addr(name; instance)
function_pointer(device::Device, name::AbstractString) = get_device_proc_addr(device, name)
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
end
