using Test
using Vulkan

const VALIDATION_DEBUG_SIGNAL = Ref{Bool}(false)

function debug_callback(args...)
    VALIDATION_DEBUG_SIGNAL[] = true
    default_debug_callback(args...)
end

const debug_callback_c = @cfunction(debug_callback, UInt32, (VkDebugUtilsMessageSeverityFlagBitsEXT, VkDebugUtilsMessageTypeFlagBitsEXT, Ptr{vk.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))
const IMPL_VERSION = enumerate_instance_version()
const VALIDATION_LAYER = "VK_LAYER_KHRONOS_validation"
const WITH_VALIDATION = Ref(false)
const INSTANCE_LAYERS = String[
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

let available_layers = enumerate_instance_layer_properties()
    if VALIDATION_LAYER ∈ getproperty.(available_layers, :layer_name)
        push!(INSTANCE_LAYERS, VALIDATION_LAYER)
        WITH_VALIDATION[] = true
    end
end

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
            if WITH_VALIDATION[]
                @test VALIDATION_DEBUG_SIGNAL[]
            end
        end
    end
end

GC.gc()
