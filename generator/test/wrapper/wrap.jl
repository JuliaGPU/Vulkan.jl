test_ex(x, y) = @test prettify(x) == prettify(y)
test_ex(x::Dict, y) = @test prettify(to_expr(x)) == prettify(y)

test_wrap(f, value, ex; kwargs...) = test_ex(wrap(f(value); kwargs...), ex)
test_wrap_handle(name, ex) = test_wrap(handle_by_name, name, ex)
test_wrap_struct(name, ex) = test_wrap(struct_by_name, name, ex)
test_wrap_func(name, ex; kwargs...) = test_wrap(func_by_name, name, ex; kwargs...)
test_wrap_bitmask(name, ex) = test_wrap(bitmask_by_name, name, ex)
test_add_constructor(f, name, ex; kwargs...) = test_ex(add_constructor(f(name); kwargs...), ex)
test_add_constructors(f, name, exs; kwargs...) = test_ex.(add_constructors(f(name); kwargs...), exs)
test_struct_add_constructor(args...) = test_add_constructor(struct_by_name, args...)
test_handle_add_constructor(name, ex; kwargs...) = test_ex(first(add_constructors(handle_by_name(name); kwargs...)), ex)
test_handle_add_constructors(args...; kwargs...) = test_add_constructors(handle_by_name, args...; kwargs...)
test_extend_from_vk(name, ex) = test_ex(extend_from_vk(struct_by_name(name)), :(from_vk(T::Type{$(VulkanGen.remove_vk_prefix(name))}, x::$name) = $ex))
test_extend_handle_constructor(name, ex; kwargs...) = test_ex(extend_handle_constructor(create_func_no_batch(handle_by_name(name)); kwargs...), ex)

@testset "Wrapping" begin
    @testset "Handles" begin
        test_wrap_handle(:VkInstance, :(
            mutable struct Instance <: Handle
                vks::VkInstance
                refcount::RefCounter
                destructor
                Instance(vks::VkInstance, refcount::RefCounter) = new(vks, refcount, undef)
            end
        ))

        test_wrap_handle(:VkPhysicalDevice, :(
            mutable struct PhysicalDevice <: Handle
                vks::VkPhysicalDevice
                instance::Instance
                refcount::RefCounter
                destructor
                PhysicalDevice(vks::VkPhysicalDevice, instance::Instance, refcount::RefCounter) = new(vks, instance, refcount, undef)
            end
        ))

        test_wrap_handle(:VkDevice, :(
            mutable struct Device <: Handle
                vks::VkDevice
                physical_device::PhysicalDevice
                refcount::RefCounter
                destructor
                Device(vks::VkDevice, physical_device::PhysicalDevice, refcount::RefCounter) = new(vks, physical_device, refcount, undef)
            end
        ))
    end

    @testset "Structs" begin

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
            struct ApplicationInfo <: VulkanStruct{true}
                vks::VkApplicationInfo
                deps::Vector{Any}
            end))

        test_wrap_struct(:VkExtent2D, :(
            struct Extent2D <: VulkanStruct{false}
                vks::VkExtent2D
            end))

        test_wrap_struct(:VkExternalBufferProperties, :(
            struct ExternalBufferProperties <: ReturnedOnly
                s_type::VkStructureType
                p_next::Ptr{Cvoid}
                external_memory_properties::ExternalMemoryProperties
            end
        ))

        test_wrap_struct(:VkPipelineExecutableInternalRepresentationKHR, :(
            struct PipelineExecutableInternalRepresentationKHR <: ReturnedOnly
                s_type::VkStructureType
                p_next::Ptr{Cvoid}
                name::String
                description::String
                is_text::Bool
                data_size::UInt
                p_data::Ptr{Cvoid}
            end
        ))

        test_wrap_struct(:VkDescriptorSetAllocateInfo, :(
            struct DescriptorSetAllocateInfo <: VulkanStruct{true}
                vks::VkDescriptorSetAllocateInfo
                deps::Vector{Any}
                descriptor_pool::DescriptorPool
            end
        ))

        test_wrap_struct(:VkAccelerationStructureBuildGeometryInfoKHR, :(
            struct AccelerationStructureBuildGeometryInfoKHR <: VulkanStruct{true}
                vks::VkAccelerationStructureBuildGeometryInfoKHR
                deps::Vector{Any}
                src_acceleration_structure::OptionalPtr{AccelerationStructureKHR}
                dst_acceleration_structure::AccelerationStructureKHR
            end
        ))
    end

    @testset "API functions" begin
        test_wrap_func(:vkEnumeratePhysicalDevices, :(
            function enumerate_physical_devices(instance::Instance)::Result{Vector{PhysicalDevice},VulkanError}
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
            function enumerate_instance_version()::Result{VersionNumber,VulkanError}
                pApiVersion = Ref{UInt32}()
                @check vkEnumerateInstanceVersion(pApiVersion)
                from_vk(VersionNumber, pApiVersion[])
            end
        ))

        test_wrap_func(:vkEnumerateInstanceExtensionProperties, :(
            function enumerate_instance_extension_properties(; layer_name = C_NULL)::Result{Vector{ExtensionProperties},VulkanError}
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
            function get_generated_commands_memory_requirements_nv(device::Device, info::GeneratedCommandsMemoryRequirementsInfoNV)::MemoryRequirements2
                pMemoryRequirements = Ref{VkMemoryRequirements2}()
                vkGetGeneratedCommandsMemoryRequirementsNV(device, info, pMemoryRequirements)
                from_vk(MemoryRequirements2, pMemoryRequirements[])
            end
        ))

        test_wrap_func(:vkGetInstanceProcAddr, :(get_instance_proc_addr(name::AbstractString; instance = C_NULL)::FunctionPtr = vkGetInstanceProcAddr(instance, name)))
        test_wrap_func(:vkGetInstanceProcAddr, :(get_instance_proc_addr(name::AbstractString, fun_ptr::FunctionPtr; instance = C_NULL)::FunctionPtr = vkGetInstanceProcAddr(instance, name, fun_ptr)); with_func_ptr=true)

        test_wrap_func(:vkGetPhysicalDeviceSurfacePresentModesKHR, :(
            function get_physical_device_surface_present_modes_khr(physical_device::PhysicalDevice, surface::SurfaceKHR)::Result{Vector{PresentModeKHR},VulkanError}
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
            function get_rand_r_output_display_ext(physical_device::PhysicalDevice, dpy::vk.Display, rr_output::vk.RROutput)::Result{DisplayKHR,VulkanError}
                pDisplay = Ref{VkDisplayKHR}()
                @check vkGetRandROutputDisplayEXT(physical_device, Ref(dpy), rr_output, pDisplay)
                DisplayKHR(pDisplay[], identity, physical_device)
            end
        ))

        test_wrap_func(:vkRegisterDeviceEventEXT, :(
            function register_device_event_ext(device::Device, device_event_info::DeviceEventInfoEXT; allocator = C_NULL)::Result{Fence,VulkanError}
                pFence = Ref{VkFence}()
                @check vkRegisterDeviceEventEXT(device, device_event_info, allocator, pFence)
                Fence(pFence[], (x->destroy_fence(device, x; allocator)), device)
            end
        ))

        test_wrap_func(:vkCreateInstance, :(
            function create_instance(create_info::InstanceCreateInfo; allocator = C_NULL)::Result{Instance,VulkanError}
                pInstance = Ref{VkInstance}()
                @check vkCreateInstance(create_info, allocator, pInstance)
                Instance(pInstance[], x -> destroy_instance(x; allocator))
            end
        ))

        test_wrap_func(:vkCreateDebugReportCallbackEXT, :(
            function create_debug_report_callback_ext(instance::Instance, create_info::DebugReportCallbackCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)::Result{DebugReportCallbackEXT,VulkanError}
                pCallback = Ref{VkDebugReportCallbackEXT}()
                @check vkCreateDebugReportCallbackEXT(instance, create_info, allocator, pCallback, fun_ptr_create)
                DebugReportCallbackEXT(pCallback[], (x->destroy_debug_report_callback_ext(instance, x, fun_ptr_destroy; allocator)), instance)
            end
        ); with_func_ptr=true)

        test_wrap_func(:vkCreateGraphicsPipelines, :(
            function create_graphics_pipelines(device::Device, create_infos::AbstractArray; pipeline_cache = C_NULL, allocator = C_NULL)::Result{Tuple{Vector{Pipeline}, VkResult}, VulkanError}
                pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
                @check vkCreateGraphicsPipelines(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines)
                (Pipeline.(pPipelines, x -> destroy_pipeline(device, x; allocator), device), _return_code)
            end
        ))

        test_wrap_func(:vkAllocateDescriptorSets, :(
            function allocate_descriptor_sets(device::Device, allocate_info::DescriptorSetAllocateInfo)::Result{Vector{DescriptorSet},VulkanError}
                pDescriptorSets = Vector{VkDescriptorSet}(undef, allocate_info.vks.descriptorSetCount)
                @check vkAllocateDescriptorSets(device, allocate_info, pDescriptorSets)
                DescriptorSet.(pDescriptorSets, identity, getproperty(allocate_info, :descriptor_pool))
            end
        ))

        test_wrap_func(:vkMergePipelineCaches, :(
            merge_pipeline_caches(device::Device, dst_cache::PipelineCache, src_caches::AbstractArray)::Result{VkResult,VulkanError} = @check(vkMergePipelineCaches(device, dst_cache, pointer_length(src_caches), src_caches))
        ))

        test_wrap_func(:vkGetFenceFdKHR, :(
            function get_fence_fd_khr(device::Device, get_fd_info::FenceGetFdInfoKHR)::Result{Int,VulkanError}
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
            update_descriptor_sets(device::Device, descriptor_writes::AbstractArray, descriptor_copies::AbstractArray)::Cvoid = vkUpdateDescriptorSets(device, pointer_length(descriptor_writes), descriptor_writes, pointer_length(descriptor_copies), descriptor_copies)
        ))

        test_wrap_func(:vkCmdSetViewport, :(
            cmd_set_viewport(command_buffer::CommandBuffer, viewports::AbstractArray)::Cvoid = vkCmdSetViewport(command_buffer, 0, pointer_length(viewports), viewports)
        ))

        test_wrap_func(:vkCmdSetLineWidth, :(
            cmd_set_line_width(command_buffer::CommandBuffer, line_width::Real)::Cvoid = vkCmdSetLineWidth(command_buffer, line_width)
        ))

        test_wrap_func(:vkDestroyInstance, :(
            destroy_instance(instance::Instance; allocator = C_NULL)::Cvoid = vkDestroyInstance(instance, allocator)
        ))

        test_wrap_func(:vkMapMemory, :(
            function map_memory(device::Device, memory::DeviceMemory, offset::Integer, size::Integer; flags = 0)::Result{Ptr{Cvoid},VulkanError}
                ppData = Ref{Ptr{Cvoid}}()
                @check vkMapMemory(device, memory, offset, size, flags, ppData)
                ppData[]
            end
        ))

        test_wrap_func(:vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR, :(
            function enumerate_physical_device_queue_family_performance_query_counters_khr(physical_device::PhysicalDevice, queue_family_index::Integer)::Result{Tuple{Vector{PerformanceCounterKHR}, Vector{PerformanceCounterDescriptionKHR}},VulkanError}
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
            function get_pipeline_cache_data(device::Device, pipeline_cache::PipelineCache)::Result{Tuple{UInt,Ptr{Cvoid}},VulkanError}
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
            write_acceleration_structures_properties_khr(device::Device, acceleration_structures::AbstractArray, query_type::VkQueryType, data_size::Integer, data::Ptr{Cvoid}, stride::Integer)::Result{VkResult, VulkanError} = @check vkWriteAccelerationStructuresPropertiesKHR(device, pointer_length(acceleration_structures), acceleration_structures, query_type, data_size, data, stride)
        ))

        test_wrap_func(:vkGetQueryPoolResults, :(
            get_query_pool_results(device::Device, query_pool::QueryPool, first_query::Integer, query_count::Integer, data_size::Integer, data::Ptr{Cvoid}, stride::Integer; flags = 0)::Result{VkResult, VulkanError} = @check vkGetQueryPoolResults(device, query_pool, first_query, query_count, data_size, data, stride, flags)
        ))

        test_wrap_func(:vkGetFenceStatus, :(
            get_fence_status(device::Device, fence::Fence)::Result{VkResult, VulkanError} = @check(vkGetFenceStatus(device, fence))
        ))
    end

    @testset "Additional constructors" begin
        @testset "Struct constructors" begin
            test_struct_add_constructor(:VkInstanceCreateInfo, :(
                function InstanceCreateInfo(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; next=C_NULL, flags=0, application_info=C_NULL)
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
                                            pointer_length(enabled_layer_names),
                                            unsafe_convert(Ptr{Cstring}, enabled_layer_names),
                                            pointer_length(enabled_extension_names),
                                            unsafe_convert(Ptr{Cstring}, enabled_extension_names),
                                            )
                    InstanceCreateInfo(vks, deps)
                end
            ))

        test_struct_add_constructor(:VkSubpassSampleLocationsEXT, :(
            function SubpassSampleLocationsEXT(subpass_index::Integer, sample_locations_info::SampleLocationsInfoEXT)
                SubpassSampleLocationsEXT(VkSubpassSampleLocationsEXT(subpass_index, sample_locations_info.vks))
            end
        ))

        test_struct_add_constructor(:VkDebugUtilsMessengerCreateInfoEXT, :(
            function DebugUtilsMessengerCreateInfoEXT(message_severity::DebugUtilsMessageSeverityFlagEXT, message_type::DebugUtilsMessageTypeFlagEXT, pfn_user_callback::FunctionPtr; next = C_NULL, flags = 0, user_data = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                user_data = cconvert(Ptr{Cvoid}, user_data)
                deps = [next, user_data]
                vks = VkDebugUtilsMessengerCreateInfoEXT(VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, message_severity, message_type, pfn_user_callback, unsafe_convert(Ptr{Cvoid}, user_data))
                DebugUtilsMessengerCreateInfoEXT(vks, deps)
            end
        ))

        test_struct_add_constructor(:VkDescriptorSetAllocateInfo, :(
            function DescriptorSetAllocateInfo(descriptor_pool::DescriptorPool, set_layouts::AbstractArray; next = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                set_layouts = cconvert(Ptr{VkDescriptorSetLayout}, set_layouts)
                deps = [next, set_layouts]
                vks = VkDescriptorSetAllocateInfo(VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), descriptor_pool, pointer_length(set_layouts), unsafe_convert(Ptr{VkDescriptorSetLayout}, set_layouts))
                DescriptorSetAllocateInfo(vks, deps, descriptor_pool)
            end
        ))

        test_struct_add_constructor(:VkPipelineShaderStageCreateInfo, :(
            function PipelineShaderStageCreateInfo(stage::ShaderStageFlag, _module::ShaderModule, name::AbstractString; next = C_NULL, flags = 0, specialization_info = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                name = cconvert(Cstring, name)
                specialization_info = cconvert(Ptr{VkSpecializationInfo}, specialization_info)
                deps = [next, name, specialization_info]
                vks = VkPipelineShaderStageCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, VkShaderStageFlagBits(stage.val), _module, unsafe_convert(Cstring, name), unsafe_convert(Ptr{VkSpecializationInfo}, specialization_info))
                PipelineShaderStageCreateInfo(vks, deps, _module)
            end
        ))

        end

        @testset "Handle constructors" begin
            test_handle_add_constructor(:VkInstance, :(
                Instance(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; allocator = C_NULL, next=C_NULL, flags=0, application_info=C_NULL) = unwrap(create_instance(enabled_layer_names, enabled_extension_names; allocator, next, flags, application_info))
            ))

            test_handle_add_constructor(:VkDebugReportCallbackEXT, :(
                    DebugReportCallbackEXT(instance::Instance, pfn_callback::FunctionPtr, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) =    unwrap(create_debug_report_callback_ext(instance, pfn_callback, fun_ptr_create, fun_ptr_destroy; allocator, next, flags, user_data))
                ),
                with_func_ptr=true,
            )

            test_handle_add_constructor(:VkDeferredOperationKHR, :(
                DeferredOperationKHR(device::Device; allocator = C_NULL) = create_deferred_operation_khr(device; allocator)
            ))

            test_handle_add_constructors(:VkRenderPass, [
                :(
                    RenderPass(device::Device, attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0) = unwrap(create_render_pass(device, attachments, subpasses, dependencies; allocator, next, flags))
                ),
                :(
                    RenderPass(device::Device, attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray, correlated_view_masks::AbstractArray; allocator = C_NULL, next = C_NULL, flags = 0) = unwrap(create_render_pass_2(device, attachments, subpasses, dependencies, correlated_view_masks; allocator, next, flags))
                ),
            ])
        end

        @testset "Extended handle constructors" begin
            test_extend_handle_constructor(:VkInstance, :(
                create_instance(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; allocator = C_NULL, next=C_NULL, flags=0, application_info=C_NULL) = create_instance(InstanceCreateInfo(enabled_layer_names, enabled_extension_names; next, flags, application_info); allocator)
            ))

            test_extend_handle_constructor(:VkDebugReportCallbackEXT, :(
                create_debug_report_callback_ext(instance::Instance, pfn_callback::FunctionPtr, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = create_debug_report_callback_ext(instance, DebugReportCallbackCreateInfoEXT(pfn_callback; next, flags, user_data), fun_ptr_create, fun_ptr_destroy; allocator)
                ),
                with_func_ptr=true,
            )
        end
    end

    @testset "New methods for `from_vk`" begin
        test_extend_from_vk(:VkLayerProperties, :(
            T(from_vk(String, x.layerName), from_vk(VersionNumber, x.specVersion), from_vk(VersionNumber, x.implementationVersion), from_vk(String, x.description))
        ))

        test_extend_from_vk(:VkQueueFamilyProperties, :(
            T(x.queueFlags, x.queueCount, x.timestampValidBits, from_vk(Extent3D, x.minImageTransferGranularity))
        ))

        test_extend_from_vk(:VkPhysicalDeviceMemoryProperties, :(
            T(x.memoryTypeCount, from_vk.(MemoryType, x.memoryTypes), x.memoryHeapCount, from_vk.(MemoryHeap, x.memoryHeaps))
        ))

        test_extend_from_vk(:VkDisplayPlaneCapabilities2KHR, :(
            T(x.sType, x.pNext, from_vk(DisplayPlaneCapabilitiesKHR, x.capabilities))
        ))

        test_extend_from_vk(:VkDrmFormatModifierPropertiesListEXT, :(
            T(x.sType, x.pNext, unsafe_wrap(Vector{DrmFormatModifierPropertiesEXT}, x.pDrmFormatModifierProperties, x.drmFormatModifierCount; own = true))
        ))
    end

    @testset "Bitmask flags" begin
        test_wrap_bitmask(:VkQueryPipelineStatisticFlagBits, :(
            @bitmask_flag QueryPipelineStatisticFlag::UInt32 begin
                QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_VERTICES_BIT = 1
                QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_PRIMITIVES_BIT = 2
                QUERY_PIPELINE_STATISTIC_VERTEX_SHADER_INVOCATIONS_BIT = 4
                QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_INVOCATIONS_BIT = 8
                QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_PRIMITIVES_BIT = 16
                QUERY_PIPELINE_STATISTIC_CLIPPING_INVOCATIONS_BIT = 32
                QUERY_PIPELINE_STATISTIC_CLIPPING_PRIMITIVES_BIT = 64
                QUERY_PIPELINE_STATISTIC_FRAGMENT_SHADER_INVOCATIONS_BIT = 128
                QUERY_PIPELINE_STATISTIC_TESSELLATION_CONTROL_SHADER_PATCHES_BIT = 256
                QUERY_PIPELINE_STATISTIC_TESSELLATION_EVALUATION_SHADER_INVOCATIONS_BIT = 512
                QUERY_PIPELINE_STATISTIC_COMPUTE_SHADER_INVOCATIONS_BIT = 1024
            end
        ))

        test_wrap_bitmask(:VkSparseMemoryBindFlagBits, :(
            @bitmask_flag SparseMemoryBindFlag::UInt32 begin
                SPARSE_MEMORY_BIND_METADATA_BIT = 1
            end
        ))
    end
end
