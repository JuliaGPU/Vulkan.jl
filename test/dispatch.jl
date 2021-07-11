@testset "Dispatcher" begin
    dispatcher = Vulkan.APIDispatcher()
    @test !haskey(dispatcher.instance_table, :vkEnumerateDeviceExtensionProperties)
    Vulkan.add_fptr!(dispatcher, instance, :vkEnumerateDeviceExtensionProperties)
    @test haskey(dispatcher.instance_table, :vkEnumerateDeviceExtensionProperties)
    @test !isnothing(enumerate_instance_extension_properties(Vulkan.get_fptr(dispatcher, nothing, :vkEnumerateInstanceExtensionProperties)))
    @test !isnothing(enumerate_device_extension_properties(device.physical_device, Vulkan.get_fptr(dispatcher, instance, :vkEnumerateDeviceExtensionProperties)))
    @test Fence(device, Vulkan.get_fptr(dispatcher, device, :vkCreateFence), Vulkan.get_fptr(dispatcher, device, :vkDestroyFence)) isa Fence
    if WITH_DEBUG
        @test Vulkan.add_fptr!(dispatcher, instance, :vkCreateDebugUtilsMessengerEXT) ≠ C_NULL
    end
    @test_throws ErrorException Vulkan.add_fptr!(dispatcher, device, :vkCmdPushDescriptorSetWithTemplateKHR)
end

GC.gc()
