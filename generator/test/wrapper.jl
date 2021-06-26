test_ex(x, y) = @test resolve_types(prettify(x)) == prettify(y)
test_ex(x::Dict, y) = @test resolve_types(prettify(to_expr(x))) == prettify(y)

@testset "Wrapper" begin
    @testset "Wrapper utilities" begin
        include("wrapper/utilities/exprs.jl")
        include("wrapper/utilities/naming_conventions.jl")
    end

    @testset "Wrapper generation" begin
        include("wrapper/generation/config.jl")
    end

    @testset "Low-level wrapper" begin
        include("wrapper/low_level/wrapper.jl")
        include("wrapper/low_level/docs.jl")
    end

    @testset "High-level wrapper" begin
        include("wrapper/high_level/wrapper.jl")
        include("wrapper/high_level/docs.jl")
    end
end
