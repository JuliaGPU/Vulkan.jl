reverse_dict(dict::AbstractDict) = Dict(v => k for (k, v) ∈ dict)

function_pointer(instance::Instance, name) = get_instance_proc_addr(name; instance)
function_pointer(device::Device, name) = get_device_proc_addr(device, name)
