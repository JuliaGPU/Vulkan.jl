@testset "Apply Vulkan prefixes" begin
    @test prefix_vk(c1_novk) == c1
    @test prefix_vk(c2_novk) == c2
    @test prefix_vk(s2_novk) == s2
    @test prefix_vk(c1_novk.value) == c1.value
    @test prefix_vk(c2_novk.value) == c2.value
    @test prefix_vk(s2_novk.value) == s2.value
end

@testset "Remove Vulkan prefixes" begin
    @test remove_prefix(s2) == s2_novk
    @test remove_prefix(c1) == c1_novk
    @test remove_prefix(c2) == c2_novk
end