@bitmask_flag FlagBits::UInt32 begin
    BIT_A = 1
    BIT_B = 2
    BIT_C = 3
end

@bitmask_flag FlagBits2::UInt32 begin
    BIT_A_2 = 1
    BIT_B_2 = 2
    BIT_C_2 = 3
end

@testset "Bitmasks" begin
    @testset "Bitmask creation & operations" begin
        @test BIT_A & BIT_B == FlagBits(0)
        @test BIT_A | BIT_B == BIT_C
        @test xor(BIT_A, BIT_B) == BIT_C
        @test BIT_A < BIT_B && BIT_B < BIT_C && BIT_A < BIT_C
        @test BIT_A & 1 == 1 & BIT_A == BIT_A
        @test BIT_A | 2 == 2 | BIT_A == BIT_C
        @test xor(BIT_A, 2) == xor(2, BIT_A) == BIT_C
        @test 1 < BIT_B && BIT_B < 3
        @test BIT_A <= BIT_B <= BIT_C
        @test BIT_A == BIT_A
        @test BIT_B in BIT_C
        @test BIT_A ∉ BIT_B
        @test 2 in BIT_C
        @test BIT_B in 3
        @test_throws ErrorException BIT_A & BIT_A_2
        @test_throws ErrorException BIT_A == BIT_A_2
        @test_throws ErrorException BIT_A in BIT_A_2
    end

    all_graphics = SHADER_STAGE_VERTEX_BIT | SHADER_STAGE_FRAGMENT_BIT | SHADER_STAGE_TESSELLATION_CONTROL_BIT | SHADER_STAGE_TESSELLATION_EVALUATION_BIT | SHADER_STAGE_GEOMETRY_BIT

    @testset "Generation of Vulkan bitmasks" begin
        @test all_graphics == SHADER_STAGE_ALL_GRAPHICS
    end

    @testset "Correct printing of bitmasks" begin
        @test string(BIT_C) == "FlagBits(BIT_C)"
        @test string(all_graphics) == "ShaderStageFlag(SHADER_STAGE_ALL_GRAPHICS)"
        @test string(SHADER_STAGE_VERTEX_BIT | SHADER_STAGE_FRAGMENT_BIT) == "ShaderStageFlag(SHADER_STAGE_VERTEX_BIT | SHADER_STAGE_FRAGMENT_BIT)"
    end
end
