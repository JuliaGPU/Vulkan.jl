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
end
