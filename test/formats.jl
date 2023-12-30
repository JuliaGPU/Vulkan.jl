using Vulkan: Vk
using Test

@testset "Format utilities" begin
  @test Vk.format_type(FORMAT_R32_SFLOAT) === Float32
  @test Vk.Format(Float32) == FORMAT_R32_SFLOAT
end;
