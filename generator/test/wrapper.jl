test_ex(x, y) = @test resolve_types(prettify(x)) == prettify(y)
test_ex(x::Dict, y) = @test resolve_types(prettify(to_expr(x))) == prettify(y)

test_wrap(f, value, ex; kwargs...) = test_ex(wrap(f(value); kwargs...), ex)
test_hl_wrap(f, value, ex; kwargs...) = test_ex(hl_wrap(f(value); kwargs...), ex)
test_add_constructor(f, name, ex; kwargs...) = test_ex(add_constructor(f(name); kwargs...), ex)
test_add_constructors(f, name, exs; kwargs...) = test_ex.(add_constructors(f(name); kwargs...), exs)

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
