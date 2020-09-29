@testset "Handles" begin
    @test vg.is_handle("VkInstance")
    @test !vg.is_handle("VkInstanceCreateInfo")
    @test vg.is_handle_with_create_info("VkInstance")
    @test !vg.is_handle_with_create_info("VkPhysicalDevice")
    @test vg.is_handle_destructible("VkDevice")
    @test !vg.is_handle_destructible("VkPhysicalDevice")
    @test vg.is_handle_with_multiple_create_info("VkPipeline")
    @test !vg.is_handle_with_multiple_create_info("VkPhysicalDevice")
    @test issubset(filter(!vg.isalias, unique(vg.vulkan_creation_info.name)), vg.vulkan_handles.name)
end

@testset "Type queries" begin
    @test vg.is_bitmask("VkQueryPoolCreateFlags")
    @test vg.is_enum("VkDebugUtilsMessageSeverityFlagBitsEXT")
    @test !vg.is_bitmask("VkInstance")
    @test vg.is_enum("VkResult")
    @test !vg.is_enum("VkInstance")
    @test vg.isalias("VkAccelerationStructureNV")
    @test !vg.isalias("VkAccelerationStructureKHR")
end

@testset "Array & count variables" begin
    @test vg.is_array_variable("ppEnabledLayerNames", "VkInstanceCreateInfo")
    @test !vg.is_array_variable("enabledLayerCount", "VkInstanceCreateInfo")
    @test !vg.is_count_variable("ppEnabledLayerNames", "VkInstanceCreateInfo")
    @test vg.is_count_variable("enabledLayerCount", "VkInstanceCreateInfo")
    @test vg.associated_array_variables("enabledLayerCount", "VkInstanceCreateInfo") == ["ppEnabledLayerNames"]
    @test vg.associated_count_variable("ppEnabledLayerNames", "VkInstanceCreateInfo") == "enabledLayerCount"
end

@testset "Defaults" begin
    @test vg.default("ppEnabledLayerNames", "Ptr{Cstring}") == "C_NULL"
    @test vg.default("pApplicationInfo", "Ptr{VkApplicationInfo}") == "C_NULL"
    @test vg.default("device", "VkDevice") == "C_NULL"
    @test vg.default("enabledLayerCount", "UInt32") == "0"
end

@testset "Count variables to be filled (enumerations)" begin
    @test vg.is_count_to_be_filled("pPhysicalDeviceCount", "vkEnumeratePhysicalDevices")
    @test vg.enumeration_command_count_variable("vkEnumeratePhysicalDevices").name == "pPhysicalDeviceCount"
    @test vg.enumeration_command_array_variable("vkEnumeratePhysicalDevices").name == "pPhysicalDevices"
end
