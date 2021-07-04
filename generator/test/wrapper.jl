test_ex(x, y) = @test prettify(x) == prettify(y)
test_ex(x::AbstractArray, y::AbstractArray) = foreach(test_ex, x, y)
test_ex(x::WrapperNode, y) = @test prettify(to_expr(x)) == prettify(y)

test(T, f, name, ex) = test_ex(T(f(name)), ex)
test(T, arg, ex) = test(T, identity, arg, ex)

@testset "Wrapper" begin
    @testset "Wrapper utilities" begin
        include("wrapper/utilities/exprs.jl")
        include("wrapper/utilities/naming_conventions.jl")
    end

    @testset "Wrapper generation" begin
        include("wrapper/config.jl")
    end

    @testset "Code generation" begin
        @testset "Structs" begin
            include("wrapper/codegen/structs/low_level.jl")
            include("wrapper/codegen/structs/high_level.jl")
            include("wrapper/codegen/structs/unions.jl")
        end

        include("wrapper/codegen/constants.jl")
        include("wrapper/codegen/enums/enums.jl")
        include("wrapper/codegen/enums/bitmasks.jl")
        include("wrapper/codegen/handles.jl")

        @testset "Functions" begin
            include("wrapper/codegen/functions/api.jl")
            include("wrapper/codegen/functions/overloads.jl")
        end

        include("wrapper/codegen/docs.jl")
    end
end
