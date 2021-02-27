@test_throws VulkanError("failed to execute vkCreateInstance(create_info, allocator, pInstance)", VK_ERROR_LAYER_NOT_PRESENT) unwrap(Instance(["nonexistent_layer"], String[]))
@test_throws VulkanError("failed to execute vkCreateInstance(create_info, allocator, pInstance)", VK_ERROR_EXTENSION_NOT_PRESENT) unwrap(Instance(String[], ["nonexistent_extension"]))
@test unwrap_error(Instance(String[], ["nonexistent_extension"])) == VulkanError("failed to execute vkCreateInstance(create_info, allocator, pInstance)", VK_ERROR_EXTENSION_NOT_PRESENT)

const instance = unwrap(Instance(INSTANCE_LAYERS, INSTANCE_EXTENSIONS;
    application_info = ApplicationInfo(v"0.0.1", v"0.0.1", API_VERSION; application_name="Test", engine_name="Experimental engine")))
@info "Instance created: $instance."

if WITH_VALIDATION[]
    debug_messenger = unwrap(DebugUtilsMessengerEXT(instance, debug_callback_c; severity="debug"))
end

const device = let pdevices = unwrap(enumerate_physical_devices(instance))
    if isempty(pdevices)
        error("No physical devices available for testing.")
    end
    
    @info "$(length(pdevices)) physical device(s) found."

    pdevice = first(pdevices)

    @info "Selected $(get_physical_device_properties(pdevice))"
    @test_throws ErrorException("No queue with the desired capabilities could be found.") find_queue_index(pdevice, typemax(QueueFlag))
    @test_throws ErrorException("Invalid physical device features: no_feature") PhysicalDeviceFeatures(:no_feature)

    unwrap(Device(
        pdevice,
        [DeviceQueueCreateInfo(find_queue_index(pdevice, QUEUE_GRAPHICS_BIT & QUEUE_COMPUTE_BIT), [1.0])],
        [], DEVICE_EXTENSIONS; enabled_features = ENABLED_FEATURES
    ))
end

@info "Logical device created: $device."
