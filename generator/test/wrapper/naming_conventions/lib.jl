@testset "Library" begin
    @testset "Camel Case Splitting" begin
        @test split(camel_split_l_c1) == ["my", "Camel", "2"]
        @test split(camel_split_l_c2) == ["my", "Camel", "2", "KHR", "Ext"]
        @test split(camel_split_l_c3) == ["my", "Camel", "2", "Ext", "4"]
        @test split(camel_split_u_c1) == ["My", "Camel", "2"]
        @test split(camel_split_u_c2) == ["My", "Camel", "2", "KHR", "Ext"]
        @test split(camel_split_u_c3) == ["My", "Camel", "2", "Ext", "4"]
    end
    @testset "Conversions" begin
        @test Base.convert(CamelCaseLower, const_s1) == const_c1
        @test Base.convert(CamelCaseLower, const_s2) == const_c1
        @test Base.convert(CamelCaseUpper, const_s1) == const_c2
        @test Base.convert(CamelCaseUpper, const_s2) == const_c2
        @test Base.convert(SnakeCaseLower, const_c1) == const_s1
        @test Base.convert(SnakeCaseLower, const_c2) == const_s1
        @test Base.convert(SnakeCaseUpper, const_c1) == const_s2
        @test Base.convert(SnakeCaseUpper, const_c2) == const_s2
    end
    @testset "Remove parts" begin
        @test remove_parts(longstr, [1, 3]).value == "snake_with_many_words"
        @test remove_parts(longstr, 1).value == "snake_case_with_many_words"
    end
end