test_ex(x, y) = @test prettify(x) == prettify(y)

test_wrap(f, value, ex) = test_ex(wrap(f(value)), ex)
test_wrap_handle(name, ex) = test_wrap(handle_by_name, name, ex)
test_wrap_struct(name, ex) = test_wrap(struct_by_name, name, ex)
test_wrap_func(name, ex) = test_wrap(func_by_name, name, ex)

@testset "Wrapping" begin
    test_wrap_handle(:VkInstance, :(
        mutable struct Instance <: Handle
            handle::VkInstance
        end))

    test_wrap_struct(:VkPhysicalDeviceProperties, :(
        struct PhysicalDeviceProperties <: ReturnedOnly
            api_version::VersionNumber
            driver_version::VersionNumber
            vendor_id::UInt32
            device_id::UInt32
            device_type::VkPhysicalDeviceType
            device_name::String
            pipeline_cache_uuid::String
            limits::PhysicalDeviceLimits
            sparse_properties::PhysicalDeviceSparseProperties
        end))

    test_wrap_struct(:VkApplicationInfo, :(
        struct ApplicationInfo <: VulkanStruct
            vks::VkApplicationInfo
            deps::Vector{Any}
        end))

    test_wrap_struct(:VkExtent2D, :(
        struct Extent2D <: VulkanStruct
            vks::VkExtent2D
        end))

    test_wrap_func(:vkEnumeratePhysicalDevices, :(
        function enumerate_physical_devices(instance::Instance)
            pPhysicalDeviceCount = Ref{UInt32}(0)
            @check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL)
            pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])
            @check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices)
            PhysicalDevice.(pPhysicalDevices)
        end
    ))

    test_wrap_func(:vkGetPhysicalDeviceProperties, :(
        function get_physical_device_properties(physical_device::PhysicalDevice)
            pProperties = Ref{VkPhysicalDeviceProperties}()
            vkGetPhysicalDeviceProperties(physical_device, pProperties)
            from_vk(PhysicalDeviceProperties, pProperties[])
        end
    ))

    test_wrap_func(:vkEnumerateInstanceVersion, :(
        function enumerate_instance_version()
            pApiVersion = Ref{UInt32}()
            @check vkEnumerateInstanceVersion(pApiVersion)
            from_vk(VersionNumber, pApiVersion[])
        end
    ))

    test_wrap_func(:vkEnumerateInstanceExtensionProperties, :(
        function enumerate_instance_extension_properties(; layer_name = C_NULL)
            pPropertyCount = Ref{UInt32}(0)
            @check vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, C_NULL)
            pProperties = Vector{VkExtensionProperties}(undef, pPropertyCount[])
            @check vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, pProperties)
            from_vk.(ExtensionProperties, pProperties)
        end
    ))

    test_wrap_func(:vkGetGeneratedCommandsMemoryRequirementsNV, :(
        function get_generated_commands_memory_requirements_nv(device::Device, info::GeneratedCommandsMemoryRequirementsInfoNV)
            pMemoryRequirements = Ref{VkMemoryRequirements2}()
            vkGetGeneratedCommandsMemoryRequirementsNV(device, Ref(info), pMemoryRequirements)
            from_vk(MemoryRequirements2, pMemoryRequirements[])
        end
    ))

    test_wrap_func(:vkGetInstanceProcAddr, :(get_instance_proc_addr(name::String; instance = C_NULL) = vkGetInstanceProcAddr(instance, name)))

    test_wrap_func(:vkGetPhysicalDeviceSurfacePresentModesKHR, :(
        function get_physical_device_surface_present_modes_khr(physical_device::PhysicalDevice, surface::SurfaceKHR)
            pPresentModeCount = Ref{UInt32}(0)
            @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, C_NULL)
            pPresentModes = Vector{VkPresentModeKHR}(undef, pPresentModeCount[])
            @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, pPresentModes)
            pPresentModes
        end
        ))
end
