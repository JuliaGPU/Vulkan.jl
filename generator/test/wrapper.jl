@testset "Wrapper" begin
    @testset "Wrapper utilities" begin
        include("utilities/exprs.jl")
        include("utilities/naming_conventions.jl")
    end

    @testset "Low-level wrapper" begin
        include("low_level_wrapper/wrapper.jl")
        include("low_level_wrapper/docs.jl")
    end

    @testset "High-level wrapper" begin
        include("high_level_wrapper/wrapper.jl")
        include("high_level_wrapper/docs.jl")
    end
end
