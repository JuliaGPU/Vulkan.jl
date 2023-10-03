using VulkanGen
using Test
using StructArrays

test_ex(x, y) = @test prettify(x) == prettify(y)
test_ex(x::AbstractArray, y::AbstractArray) = foreach(test_ex, x, y)
test_ex(x::WrapperNode, y) = @test prettify(to_expr(x)) == prettify(y)

test(T, f, name, ex) = test_ex(T(f(name)), ex)
test(T, arg, ex) = test(T, identity, arg, ex)

@testset "VulkanGen.jl" begin
  @testset "Wrapper utilities" begin
    include("utilities/exprs.jl")
    include("utilities/naming_conventions.jl")
  end

  @testset "Wrapper generation" begin
    include("config.jl")
  end

  @testset "Code generation" begin
    @testset "Structs" begin
      include("codegen/structs/low_level.jl")
      include("codegen/structs/high_level.jl")
      include("codegen/structs/unions.jl")
    end

    include("codegen/constants.jl")
    include("codegen/enums/enums.jl")
    include("codegen/enums/bitmasks.jl")
    include("codegen/handles.jl")

    @testset "Functions" begin
      include("codegen/functions/low_level.jl")
      include("codegen/functions/high_level.jl")
      include("codegen/functions/overloads.jl")
    end

    include("codegen/aliases.jl")
    include("codegen/docs.jl")
  end
end

end;
