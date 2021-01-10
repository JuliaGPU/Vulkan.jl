test_ex(x, y) = @test prettify(x) == prettify(y)

test_wrap(f, value, ex) = test_ex(wrap(f(value)), ex)
test_wrap_handle(name, ex) = test_wrap(handle_by_name, name, ex)
test_wrap_struct(name, ex) = test_wrap(struct_by_name, name, ex)
test_wrap_func(name, ex) = test_wrap(func_by_name, name, ex)
test_add_constructor(name, ex) = test_ex(add_constructor(struct_by_name(name)), ex)

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

    test_wrap_struct(:VkExternalBufferProperties, :(
        struct ExternalBufferProperties <: ReturnedOnly
            s_type::VkStructureType
            p_next::Ptr{Cvoid}
            external_memory_properties::ExternalMemoryProperties
        end
    ))

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
            vkGetGeneratedCommandsMemoryRequirementsNV(device, info, pMemoryRequirements)
            from_vk(MemoryRequirements2, pMemoryRequirements[])
        end
    ))

    test_wrap_func(:vkGetInstanceProcAddr, :(get_instance_proc_addr(name::AbstractString; instance = C_NULL) = vkGetInstanceProcAddr(instance, name)))

    test_wrap_func(:vkGetPhysicalDeviceSurfacePresentModesKHR, :(
        function get_physical_device_surface_present_modes_khr(physical_device::PhysicalDevice, surface::SurfaceKHR)
            pPresentModeCount = Ref{UInt32}(0)
            @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, C_NULL)
            pPresentModes = Vector{VkPresentModeKHR}(undef, pPresentModeCount[])
            @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, pPresentModes)
            pPresentModes
        end
    ))

    test_wrap_func(:vkGetRandROutputDisplayEXT, :(
        function get_rand_r_output_display_ext(physical_device::PhysicalDevice, dpy::Display, rr_output::RROutput)
            pDisplay = Ref{VkDisplayKHR}()
            @check vkGetRandROutputDisplayEXT(physical_device, Ref(dpy), rr_output, pDisplay)
            DisplayKHR(pDisplay[])
        end
    ))

    test_wrap_func(:vkRegisterDeviceEventEXT, :(
        function register_device_event_ext(device::Device, device_event_info::DeviceEventInfoEXT; allocator = C_NULL)
            pFence = Ref{VkFence}()
            @check vkRegisterDeviceEventEXT(device, device_event_info, allocator, pFence)
            Fence(pFence[])
        end
    ))

    test_wrap_func(:vkCreateInstance, :(
        function create_instance(create_info::InstanceCreateInfo; allocator = C_NULL)
            pInstance = Ref{VkInstance}()
            @check vkCreateInstance(create_info, allocator, pInstance)
            Instance(pInstance[])
        end
    ))
    test_wrap_func(:vkMergePipelineCaches, :(
        merge_pipeline_caches(device::Device, dst_cache::PipelineCache, src_caches::AbstractArray{<:PipelineCache}) = @check(vkMergePipelineCaches(device, dst_cache, length(src_caches), src_caches))
    ))

    test_wrap_func(:vkGetFenceFdKHR, :(
        function get_fence_fd_khr(device::Device, get_fd_info::FenceGetFdInfoKHR)
            pFd = Ref{Int}()
            @check vkGetFenceFdKHR(device, get_fd_info, pFd)
            pFd[]
        end
    ))

    test_wrap_func(:vkGetDeviceGroupPeerMemoryFeatures, :(
        function get_device_group_peer_memory_features(device::Device, heap_index::Integer, local_device_index::Integer, remote_device_index::Integer)
            pPeerMemoryFeatures = Ref{VkPeerMemoryFeatureFlags}()
            vkGetDeviceGroupPeerMemoryFeatures(device, heap_index, local_device_index, remote_device_index, pPeerMemoryFeatures)
            pPeerMemoryFeatures[]
        end
    ))

    test_wrap_func(:vkUpdateDescriptorSets, :(
        update_descriptor_sets(device::Device, descriptor_writes::AbstractArray{<:WriteDescriptorSet}, descriptor_copies::AbstractArray{<:CopyDescriptorSet}) = vkUpdateDescriptorSets(device, length(descriptor_writes), descriptor_writes, length(descriptor_copies), descriptor_copies)
    ))

    test_wrap_func(:vkCmdSetViewport, :(
        cmd_set_viewport(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}) = vkCmdSetViewport(command_buffer, 0, length(viewports), viewports)
    ))

    test_wrap_func(:vkCmdSetLineWidth, :(
        cmd_set_line_width(command_buffer::CommandBuffer, line_width::Real) = vkCmdSetLineWidth(command_buffer, line_width)
    ))

    test_wrap_func(:vkMapMemory, :(
        function map_memory(device::Device, memory::DeviceMemory, offset::Integer, size::Integer; flags = 0)
            ppData = Ref{Ptr{Cvoid}}()
            @check vkMapMemory(device, memory, offset, size, flags, ppData)
            from_vk(AbstractArray, ppData[])
        end
    ))

    test_add_constructor(:VkInstanceCreateInfo, :(
        function InstanceCreateInfo(enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; next=C_NULL, flags=0, application_info=C_NULL)
            next = cconvert(Ptr{Cvoid}, next)
            application_info = cconvert(Ptr{VkApplicationInfo}, application_info)
            enabled_layer_names = cconvert(Ptr{Cstring}, enabled_layer_names)
            enabled_extension_names = cconvert(Ptr{Cstring}, enabled_extension_names)
            deps = [
                next,
                application_info,
                enabled_layer_names,
                enabled_extension_names
            ]
            vks = VkInstanceCreateInfo(VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
                                       unsafe_convert(Ptr{Cvoid}, next),
                                       flags,
                                       unsafe_convert(Ptr{VkApplicationInfo}, application_info),
                                       length(enabled_layer_names),
                                       unsafe_convert(Ptr{Cstring}, enabled_layer_names),
                                       length(enabled_extension_names),
                                       unsafe_convert(Ptr{Cstring}, enabled_extension_names),
                                       )
            InstanceCreateInfo(vks, deps)
        end
    ))
    
    test_add_constructor(:VkSubpassSampleLocationsEXT, :(
        function SubpassSampleLocationsEXT(subpass_index::Integer, sample_locations_info::SampleLocationsInfoEXT)
            SubpassSampleLocationsEXT(VkSubpassSampleLocationsEXT(subpass_index, sample_locations_info.vks))
        end
    ))
end
