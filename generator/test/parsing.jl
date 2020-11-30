source = joinpath(@__DIR__, "resources", "defs.jl")

pf = API(source, sym -> @eval(vk, $(Meta.parse("$sym"))))

s1 = SDefinition("MyMutableStruct", true)
s2 = SDefinition("MyStruct", false, fields=("a" => "Int", "b" => "Ptr{Cvoid}", "c" => "NTuple{16,Cfloat}"))

f1 = FDefinition("f", Signature("f", PositionalArgument.(["x", "y", "z"], ["Int", nothing, nothing]), [KeywordArgument("p", 5)]), false, [Statement("println(50)"), Statement("println(\"finished\")")])
f2 = FDefinition("g", Signature("g", [PositionalArgument("x", nothing)], []), true, [Statement("50x")])

c1 = CDefinition(:(const myconst = 50))

e1 = EDefinition(:(@enum my_enum begin; a = 3; b = 2; c = 200; end))# name="my_enum", fields=["a = 3", "b = 2", "c=200"], with_begin_block=true)

@testset "Parsing" begin
    @testset "Source parsing" begin
        @test generate(pf.structs["MyMutableStruct"]) == generate(s1)
        @test generate(pf.structs["MyStruct"]) == generate(s2)
        @test generate(pf.funcs["f"]) == generate(f1)
        @test generate(pf.funcs["g"]) == generate(f2)
        @test generate(pf.consts["myconst"]) == generate(c1)
        @test generate(pf.enums["my_enum"]) == generate(e1)
    end
end
