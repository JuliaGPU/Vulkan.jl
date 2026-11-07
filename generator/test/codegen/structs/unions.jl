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

    # A union whose alternatives are POINTERS. `idiomatic_julia_type` maps
    # `Ptr{VkX}` to the wrapper struct `_X`, which used to give these a
    # signature promising a value the body then handed to a constructor that
    # stores a pointer -- a MethodError for all 18 constructors of the three
    # such unions, all new in Vulkan 1.4. A union wrapper has one field and no
    # `deps`, so there is nowhere to anchor a pointee and the pointer is the
    # only signature that can be honoured.
    @testset "Pointer alternatives stay pointers" begin
        consts = VulkanGen.constructors(StructDefinition{false}(api.unions[:VkIndirectCommandsTokenDataEXT]))
        expected = [
            :(_IndirectCommandsTokenDataEXT(push_constant::Ptr{VkIndirectCommandsPushConstantTokenEXT}) = _IndirectCommandsTokenDataEXT(VkIndirectCommandsTokenDataEXT(push_constant))),
            :(_IndirectCommandsTokenDataEXT(vertex_buffer::Ptr{VkIndirectCommandsVertexBufferTokenEXT}) = _IndirectCommandsTokenDataEXT(VkIndirectCommandsTokenDataEXT(vertex_buffer))),
            :(_IndirectCommandsTokenDataEXT(index_buffer::Ptr{VkIndirectCommandsIndexBufferTokenEXT}) = _IndirectCommandsTokenDataEXT(VkIndirectCommandsTokenDataEXT(index_buffer))),
            :(_IndirectCommandsTokenDataEXT(execution_set::Ptr{VkIndirectCommandsExecutionSetTokenEXT}) = _IndirectCommandsTokenDataEXT(VkIndirectCommandsTokenDataEXT(execution_set))),
        ]
        foreach(Base.splat(test_ex), zip(consts, expected))
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
