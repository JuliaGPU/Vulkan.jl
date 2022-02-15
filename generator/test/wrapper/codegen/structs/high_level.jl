@testset "High-level wrapper" begin
    @testset "Generated structs" begin
        test(StructDefinition{true}, struct_by_name, :VkPhysicalDeviceProperties, :(
            @auto_hash_equals struct PhysicalDeviceProperties <: HighLevelStruct
                api_version::VersionNumber
                driver_version::VersionNumber
                vendor_id::UInt32
                device_id::UInt32
                device_type::PhysicalDeviceType
                device_name::String
                pipeline_cache_uuid::String
                limits::PhysicalDeviceLimits
                sparse_properties::PhysicalDeviceSparseProperties
            end
        ))

        test(StructDefinition{true}, struct_by_name, :VkExternalBufferProperties, :(
            @auto_hash_equals struct ExternalBufferProperties <: HighLevelStruct
                next::Any
                external_memory_properties::ExternalMemoryProperties
            end
        ))

        test(StructDefinition{true}, struct_by_name, :VkPipelineExecutableInternalRepresentationKHR, :(
            @auto_hash_equals struct PipelineExecutableInternalRepresentationKHR <: HighLevelStruct
                next::Any
                name::String
                description::String
                is_text::Bool
                data_size::UInt
                data::OptionalPtr{Ptr{Cvoid}}
            end
        ))

        test(StructDefinition{true}, struct_by_name, :VkApplicationInfo, :(
            @auto_hash_equals struct ApplicationInfo <: HighLevelStruct
                next::Any
                application_name::String
                application_version::VersionNumber
                engine_name::String
                engine_version::VersionNumber
                api_version::VersionNumber
            end
        ))

        test(StructDefinition{true}, struct_by_name, :VkInstanceCreateInfo, :(
            @auto_hash_equals struct InstanceCreateInfo <: HighLevelStruct
                next::Any
                flags::UInt32
                application_info::OptionalPtr{ApplicationInfo}
                enabled_layer_names::Vector{String}
                enabled_extension_names::Vector{String}
            end
        ))

        test(StructDefinition{true}, struct_by_name, :VkXcbSurfaceCreateInfoKHR, :(
            @auto_hash_equals struct XcbSurfaceCreateInfoKHR <: HighLevelStruct
                next::Any
                flags::UInt32
                connection::Ptr{vk.xcb_connection_t}
                window::vk.xcb_window_t
            end
        ))
    end

    @testset "Conversion to low-level structs" begin
        test_ex(
            Constructor(
                StructDefinition{false}(struct_by_name(:VkApplicationInfo)),
                StructDefinition{true}(struct_by_name(:VkApplicationInfo)),
            ),
            :(
                _ApplicationInfo(x::ApplicationInfo) = _ApplicationInfo(x.application_version, x.engine_version, x.api_version; x.next, x.application_name, x.engine_name)
            ),
        )
        test_ex(
            Constructor(
                StructDefinition{false}(struct_by_name(:VkInstanceCreateInfo)),
                StructDefinition{true}(struct_by_name(:VkInstanceCreateInfo)),
            ),
            :(
                _InstanceCreateInfo(x::InstanceCreateInfo) = _InstanceCreateInfo(x.enabled_layer_names, x.enabled_extension_names; x.next, x.flags, application_info = convert_nonnull(_ApplicationInfo, x.application_info))
            ),
        )
    end

    @testset "Additional constructor" begin
        test(Constructor, StructDefinition{true}(StructDefinition{false}(struct_by_name(:VkApplicationInfo))), :(
            ApplicationInfo(application_version::VersionNumber, engine_version::VersionNumber, api_version::VersionNumber; next = C_NULL, application_name = "", engine_name = "") = ApplicationInfo(next, application_name, application_version, engine_name, engine_version, api_version)
        ))
    end

    @testset "`Core -> High-level constructors`" begin
        function test_constructor_core_to_hl(name, with_next_types, body)
            spec = struct_by_name(name)
            def = StructDefinition{true}(struct_by_name(name))
            cons = Constructor(def, spec)
            expected = :($(VulkanGen.struct_name(name, true))(x::$name) = $body)
            with_next_types && push!(expected.args[1].args, :(next_types::Type...))
            test_ex(cons, expected)
        end

        test_constructor_core_to_hl(:VkLayerProperties, false, :(
            LayerProperties(from_vk(String, x.layerName), from_vk(VersionNumber, x.specVersion), from_vk(VersionNumber, x.implementationVersion), from_vk(String, x.description))
        ))

        test_constructor_core_to_hl(:VkQueueFamilyProperties, false, :(
            QueueFamilyProperties(x.queueFlags, x.queueCount, x.timestampValidBits, Extent3D(x.minImageTransferGranularity))
        ))

        test_constructor_core_to_hl(:VkPhysicalDeviceMemoryProperties, false, :(
            PhysicalDeviceMemoryProperties(x.memoryTypeCount, MemoryType.(x.memoryTypes), x.memoryHeapCount, MemoryHeap.(x.memoryHeaps))
        ))

        test_constructor_core_to_hl(:VkDisplayPlaneCapabilities2KHR, true, :(
            DisplayPlaneCapabilities2KHR(load_next_chain(x.pNext, next_types...), DisplayPlaneCapabilitiesKHR(x.capabilities))
        ))

        test_constructor_core_to_hl(:VkDrmFormatModifierPropertiesListEXT, true, :(
            DrmFormatModifierPropertiesListEXT(load_next_chain(x.pNext, next_types...), unsafe_wrap(Vector{DrmFormatModifierPropertiesEXT}, x.pDrmFormatModifierProperties, x.drmFormatModifierCount; own = true))
        ))

        test_constructor_core_to_hl(:VkPhysicalDeviceGroupProperties, true, :(
            PhysicalDeviceGroupProperties(load_next_chain(x.pNext, next_types...), x.physicalDeviceCount, PhysicalDevice.(x.physicalDevices), from_vk(Bool, x.subsetAllocation))
        ))

        test_constructor_core_to_hl(:VkAccelerationStructureVersionInfoKHR, true, :(
            AccelerationStructureVersionInfoKHR(load_next_chain(x.pNext, next_types...), unsafe_wrap(Vector{UInt8}, x.pVersionData, 2VK_UUID_SIZE; own = true))
        ))
    end

    @testset "`Low-level -> High-level constructors`" begin
        function test_constructor_ll_to_hl(name, ex)
            s = struct_by_name(name)
            def_hl = StructDefinition{true}(s)
            def_ll = StructDefinition{false}(s)
            c = Constructor(def_hl, def_ll)
            test_ex(c, ex)
        end
        test_constructor_ll_to_hl(:VkPhysicalDeviceFeatures2, :(
            function PhysicalDeviceFeatures2(x::_PhysicalDeviceFeatures2, next_types::Type...)
                (; deps) = x
                GC.@preserve deps PhysicalDeviceFeatures2(x.vks, next_types...)
            end
        ))
        test_constructor_ll_to_hl(:VkPhysicalDeviceFeatures, :(
            PhysicalDeviceFeatures(x::_PhysicalDeviceFeatures) = PhysicalDeviceFeatures(x.vks)
        ))
    end
end
