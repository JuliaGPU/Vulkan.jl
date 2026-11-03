@testset "Promoted extension aliases" begin
    @test _PhysicalDeviceLineRasterizationFeaturesEXT === _PhysicalDeviceLineRasterizationFeatures
    @test _QueueFamilyGlobalPriorityPropertiesKHR === _QueueFamilyGlobalPriorityProperties
    @test :_cmd_push_descriptor_set_khr in names(Vulkan)
    @test ACCESS_2_ACCELERATION_STRUCTURE_READ_BIT_KHR isa AccessFlag2
end

@testset "Driver selection" begin
    @test Vulkan.driver_library(Val(:System)) === nothing
    @test_throws ErrorException Vulkan.driver_library(Val(:Unknown))
    @test isfile(Vulkan.driver_library(Val(:Loader)))
end

@testset "Layout blob output headers" begin
    value = Vulkan.initialize_core(VkCore.VkPipelineExecutableStatisticKHR, [])
    @test value.sType == VkCore.VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_STATISTIC_KHR
    @test value.pNext == C_NULL
end
