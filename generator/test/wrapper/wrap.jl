test_ex(x, y) = @test prettify(x) == prettify(y)

test_wrap(f, value, ex) = test_ex(wrap(f(value)), ex)
test_wrap_handle(name, ex) = test_wrap(handle_by_name, name, ex)
test_wrap_struct(name, ex) = test_wrap(struct_by_name, name, ex)
test_wrap_func(name, ex) = test_wrap(func_by_name, name, ex)

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
end
