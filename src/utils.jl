"""
Query a function pointer for an API function.

One of `get_instance_proc_addr` or `get_device_proc_addr` will be used depending on the argument types.
"""
function function_pointer end

function_pointer(name::AbstractString) = get_instance_proc_addr(name)
function_pointer(instance::Instance, name::AbstractString) = get_instance_proc_addr(name; instance)
function_pointer(device::Device, name::AbstractString) = get_device_proc_addr(device, name)
