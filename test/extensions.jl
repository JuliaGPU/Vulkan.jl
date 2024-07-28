using FixedPointNumbers
using ColorTypes
using StaticArraysCore: SVector

function test_format_equivalent_to(format, T)
  @test Vk.Format(T) === format
  @test format_type(format) === T
end

@testset "Extensions" begin
  # FixedPointNumbers.
  test_format_equivalent_to(Vk.FORMAT_R8_UNORM, N0f8)

  # ColorTypes.
  test_format_equivalent_to(Vk.FORMAT_R16G16B16_SFLOAT, RGB{Float16})
  test_format_equivalent_to(Vk.FORMAT_R16G16B16A16_SFLOAT, RGBA{Float16})

  # FixedPointNumbers + ColorTypes.
  test_format_equivalent_to(Vk.FORMAT_R8G8B8_UNORM, RGB{N0f8})
  test_format_equivalent_to(Vk.FORMAT_B8G8R8_UNORM, BGR{N0f8})

  # StaticArraysCore.
  test_format_equivalent_to(Vk.FORMAT_R16G16_SFLOAT, SVector{2,Float16})

  # FixedPointNumbers + StaticArraysCore.
  test_format_equivalent_to(Vk.FORMAT_R8G8_UNORM, SVector{2, N0f8})
  @test Vk.Format(SVector{3,N0f8}) === Vk.FORMAT_R8G8B8_UNORM
  @test format_type(Vk.FORMAT_G8B8G8R8_422_UNORM) == SVector{4, N0f8}
end;
