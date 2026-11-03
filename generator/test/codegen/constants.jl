@testset "Constants" begin
    test_ex(ConstantDefinition(api.constants[:VK_SUBPASS_EXTERNAL]), :(const SUBPASS_EXTERNAL = VK_SUBPASS_EXTERNAL))

    wrapper = VulkanWrapper(wrapper_config())
    source = join(VulkanGen.block.(wrapper.independent))
    @test !occursin("const IMAGE_LAYOUT_PRESENT_SRC_KHR =", source)
    @test occursin("IMAGE_LAYOUT_PRESENT_SRC_KHR = 1000001002", source)
    aliases = join(VulkanGen.block.(wrapper.dependent))
    @test !occursin("const ACCESS_2_ACCELERATION_STRUCTURE_READ_BIT_KHR =", aliases)
end;
