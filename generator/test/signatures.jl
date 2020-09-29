f(x::Int64, y::Float64) = 5x + y

sig = Signature(first(methods(f)))
sig_f = Signature(f)

@testset "Signatures" begin
    @test argnames(sig) == ["x", "y"]
    @test argtypes(sig) == ["Int64", "Float64"]
    @test argnames(sig_f) == argnames(sig)
    @test argtypes(sig_f) == argtypes(sig)
end