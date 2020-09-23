function_pointer(instance::Instance, name) = vkGetInstanceProcAddr(instance, name)
function_pointer(instance::Device, name) = vkGetDeviceProcAddr(instance, name)