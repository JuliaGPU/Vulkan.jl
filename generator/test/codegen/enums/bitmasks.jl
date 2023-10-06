@testset "Bitmask flags" begin
    test_ex(BitmaskDefinition(api.bitmasks[:VkQueryPipelineStatisticFlagBits]), :(
        @bitmask QueryPipelineStatisticFlag::UInt32 begin
            QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_VERTICES_BIT = 1
            QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_PRIMITIVES_BIT = 2
            QUERY_PIPELINE_STATISTIC_VERTEX_SHADER_INVOCATIONS_BIT = 4
            QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_INVOCATIONS_BIT = 8
            QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_PRIMITIVES_BIT = 16
            QUERY_PIPELINE_STATISTIC_CLIPPING_INVOCATIONS_BIT = 32
            QUERY_PIPELINE_STATISTIC_CLIPPING_PRIMITIVES_BIT = 64
            QUERY_PIPELINE_STATISTIC_FRAGMENT_SHADER_INVOCATIONS_BIT = 128
            QUERY_PIPELINE_STATISTIC_TESSELLATION_CONTROL_SHADER_PATCHES_BIT = 256
            QUERY_PIPELINE_STATISTIC_TESSELLATION_EVALUATION_SHADER_INVOCATIONS_BIT = 512
            QUERY_PIPELINE_STATISTIC_COMPUTE_SHADER_INVOCATIONS_BIT = 1024
            QUERY_PIPELINE_STATISTIC_TASK_SHADER_INVOCATIONS_BIT_EXT = 2048
            QUERY_PIPELINE_STATISTIC_MESH_SHADER_INVOCATIONS_BIT_EXT = 4096
            QUERY_PIPELINE_STATISTIC_CLUSTER_CULLING_SHADER_INVOCATIONS_BIT_HUAWEI = 8192
        end
    ))

    test_ex(BitmaskDefinition(api.bitmasks[:VkSparseMemoryBindFlagBits]), :(
        @bitmask SparseMemoryBindFlag::UInt32 begin
            SPARSE_MEMORY_BIND_METADATA_BIT = 1
        end
    ))

    test_ex(BitmaskDefinition(api.bitmasks[:VkShaderStageFlagBits]), :(
        @bitmask ShaderStageFlag::UInt32 begin
            SHADER_STAGE_VERTEX_BIT = 1
            SHADER_STAGE_TESSELLATION_CONTROL_BIT = 2
            SHADER_STAGE_TESSELLATION_EVALUATION_BIT = 4
            SHADER_STAGE_GEOMETRY_BIT = 8
            SHADER_STAGE_FRAGMENT_BIT = 16
            SHADER_STAGE_COMPUTE_BIT = 32
            SHADER_STAGE_RAYGEN_BIT_KHR = 256
            SHADER_STAGE_ANY_HIT_BIT_KHR = 512
            SHADER_STAGE_CLOSEST_HIT_BIT_KHR = 1024
            SHADER_STAGE_MISS_BIT_KHR = 2048
            SHADER_STAGE_INTERSECTION_BIT_KHR = 4096
            SHADER_STAGE_CALLABLE_BIT_KHR = 8192
            SHADER_STAGE_TASK_BIT_EXT = 64
            SHADER_STAGE_MESH_BIT_EXT = 128
            SHADER_STAGE_SUBPASS_SHADING_BIT_HUAWEI = 16384
            SHADER_STAGE_CLUSTER_CULLING_BIT_HUAWEI = 524288
            SHADER_STAGE_ALL_GRAPHICS = $(Int(0x0000001f))
            SHADER_STAGE_ALL = $(Int(0x7fffffff))
        end
    ))

    test_ex(BitmaskDefinition(api.bitmasks[:VkCullModeFlagBits]), :(
        @bitmask CullModeFlag::UInt32 begin
            CULL_MODE_FRONT_BIT = 1
            CULL_MODE_BACK_BIT = 2
            CULL_MODE_NONE = 0
            CULL_MODE_FRONT_AND_BACK = 3
        end
    ))

    test_ex(BitmaskDefinition(api.bitmasks[:VkInstanceCreateFlagBits]), :(
        @bitmask InstanceCreateFlag::UInt32 begin
            INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR = 1
        end
    ))
end;
