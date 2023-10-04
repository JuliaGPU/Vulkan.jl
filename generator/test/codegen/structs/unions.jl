@testset "Unions" begin
    @testset "Low-level" begin
        test_ex(StructDefinition{false}(api.unions[:VkClearColorValue]), :(
            struct _ClearColorValue <: VulkanStruct{false}
                vks::VkClearColorValue
            end
        ))

        test_ex(StructDefinition{false}(api.unions[:VkClearValue]), :(
            struct _ClearValue <: VulkanStruct{false}
                vks::VkClearValue
            end
        ))
    end

    @testset "High-level" begin
        test_ex(StructDefinition{true}(api.unions[:VkClearColorValue]), :(
            struct ClearColorValue <: HighLevelStruct
                vks::VkClearColorValue
            end
        ))

        test_ex(StructDefinition{true}(api.unions[:VkClearValue]), :(
            struct ClearValue <: HighLevelStruct
                vks::VkClearValue
            end
        ))
    end

    @testset "Constructors" begin
        consts = VulkanGen.constructors(StructDefinition{true}(api.unions[:VkClearValue]))
        expected = [
            :(ClearValue(color::ClearColorValue) = ClearValue(VkClearValue(color.vks))),
            :(ClearValue(depth_stencil::ClearDepthStencilValue) = ClearValue(VkClearValue(_ClearDepthStencilValue(depth_stencil).vks))),
        ]
        foreach(Base.splat(test_ex), zip(consts, expected))
    end
end;
