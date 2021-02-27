@bitmask_flags BitFlags::UInt32 begin
    BIT_A = 1
    BIT_B = 2
    BIT_C = 3
end

@bitmask_flags BitFlags2::UInt32 begin
    BIT_A_2 = 1
    BIT_B_2 = 2
    BIT_C_2 = 3
end

@testset "Vulkan enum wrappers" begin
    @test BIT_A & BIT_B == BitFlags(0)
    @test BIT_A | BIT_B == BIT_C
    @test xor(BIT_A, BIT_B) == BIT_C
    @test BIT_A & 1 == 1 & BIT_A == BIT_A
    @test BIT_A | 2 == 2 | BIT_A == BIT_C
    @test xor(BIT_A, 2) == xor(2, BIT_A) == BIT_C

    @test_throws ErrorException("Bitwise operation between incompatible bitmasks 'BitFlags', 'BitFlags2' not allowed") BIT_A & BIT_A_2
end
