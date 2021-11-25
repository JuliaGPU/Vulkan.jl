@testset "Unions" begin
    @testset "Low-level" begin
        test(StructDefinition{false}, union_by_name, :VkClearColorValue, :(
            struct _ClearColorValue <: VulkanStruct{false}
                vks::VkClearColorValue
            end
        ))

        test(StructDefinition{false}, union_by_name, :VkClearValue, :(
            struct _ClearValue <: VulkanStruct{false}
                vks::VkClearValue
            end
        ))
    end

    @testset "High-level" begin
        test(StructDefinition{true}, union_by_name, :VkClearColorValue, :(
            struct ClearColorValue <: HighLevelStruct
                data::VkClearColorValue
            end
        ))

        test(StructDefinition{true}, union_by_name, :VkClearValue, :(
            struct ClearValue <: HighLevelStruct
                data::VkClearValue
            end
        ))
    end

    @testset "Constructors" begin
        consts = VulkanGen.constructors(StructDefinition{true}(union_by_name(:VkClearValue)))
        expected = [
            :(ClearValue(color::ClearColorValue) = ClearValue(VkClearValue(color.data))),
            :(ClearValue(depth_stencil::ClearDepthStencilValue) = ClearValue(VkClearValue(_ClearDepthStencilValue(depth_stencil).vks))),
        ]
        foreach(Base.splat(test_ex), zip(consts, expected))
    end
end
