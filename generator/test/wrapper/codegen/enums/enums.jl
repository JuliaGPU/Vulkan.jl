@testset "Enums" begin
    test(EnumDefinition, enum_by_name, :VkAttachmentLoadOp, :(
        @cenum AttachmentLoadOp::UInt32 begin
            ATTACHMENT_LOAD_OP_LOAD = 0
            ATTACHMENT_LOAD_OP_CLEAR = 1
            ATTACHMENT_LOAD_OP_DONT_CARE = 2
        end
    ))

    test(EnumDefinition, enum_by_name, :VkResult, :(
        @cenum Result::Int32 begin
            SUCCESS = 0
            NOT_READY = 1
            TIMEOUT = 2
            EVENT_SET = 3
            EVENT_RESET = 4
            INCOMPLETE = 5
            ERROR_OUT_OF_HOST_MEMORY = -1
            ERROR_OUT_OF_DEVICE_MEMORY = -2
            ERROR_INITIALIZATION_FAILED = -3
            ERROR_DEVICE_LOST = -4
            ERROR_MEMORY_MAP_FAILED = -5
            ERROR_LAYER_NOT_PRESENT = -6
            ERROR_EXTENSION_NOT_PRESENT = -7
            ERROR_FEATURE_NOT_PRESENT = -8
            ERROR_INCOMPATIBLE_DRIVER = -9
            ERROR_TOO_MANY_OBJECTS = -10
            ERROR_FORMAT_NOT_SUPPORTED = -11
            ERROR_FRAGMENTED_POOL = -12
            ERROR_UNKNOWN = -13
            ERROR_OUT_OF_POOL_MEMORY = -1000069000
            ERROR_INVALID_EXTERNAL_HANDLE = -1000072003
            ERROR_FRAGMENTATION = -1000161000
            ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS = -1000257000
            ERROR_SURFACE_LOST_KHR = -1000000000
            ERROR_NATIVE_WINDOW_IN_USE_KHR = -1000000001
            SUBOPTIMAL_KHR = 1000001003
            ERROR_OUT_OF_DATE_KHR = -1000001004
            ERROR_INCOMPATIBLE_DISPLAY_KHR = -1000003001
            ERROR_VALIDATION_FAILED_EXT = -1000011001
            ERROR_INVALID_SHADER_NV = -1000012000
            ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT = -1000158000
            ERROR_NOT_PERMITTED_EXT = -1000174001
            ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT = -1000255000
            THREAD_IDLE_KHR = 1000268000
            THREAD_DONE_KHR = 1000268001
            OPERATION_DEFERRED_KHR = 1000268002
            OPERATION_NOT_DEFERRED_KHR = 1000268003
            PIPELINE_COMPILE_REQUIRED_EXT = 1000297000
        end
    ))

    test(EnumDefinition, enum_by_name, :VkPipelineCacheHeaderVersion, :(
        @cenum PipelineCacheHeaderVersion::UInt32 begin
            PIPELINE_CACHE_HEADER_VERSION_ONE = 1
    end
    ))
end
