function test_extend_from_vk(name, with_next_types, body)
    node = FromVk(StructDefinition{true}(struct_by_name(name)))
    expected = :(from_vk(T::Type{$(VulkanGen.remove_vk_prefix(name))}, x::$name) = $body)
    with_next_types && push!(expected.args[1].args, :(next_types...))
    test_ex(node, expected)
end

@testset "Overloads" begin
    @testset "`from_vk`" begin
        test_extend_from_vk(:VkLayerProperties, false, :(
            T(from_vk(String, x.layerName), from_vk(VersionNumber, x.specVersion), from_vk(VersionNumber, x.implementationVersion), from_vk(String, x.description))
        ))

        test_extend_from_vk(:VkQueueFamilyProperties, false, :(
            T(x.queueFlags, x.queueCount, x.timestampValidBits, from_vk(_Extent3D, x.minImageTransferGranularity))
        ))

        test_extend_from_vk(:VkPhysicalDeviceMemoryProperties, false, :(
            T(x.memoryTypeCount, from_vk.(MemoryType, x.memoryTypes), x.memoryHeapCount, from_vk.(MemoryHeap, x.memoryHeaps))
        ))

        test_extend_from_vk(:VkDisplayPlaneCapabilities2KHR, true, :(
            T(load_next_chain(x.pNext, next_types...), from_vk(DisplayPlaneCapabilitiesKHR, x.capabilities))
        ))

        test_extend_from_vk(:VkDrmFormatModifierPropertiesListEXT, true, :(
            T(load_next_chain(x.pNext, next_types...), unsafe_wrap(Vector{DrmFormatModifierPropertiesEXT}, x.pDrmFormatModifierProperties, x.drmFormatModifierCount; own = true))
        ))

        test_extend_from_vk(:VkPhysicalDeviceGroupProperties, true, :(
            T(load_next_chain(x.pNext, next_types...), x.physicalDeviceCount, PhysicalDevice.(x.physicalDevices), from_vk(Bool, x.subsetAllocation))
        ))

        test_extend_from_vk(:VkAccelerationStructureVersionInfoKHR, true, :(
            T(load_next_chain(x.pNext, next_types...), unsafe_wrap(Vector{UInt8}, x.pVersionData, 2VK_UUID_SIZE; own = true))
        ))
    end

    @testset "Parent navigation" begin
        test_ex(Parent(HandleDefinition(handle_by_name(:VkDevice))), :(
            parent(device::Device) = device.physical_device
        ))

        test_ex(Parent(HandleDefinition(handle_by_name(:VkSurfaceKHR))), :(
            parent(surface::SurfaceKHR) = surface.instance
        ))
    end
end
