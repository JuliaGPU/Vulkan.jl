@test_throws VulkanError Instance(["nonexistent_layer"], [])
@test_throws VulkanError Instance([], ["nonexistent_extension"])
@test unwrap_error(create_instance([], ["nonexistent_extension"])).code == ERROR_EXTENSION_NOT_PRESENT

const instance = Instance(INSTANCE_LAYERS, INSTANCE_EXTENSIONS;
    application_info = ApplicationInfo(v"0.0.1", v"0.0.1", API_VERSION; application_name="Test", engine_name="Experimental engine"))
@info "Instance created: $instance."

if WITH_VALIDATION[]
    debug_messenger = DebugUtilsMessengerEXT(instance, debug_callback_c)
end

const device = let pdevices = unwrap(enumerate_physical_devices(instance))
    if isempty(pdevices)
        error("No physical devices available for testing.")
    end
    
    @info "$(length(pdevices)) physical device(s) found."

    pdevice = first(pdevices)

    @info "Selected $(get_physical_device_properties(pdevice))"
    @test_throws ErrorException("No queue with the desired capabilities could be found.") find_queue_family(pdevice, typemax(QueueFlag))
    @test_throws ErrorException("Invalid physical device features: no_feature") PhysicalDeviceFeatures(:no_feature)

    Device(
        pdevice,
        [DeviceQueueCreateInfo(find_queue_family(pdevice, QUEUE_GRAPHICS_BIT & QUEUE_COMPUTE_BIT), [1.0])],
        [], DEVICE_EXTENSIONS; enabled_features = ENABLED_FEATURES
    )
end

@info "Logical device created: $device."
