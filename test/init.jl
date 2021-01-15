@test_throws VulkanError("failed to execute vkCreateInstance(create_info, allocator, pInstance)", VK_ERROR_LAYER_NOT_PRESENT) Instance(["nonexistent_layer"], String[])
@test_throws VulkanError("failed to execute vkCreateInstance(create_info, allocator, pInstance)", VK_ERROR_EXTENSION_NOT_PRESENT) Instance(String[], ["nonexistent_extension"])
instance = Instance(INSTANCE_LAYERS, INSTANCE_EXTENSIONS;
    application_info = ApplicationInfo(v"0.0.1", v"0.0.1", API_VERSION; application_name="Test", engine_name="Experimental engine"))
@info "Instance created."
if WITH_VALIDATION[]
    debug_messenger = DebugUtilsMessengerEXT(instance, debug_callback_c; severity="debug")
end

pdevices = enumerate_physical_devices(instance)

if isempty(pdevices)
    error("No physical devices available for testing.")
end

pdevice = first(pdevices)
@info "$(length(pdevices)) physical device(s) found."
@test_throws ErrorException("No queue with the desired capabilities could be found.") find_queue_index(pdevice, typemax(UInt32))
@test_throws ErrorException("Invalid physical device features: no_feature") physical_device_features(:no_feature)
device = Device(pdevice, [
    DeviceQueueCreateInfo(find_queue_index(pdevice, VK_QUEUE_GRAPHICS_BIT & VK_QUEUE_COMPUTE_BIT), [1.0])
    ], String[], DEVICE_EXTENSIONS; enabled_features = ENABLED_FEATURES)
@info "Logical device created."
