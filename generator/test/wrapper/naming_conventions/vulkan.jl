@testset "Remove Vulkan prefixes" begin
    @test remove_prefix(s2) == s2_novk
    @test remove_prefix(c1) == c1_novk
    @test remove_prefix(c2) == c2_novk
end
