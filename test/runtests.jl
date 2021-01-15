using Test
using Vulkan

const VALIDATION_DEBUG_SIGNAL = Ref{Bool}(false)

function debug_callback(args...)
    VALIDATION_DEBUG_SIGNAL[] = true
    default_debug_callback(args...)
end

const debug_callback_c = @cfunction(debug_callback, UInt32, (VkDebugUtilsMessageSeverityFlagBitsEXT, VkDebugUtilsMessageTypeFlagBitsEXT, Ptr{vk.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))
const IMPL_VERSION = enumerate_instance_version()
const INSTANCE_LAYERS = [
    "VK_LAYER_KHRONOS_validation",
]
const INSTANCE_EXTENSIONS = [
    "VK_EXT_debug_utils",
    "VK_KHR_surface",
]
const DEVICE_EXTENSIONS = [
    "VK_KHR_swapchain",
]
const ENABLED_FEATURES = physical_device_features(
)

@testset "Vulkan tests" begin
    include("init.jl")

    @testset "Utilities" begin
        @testset "Function pointers" begin
            @test function_pointer(instance, "vkEnumeratePhysicalDevices") == get_instance_proc_addr("vkEnumeratePhysicalDevices"; instance)
            @test function_pointer(device, "vkQueueWaitIdle") == get_device_proc_addr(device, "vkQueueWaitIdle")
        end
    end

    @testset "Debugging" begin
        @testset "Validation" begin
            @test VALIDATION_DEBUG_SIGNAL[]
        end
    end
end

GC.gc()

# include("examples.jl")
# using .VulkanAppExample

# VulkanAppExample.main()
