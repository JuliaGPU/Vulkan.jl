@testset "Deconstruct" begin
    let p = deconstruct(f)
        @test p[:category] == :function
        @test p[:name] == :f
        @test p[:args] == [:x, Expr(:kw, :y, 3)]
        @test p[:kwargs] == [:a, Expr(:kw, :b, 5)]
        @test p[:short]
        @test issubset([50], p[:body].args)
    end

    let p = deconstruct(f2)
        @test p[:category] == :function
        @test p[:name] == :f
        @test p[:args] == [:x]
        @test issubset([:(println(2)), :(return 5)], p[:body].args)
        @test !p[:short]
    end

    let p = deconstruct(s)
        @test p[:category] == :struct
        @test p[:name] == :HandleType
        @test p[:fields] == [:(handle::Ptr{Nothing})]
        @test p[:is_mutable] == true
        @test p[:constructors] == []
    end


    let p = deconstruct(c)
        @test p[:category] == :const
        @test p[:value] == :val
    end

    let p = deconstruct(e)
        @test p[:category] == :enum
        @test p[:name] == :myenum
        @test p[:macro] == Symbol("@enum")
        @test p[:values] == [:a, :b, :c, :d]
    end

    let p = deconstruct(e2)
        @test p[:category] == :enum
        @test p[:name] == :myotherenum
        @test p[:macro] == Symbol("@cenum")
        @test p[:values] == [:(a=1), :(b=2), :(c=3), :(d=4)]
    end
end
