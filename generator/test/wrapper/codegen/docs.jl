test_doc(obj, doc) = @test Documented(obj).p[:docstring] == doc

@testset "Generated documentation" begin
    @testset "Low-level structs" begin
        test_doc(
            Constructor(StructDefinition{false}(struct_by_name(:VkExtent2D))),
            """
                _Extent2D(width::Integer, height::Integer)

            Arguments:
            - `width::Integer`
            - `height::Integer`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkExtent2D.html)
            """,
        )

        test_doc(
            Constructor(StructDefinition{false}(struct_by_name(:VkInstanceCreateInfo))),
            """
                _InstanceCreateInfo(enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; next = C_NULL, flags = 0, application_info = C_NULL)

            Arguments:
            - `enabled_layer_names::AbstractArray{<:AbstractString}`
            - `enabled_extension_names::AbstractArray{<:AbstractString}`
            - `next`: defaults to `C_NULL`
            - `flags`: defaults to `0`
            - `application_info`: defaults to `C_NULL`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkInstanceCreateInfo.html)
            """,
        )

        test_doc(
            Constructor(StructDefinition{false}(struct_by_name(:VkSubmitInfo2KHR))),
            """
                _SubmitInfo2KHR(wait_semaphore_infos::AbstractArray{_SemaphoreSubmitInfoKHR}, command_buffer_infos::AbstractArray{_CommandBufferSubmitInfoKHR}, signal_semaphore_infos::AbstractArray{_SemaphoreSubmitInfoKHR}; next = C_NULL, flags = 0)

            Extension: VK\\\\_KHR\\\\_synchronization2

            Arguments:
            - `wait_semaphore_infos::AbstractArray{_SemaphoreSubmitInfoKHR}`
            - `command_buffer_infos::AbstractArray{_CommandBufferSubmitInfoKHR}`
            - `signal_semaphore_infos::AbstractArray{_SemaphoreSubmitInfoKHR}`
            - `next`: defaults to `C_NULL`
            - `flags`: defaults to `0`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkSubmitInfo2KHR.html)
            """,
        )
    end

    @testset "High-level structs" begin
        test_doc(StructDefinition{true}(struct_by_name(:VkInstanceCreateInfo)),
            """
            High-level wrapper for VkInstanceCreateInfo.

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkInstanceCreateInfo.html)
            """,
        )
    end

    @testset "API functions" begin
        test_doc(
            APIFunction(func_by_name(:vkEnumerateInstanceExtensionProperties), false),
            """
                _enumerate_instance_extension_properties(; layer_name = C_NULL)::ResultTypes.Result{Vector{_ExtensionProperties}, VulkanError}

            Return codes:
            - Error:
              - `ERROR_OUT_OF_HOST_MEMORY`
              - `ERROR_OUT_OF_DEVICE_MEMORY`
              - `ERROR_LAYER_NOT_PRESENT`

            Arguments:
            - `layer_name`: defaults to `C_NULL`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkEnumerateInstanceExtensionProperties.html)
            """,
        )

        test_doc(
            APIFunction(func_by_name(:vkDestroyDevice), false),
            """
                _destroy_device(device; allocator = C_NULL)::Cvoid

            Arguments:
            - `device` (externsync)
            - `allocator`: defaults to `C_NULL`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkDestroyDevice.html)
            """,
        )

        test_doc(
            APIFunction(func_by_name(:vkGetPipelineCacheData), false),
            """
                _get_pipeline_cache_data(device, pipeline_cache)::ResultTypes.Result{Tuple{UInt, Ptr{Cvoid}}, VulkanError}

            Return codes:
            - Error:
              - `ERROR_OUT_OF_HOST_MEMORY`
              - `ERROR_OUT_OF_DEVICE_MEMORY`

            Arguments:
            - `device`
            - `pipeline_cache`

            !!! warning
                The pointer returned by this function holds memory owned by Julia. It is therefore **your** responsibility to free it after use (e.g. with `Libc.free`).

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkGetPipelineCacheData.html)
            """,
        )

        test_doc(
            APIFunction(func_by_name(:vkWriteAccelerationStructuresPropertiesKHR), false),
            """
                _write_acceleration_structures_properties_khr(device, acceleration_structures::AbstractArray{AccelerationStructureKHR}, query_type::QueryType, data_size::Integer, data::Ptr{Cvoid}, stride::Integer)::ResultTypes.Result{Result, VulkanError}

            Extension: VK\\\\_KHR\\\\_acceleration\\\\_structure

            Return codes:
            - Error:
              - `ERROR_OUT_OF_HOST_MEMORY`
              - `ERROR_OUT_OF_DEVICE_MEMORY`

            Arguments:
            - `device`
            - `acceleration_structures::AbstractArray{AccelerationStructureKHR}`
            - `query_type::QueryType`
            - `data_size::Integer`
            - `data::Ptr{Cvoid}` (must be a valid pointer with `data_size` bytes)
            - `stride::Integer`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkWriteAccelerationStructuresPropertiesKHR.html)
            """,
        )

        test_doc(
            APIFunction(func_by_name(:vkEnumerateInstanceLayerProperties), false),
            """
                _enumerate_instance_layer_properties()::ResultTypes.Result{Vector{_LayerProperties}, VulkanError}

            Return codes:
            - Error:
              - `ERROR_OUT_OF_HOST_MEMORY`
              - `ERROR_OUT_OF_DEVICE_MEMORY`

            [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkEnumerateInstanceLayerProperties.html)
            """,
        )
    end
end
