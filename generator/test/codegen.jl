s1 = Statement("a=2", "a")

sdef1 = SDefinition("sdef1", false)
sdef2 = SDefinition("sdef2", true)
sdef3 = SDefinition("sdef3", true, fields=("device" => Ptr{Nothing}, "notype" => nothing))

signature = Signature(first(methods(replace)))
fdef1 = FDefinition("replace", signature, false, Statement[])
fdef2 = FDefinition("replace", signature, false, [Statement("a=5")])
fdef3 = FDefinition("replace", signature, false, Statement.(["i=1", "i+=1", "nothing"]))

cdef1 = CDefinition("c1", 0)
cdef2 = CDefinition("c2", "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]")

edef1 = EDefinition(name="e1", fields=["a", "b", "c", "d"])
edef2 = EDefinition(name="e1", fields=["a", "b", "c", "d"], with_begin_block=true, enum_macro="@enum")

@testset "Code generation" begin
    @testset "Structure definition" begin
        @test generate(sdef1) == format_text("struct sdef1 end")
        @test generate(sdef2) == format_text("mutable struct sdef2 end")
        @test generate(sdef3) == format_text("""
                         mutable struct sdef3
                             device::Ptr{Nothing}
                             notype::Any
                         end""")
    end

    @testset "Function definition" begin
        @test generate(fdef1) == format_text("function replace(a::Union{Function, Type}, b::Pair; count) end")
        @test generate(fdef2) == format_text("function replace(a::Union{Function, Type}, b::Pair; count) a=5 end")
        @test generate(fdef3) == format_text("""
                         function replace(a::Union{Function, Type}, b::Pair; count)
                             i = 1
                             i += 1
                             nothing
                         end""")
        @test_throws ErrorException generate(FDefinition("replace", signature, true, Statement[])) # short notation for a function without body
    end
    @testset "Statements" begin
        @test generate([s1]) == format_text("a = 2")
    end
    @testset "Constant definition" begin
        @test generate(cdef1) == format_text("const c1 = 0")
        @test generate(cdef2) == format_text("const c2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]")
    end
    @testset "Enum definition" begin
        @test generate(edef1) == format_text("@enum e1 a b c d")
        @test generate(edef2) == format_text("@enum e1 begin\na\nb\nc\nd\nend")
    end
end