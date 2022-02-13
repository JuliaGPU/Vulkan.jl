@testset "Low-level" begin
    @testset "Definitions" begin
        test(StructDefinition{false}, struct_by_name, :VkPhysicalDeviceProperties, :(
            struct PhysicalDeviceProperties <: ReturnedOnly
                api_version::VersionNumber
                driver_version::VersionNumber
                vendor_id::UInt32
                device_id::UInt32
                device_type::PhysicalDeviceType
                device_name::String
                pipeline_cache_uuid::String
                limits::PhysicalDeviceLimits
                sparse_properties::PhysicalDeviceSparseProperties
            end))

        test(StructDefinition{false}, struct_by_name, :VkApplicationInfo, :(
            struct _ApplicationInfo <: VulkanStruct{true}
                vks::VkApplicationInfo
                deps::Vector{Any}
            end))

        test(StructDefinition{false}, struct_by_name, :VkExtent2D, :(
            struct _Extent2D <: VulkanStruct{false}
                vks::VkExtent2D
            end))

        test(StructDefinition{false}, struct_by_name, :VkExternalBufferProperties, :(
            struct ExternalBufferProperties <: ReturnedOnly
                s_type::StructureType
                next::Ptr{Cvoid}
                external_memory_properties::ExternalMemoryProperties
            end
        ))

        test(StructDefinition{false}, struct_by_name, :VkPipelineExecutableInternalRepresentationKHR, :(
            struct PipelineExecutableInternalRepresentationKHR <: ReturnedOnly
                s_type::StructureType
                next::Ptr{Cvoid}
                name::String
                description::String
                is_text::Bool
                data_size::UInt
                data::Ptr{Cvoid}
            end
        ))

        test(StructDefinition{false}, struct_by_name, :VkDescriptorSetAllocateInfo, :(
            struct _DescriptorSetAllocateInfo <: VulkanStruct{true}
                vks::VkDescriptorSetAllocateInfo
                deps::Vector{Any}
                descriptor_pool::DescriptorPool
            end
        ))

        test(StructDefinition{false}, struct_by_name, :VkAccelerationStructureBuildGeometryInfoKHR, :(
            struct _AccelerationStructureBuildGeometryInfoKHR <: VulkanStruct{true}
                vks::VkAccelerationStructureBuildGeometryInfoKHR
                deps::Vector{Any}
                src_acceleration_structure::OptionalPtr{AccelerationStructureKHR}
                dst_acceleration_structure::OptionalPtr{AccelerationStructureKHR}
            end
        ))
    end

    @testset "Friendly constructors" begin
        test(Constructor, StructDefinition{false}(struct_by_name(:VkInstanceCreateInfo)), :(
            function _InstanceCreateInfo(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; next=C_NULL, flags=0, application_info=C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                application_info = cconvert(Ptr{VkApplicationInfo}, application_info)
                enabled_layer_names = cconvert(Ptr{Cstring}, enabled_layer_names)
                enabled_extension_names = cconvert(Ptr{Cstring}, enabled_extension_names)
                deps = Any[
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
                _InstanceCreateInfo(vks, deps)
            end
        ))

        test(Constructor, StructDefinition{false}(struct_by_name(:VkSubpassSampleLocationsEXT)), :(
            function _SubpassSampleLocationsEXT(subpass_index::Integer, sample_locations_info::_SampleLocationsInfoEXT)
                _SubpassSampleLocationsEXT(VkSubpassSampleLocationsEXT(subpass_index, sample_locations_info.vks))
            end
        ))

        test(Constructor, StructDefinition{false}(struct_by_name(:VkDebugUtilsMessengerCreateInfoEXT)), :(
            function _DebugUtilsMessengerCreateInfoEXT(message_severity::DebugUtilsMessageSeverityFlagEXT, message_type::DebugUtilsMessageTypeFlagEXT, pfn_user_callback::FunctionPtr; next = C_NULL, flags = 0, user_data = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                user_data = cconvert(Ptr{Cvoid}, user_data)
                deps = Any[next, user_data]
                vks = VkDebugUtilsMessengerCreateInfoEXT(VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, message_severity, message_type, pfn_user_callback, unsafe_convert(Ptr{Cvoid}, user_data))
                _DebugUtilsMessengerCreateInfoEXT(vks, deps)
            end
        ))

        test(Constructor, StructDefinition{false}(struct_by_name(:VkDescriptorSetAllocateInfo)), :(
            function _DescriptorSetAllocateInfo(descriptor_pool, set_layouts::AbstractArray; next = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                set_layouts = cconvert(Ptr{VkDescriptorSetLayout}, set_layouts)
                deps = Any[next, set_layouts]
                vks = VkDescriptorSetAllocateInfo(VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), descriptor_pool, pointer_length(set_layouts), unsafe_convert(Ptr{VkDescriptorSetLayout}, set_layouts))
                _DescriptorSetAllocateInfo(vks, deps, descriptor_pool)
            end
        ))

        test(Constructor, StructDefinition{false}(struct_by_name(:VkPipelineShaderStageCreateInfo)), :(
            function _PipelineShaderStageCreateInfo(stage::ShaderStageFlag, _module, name::AbstractString; next = C_NULL, flags = 0, specialization_info = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                name = cconvert(Cstring, name)
                specialization_info = cconvert(Ptr{VkSpecializationInfo}, specialization_info)
                deps = Any[next, name, specialization_info]
                vks = VkPipelineShaderStageCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, VkShaderStageFlagBits(stage.val), _module, unsafe_convert(Cstring, name), unsafe_convert(Ptr{VkSpecializationInfo}, specialization_info))
                _PipelineShaderStageCreateInfo(vks, deps, _module)
            end
        ))

        test(Constructor, StructDefinition{false}(struct_by_name(:VkDescriptorImageInfo)), :(
            function _DescriptorImageInfo(sampler, image_view, image_layout::ImageLayout)
                _DescriptorImageInfo(VkDescriptorImageInfo(sampler, image_view, image_layout), sampler, image_view)
            end
        ))

        test(Constructor, StructDefinition{false}(struct_by_name(:VkDescriptorSetLayoutBinding)), :(
            function _DescriptorSetLayoutBinding(binding::Integer, descriptor_type::DescriptorType, stage_flags::ShaderStageFlag; descriptor_count = 0, immutable_samplers = C_NULL)
                immutable_samplers = cconvert(Ptr{VkSampler}, immutable_samplers)
                deps = Any[immutable_samplers]
                vks = VkDescriptorSetLayoutBinding(binding, descriptor_type, descriptor_count, stage_flags, unsafe_convert(Ptr{VkSampler}, immutable_samplers))
                _DescriptorSetLayoutBinding(vks, deps)
            end
        ))

        test(Constructor, StructDefinition{false}(struct_by_name(:VkXcbSurfaceCreateInfoKHR)), :(
            function _XcbSurfaceCreateInfoKHR(connection::Ptr{vk.xcb_connection_t}, window::vk.xcb_window_t; next = C_NULL, flags = 0)
                next = cconvert(Ptr{Cvoid}, next)
                connection = cconvert(Ptr{vk.xcb_connection_t}, connection)
                deps = Any[next, connection]
                vks = VkXcbSurfaceCreateInfoKHR(VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{vk.xcb_connection_t}, connection), window)
                _XcbSurfaceCreateInfoKHR(vks, deps)
            end
        ))
    end

    @testset "Manual tweaks" begin
        test(Constructor, StructDefinition{false}(struct_by_name(:VkWriteDescriptorSet)), :(
            function _WriteDescriptorSet(dst_set, dst_binding::Integer, dst_array_element::Integer, descriptor_type::DescriptorType, image_info::AbstractArray, buffer_info::AbstractArray, texel_buffer_view::AbstractArray; next = C_NULL, descriptor_count = max(pointer_length(image_info), pointer_length(buffer_info), pointer_length(texel_buffer_view)))
                next = cconvert(Ptr{Cvoid}, next)
                image_info = cconvert(Ptr{VkDescriptorImageInfo}, image_info)
                buffer_info = cconvert(Ptr{VkDescriptorBufferInfo}, buffer_info)
                texel_buffer_view = cconvert(Ptr{VkBufferView}, texel_buffer_view)
                deps = Any[next, image_info, buffer_info, texel_buffer_view]
                vks = VkWriteDescriptorSet(VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET, unsafe_convert(Ptr{Cvoid}, next), dst_set, dst_binding, dst_array_element, descriptor_count, descriptor_type, unsafe_convert(Ptr{VkDescriptorImageInfo}, image_info), unsafe_convert(Ptr{VkDescriptorBufferInfo}, buffer_info), unsafe_convert(Ptr{VkBufferView}, texel_buffer_view))
                _WriteDescriptorSet(vks, deps, dst_set)
            end
        ))
    end
end
