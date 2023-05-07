const CALLBACK_DEBUG_SIGNAL = Ref(false)

function debug_callback(args...)
    CALLBACK_DEBUG_SIGNAL[] = true
    default_debug_callback(args...)
end

const debug_callback_c = @cfunction(debug_callback, UInt32, (DebugUtilsMessageSeverityFlagEXT, DebugUtilsMessageTypeFlagEXT, Ptr{VkCore.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))
const API_VERSION = v"1.3"
const VALIDATION_LAYER = "VK_LAYER_KHRONOS_validation"

const INSTANCE_LAYERS = String[
]
const INSTANCE_EXTENSIONS = String[
]
const DEVICE_EXTENSIONS = String[
]
const ENABLED_FEATURES = PhysicalDeviceFeatures(
)

let available_layers = unwrap(enumerate_instance_layer_properties())
    if VALIDATION_LAYER ∈ getproperty.(available_layers, :layer_name)
        push!(INSTANCE_LAYERS, VALIDATION_LAYER)
        true
    else
        @warn "Validation layer not found."
        false
    end
end

const WITH_DEBUG = let available_extensions = unwrap(enumerate_instance_extension_properties())
    if "VK_EXT_debug_utils" ∈ getproperty.(available_extensions, :extension_name)
        push!(INSTANCE_EXTENSIONS, "VK_EXT_debug_utils")
        true
    else
        @warn "VK_EXT_debug_utils not supported"
        false
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
            if WITH_DEBUG
                @test CALLBACK_DEBUG_SIGNAL[]
            end
        end
    end

    @testset "Bitmask flags" begin
        buffer = Buffer(device, 24, BUFFER_USAGE_INDIRECT_BUFFER_BIT, SHARING_MODE_EXCLUSIVE, [0]; flags=BUFFER_CREATE_PROTECTED_BIT & BUFFER_CREATE_SPARSE_ALIASED_BIT)
        buffer_2 = Buffer(device, 24, BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT, SHARING_MODE_EXCLUSIVE, [0]; flags=0)
        @test buffer isa Buffer
        @test buffer_2 isa Buffer
    end

    @testset "Buffers" begin
        command_pool = CommandPool(device, 0)
        cbuffer = first(unwrap(allocate_command_buffers(device, CommandBufferAllocateInfo(command_pool, COMMAND_BUFFER_LEVEL_PRIMARY, 1))))
        @test cbuffer isa CommandBuffer

        buffer = Buffer(device, 100, BUFFER_USAGE_TRANSFER_DST_BIT, SHARING_MODE_EXCLUSIVE, [])
        @test buffer isa Buffer
        @test get_buffer_memory_requirements_2_khr ≠ get_buffer_memory_requirements_2
    end

    @testset "Introspection" begin
        @test Vk.hl_type(VkCore.VkPhysicalDeviceFeatures) == PhysicalDeviceFeatures
        @test Vk.intermediate_type(VkCore.VkPhysicalDeviceFeatures) == Vk.intermediate_type(PhysicalDeviceFeatures) == _PhysicalDeviceFeatures
        @test Vk.core_type(PhysicalDeviceFeatures) == VkCore.VkPhysicalDeviceFeatures
        @test Vk.structure_type(PhysicalDeviceFeatures2) ==
            Vk.structure_type(_PhysicalDeviceFeatures2) ==
            Vk.structure_type(VkCore.VkPhysicalDeviceFeatures2) ==
            VkCore.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2
    end

    @testset "Next chains" begin
        # Initialization of chained empty structs.
        f1 = Vk.initialize(_PhysicalDeviceFeatures2, _PhysicalDeviceVulkan12Features, _PhysicalDeviceVulkanMemoryModelFeatures)
        @test f1.vks.pNext ≠ C_NULL
        @test Base.unsafe_load(Base.unsafe_convert(Ptr{VkCore.VkPhysicalDeviceVulkan12Features}, f1.vks.pNext)).pNext ≠ C_NULL

        f1 = Vk.initialize(PhysicalDeviceFeatures2, PhysicalDeviceVulkan12Features, PhysicalDeviceVulkanMemoryModelFeatures)
        @test f1.next isa PhysicalDeviceVulkan12Features
        @test f1.next.next isa PhysicalDeviceVulkanMemoryModelFeatures

        # Chaining/unchaining of structs.
        chain_args = [PhysicalDeviceFeatures2(PhysicalDeviceFeatures()), PhysicalDeviceVulkan12Features(), PhysicalDeviceVulkanMemoryModelFeatures(false, false, false)]
        chained = Vk.chain(chain_args...)
        @test Vk.unchain(chained) == chain_args
        @test f1 == chained

        # Conversion to core data structures and back.
        f2 = _PhysicalDeviceFeatures2(f1)
        f3 = Base.unsafe_convert(VkCore.VkPhysicalDeviceFeatures2, f2)
        f4 = PhysicalDeviceFeatures2(f3, PhysicalDeviceVulkan12Features, PhysicalDeviceVulkanMemoryModelFeatures)
        @test f1 == f4

        # Queries with optional chain members.
        feats = get_physical_device_features_2(device.physical_device, PhysicalDeviceVulkan12Features, PhysicalDeviceVulkanMemoryModelFeatures)
        @test feats isa PhysicalDeviceFeatures2
        @test feats.next isa PhysicalDeviceVulkan12Features
        @test feats.next.next isa PhysicalDeviceVulkanMemoryModelFeatures
        feats2 = get_physical_device_features_2(device.physical_device, PhysicalDeviceVulkan12Features)
        @test feats2 == @set(feats2.next.next = C_NULL)

        props = get_physical_device_properties_2(device.physical_device, PhysicalDeviceProtectedMemoryProperties, PhysicalDeviceProvokingVertexPropertiesEXT)
        @test props isa PhysicalDeviceProperties2
        @test props.next isa PhysicalDeviceProtectedMemoryProperties
        @test props.next.next isa PhysicalDeviceProvokingVertexPropertiesEXT
        props = get_physical_device_properties_2(device.physical_device, PhysicalDeviceVulkan11Properties, PhysicalDeviceVulkan12Properties)
        @test props.properties.api_version ≥ v"1.1"
    end

    @testset "Handle constructors" begin
        info = FenceCreateInfo()
        fence_1 = Fence(device, info)
        @test fence_1 isa Fence
        fence_2 = Fence(device)
        @test fence_2 isa Fence
        fence_3 = unwrap(create_fence(device, info))
        @test fence_3 isa Fence
        fence_4 = unwrap(create_fence(device))
        @test fence_4 isa Fence

        info = _FenceCreateInfo()
        fence_1 = Fence(device, info)
        @test fence_1 isa Fence
        fence_2 = Fence(device)
        @test fence_2 isa Fence
        fence_3 = unwrap(_create_fence(device, info))
        @test_throws MethodError unwrap(create_fence(device, info))
        @test fence_3 isa Fence
        fence_4 = unwrap(_create_fence(device))
        @test fence_4 isa Fence
    end
end

GC.gc()
