function_pointer(instance::Instance, name) = vkGetInstanceProcAddr(instance, name)
function_pointer(device::Device, name) = vkGetDeviceProcAddr(device, name)

CommandBuffer(device, allocate_info) = CommandBuffer(device, allocate_info, allocate_info.vks.commandBufferCount)

function find_memory_type(physical_device, type_flag, flagbits)
    mem_props = get_physical_device_memory_properties(physical_device)
    indices = findall(x -> (x.propertyFlags & flagbits) == flagbits, mem_props.memory_types[1:mem_props.memory_type_count]) .- 1
    indices[findfirst(i -> type_flag & 1 << i ≠ 0, indices)]
end
