@testset "Reconstruct" begin
    @test prettify(reconstruct(deconstruct(f))) == prettify(f)
    @test prettify(reconstruct(deconstruct(e2))) == prettify(e2)
    @test prettify(reconstruct(deconstruct(s))) == prettify(s)
    @test string(prettify(reconstruct(Dict(deconstruct(f)..., :docstring => "I document function f")))) == "Core.@doc \"I document function f\" $(string(prettify(f)))"
end
