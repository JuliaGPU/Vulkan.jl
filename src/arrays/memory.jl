#=
Good overview over memory handling in Vulkan:
https://developer.nvidia.com/vulkan-memory-management
=#




"""
Find the memory type index, which selects the properties of the memory to be allocated,
as well as the heap the memory will come from.
"""
function memory_type(device, typebits, properties)
    memory_types = device.physical_device.memory_properties.memoryTypes
	for i_int=0:31
		i = UInt32(i_int)
		if ((typebits & 1) == 1)
			if ((memory_types[i+1].propertyFlags & UInt32(properties)) == UInt32(properties))
				return i
			end
		end
		typebits >>= 1
	end
	error("Can't get no memory type!")
end


function memory_requirements(device, buffer::VulkanBuffer)
    mem_requirements_ref = Ref{api.VkMemoryRequirements}()
	api.vkGetBufferMemoryRequirements(device, buffer, mem_requirements_ref)
    mem_requirements_ref[]
end

function memory_requirements(device, buffer::VulkanImage)
    mem_requirements_ref = Ref{api.VkMemoryRequirements}()
	api.vkGetImageMemoryRequirements(device, buffer, mem_requirements_ref)
    mem_requirements_ref[]
end
