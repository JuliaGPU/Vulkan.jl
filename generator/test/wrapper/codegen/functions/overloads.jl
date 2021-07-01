test_extend_from_vk(name, ex) = test_ex(extend_from_vk(struct_by_name(name)), :(from_vk(T::Type{$(VulkanGen.remove_vk_prefix(name))}, x::$name) = $ex))

@testset "Overloads" begin
    @testset "`from_vk`" begin
        test_extend_from_vk(:VkLayerProperties, :(
            T(from_vk(String, x.layerName), from_vk(VersionNumber, x.specVersion), from_vk(VersionNumber, x.implementationVersion), from_vk(String, x.description))
        ))

        test_extend_from_vk(:VkQueueFamilyProperties, :(
            T(x.queueFlags, x.queueCount, x.timestampValidBits, from_vk(_Extent3D, x.minImageTransferGranularity))
        ))

        test_extend_from_vk(:VkPhysicalDeviceMemoryProperties, :(
            T(x.memoryTypeCount, from_vk.(MemoryType, x.memoryTypes), x.memoryHeapCount, from_vk.(MemoryHeap, x.memoryHeaps))
        ))

        test_extend_from_vk(:VkDisplayPlaneCapabilities2KHR, :(
            T(x.sType, x.pNext, from_vk(DisplayPlaneCapabilitiesKHR, x.capabilities))
        ))

        test_extend_from_vk(:VkDrmFormatModifierPropertiesListEXT, :(
            T(x.sType, x.pNext, unsafe_wrap(Vector{DrmFormatModifierPropertiesEXT}, x.pDrmFormatModifierProperties, x.drmFormatModifierCount; own = true))
        ))

        test_extend_from_vk(:VkPhysicalDeviceGroupProperties, :(
            T(x.sType, x.pNext, x.physicalDeviceCount, PhysicalDevice.(x.physicalDevices), from_vk(Bool, x.subsetAllocation))
        ))
    end
end
