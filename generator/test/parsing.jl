pf = API(joinpath(@__DIR__, "resources", "defs.jl"), sym -> @eval(vk, $(Meta.parse("$sym"))))

# println(pf.structs)
# println(pf.funcs)
# println(pf.consts)
# println(pf.enums)

s1 = SDefinition("MyMutableStruct", true)
s2 = SDefinition("MyStruct", false, fields=("a" => "Int", "b" => "Ptr{Cvoid}", "c" => "NTuple{16,Cfloat}"))



f1 = FDefinition("f", Signature("f", PositionalArgument.(["x", "y", "z"], ["Int", nothing, nothing]), [KeywordArgument("p", 5)]), false, [Statement("println(50)"), Statement("println(\"finished\")")])
f2 = FDefinition("g", Signature("g", [PositionalArgument("x", nothing)], []), true, [Statement("50 * x")])

c1 = CDefinition("myconst", 50)

e1 = EDefinition(name="my_enum", fields=["a", "b", "c", "d", "e", "f"], with_begin_block=false)
e2 = EDefinition(name="my_other_enum", fields=["a = 3", "b = 2", "c=200"], with_begin_block=true)



@testset "Parsing" begin
    @testset "Source parsing" begin
        @test generate(pf.structs["MyMutableStruct"]) == generate(s1)
        @test generate(pf.structs["MyStruct"]) == generate(s2)
        @test generate(pf.funcs["f"]) == generate(f1)
        @test generate(pf.funcs["g"]) == generate(f2)
        @test generate(pf.consts["myconst"]) == generate(c1)
        @test generate(pf.enums["my_enum"]) == generate(e1)
        @test generate(pf.enums["my_other_enum"]) == generate(e2)
    end
    # @testset "Declaration generation interoperability" begin
        
    # end
end

"""
mutable struct MyMutableStruct end
struct MyStruct
    a::Int
    b::Ptr{Cvoid}
    c::NTuple{16,Cfloat}
end

function f(x::Int, y, z; p=5)
    println(50)
    println("finished")
end

g(x) = 50 * x

@enum my_enum a b c d e f

const myconst = 50
"""