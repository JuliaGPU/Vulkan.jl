@testset "Unblock" begin
    @test string(unblock(striplines(f))) == "f(x, y = 3; a, b = 5) = 50"
end
