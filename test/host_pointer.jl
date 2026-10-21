module HostPointerOutputTests
using Test, Vulkan
const CoreVK = Vulkan.VkCore
const observed = Ref((false, false))
const external_observed = Ref((false, false))

# This stub reads the same required input header as the driver/validation layer.
# It makes the regression check independent of GPU/extension availability.
function spy(device, handle_type, pointer, output)
    value = unsafe_load(output)
    observed[] = (value.sType == CoreVK.VK_STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT,
                  value.pNext == C_NULL)
    unsafe_store!(output, CoreVK.VkMemoryHostPointerPropertiesEXT(value.sType, value.pNext, UInt32(0x25)))
    Cint(0)
end
const SPY = @cfunction(spy, Cint,
    (CoreVK.VkDevice, Cint, Ptr{Cvoid}, Ptr{CoreVK.VkMemoryHostPointerPropertiesEXT}))
function external_spy(physical, info, output)
    value = unsafe_load(output)
    external_observed[] = (value.sType == CoreVK.VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES,
                           value.pNext == C_NULL)
    nothing
end
const EXTERNAL_SPY = @cfunction(external_spy, Cvoid,
    (CoreVK.VkPhysicalDevice, Ptr{CoreVK.VkPhysicalDeviceExternalBufferInfo},
     Ptr{CoreVK.VkExternalBufferProperties}))

@testset "host-pointer query initializes the required output header" begin
    result = unwrap(get_memory_host_pointer_properties_ext(CoreVK.VkDevice(C_NULL),
        EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT, Ptr{Cvoid}(C_NULL), SPY))
    @test observed[] == (true, true)
    @test result.memory_type_bits == UInt32(0x25)

    # Negative control: the old uninitialized/wrong header is detectable.
    wrong = Ref(CoreVK.VkMemoryHostPointerPropertiesEXT(
        CoreVK.VK_STRUCTURE_TYPE_APPLICATION_INFO, Ptr{Cvoid}(C_NULL), UInt32(0)))
    CoreVK.vkGetMemoryHostPointerPropertiesEXT(CoreVK.VkDevice(C_NULL),
        CoreVK.VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT, Ptr{Cvoid}(C_NULL), wrong, SPY)
    @test observed[] == (false, true)

    get_physical_device_external_buffer_properties(CoreVK.VkPhysicalDevice(C_NULL),
        PhysicalDeviceExternalBufferInfo(BUFFER_USAGE_TRANSFER_SRC_BIT,
            EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT), EXTERNAL_SPY)
    @test external_observed[] == (true, true)
end
end
