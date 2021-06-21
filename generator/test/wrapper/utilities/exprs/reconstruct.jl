@testset "Reconstruct" begin
    @test prettify(reconstruct(deconstruct(f))) == prettify(f)
    @test prettify(reconstruct(deconstruct(doc_f))) == prettify(doc_f)
    @test prettify(reconstruct(deconstruct(e2))) == prettify(e2)
    @test prettify(reconstruct(deconstruct(s))) == prettify(s)
    @test prettify(reconstruct(deconstruct(doc_s))) == prettify(doc_s)
end
