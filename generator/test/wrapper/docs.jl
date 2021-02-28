test_doc(generated, docstring) = @test deconstruct(generated)[:docstring] == docstring
test_doc(spec::SpecFunc, docstring) = test_doc(document(spec, wrap(spec)), docstring)
test_doc(spec::SpecStruct, docstring) = test_doc(document(spec, add_constructor(spec)), docstring)

@testset "Generated documentation" begin
    test_doc(struct_by_name(:VkExtent2D),
    """

        Extent2D(width::Integer, height::Integer)

    Arguments:
    - `width::Integer`
    - `height::Integer`

    """
    )

    test_doc(struct_by_name(:VkInstanceCreateInfo),
    """

        InstanceCreateInfo(enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; next = C_NULL, flags = 0, application_info = C_NULL)

    Arguments:
    - `enabled_layer_names::AbstractArray{<:AbstractString}`
    - `enabled_extension_names::AbstractArray{<:AbstractString}`
    - `next`: defaults to `C_NULL`
    - `flags`: defaults to `0`
    - `application_info`: defaults to `C_NULL`

    """
    )

    test_doc(func_by_name(:vkEnumerateInstanceExtensionProperties),
    """

        enumerate_instance_extension_properties(; layer_name = C_NULL)::Result{Tuple{Vector{ExtensionProperties}, VkResult}, VulkanError}

    Return codes:
    - Success:
      - `VK_SUCCESS`
      - `VK_INCOMPLETE`
    - Error:
      - `VK_ERROR_OUT_OF_HOST_MEMORY`
      - `VK_ERROR_OUT_OF_DEVICE_MEMORY`
      - `VK_ERROR_LAYER_NOT_PRESENT`

    Arguments:
    - `layer_name`: defaults to `C_NULL`

    """)

    test_doc(func_by_name(:vkDestroyDevice),
    """

        destroy_device(device::Device; allocator = C_NULL)::Cvoid

    Arguments:
    - `device::Device` (externsync)
    - `allocator`: defaults to `C_NULL`

    """
    )
end
