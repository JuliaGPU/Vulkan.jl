test_wrap_func(name, ex; kwargs...) = test_wrap(func_by_name, name, ex; kwargs...)
test_extend_handle_constructor(name, ex; kwargs...) = test_ex(extend_handle_constructor(create_func_no_batch(handle_by_name(name)); kwargs...), ex)

@testset "API functions" begin
    test_wrap_func(:vkEnumeratePhysicalDevices, :(
        function enumerate_physical_devices(instance::Instance)::ResultTypes.Result{Vector{PhysicalDevice},VulkanError}
            pPhysicalDeviceCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                @check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL)
                pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])
                @check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices)
            end
            PhysicalDevice.(pPhysicalDevices, identity, instance)
        end
    ))

    test_wrap_func(:vkGetPhysicalDeviceProperties, :(
        function get_physical_device_properties(physical_device::PhysicalDevice)::PhysicalDeviceProperties
            pProperties = Ref{VkPhysicalDeviceProperties}()
            vkGetPhysicalDeviceProperties(physical_device, pProperties)
            from_vk(PhysicalDeviceProperties, pProperties[])
        end
    ))

    test_wrap_func(:vkEnumerateInstanceVersion, :(
        function enumerate_instance_version()::ResultTypes.Result{VersionNumber,VulkanError}
            pApiVersion = Ref{UInt32}()
            @check vkEnumerateInstanceVersion(pApiVersion)
            from_vk(VersionNumber, pApiVersion[])
        end
    ))

    test_wrap_func(:vkEnumerateInstanceExtensionProperties, :(
        function enumerate_instance_extension_properties(; layer_name = C_NULL)::ResultTypes.Result{Vector{ExtensionProperties},VulkanError}
            pPropertyCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                @check vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, C_NULL)
                pProperties = Vector{VkExtensionProperties}(undef, pPropertyCount[])
                @check vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, pProperties)
            end
            from_vk.(ExtensionProperties, pProperties)
        end
    ))

    test_wrap_func(:vkGetGeneratedCommandsMemoryRequirementsNV, :(
        function get_generated_commands_memory_requirements_nv(device::Device, info::_GeneratedCommandsMemoryRequirementsInfoNV)::MemoryRequirements2
            pMemoryRequirements = Ref{VkMemoryRequirements2}()
            vkGetGeneratedCommandsMemoryRequirementsNV(device, info, pMemoryRequirements)
            from_vk(MemoryRequirements2, pMemoryRequirements[])
        end
    ))

    test_wrap_func(:vkGetInstanceProcAddr, :(get_instance_proc_addr(name::AbstractString; instance = C_NULL)::FunctionPtr = vkGetInstanceProcAddr(instance, name)))
    test_wrap_func(:vkGetInstanceProcAddr, :(get_instance_proc_addr(name::AbstractString, fun_ptr::FunctionPtr; instance = C_NULL)::FunctionPtr = vkGetInstanceProcAddr(instance, name, fun_ptr)); with_func_ptr=true)

    test_wrap_func(:vkGetPhysicalDeviceSurfacePresentModesKHR, :(
        function get_physical_device_surface_present_modes_khr(physical_device::PhysicalDevice, surface::SurfaceKHR)::ResultTypes.Result{Vector{PresentModeKHR},VulkanError}
            pPresentModeCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, C_NULL)
                pPresentModes = Vector{VkPresentModeKHR}(undef, pPresentModeCount[])
                @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, pPresentModes)
            end
            pPresentModes
        end
    ))

    test_wrap_func(:vkGetRandROutputDisplayEXT, :(
        function get_rand_r_output_display_ext(physical_device::PhysicalDevice, dpy::Ptr{vk.Display}, rr_output::vk.RROutput)::ResultTypes.Result{DisplayKHR,VulkanError}
            pDisplay = Ref{VkDisplayKHR}()
            @check vkGetRandROutputDisplayEXT(physical_device, dpy, rr_output, pDisplay)
            DisplayKHR(pDisplay[], identity, physical_device)
        end
    ))

    test_wrap_func(:vkRegisterDeviceEventEXT, :(
        function register_device_event_ext(device::Device, device_event_info::_DeviceEventInfoEXT; allocator = C_NULL)::ResultTypes.Result{Fence,VulkanError}
            pFence = Ref{VkFence}()
            @check vkRegisterDeviceEventEXT(device, device_event_info, allocator, pFence)
            Fence(pFence[], (x->destroy_fence(device, x; allocator)), device)
        end
    ))

    test_wrap_func(:vkCreateInstance, :(
        function create_instance(create_info::_InstanceCreateInfo; allocator = C_NULL)::ResultTypes.Result{Instance,VulkanError}
            pInstance = Ref{VkInstance}()
            @check vkCreateInstance(create_info, allocator, pInstance)
            Instance(pInstance[], x -> destroy_instance(x; allocator))
        end
    ))

    test_wrap_func(:vkCreateDebugReportCallbackEXT, :(
        function create_debug_report_callback_ext(instance::Instance, create_info::_DebugReportCallbackCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)::ResultTypes.Result{DebugReportCallbackEXT,VulkanError}
            pCallback = Ref{VkDebugReportCallbackEXT}()
            @check vkCreateDebugReportCallbackEXT(instance, create_info, allocator, pCallback, fun_ptr_create)
            DebugReportCallbackEXT(pCallback[], (x->destroy_debug_report_callback_ext(instance, x, fun_ptr_destroy; allocator)), instance)
        end
    ); with_func_ptr=true)

    test_wrap_func(:vkCreateGraphicsPipelines, :(
        function create_graphics_pipelines(device::Device, create_infos::AbstractArray{<:_GraphicsPipelineCreateInfo}; pipeline_cache = C_NULL, allocator = C_NULL)::ResultTypes.Result{Tuple{Vector{Pipeline}, Result}, VulkanError}
            pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
            @check vkCreateGraphicsPipelines(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines)
            (Pipeline.(pPipelines, x -> destroy_pipeline(device, x; allocator), device), _return_code)
        end
    ))

    test_wrap_func(:vkAllocateDescriptorSets, :(
        function allocate_descriptor_sets(device::Device, allocate_info::_DescriptorSetAllocateInfo)::ResultTypes.Result{Vector{DescriptorSet},VulkanError}
            pDescriptorSets = Vector{VkDescriptorSet}(undef, allocate_info.vks.descriptorSetCount)
            @check vkAllocateDescriptorSets(device, allocate_info, pDescriptorSets)
            DescriptorSet.(pDescriptorSets, identity, getproperty(allocate_info, :descriptor_pool))
        end
    ))

    test_wrap_func(:vkMergePipelineCaches, :(
        merge_pipeline_caches(device::Device, dst_cache::PipelineCache, src_caches::AbstractArray)::ResultTypes.Result{Result,VulkanError} = @check(vkMergePipelineCaches(device, dst_cache, pointer_length(src_caches), src_caches))
    ))

    test_wrap_func(:vkGetFenceFdKHR, :(
        function get_fence_fd_khr(device::Device, get_fd_info::_FenceGetFdInfoKHR)::ResultTypes.Result{Int,VulkanError}
            pFd = Ref{Int}()
            @check vkGetFenceFdKHR(device, get_fd_info, pFd)
            pFd[]
        end
    ))

    test_wrap_func(:vkGetDeviceGroupPeerMemoryFeatures, :(
        function get_device_group_peer_memory_features(device::Device, heap_index::Integer, local_device_index::Integer, remote_device_index::Integer)::PeerMemoryFeatureFlag
            pPeerMemoryFeatures = Ref{VkPeerMemoryFeatureFlags}()
            vkGetDeviceGroupPeerMemoryFeatures(device, heap_index, local_device_index, remote_device_index, pPeerMemoryFeatures)
            pPeerMemoryFeatures[]
        end
    ))

    test_wrap_func(:vkUpdateDescriptorSets, :(
        update_descriptor_sets(device::Device, descriptor_writes::AbstractArray{<:_WriteDescriptorSet}, descriptor_copies::AbstractArray{<:_CopyDescriptorSet})::Cvoid = vkUpdateDescriptorSets(device, pointer_length(descriptor_writes), descriptor_writes, pointer_length(descriptor_copies), descriptor_copies)
    ))

    test_wrap_func(:vkCmdSetViewport, :(
        cmd_set_viewport(command_buffer::CommandBuffer, viewports::AbstractArray{<:_Viewport})::Cvoid = vkCmdSetViewport(command_buffer, 0, pointer_length(viewports), viewports)
    ))

    test_wrap_func(:vkCmdSetLineWidth, :(
        cmd_set_line_width(command_buffer::CommandBuffer, line_width::Real)::Cvoid = vkCmdSetLineWidth(command_buffer, line_width)
    ))

    test_wrap_func(:vkDestroyInstance, :(
        destroy_instance(instance::Instance; allocator = C_NULL)::Cvoid = vkDestroyInstance(instance, allocator)
    ))

    test_wrap_func(:vkMapMemory, :(
        function map_memory(device::Device, memory::DeviceMemory, offset::Integer, size::Integer; flags = 0)::ResultTypes.Result{Ptr{Cvoid},VulkanError}
            ppData = Ref{Ptr{Cvoid}}()
            @check vkMapMemory(device, memory, offset, size, flags, ppData)
            ppData[]
        end
    ))

    test_wrap_func(:vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR, :(
        function enumerate_physical_device_queue_family_performance_query_counters_khr(physical_device::PhysicalDevice, queue_family_index::Integer)::ResultTypes.Result{Tuple{Vector{PerformanceCounterKHR}, Vector{PerformanceCounterDescriptionKHR}},VulkanError}
            pCounterCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                @check vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device, queue_family_index, pCounterCount, C_NULL, C_NULL)
                pCounters = Vector{VkPerformanceCounterKHR}(undef, pCounterCount[])
                pCounterDescriptions = Vector{VkPerformanceCounterDescriptionKHR}(undef, pCounterCount[])
                @check vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device, queue_family_index, pCounterCount, pCounters, pCounterDescriptions)
            end
            (from_vk.(PerformanceCounterKHR, pCounters), from_vk.(PerformanceCounterDescriptionKHR, pCounterDescriptions))
        end
    ))

    test_wrap_func(:vkGetPipelineCacheData, :(
        function get_pipeline_cache_data(device::Device, pipeline_cache::PipelineCache)::ResultTypes.Result{Tuple{UInt,Ptr{Cvoid}},VulkanError}
            pDataSize = Ref{UInt}()
            @repeat_while_incomplete begin
                @check vkGetPipelineCacheData(device, pipeline_cache, pDataSize, C_NULL)
                pData = Libc.malloc(pDataSize[])
                @check vkGetPipelineCacheData(device, pipeline_cache, pDataSize, pData)
                if _return_code == VK_INCOMPLETE
                    Libc.free(pData)
                end
            end
            (pDataSize[], pData)
        end
    ))

    test_wrap_func(:vkWriteAccelerationStructuresPropertiesKHR, :(
        write_acceleration_structures_properties_khr(device::Device, acceleration_structures::AbstractArray, query_type::QueryType, data_size::Integer, data::Ptr{Cvoid}, stride::Integer)::ResultTypes.Result{Result, VulkanError} = @check vkWriteAccelerationStructuresPropertiesKHR(device, pointer_length(acceleration_structures), acceleration_structures, query_type, data_size, data, stride)
    ))

    test_wrap_func(:vkGetQueryPoolResults, :(
        get_query_pool_results(device::Device, query_pool::QueryPool, first_query::Integer, query_count::Integer, data_size::Integer, data::Ptr{Cvoid}, stride::Integer; flags = 0)::ResultTypes.Result{Result, VulkanError} = @check vkGetQueryPoolResults(device, query_pool, first_query, query_count, data_size, data, stride, flags)
    ))

    test_wrap_func(:vkGetFenceStatus, :(
        get_fence_status(device::Device, fence::Fence)::ResultTypes.Result{Result, VulkanError} = @check(vkGetFenceStatus(device, fence))
    ))

    test_wrap_func(:vkGetSwapchainImagesKHR, :(
        function get_swapchain_images_khr(device::Device, swapchain::SwapchainKHR)::ResultTypes.Result{Vector{Image}, VulkanError}
            pSwapchainImageCount = Ref{UInt32}()
            @repeat_while_incomplete begin
                    @check vkGetSwapchainImagesKHR(device, swapchain, pSwapchainImageCount, C_NULL)
                    pSwapchainImages = Vector{VkImage}(undef, pSwapchainImageCount[])
                    @check vkGetSwapchainImagesKHR(device, swapchain, pSwapchainImageCount, pSwapchainImages)
                end
            Image.(pSwapchainImages, identity, device)
        end
    ))

    @testset "Automatic reconstruction of create infos" begin
        test_extend_handle_constructor(:VkInstance, :(
            create_instance(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; allocator = C_NULL, next=C_NULL, flags=0, application_info=C_NULL) = create_instance(_InstanceCreateInfo(enabled_layer_names, enabled_extension_names; next, flags, application_info); allocator)
        ))

        test_extend_handle_constructor(:VkDebugReportCallbackEXT, :(
            create_debug_report_callback_ext(instance::Instance, pfn_callback::FunctionPtr, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = create_debug_report_callback_ext(instance, _DebugReportCallbackCreateInfoEXT(pfn_callback; next, flags, user_data), fun_ptr_create, fun_ptr_destroy; allocator)
            ),
            with_func_ptr=true,
        )
    end
end
