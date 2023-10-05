docstring(obj) = Documented(obj).p[:docstring]

@testset "Generated documentation" begin
    @testset "Low-level structs" begin
        @test docstring(StructDefinition{false}(api.structs[:VkExtent2D])) ==
            """
            Intermediate wrapper for VkExtent2D.

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkExtent2D.html)
            """

        @test docstring(Constructor(StructDefinition{false}(api.structs[:VkExtent2D]))) ==
            """
            Arguments:
            - `width::UInt32`
            - `height::UInt32`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkExtent2D.html)
            """

        @test docstring(Constructor(StructDefinition{false}(api.structs[:VkInstanceCreateInfo]))) ==
            """
            Arguments:
            - `enabled_layer_names::Vector{String}`
            - `enabled_extension_names::Vector{String}`
            - `next::Ptr{Cvoid}`: defaults to `C_NULL`
            - `flags::InstanceCreateFlag`: defaults to `0`
            - `application_info::_ApplicationInfo`: defaults to `C_NULL`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkInstanceCreateInfo.html)
            """

        @test docstring(Constructor(StructDefinition{false}(api.structs[:VkSubmitInfo2]))) ==
            """
            Arguments:
            - `wait_semaphore_infos::Vector{_SemaphoreSubmitInfo}`
            - `command_buffer_infos::Vector{_CommandBufferSubmitInfo}`
            - `signal_semaphore_infos::Vector{_SemaphoreSubmitInfo}`
            - `next::Ptr{Cvoid}`: defaults to `C_NULL`
            - `flags::SubmitFlag`: defaults to `0`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkSubmitInfo2.html)
            """
    end

    @testset "High-level structs" begin
        @test docstring(StructDefinition{true}(api.structs[:VkInstanceCreateInfo])) ==
            """
            High-level wrapper for VkInstanceCreateInfo.

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkInstanceCreateInfo.html)
            """
        @test docstring(Constructor(StructDefinition{true}(api.structs[:VkInstanceCreateInfo]))) ==
            """
            Arguments:
            - `enabled_layer_names::Vector{String}`
            - `enabled_extension_names::Vector{String}`
            - `next::Any`: defaults to `C_NULL`
            - `flags::InstanceCreateFlag`: defaults to `0`
            - `application_info::ApplicationInfo`: defaults to `C_NULL`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkInstanceCreateInfo.html)
            """

        @test docstring(APIFunction(api.constructors[:vkCreateInstance], false)) ==
            """
            Return codes:
            - `SUCCESS`
            - `ERROR_OUT_OF_HOST_MEMORY`
            - `ERROR_OUT_OF_DEVICE_MEMORY`
            - `ERROR_INITIALIZATION_FAILED`
            - `ERROR_LAYER_NOT_PRESENT`
            - `ERROR_EXTENSION_NOT_PRESENT`
            - `ERROR_INCOMPATIBLE_DRIVER`

            Arguments:
            - `enabled_layer_names::Vector{String}`
            - `enabled_extension_names::Vector{String}`
            - `allocator::_AllocationCallbacks`: defaults to `C_NULL`
            - `next::Ptr{Cvoid}`: defaults to `C_NULL`
            - `flags::InstanceCreateFlag`: defaults to `0`
            - `application_info::_ApplicationInfo`: defaults to `C_NULL`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkCreateInstance.html)
            """
    end

    @testset "API functions" begin
        @testset "Intermediate functions" begin
            @test docstring(APIFunction(api.functions[:vkEnumerateInstanceExtensionProperties], false)) ==
                """
                Return codes:
                - `SUCCESS`
                - `ERROR_OUT_OF_HOST_MEMORY`
                - `ERROR_OUT_OF_DEVICE_MEMORY`
                - `ERROR_LAYER_NOT_PRESENT`

                Arguments:
                - `layer_name::String`: defaults to `C_NULL`

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkEnumerateInstanceExtensionProperties.html)
                """

            @test docstring(APIFunction(api.functions[:vkDestroyDevice], false)) ==
                """
                Arguments:
                - `device::Device` (externsync)
                - `allocator::_AllocationCallbacks`: defaults to `C_NULL`

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkDestroyDevice.html)
                """

            @test docstring(APIFunction(api.functions[:vkGetPipelineCacheData], false)) ==
                """
                Return codes:
                - `SUCCESS`
                - `ERROR_OUT_OF_HOST_MEMORY`
                - `ERROR_OUT_OF_DEVICE_MEMORY`

                Arguments:
                - `device::Device`
                - `pipeline_cache::PipelineCache`

                !!! warning
                    The pointer returned by this function holds memory owned by Julia. It is therefore **your** responsibility to free it after use (e.g. with `Libc.free`).

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkGetPipelineCacheData.html)
                """

            @test docstring(APIFunction(api.functions[:vkWriteAccelerationStructuresPropertiesKHR], false)) ==
                """
                Extension: VK\\\\_KHR\\\\_acceleration\\\\_structure

                Return codes:
                - `SUCCESS`
                - `ERROR_OUT_OF_HOST_MEMORY`
                - `ERROR_OUT_OF_DEVICE_MEMORY`

                Arguments:
                - `device::Device`
                - `acceleration_structures::Vector{AccelerationStructureKHR}`
                - `query_type::QueryType`
                - `data_size::UInt`
                - `data::Ptr{Cvoid}` (must be a valid pointer with `data_size` bytes)
                - `stride::UInt`

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkWriteAccelerationStructuresPropertiesKHR.html)
                """

            @test docstring(APIFunction(api.functions[:vkEnumerateInstanceLayerProperties], false)) ==
                """
                Return codes:
                - `SUCCESS`
                - `ERROR_OUT_OF_HOST_MEMORY`
                - `ERROR_OUT_OF_DEVICE_MEMORY`

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkEnumerateInstanceLayerProperties.html)
                """
        end

        @testset "High-level functions" begin
            @test docstring(VulkanGen.promote_hl(APIFunction(api.functions[:vkWriteAccelerationStructuresPropertiesKHR], false))) ==
                """
                Extension: VK\\\\_KHR\\\\_acceleration\\\\_structure

                Return codes:
                - `SUCCESS`
                - `ERROR_OUT_OF_HOST_MEMORY`
                - `ERROR_OUT_OF_DEVICE_MEMORY`

                Arguments:
                - `device::Device`
                - `acceleration_structures::Vector{AccelerationStructureKHR}`
                - `query_type::QueryType`
                - `data_size::UInt`
                - `data::Ptr{Cvoid}` (must be a valid pointer with `data_size` bytes)
                - `stride::UInt`

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkWriteAccelerationStructuresPropertiesKHR.html)
                """

            @test docstring(VulkanGen.promote_hl(APIFunction(api.functions[:vkEnumerateInstanceLayerProperties], false))) ==
                """
                Return codes:
                - `SUCCESS`
                - `ERROR_OUT_OF_HOST_MEMORY`
                - `ERROR_OUT_OF_DEVICE_MEMORY`

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkEnumerateInstanceLayerProperties.html)
                """

            @test docstring(VulkanGen.promote_hl(APIFunction(api.functions[:vkAcquireNextImageKHR], false))) ==
                """
                Extension: VK\\\\_KHR\\\\_swapchain

                Return codes:
                - `SUCCESS`
                - `TIMEOUT`
                - `NOT_READY`
                - `SUBOPTIMAL_KHR`
                - `ERROR_OUT_OF_HOST_MEMORY`
                - `ERROR_OUT_OF_DEVICE_MEMORY`
                - `ERROR_DEVICE_LOST`
                - `ERROR_OUT_OF_DATE_KHR`
                - `ERROR_SURFACE_LOST_KHR`
                - `ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT`

                Arguments:
                - `device::Device`
                - `swapchain::SwapchainKHR` (externsync)
                - `timeout::UInt64`
                - `semaphore::Semaphore`: defaults to `C_NULL` (externsync)
                - `fence::Fence`: defaults to `C_NULL` (externsync)

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkAcquireNextImageKHR.html)
                """

            @test docstring(VulkanGen.promote_hl(APIFunction(api.functions[:vkGetDescriptorSetLayoutSupport], false))) ==
                """
                Arguments:
                - `device::Device`
                - `create_info::DescriptorSetLayoutCreateInfo`
                - `next_types::Type...`: types of members to initialize and include as part of the `next` chain

                [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkGetDescriptorSetLayoutSupport.html)
                """
        end
    end
    @testset "Handles" begin
        @test docstring(Constructor(HandleDefinition(api.handles[:VkInstance]), VulkanGen.promote_hl(APIFunction(api.constructors[:vkCreateInstance], false)))) ==
            """
            Arguments:
            - `enabled_layer_names::Vector{String}`
            - `enabled_extension_names::Vector{String}`
            - `allocator::AllocationCallbacks`: defaults to `C_NULL`
            - `next::Any`: defaults to `C_NULL`
            - `flags::InstanceCreateFlag`: defaults to `0`
            - `application_info::ApplicationInfo`: defaults to `C_NULL`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkCreateInstance.html)
            """
    end
end;
