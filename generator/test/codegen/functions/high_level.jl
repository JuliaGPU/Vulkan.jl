@testset "High-level functions" begin
    test_ex(VulkanGen.promote_hl(APIFunction(func_by_name(:vkEnumeratePhysicalDevices), false)), :(
        function enumerate_physical_devices(instance)::ResultTypes.Result{Vector{PhysicalDevice}, VulkanError}
            val = @propagate_errors(_enumerate_physical_devices(instance))
            val
        end
    ))

    test_ex(VulkanGen.promote_hl(APIFunction(func_by_name(:vkGetPerformanceParameterINTEL), false)), :(
        function get_performance_parameter_intel(device, parameter::PerformanceParameterTypeINTEL)::ResultTypes.Result{PerformanceValueINTEL, VulkanError}
            val = @propagate_errors _get_performance_parameter_intel(device, parameter)
            PerformanceValueINTEL(val)
        end
    ))

    test_ex(VulkanGen.promote_hl(APIFunction(func_by_name(:vkDestroyInstance), false)), :(
        function destroy_instance(instance; allocator = C_NULL)
            _destroy_instance(instance; allocator)
        end
    ))

    test_ex(VulkanGen.promote_hl(APIFunction(func_by_name(:vkGetPhysicalDeviceProperties2), false)), :(
        function get_physical_device_properties_2(physical_device, next_types::Type...)
            next_types_hl = next_types
            next_types = intermediate_type.(next_types)
            PhysicalDeviceProperties2(_get_physical_device_properties_2(physical_device, next_types...), next_types_hl...)
        end
    ))

    test_ex(VulkanGen.promote_hl(APIFunction(func_by_name(:vkGetPhysicalDeviceImageFormatProperties2), false)), :(
        function get_physical_device_image_format_properties_2(physical_device, image_format_info::PhysicalDeviceImageFormatInfo2, next_types::Type...)::ResultTypes.Result{ImageFormatProperties2, VulkanError}
            next_types_hl = next_types
            next_types = intermediate_type.(next_types)
            val = @propagate_errors(_get_physical_device_image_format_properties_2(physical_device, convert(_PhysicalDeviceImageFormatInfo2, image_format_info), next_types...))
            ImageFormatProperties2(val, next_types_hl...)
        end
    ))

    test_ex(VulkanGen.promote_hl(APIFunction(create_func(:vkCreateInstance), false)), :(
        function create_instance(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0, application_info = C_NULL)::ResultTypes.Result{Instance, VulkanError}
            val = @propagate_errors(_create_instance(enabled_layer_names, enabled_extension_names; allocator, next, flags, application_info))
            val
        end
    ))
end
