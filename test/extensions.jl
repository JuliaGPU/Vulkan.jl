using ColorTypes

@testset "Extensions" begin
  @test Vk.Format(RGBA{Float16}) === Vk.FORMAT_R16G16B16A16_SFLOAT
  @test format_type(Vk.FORMAT_R16G16B16A16_SFLOAT) === RGBA{Float16}
end
