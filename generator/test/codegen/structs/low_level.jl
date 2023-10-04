@testset "Low-level" begin
    @testset "Definitions" begin
        test_ex(StructDefinition{false}(api.structs[:VkPhysicalDeviceProperties]), :(
            struct _PhysicalDeviceProperties <: VulkanStruct{false}
                vks::VkPhysicalDeviceProperties
            end))

        test_ex(StructDefinition{false}(api.structs[:VkApplicationInfo]), :(
            struct _ApplicationInfo <: VulkanStruct{true}
                vks::VkApplicationInfo
                deps::Vector{Any}
            end))

        test_ex(StructDefinition{false}(api.structs[:VkExtent2D]), :(
            struct _Extent2D <: VulkanStruct{false}
                vks::VkExtent2D
            end))

        test_ex(StructDefinition{false}(api.structs[:VkExternalBufferProperties]), :(
            struct _ExternalBufferProperties <: VulkanStruct{true}
                vks::VkExternalBufferProperties
                deps::Vector{Any}
            end
        ))

        test_ex(StructDefinition{false}(api.structs[:VkPipelineExecutableInternalRepresentationKHR]), :(
            struct _PipelineExecutableInternalRepresentationKHR <: VulkanStruct{true}
                vks::VkPipelineExecutableInternalRepresentationKHR
                deps::Vector{Any}
            end
        ))

        test_ex(StructDefinition{false}(api.structs[:VkDescriptorSetAllocateInfo]), :(
            struct _DescriptorSetAllocateInfo <: VulkanStruct{true}
                vks::VkDescriptorSetAllocateInfo
                deps::Vector{Any}
                descriptor_pool::DescriptorPool
            end
        ))

        test_ex(StructDefinition{false}(api.structs[:VkAccelerationStructureBuildGeometryInfoKHR]), :(
            struct _AccelerationStructureBuildGeometryInfoKHR <: VulkanStruct{true}
                vks::VkAccelerationStructureBuildGeometryInfoKHR
                deps::Vector{Any}
                src_acceleration_structure::OptionalPtr{AccelerationStructureKHR}
                dst_acceleration_structure::OptionalPtr{AccelerationStructureKHR}
            end
        ))
    end

    @testset "Friendly constructors" begin
        test_ex(Constructor(StructDefinition{false}(api.structs[:VkPhysicalDeviceProperties])), :(
            function _PhysicalDeviceProperties(api_version::VersionNumber, driver_version::VersionNumber, vendor_id::Integer, device_id::Integer, device_type::PhysicalDeviceType, device_name::AbstractString, pipeline_cache_uuid::NTuple{Int(VK_UUID_SIZE), UInt8}, limits::_PhysicalDeviceLimits, sparse_properties::_PhysicalDeviceSparseProperties)
                _PhysicalDeviceProperties(VkPhysicalDeviceProperties(to_vk(UInt32, api_version), to_vk(UInt32, driver_version), vendor_id, device_id, device_type, device_name, pipeline_cache_uuid, limits.vks, sparse_properties.vks))
            end
        ))

        test_ex(Constructor(StructDefinition{false}(api.structs[:VkInstanceCreateInfo])), :(
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
                vks = VkInstanceCreateInfo(structure_type(VkInstanceCreateInfo),
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

        test_ex(Constructor(StructDefinition{false}(api.structs[:VkSubpassSampleLocationsEXT])), :(
            function _SubpassSampleLocationsEXT(subpass_index::Integer, sample_locations_info::_SampleLocationsInfoEXT)
                _SubpassSampleLocationsEXT(VkSubpassSampleLocationsEXT(subpass_index, sample_locations_info.vks))
            end
        ))

        test_ex(Constructor(StructDefinition{false}(api.structs[:VkDebugUtilsMessengerCreateInfoEXT])), :(
            function _DebugUtilsMessengerCreateInfoEXT(message_severity::DebugUtilsMessageSeverityFlagEXT, message_type::DebugUtilsMessageTypeFlagEXT, pfn_user_callback::FunctionPtr; next = C_NULL, flags = 0, user_data = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                user_data = cconvert(Ptr{Cvoid}, user_data)
                deps = Any[next, user_data]
                vks = VkDebugUtilsMessengerCreateInfoEXT(structure_type(VkDebugUtilsMessengerCreateInfoEXT), unsafe_convert(Ptr{Cvoid}, next), flags, message_severity, message_type, pfn_user_callback, unsafe_convert(Ptr{Cvoid}, user_data))
                _DebugUtilsMessengerCreateInfoEXT(vks, deps)
            end
        ))

        test_ex(Constructor(StructDefinition{false}(api.structs[:VkDescriptorSetAllocateInfo])), :(
            function _DescriptorSetAllocateInfo(descriptor_pool, set_layouts::AbstractArray; next = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                set_layouts = cconvert(Ptr{VkDescriptorSetLayout}, set_layouts)
                deps = Any[next, set_layouts]
                vks = VkDescriptorSetAllocateInfo(structure_type(VkDescriptorSetAllocateInfo), unsafe_convert(Ptr{Cvoid}, next), descriptor_pool, pointer_length(set_layouts), unsafe_convert(Ptr{VkDescriptorSetLayout}, set_layouts))
                _DescriptorSetAllocateInfo(vks, deps, descriptor_pool)
            end
        ))

        test_ex(Constructor(StructDefinition{false}(api.structs[:VkPipelineShaderStageCreateInfo])), :(
            function _PipelineShaderStageCreateInfo(stage::ShaderStageFlag, _module, name::AbstractString; next = C_NULL, flags = 0, specialization_info = C_NULL)
                next = cconvert(Ptr{Cvoid}, next)
                name = cconvert(Cstring, name)
                specialization_info = cconvert(Ptr{VkSpecializationInfo}, specialization_info)
                deps = Any[next, name, specialization_info]
                vks = VkPipelineShaderStageCreateInfo(structure_type(VkPipelineShaderStageCreateInfo), unsafe_convert(Ptr{Cvoid}, next), flags, VkShaderStageFlagBits(stage.val), _module, unsafe_convert(Cstring, name), unsafe_convert(Ptr{VkSpecializationInfo}, specialization_info))
                _PipelineShaderStageCreateInfo(vks, deps, _module)
            end
        ))

        test_ex(Constructor(StructDefinition{false}(api.structs[:VkDescriptorImageInfo])), :(
            function _DescriptorImageInfo(sampler, image_view, image_layout::ImageLayout)
                _DescriptorImageInfo(VkDescriptorImageInfo(sampler, image_view, image_layout), sampler, image_view)
            end
        ))

        test_ex(Constructor(StructDefinition{false}(api.structs[:VkDescriptorSetLayoutBinding])), :(
            function _DescriptorSetLayoutBinding(binding::Integer, descriptor_type::DescriptorType, stage_flags::ShaderStageFlag; descriptor_count = 0, immutable_samplers = C_NULL)
                immutable_samplers = cconvert(Ptr{VkSampler}, immutable_samplers)
                deps = Any[immutable_samplers]
                vks = VkDescriptorSetLayoutBinding(binding, descriptor_type, descriptor_count, stage_flags, unsafe_convert(Ptr{VkSampler}, immutable_samplers))
                _DescriptorSetLayoutBinding(vks, deps)
            end
        ))

        test_ex(Constructor(StructDefinition{false}(api.structs[:VkXcbSurfaceCreateInfoKHR])), :(
            function _XcbSurfaceCreateInfoKHR(connection::Ptr{vk.xcb_connection_t}, window::vk.xcb_window_t; next = C_NULL, flags = 0)
                next = cconvert(Ptr{Cvoid}, next)
                connection = cconvert(Ptr{vk.xcb_connection_t}, connection)
                deps = Any[next, connection]
                vks = VkXcbSurfaceCreateInfoKHR(structure_type(VkXcbSurfaceCreateInfoKHR), unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{vk.xcb_connection_t}, connection), window)
                _XcbSurfaceCreateInfoKHR(vks, deps)
            end
        ))
    end

    @testset "Manual tweaks" begin
        test_ex(Constructor(StructDefinition{false}(api.structs[:VkWriteDescriptorSet])), :(
            function _WriteDescriptorSet(dst_set, dst_binding::Integer, dst_array_element::Integer, descriptor_type::DescriptorType, image_info::AbstractArray, buffer_info::AbstractArray, texel_buffer_view::AbstractArray; next = C_NULL, descriptor_count = max(pointer_length(image_info), pointer_length(buffer_info), pointer_length(texel_buffer_view)))
                next = cconvert(Ptr{Cvoid}, next)
                image_info = cconvert(Ptr{VkDescriptorImageInfo}, image_info)
                buffer_info = cconvert(Ptr{VkDescriptorBufferInfo}, buffer_info)
                texel_buffer_view = cconvert(Ptr{VkBufferView}, texel_buffer_view)
                deps = Any[next, image_info, buffer_info, texel_buffer_view]
                vks = VkWriteDescriptorSet(structure_type(VkWriteDescriptorSet), unsafe_convert(Ptr{Cvoid}, next), dst_set, dst_binding, dst_array_element, descriptor_count, descriptor_type, unsafe_convert(Ptr{VkDescriptorImageInfo}, image_info), unsafe_convert(Ptr{VkDescriptorBufferInfo}, buffer_info), unsafe_convert(Ptr{VkBufferView}, texel_buffer_view))
                _WriteDescriptorSet(vks, deps, dst_set)
            end
        ))
    end
end;
