using Vulkan

const instance = Instance([], [])
const pdevice = first(unwrap(enumerate_physical_devices(instance)))
const device = Device(pdevice, [DeviceQueueCreateInfo(0, [1.0])], [], [])

function manyf(f, args...)
  for i in 1:10000
    f(args...)
  end
end

function manual_f(device)
  f = Ref{VkCore.VkFence}()
  info = VkCore.VkFenceCreateInfo(VkCore.VK_STRUCTURE_TYPE_FENCE_CREATE_INFO, C_NULL, 0)
  VkCore.vkCreateFence(device, Ref(info), C_NULL, f)
  VkCore.vkDestroyFence(device, f[], C_NULL)
end

function manual_f(device, fptr1, fptr2)
  f = Ref{VkCore.VkFence}()
  info = VkCore.VkFenceCreateInfo(VkCore.VK_STRUCTURE_TYPE_FENCE_CREATE_INFO, C_NULL, 0)
  VkCore.vkCreateFence(device, Ref(info), C_NULL, f, fptr1)
  VkCore.vkDestroyFence(device, f[], C_NULL, fptr2)
end

fptr1, fptr2 = function_pointer(device, "vkCreateFence"), function_pointer(device, "vkDestroyFence")
@time manual_f(device)
@time manual_f(device, fptr1, fptr2)

@time manyf(manual_f, device)
@time manyf(manual_f, device, fptr1, fptr2)

function f(device)
  f = Vk.Fence(device)
  finalize(f)
end

@time f(device)
@profview manyf(f, device)
