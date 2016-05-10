

"""
Collect all devices
"""
function collect_devices(instance)
    # Physical device
    gpu_count = Ref{UInt32}()
    # Get number of available physical devices
    err = api.vkEnumeratePhysicalDevices(instance, gpu_count, C_NULL)
    check(err)
    if gpu_count[] < 1
        error("No gpu found. Number of GPUS's: $gpu_count")
    end
    # Enumerate devices
    physical_devices = Array(api.VkPhysicalDevice, gpu_count[])
    err = api.vkEnumeratePhysicalDevices(instance, gpu_count, physical_devices)
    if err != api.VK_SUCCESS
        error("Could not enumerate phyiscal devices \n: $err, Fatal error")
    end
    physical_devices
end


function get_queue_family_properties(physical_device)
    queue_count = Ref{UInt32}()
    api.vkGetPhysicalDeviceQueueFamilyProperties(physical_device, queue_count, C_NULL)
    if queue_count[] < 1
        error("No queue found. Number of queues: $queue_count")
    end
    queue_props = Array(api.VkQueueFamilyProperties, queue_count[])
    api.vkGetPhysicalDeviceQueueFamilyProperties(physical_device, queue_count, queue_props)
    queue_props
end
"""
Finds a queue that supports graphics operations and returns it's index
"""
function get_graphic_queue(physical_device)
    queue_props = get_queue_family_properties(physical_device)
    # search for queue that supports graphics
    index = findfirst(queue_props) do queue
        (UInt32(queue.queueFlags) & UInt32(api.VK_QUEUE_GRAPHICS_BIT)) == UInt32(true)
    end
    if (index == 0)
        error("no queue found with graphics support")
    end
    index-1 # Vulkan is 0 indexed
end

function Device(physical_device, requested_queues, enable_validation)
    enabled_extensions = [api.VK_KHR_SWAPCHAIN_EXTENSION_NAME]
    device = CreateDevice(physical_device, C_NULL, (
        :queueCreateInfoCount, 1,
        :pQueueCreateInfos, requested_queues,
        :enabledExtensionCount, length(enabled_extensions),
        :ppEnabledExtensionNames, enabled_extensions,
        :enabledLayerCount, length(validation_layer),
        :ppEnabledLayerNames, validation_layer
    ))
    Device(device, physical_device)
end



function get_graphic_device(instance, enable_validation)
    # Enumerate devices
    physical_devices = collect_devices(instance)
    # select the first one for now!

    physical_device_raw = physical_devices[1]
    deviceMemoryProperties = Ref{api.VkPhysicalDeviceMemoryProperties}()
    api.vkGetPhysicalDeviceMemoryProperties(physical_device_raw, deviceMemoryProperties)
    # Gather physical device memory properties

    physical_device = PhysicalDevice(physical_device_raw, deviceMemoryProperties[])

    graphic_queue_index = get_graphic_queue(physical_device)
    # Vulkan device
    	# Vulkan device
    queuePriorities = [0.0f0]
    queue_create_info = create(api.VkDeviceQueueCreateInfo, (
        :queueFamilyIndex, graphic_queue_index,
        :queueCount, 1,
        :pQueuePriorities, queuePriorities
    ))
    device = Device(physical_device, queue_create_info, enable_validation)


    # Get the graphics queue
    queue_ref = Ref{api.VkQueue}()
    api.vkGetDeviceQueue(device, graphic_queue_index, 0, queue_ref)

    # Set up device and instance specific functions
    connect!(instance, physical_device, device)

    device, physical_device, queue_ref[], deviceMemoryProperties[]
end
