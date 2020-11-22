function_pointer(instance::Instance, name) = vkGetInstanceProcAddr(instance, name)
function_pointer(device::Device, name) = vkGetDeviceProcAddr(device, name)

CommandBuffer(device, allocate_info) = CommandBuffer(device, allocate_info, allocate_info.vks.commandBufferCount)
