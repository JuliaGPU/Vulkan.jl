function spec_exists(f, value, args...)
    spec = f(value)
    !isnothing(spec) && spec == typeof(spec)(value, args...)
end

handle_exists(args...) = spec_exists(handle_by_name, args...)
bitmask_exists(args...) = spec_exists(bitmask_by_name, args...)
enum_exists(args...) = spec_exists(enum_by_name, args...)

create_func_exists(name, handle, _struct, index, batch) = spec_exists(x -> spec_by_field(spec_create_funcs, :func, x), func_by_name(name), handle, _struct, func_by_name(name).params[index], batch)
destroy_func_exists(name, handle, index, batch) = spec_exists(x -> spec_by_field(spec_destroy_funcs, :func, x), func_by_name(name), handle, func_by_name(name).params[index], batch)

@testset "Handles" begin
    @testset "Definition" begin
        @test handle_exists(:VkInstance, nothing, true)
        @test handle_exists(:VkDevice, :VkPhysicalDevice, true)
        @test handle_exists(:VkDeviceMemory, :VkDevice, false)
        @test !handle_exists(:VkDescriptorUpdateTemplateKHR, :VkDevice, false)
        @test handle_exists(:VkDescriptorUpdateTemplate, :VkDevice, false)
    end

    @testset "Creation" begin
        @test create_func_exists(:vkCreateInstance,
            handle_by_name(:VkInstance),
            struct_by_name(:VkInstanceCreateInfo),
            1,
            false)
        @test create_func_exists(:vkCreateGraphicsPipelines,
            handle_by_name(:VkPipeline),
            struct_by_name(:VkGraphicsPipelineCreateInfo),
            4,
            true)
        @test create_func_exists(:vkAllocateCommandBuffers,
            handle_by_name(:VkCommandBuffer),
            struct_by_name(:VkCommandBufferAllocateInfo),
            2,
            true)
        @test create_func_exists(:vkAllocateMemory,
            handle_by_name(:VkDeviceMemory),
            struct_by_name(:VkMemoryAllocateInfo),
            2,
            false)
    end

    @testset "Destruction" begin
        @test destroy_func_exists(:vkDestroyInstance,
            handle_by_name(:VkInstance),
            1,
            false)
        @test destroy_func_exists(:vkDestroyDevice,
            handle_by_name(:VkDevice),
            1,
            false)
        @test destroy_func_exists(:vkFreeDescriptorSets,
            handle_by_name(:VkDescriptorSet),
            4,
            true)
        @test destroy_func_exists(:vkDestroyPipeline,
            handle_by_name(:VkPipeline),
            2,
            false)
        @test destroy_func_exists(:vkFreeMemory,
            handle_by_name(:VkDeviceMemory),
            2,
            false)
    end

    # @test !vg.is_handle(:VkInstanceCreateInfo)
    # @test vg.is_handle_with_create_info(:VkInstance)
    # @test !vg.is_handle_with_create_info(:VkPhysicalDevice)
    # @test vg.is_handle_destructible(:VkDevice)
    # @test !vg.is_handle_destructible(:VkPhysicalDevice)
    # @test vg.is_handle_with_multiple_create_info(:VkPipeline)
    # @test !vg.is_handle_with_multiple_create_info(:VkPhysicalDevice)
    # @test issubset(filter(!vg.isalias, unique(vg.vulkan_creation_info.name)), vg.vulkan_handles.name)
end

@testset "Type queries" begin
    # @test vg.is_bitmask(:VkQueryPoolCreateFlags)
    # @test vg.is_enum(:VkDebugUtilsMessageSeverityFlagBitsEXT)
    # @test !vg.is_bitmask(:VkInstance)
    # @test vg.is_enum(:VkResult)
    # @test !vg.is_enum(:VkInstance)
end

@testset "Defaults" begin
    @test default(handle_by_name(:VkInstance)) == :C_NULL
    @test all(default.(struct_by_name(:VkInstanceCreateInfo).members) .== [0, :C_NULL, 0, :C_NULL, 0, :C_NULL, 0, :C_NULL])
end

@testset "Count variables to be filled (enumerations)" begin
    # @test vg.is_count_to_be_filled(:pPhysicalDeviceCount, :vkEnumeratePhysicalDevices)
    # @test vg.enumeration_command_count_variable(:vkEnumeratePhysicalDevices).name == :pPhysicalDeviceCount
    # @test vg.enumeration_command_array_variable(:vkEnumeratePhysicalDevices).name == :pPhysicalDevices
end

@testset "Aliases" begin
    @test isalias(:VkDescriptorUpdateTemplateKHR)
    @test hasalias(:VkDescriptorUpdateTemplate)
    @test isalias(:VkAccelerationStructureNV)
    @test !isalias(:VkAccelerationStructureKHR)
    @test follow_alias(:VkDescriptorUpdateTemplateKHR) == :VkDescriptorUpdateTemplate
    @test follow_alias(:VkPhysicalDeviceMemoryProperties2KHR) == :VkPhysicalDeviceMemoryProperties2
    @test follow_alias(:VkPhysicalDeviceMemoryProperties2) == :VkPhysicalDeviceMemoryProperties2
end
