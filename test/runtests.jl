using Test
using Vulkan

const VALIDATION_DEBUG_SIGNAL = Ref{Bool}(false)

function debug_callback(args...)
    VALIDATION_DEBUG_SIGNAL[] = true
    default_debug_callback(args...)
end

@static if get(ENV, "JULIA_GITHUB_ACTIONS_CI", "OFF") == "ON"
    using SwiftShader_jll
    ENV["VK_ICD_FILENAMES"] = joinpath(dirname(SwiftShader_jll.libvulkan), "vk_swiftshader_icd.json")
end

const debug_callback_c = @cfunction(debug_callback, UInt32, (VkDebugUtilsMessageSeverityFlagBitsEXT, VkDebugUtilsMessageTypeFlagBitsEXT, Ptr{vk.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))
const API_VERSION = v"1.2"
const VALIDATION_LAYER = "VK_LAYER_KHRONOS_validation"
const WITH_VALIDATION = Ref(false)
const INSTANCE_LAYERS = String[
]
const INSTANCE_EXTENSIONS = String[
]
const DEVICE_EXTENSIONS = String[
]
const ENABLED_FEATURES = physical_device_features(
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
end

GC.gc()
