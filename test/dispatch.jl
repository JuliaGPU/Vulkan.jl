@testset "Dispatcher" begin
    dispatcher = Vk.APIDispatcher()
    dispatcher.application_versions[instance] = nothing
    @test !haskey(dispatcher.instance_tables, instance)
    instance_table = Vk.table(dispatcher, instance)
    @test haskey(dispatcher.instance_tables, instance)
    Vk.add_fptr!(instance_table, instance, :vkEnumerateDeviceExtensionProperties)
    @test haskey(instance_table.pointers, :vkEnumerateDeviceExtensionProperties)
    @test !haskey(instance_table.pointers, :vkCreateDevice)
    @test !isnothing(enumerate_instance_extension_properties(Vk.get_fptr(dispatcher, nothing, :vkEnumerateInstanceExtensionProperties)))
    @test !isnothing(enumerate_device_extension_properties(device.physical_device, Vk.get_fptr(dispatcher, instance, :vkEnumerateDeviceExtensionProperties)))
    @test Fence(device, Vk.get_fptr(dispatcher, device, :vkCreateFence), Vk.get_fptr(dispatcher, device, :vkDestroyFence)) isa Fence
    if WITH_DEBUG
        @test Vk.add_fptr!(instance_table, instance, :vkCreateDebugUtilsMessengerEXT) ≠ C_NULL
    end
    device_table = Vk.table(dispatcher, device)
    @test_throws ErrorException Vk.add_fptr!(device_table, device, :vkCmdPushDescriptorSetWithTemplateKHR)
end

GC.gc()
