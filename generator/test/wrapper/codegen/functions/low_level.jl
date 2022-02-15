@testset "API functions" begin
    test_ex(APIFunction(func_by_name(:vkEnumeratePhysicalDevices), false), :(
        function _enumerate_physical_devices(instance)::ResultTypes.Result{Vector{PhysicalDevice},VulkanError}
            pPhysicalDeviceCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                @check @dispatch instance vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL)
                pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])
                @check @dispatch instance vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices)
            end
            PhysicalDevice.(pPhysicalDevices, identity, instance)
        end
    ))

    test_ex(APIFunction(func_by_name(:vkGetPhysicalDeviceProperties), false), :(
        function _get_physical_device_properties(physical_device)::_PhysicalDeviceProperties
            pProperties = Ref{VkPhysicalDeviceProperties}()
            @dispatch instance(physical_device) vkGetPhysicalDeviceProperties(physical_device, pProperties)
            from_vk(_PhysicalDeviceProperties, pProperties[])
        end
    ))

    test_ex(APIFunction(func_by_name(:vkEnumerateInstanceVersion), false), :(
        function _enumerate_instance_version()::ResultTypes.Result{VersionNumber,VulkanError}
            pApiVersion = Ref{UInt32}()
            @check @dispatch nothing vkEnumerateInstanceVersion(pApiVersion)
            from_vk(VersionNumber, pApiVersion[])
        end
    ))

    test_ex(APIFunction(func_by_name(:vkEnumerateInstanceExtensionProperties), false), :(
        function _enumerate_instance_extension_properties(; layer_name = C_NULL)::ResultTypes.Result{Vector{_ExtensionProperties},VulkanError}
            pPropertyCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                @check @dispatch nothing vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, C_NULL)
                pProperties = Vector{VkExtensionProperties}(undef, pPropertyCount[])
                @check @dispatch nothing vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, pProperties)
            end
            from_vk.(_ExtensionProperties, pProperties)
        end
    ))

    test_ex(APIFunction(func_by_name(:vkGetGeneratedCommandsMemoryRequirementsNV), false), :(
        function _get_generated_commands_memory_requirements_nv(device, info::_GeneratedCommandsMemoryRequirementsInfoNV, next_types::Type...)::_MemoryRequirements2
            memory_requirements = initialize(_MemoryRequirements2, next_types...)
            pMemoryRequirements = Ref(Base.unsafe_convert(VkMemoryRequirements2, memory_requirements))
            GC.@preserve memory_requirements begin
                @dispatch device vkGetGeneratedCommandsMemoryRequirementsNV(device, info, pMemoryRequirements)
                _MemoryRequirements2(pMemoryRequirements[], Any[memory_requirements])
            end
        end
    ))

    test_ex(APIFunction(func_by_name(:vkGetInstanceProcAddr), false), :(_get_instance_proc_addr(name::AbstractString; instance = C_NULL)::FunctionPtr = vkGetInstanceProcAddr(instance, name)))
    test_ex(APIFunction(func_by_name(:vkGetInstanceProcAddr), true), :(_get_instance_proc_addr(name::AbstractString, fptr::FunctionPtr; instance = C_NULL)::FunctionPtr = vkGetInstanceProcAddr(instance, name, fptr)))

    test_ex(APIFunction(func_by_name(:vkGetPhysicalDeviceSurfacePresentModesKHR), false), :(
        function _get_physical_device_surface_present_modes_khr(physical_device, surface)::ResultTypes.Result{Vector{PresentModeKHR},VulkanError}
            pPresentModeCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                @check @dispatch instance(physical_device) vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, C_NULL)
                pPresentModes = Vector{VkPresentModeKHR}(undef, pPresentModeCount[])
                @check @dispatch instance(physical_device) vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, pPresentModes)
            end
            pPresentModes
        end
    ))

    test_ex(APIFunction(func_by_name(:vkGetRandROutputDisplayEXT), false), :(
        function _get_rand_r_output_display_ext(physical_device, dpy::Ptr{vk.Display}, rr_output::vk.RROutput)::ResultTypes.Result{DisplayKHR,VulkanError}
            pDisplay = Ref{VkDisplayKHR}()
            @check @dispatch instance(physical_device) vkGetRandROutputDisplayEXT(physical_device, dpy, rr_output, pDisplay)
            DisplayKHR(pDisplay[], identity, physical_device)
        end
    ))

    test_ex(APIFunction(func_by_name(:vkRegisterDeviceEventEXT), false), :(
        function _register_device_event_ext(device, device_event_info::_DeviceEventInfoEXT; allocator = C_NULL)::ResultTypes.Result{Fence,VulkanError}
            pFence = Ref{VkFence}()
            @check @dispatch device vkRegisterDeviceEventEXT(device, device_event_info, allocator, pFence)
            Fence(pFence[], (x->_destroy_fence(device, x; allocator)), device)
        end
    ))

    test_ex(APIFunction(func_by_name(:vkCreateInstance), false), :(
        function _create_instance(create_info::_InstanceCreateInfo; allocator = C_NULL)::ResultTypes.Result{Instance,VulkanError}
            pInstance = Ref{VkInstance}()
            @check @dispatch nothing vkCreateInstance(create_info, allocator, pInstance)
            Instance(pInstance[], x -> _destroy_instance(x; allocator))
        end
    ))

    test_ex(APIFunction(func_by_name(:vkCreateDebugReportCallbackEXT), true), :(
        function _create_debug_report_callback_ext(instance, create_info::_DebugReportCallbackCreateInfoEXT, fptr_create::FunctionPtr, fptr_destroy::FunctionPtr; allocator = C_NULL)::ResultTypes.Result{DebugReportCallbackEXT,VulkanError}
            pCallback = Ref{VkDebugReportCallbackEXT}()
            @check vkCreateDebugReportCallbackEXT(instance, create_info, allocator, pCallback, fptr_create)
            DebugReportCallbackEXT(pCallback[], (x->_destroy_debug_report_callback_ext(instance, x, fptr_destroy; allocator)), instance)
        end
    ))

    test_ex(APIFunction(func_by_name(:vkCreateGraphicsPipelines), false), :(
        function _create_graphics_pipelines(device, create_infos::AbstractArray; pipeline_cache = C_NULL, allocator = C_NULL)::ResultTypes.Result{Tuple{Vector{Pipeline}, Result}, VulkanError}
            pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
            @check @dispatch device vkCreateGraphicsPipelines(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines)
            (Pipeline.(pPipelines, x -> _destroy_pipeline(device, x; allocator), device), _return_code)
        end
    ))

    test_ex(APIFunction(func_by_name(:vkAllocateDescriptorSets), false), :(
        function _allocate_descriptor_sets(device, allocate_info::_DescriptorSetAllocateInfo)::ResultTypes.Result{Vector{DescriptorSet},VulkanError}
            pDescriptorSets = Vector{VkDescriptorSet}(undef, allocate_info.vks.descriptorSetCount)
            @check @dispatch device vkAllocateDescriptorSets(device, allocate_info, pDescriptorSets)
            DescriptorSet.(pDescriptorSets, identity, getproperty(allocate_info, :descriptor_pool))
        end
    ))

    test_ex(APIFunction(func_by_name(:vkMergePipelineCaches), false), :(
        _merge_pipeline_caches(device, dst_cache, src_caches::AbstractArray)::ResultTypes.Result{Result,VulkanError} = @check(@dispatch(device, vkMergePipelineCaches(device, dst_cache, pointer_length(src_caches), src_caches)))
    ))

    test_ex(APIFunction(func_by_name(:vkGetFenceFdKHR), false), :(
        function _get_fence_fd_khr(device, get_fd_info::_FenceGetFdInfoKHR)::ResultTypes.Result{Int,VulkanError}
            pFd = Ref{Int}()
            @check @dispatch device vkGetFenceFdKHR(device, get_fd_info, pFd)
            pFd[]
        end
    ))

    test_ex(APIFunction(func_by_name(:vkGetDeviceGroupPeerMemoryFeatures), false), :(
        function _get_device_group_peer_memory_features(device, heap_index::Integer, local_device_index::Integer, remote_device_index::Integer)::PeerMemoryFeatureFlag
            pPeerMemoryFeatures = Ref{VkPeerMemoryFeatureFlags}()
            @dispatch device vkGetDeviceGroupPeerMemoryFeatures(device, heap_index, local_device_index, remote_device_index, pPeerMemoryFeatures)
            pPeerMemoryFeatures[]
        end
    ))

    test_ex(APIFunction(func_by_name(:vkUpdateDescriptorSets), false), :(
        _update_descriptor_sets(device, descriptor_writes::AbstractArray, descriptor_copies::AbstractArray)::Cvoid = @dispatch device vkUpdateDescriptorSets(device, pointer_length(descriptor_writes), descriptor_writes, pointer_length(descriptor_copies), descriptor_copies)
    ))

    test_ex(APIFunction(func_by_name(:vkCmdSetViewport), false), :(
        _cmd_set_viewport(command_buffer, viewports::AbstractArray)::Cvoid = @dispatch device(command_buffer) vkCmdSetViewport(command_buffer, 0, pointer_length(viewports), viewports)
    ))

    test_ex(APIFunction(func_by_name(:vkCmdSetLineWidth), false), :(
        _cmd_set_line_width(command_buffer, line_width::Real)::Cvoid = @dispatch device(command_buffer) vkCmdSetLineWidth(command_buffer, line_width)
    ))

    test_ex(APIFunction(func_by_name(:vkDestroyInstance), false), :(
        _destroy_instance(instance; allocator = C_NULL)::Cvoid = @dispatch instance vkDestroyInstance(instance, allocator)
    ))

    test_ex(APIFunction(func_by_name(:vkMapMemory), false), :(
        function _map_memory(device, memory, offset::Integer, size::Integer; flags = 0)::ResultTypes.Result{Ptr{Cvoid},VulkanError}
            ppData = Ref{Ptr{Cvoid}}()
            @check @dispatch device vkMapMemory(device, memory, offset, size, flags, ppData)
            ppData[]
        end
    ))

    test_ex(APIFunction(func_by_name(:vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR), false), :(
        function _enumerate_physical_device_queue_family_performance_query_counters_khr(physical_device, queue_family_index::Integer)::ResultTypes.Result{Tuple{Vector{_PerformanceCounterKHR}, Vector{_PerformanceCounterDescriptionKHR}},VulkanError}
            pCounterCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                @check @dispatch instance(physical_device) vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device, queue_family_index, pCounterCount, C_NULL, C_NULL)
                pCounters = Vector{VkPerformanceCounterKHR}(undef, pCounterCount[])
                pCounterDescriptions = Vector{VkPerformanceCounterDescriptionKHR}(undef, pCounterCount[])
                @check @dispatch instance(physical_device) vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device, queue_family_index, pCounterCount, pCounters, pCounterDescriptions)
            end
            (from_vk.(_PerformanceCounterKHR, pCounters), from_vk.(_PerformanceCounterDescriptionKHR, pCounterDescriptions))
        end
    ))

    test_ex(APIFunction(func_by_name(:vkGetPipelineCacheData), false), :(
        function _get_pipeline_cache_data(device, pipeline_cache)::ResultTypes.Result{Tuple{UInt,Ptr{Cvoid}},VulkanError}
            pDataSize = Ref{UInt}()
            @repeat_while_incomplete begin
                @check @dispatch device vkGetPipelineCacheData(device, pipeline_cache, pDataSize, C_NULL)
                pData = Libc.malloc(pDataSize[])
                @check @dispatch device vkGetPipelineCacheData(device, pipeline_cache, pDataSize, pData)
                if _return_code == VK_INCOMPLETE
                    Libc.free(pData)
                end
            end
            (pDataSize[], pData)
        end
    ))

    test_ex(APIFunction(func_by_name(:vkWriteAccelerationStructuresPropertiesKHR), false), :(
        _write_acceleration_structures_properties_khr(device, acceleration_structures::AbstractArray, query_type::QueryType, data_size::Integer, data::Ptr{Cvoid}, stride::Integer)::ResultTypes.Result{Result, VulkanError} = @check @dispatch device vkWriteAccelerationStructuresPropertiesKHR(device, pointer_length(acceleration_structures), acceleration_structures, query_type, data_size, data, stride)
    ))

    test_ex(APIFunction(func_by_name(:vkGetQueryPoolResults), false), :(
        _get_query_pool_results(device, query_pool, first_query::Integer, query_count::Integer, data_size::Integer, data::Ptr{Cvoid}, stride::Integer; flags = 0)::ResultTypes.Result{Result, VulkanError} = @check @dispatch device vkGetQueryPoolResults(device, query_pool, first_query, query_count, data_size, data, stride, flags)
    ))

    test_ex(APIFunction(func_by_name(:vkGetFenceStatus), false), :(
        _get_fence_status(device, fence)::ResultTypes.Result{Result, VulkanError} = @check(@dispatch(device, vkGetFenceStatus(device, fence)))
    ))

    test_ex(APIFunction(func_by_name(:vkGetSwapchainImagesKHR), false), :(
        function _get_swapchain_images_khr(device, swapchain)::ResultTypes.Result{Vector{Image}, VulkanError}
            pSwapchainImageCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                    @check @dispatch device vkGetSwapchainImagesKHR(device, swapchain, pSwapchainImageCount, C_NULL)
                    pSwapchainImages = Vector{VkImage}(undef, pSwapchainImageCount[])
                    @check @dispatch device vkGetSwapchainImagesKHR(device, swapchain, pSwapchainImageCount, pSwapchainImages)
                end
            Image.(pSwapchainImages, identity, device)
        end
    ))

    @testset "Automatic reconstruction of create infos" begin
        test_ex(APIFunction(create_func(:vkCreateInstance), false), :(
            _create_instance(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; allocator = C_NULL, next=C_NULL, flags=0, application_info=C_NULL) = _create_instance(_InstanceCreateInfo(enabled_layer_names, enabled_extension_names; next, flags, application_info); allocator)
        ))

        test_ex(APIFunction(create_func(:vkCreateDebugReportCallbackEXT), true), :(
            _create_debug_report_callback_ext(instance, pfn_callback::FunctionPtr, fptr_create::FunctionPtr, fptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = _create_debug_report_callback_ext(instance, _DebugReportCallbackCreateInfoEXT(pfn_callback; next, flags, user_data), fptr_create, fptr_destroy; allocator)
            ),
        )
    end
end
