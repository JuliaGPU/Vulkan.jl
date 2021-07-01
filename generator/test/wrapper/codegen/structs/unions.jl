test_wrap_union(name, ex) = test_wrap(union_by_name, name, ex)
test_hl_wrap_union(name, ex) = test_hl_wrap(union_by_name, name, ex)

@testset "Unions" begin
    @testset "Low-level" begin
        test_wrap_union(:VkClearColorValue, :(
            struct _ClearColorValue <: VulkanStruct{false}
                vks::VkClearColorValue
            end
        ))

        test_wrap_union(:VkClearValue, :(
            struct _ClearValue <: VulkanStruct{false}
                vks::VkClearValue
            end
        ))
    end

    @testset "High-level" begin
        test_hl_wrap_union(:VkClearColorValue, :(
            struct ClearColorValue <: HighLevelStruct
                data::VkClearColorValue
            end
        ))

        test_hl_wrap_union(:VkClearValue, :(
            struct ClearValue <: HighLevelStruct
                data::VkClearValue
            end
        ))
    end
end
