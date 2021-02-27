const VALIDATION_DEBUG_SIGNAL = Ref{Bool}(false)

function debug_callback(args...)
    VALIDATION_DEBUG_SIGNAL[] = true
    default_debug_callback(args...)
end

const debug_callback_c = @cfunction(debug_callback, UInt32, (VkDebugUtilsMessageSeverityFlagBitsEXT, VkDebugUtilsMessageTypeFlagBitsEXT, Ptr{vk.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))
const API_VERSION = v"1.2"
const VALIDATION_LAYER = "VK_LAYER_KHRONOS_validation"
const WITH_VALIDATION = Ref(false)
const INSTANCE_LAYERS = [
]
const INSTANCE_EXTENSIONS = [
]
const DEVICE_EXTENSIONS = [
]
const ENABLED_FEATURES = PhysicalDeviceFeatures(
)

let available_layers = enumerate_instance_layer_properties()
    if VALIDATION_LAYER ∈ getproperty.(available_layers, :layer_name)
        push!(INSTANCE_LAYERS, VALIDATION_LAYER)
        push!(INSTANCE_EXTENSIONS, "VK_EXT_debug_utils")
        WITH_VALIDATION[] = true
    else
        @warn "Validation layer not found."
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

    @testset "Bitmask flags" begin
        buffer = Buffer(device, 24, BUFFER_USAGE_INDIRECT_BUFFER_BIT, VK_SHARING_MODE_EXCLUSIVE, [0]; flags=BUFFER_CREATE_PROTECTED_BIT & BUFFER_CREATE_SPARSE_ALIASED_BIT)
        buffer_2 = Buffer(device, 24, BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, VkSharingMode(0), [0]; flags=0)
        @test buffer isa Buffer
        @test buffer_2 isa Buffer
    end
end

GC.gc()
