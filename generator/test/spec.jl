function test_spec(f, value, args...)
    spec = f(value)
    @test spec == typeof(spec)(value, args...)
end

test_handle(args...) = test_spec(handle_by_name, args...)
test_bitmask(args...) = test_spec(bitmask_by_name, args...)
test_enum(args...) = test_spec(enum_by_name, args...)
test_constant(args...) = test_spec(constant_by_name, args...)
test_struct(name, type, is_returnedonly, extends, members) = test_spec(
    struct_by_name,
    name,
    type,
    is_returnedonly,
    extends,
    StructVector(map(x -> SpecStructMember(name, x...), members)),
)
test_union(name, types, selectors, is_returnedonly) = test_spec(union_by_name, name, types, selectors, is_returnedonly)
test_func(name, type, return_type, render_pass_compatibility, queue_compatibility, params, success_codes, error_codes) =
    test_spec(
        func_by_name,
        name,
        type,
        return_type,
        render_pass_compatibility,
        queue_compatibility,
        StructVector(map(x -> SpecFuncParam(name, x...), params)),
        success_codes,
        error_codes,
    )

test_create_func(name, handle, _struct, index, batch) = test_spec(
    x -> spec_by_field(spec_create_funcs, :func, x),
    func_by_name(name),
    handle,
    _struct,
    func_by_name(name).params[index],
    batch,
)
test_destroy_func(name, handle, index, batch) = test_spec(
    x -> spec_by_field(spec_destroy_funcs, :func, x),
    func_by_name(name),
    handle,
    func_by_name(name).params[index],
    batch,
)

@testset "Vulkan Specification" begin
    @testset "Handles" begin
        @testset "Definition" begin
            test_handle(:VkInstance, nothing, true)
            test_handle(:VkDevice, :VkPhysicalDevice, true)
            test_handle(:VkDeviceMemory, :VkDevice, false)
            @test isnothing(handle_by_name(:VkDescriptorUpdateTemplateKHR))
            test_handle(:VkDescriptorUpdateTemplate, :VkDevice, false)
        end

        @testset "Creation" begin
            test_create_func(
                :vkCreateInstance,
                handle_by_name(:VkInstance),
                struct_by_name(:VkInstanceCreateInfo),
                1,
                false,
            )
            test_create_func(
                :vkCreateGraphicsPipelines,
                handle_by_name(:VkPipeline),
                struct_by_name(:VkGraphicsPipelineCreateInfo),
                4,
                true,
            )
            test_create_func(
                :vkAllocateCommandBuffers,
                handle_by_name(:VkCommandBuffer),
                struct_by_name(:VkCommandBufferAllocateInfo),
                2,
                true,
            )
            test_create_func(
                :vkAllocateMemory,
                handle_by_name(:VkDeviceMemory),
                struct_by_name(:VkMemoryAllocateInfo),
                2,
                false,
            )
        end

        @testset "Destruction" begin
            test_destroy_func(:vkDestroyInstance, handle_by_name(:VkInstance), 1, false)
            test_destroy_func(:vkDestroyDevice, handle_by_name(:VkDevice), 1, false)
            test_destroy_func(:vkFreeDescriptorSets, handle_by_name(:VkDescriptorSet), 4, true)
            test_destroy_func(:vkDestroyPipeline, handle_by_name(:VkPipeline), 2, false)
            test_destroy_func(:vkFreeMemory, handle_by_name(:VkDeviceMemory), 2, false)
        end
    end

    @testset "Defaults" begin
        @test default(handle_by_name(:VkInstance)) == :C_NULL
        @test all(
            default.(struct_by_name(:VkInstanceCreateInfo).members) .==
            [0, :C_NULL, 0, :C_NULL, 0, :C_NULL, 0, :C_NULL],
        )
    end

    @testset "Constants" begin
        test_constant(:VkBool32, :UInt32)
        test_constant(:VkFlags, :UInt32)
        test_constant(:VkPipelineCreateFlags, :VkFlags)

        @test follow_constant(constant_by_name(:VkPipelineCreateFlags)) ==
              follow_constant(:VkPipelineCreateFlags) ==
              :UInt32
        @test follow_constant(:UInt32) == :UInt32
        @test follow_constant(:(Ptr{UInt32})) == :(Ptr{UInt32})
    end

    @testset "Structs" begin
        test_struct(
            :VkApplicationInfo,
            GENERIC_INFO,
            false,
            [],
            [
                (:sType, :VkStructureType, false, false, REQUIRED, nothing, [], true),
                (:pNext, :(Ptr{Cvoid}), true, false, OPTIONAL, nothing, [], true),
                (:pApplicationName, :Cstring, true, false, OPTIONAL, nothing, [], true),
                (:applicationVersion, :UInt32, false, false, REQUIRED, nothing, [], true),
                (:pEngineName, :Cstring, true, false, OPTIONAL, nothing, [], true),
                (:engineVersion, :UInt32, false, false, REQUIRED, nothing, [], true),
                (:apiVersion, :UInt32, false, false, REQUIRED, nothing, [], true),
            ],
        )
        test_struct(
            :VkPipelineViewportCoarseSampleOrderStateCreateInfoNV,
            CREATE_INFO,
            false,
            [:VkPipelineViewportStateCreateInfo],
            [
                (:sType, :VkStructureType, false, false, REQUIRED, nothing, [], true),
                (:pNext, :(Ptr{Cvoid}), true, false, OPTIONAL, nothing, [], true),
                (:sampleOrderType, :VkCoarseSampleOrderTypeNV, false, false, REQUIRED, nothing, [], true),
                (:customSampleOrderCount, :UInt32, false, false, OPTIONAL, nothing, [:pCustomSampleOrders], true),
                (
                    :pCustomSampleOrders,
                    :(Ptr{VkCoarseSampleOrderCustomNV}),
                    true,
                    false,
                    REQUIRED,
                    :customSampleOrderCount,
                    [],
                    true,
                ),
            ],
        )
        test_struct(
            :VkPhysicalDeviceShadingRateImageFeaturesNV,
            DATA,
            false,
            [:VkPhysicalDeviceFeatures2, :VkDeviceCreateInfo],
            [
                (:sType, :VkStructureType, false, false, REQUIRED, nothing, [], true),
                (:pNext, :(Ptr{Cvoid}), false, false, OPTIONAL, nothing, [], true),
                (:shadingRateImage, :VkBool32, false, false, REQUIRED, nothing, [], true),
                (:shadingRateCoarseSampleOrder, :VkBool32, false, false, REQUIRED, nothing, [], true),
            ],
        )
        test_struct(
            :VkDescriptorSetLayoutBindingFlagsCreateInfo,
            CREATE_INFO,
            false,
            [:VkDescriptorSetLayoutCreateInfo],
            [
                (:sType, :VkStructureType, false, false, REQUIRED, nothing, [], true),
                (:pNext, :(Ptr{Cvoid}), true, false, OPTIONAL, nothing, [], true),
                (:bindingCount, :UInt32, false, false, OPTIONAL, nothing, [:pBindingFlags], true),
                (:pBindingFlags, :(Ptr{VkDescriptorBindingFlags}), true, false, POINTER_REQUIRED, :bindingCount, [], true),
            ],
        ),
        test_struct(
            :VkInstanceCreateInfo,
            CREATE_INFO,
            false,
            [],
            [
                (:sType, :VkStructureType, false, false, REQUIRED, nothing, [], true),
                (:pNext, :(Ptr{Cvoid}), true, false, OPTIONAL, nothing, [], true),
                (:flags, :VkInstanceCreateFlags, false, false, OPTIONAL, nothing, [], true),
                (:pApplicationInfo, :(Ptr{VkApplicationInfo}), true, false, OPTIONAL, nothing, [], true),
                (:enabledLayerCount, :UInt32, false, false, OPTIONAL, nothing, [:ppEnabledLayerNames], true),
                (:ppEnabledLayerNames, :(Ptr{Cstring}), true, false, REQUIRED, :enabledLayerCount, [], true),
                (:enabledExtensionCount, :UInt32, false, false, OPTIONAL, nothing, [:ppEnabledExtensionNames], true),
                (:ppEnabledExtensionNames, :(Ptr{Cstring}), true, false, REQUIRED, :enabledExtensionCount, [], true),
            ],
        )
        test_struct(
            :VkDisplayPlaneInfo2KHR,
            GENERIC_INFO,
            false,
            [],
            [
                (:sType, :VkStructureType, false, false, REQUIRED, nothing, [], true),
                (:pNext, :(Ptr{Cvoid}), true, false, OPTIONAL, nothing, [], true),
                (:mode, :VkDisplayModeKHR, false, true, REQUIRED, nothing, [], true),
                (:planeIndex, :UInt32, false, false, REQUIRED, nothing, [], true),
            ],
        )
        test_struct(
            :VkTransformMatrixKHR,
            DATA,
            false,
            [],
            [(:matrix, :(NTuple{3,NTuple{4,Float32}}), false, false, REQUIRED, nothing, [], true)],
        )
    end

    @testset "Unions" begin
        test_union(:VkClearColorValue, [:(NTuple{4,Float32}), :(NTuple{4,Int32}), :(NTuple{4,UInt32})], [], false)

        test_union(
            :VkPerformanceValueDataINTEL,
            [:UInt32, :UInt64, :Float32, :VkBool32, :Cstring],
            [
                :VK_PERFORMANCE_VALUE_TYPE_UINT32_INTEL,
                :VK_PERFORMANCE_VALUE_TYPE_UINT64_INTEL,
                :VK_PERFORMANCE_VALUE_TYPE_FLOAT_INTEL,
                :VK_PERFORMANCE_VALUE_TYPE_BOOL_INTEL,
                :VK_PERFORMANCE_VALUE_TYPE_STRING_INTEL,
            ],
            false,
        )
    end

    @testset "Functions" begin
        test_func(
            :vkCreateInstance,
            CREATE,
            :VkResult,
            [],
            [],
            [
                (:pCreateInfo, :(Ptr{VkInstanceCreateInfo}), true, false, REQUIRED, nothing, [], true),
                (:pAllocator, :(Ptr{VkAllocationCallbacks}), true, false, OPTIONAL, nothing, [], true),
                (:pInstance, :(Ptr{VkInstance}), false, false, REQUIRED, nothing, [], true),
            ],
            [:VK_SUCCESS],
            [
                :VK_ERROR_OUT_OF_HOST_MEMORY,
                :VK_ERROR_OUT_OF_DEVICE_MEMORY,
                :VK_ERROR_INITIALIZATION_FAILED,
                :VK_ERROR_LAYER_NOT_PRESENT,
                :VK_ERROR_EXTENSION_NOT_PRESENT,
                :VK_ERROR_INCOMPATIBLE_DRIVER,
            ],
        )
        test_func(
            :vkCmdBindPipeline,
            COMMAND,
            :Cvoid,
            [RenderPassInside(), RenderPassOutside()],
            [QueueGraphics(), QueueCompute()],
            [
                (:commandBuffer, :VkCommandBuffer, false, true, REQUIRED, nothing, [], true),
                (:pipelineBindPoint, :VkPipelineBindPoint, false, false, REQUIRED, nothing, [], true),
                (:pipeline, :VkPipeline, false, false, REQUIRED, nothing, [], true),
            ],
            [],
            [],
        )
    end

    @testset "Aliases" begin
        @test isalias(:VkDescriptorUpdateTemplateKHR)
        @test hasalias(:VkDescriptorUpdateTemplate)
        @test isalias(:VkImageStencilUsageCreateInfoEXT)
        @test !isalias(:VkImageStencilUsageCreateInfo)

        @test follow_alias(:VkDescriptorUpdateTemplateKHR) == :VkDescriptorUpdateTemplate
        @test follow_alias(:VkPhysicalDeviceMemoryProperties2KHR) == :VkPhysicalDeviceMemoryProperties2
        @test follow_alias(:VkPhysicalDeviceMemoryProperties2) == :VkPhysicalDeviceMemoryProperties2
    end

    @testset "Miscellaneous" begin
        @test length_chain(children(func_by_name(:vkAllocateDescriptorSets))[3], "pAllocateInfo->descriptorSetCount") ==
              [
            children(func_by_name(:vkAllocateDescriptorSets))[2],
            children(struct_by_name(:VkDescriptorSetAllocateInfo))[4],
        ]
    end
end
