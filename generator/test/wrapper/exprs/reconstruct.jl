@testset "Reconstruct" begin
    @test striplines(reconstruct(deconstruct(f))) == striplines(f)
    @test striplines(reconstruct(deconstruct(e2))) == striplines(e2)
    @test striplines(reconstruct(deconstruct(s))) == unblock(striplines(s))
end
