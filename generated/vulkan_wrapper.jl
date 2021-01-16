struct PhysicalDevice4444FormatsFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDevice4444FormatsFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceImageRobustnessFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceImageRobustnessFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceRobustness2PropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    robust_storage_buffer_access_size_alignment::UInt64
    robust_uniform_buffer_access_size_alignment::UInt64
end

struct PhysicalDeviceRobustness2FeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceRobustness2FeaturesEXT
    deps::Vector{Any}
end

struct DeviceDiagnosticsConfigCreateInfoNV <: VulkanStruct{true}
    vks::VkDeviceDiagnosticsConfigCreateInfoNV
    deps::Vector{Any}
end

struct PhysicalDeviceDiagnosticsConfigFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceDiagnosticsConfigFeaturesNV
    deps::Vector{Any}
end

struct CommandBufferInheritanceRenderPassTransformInfoQCOM <: VulkanStruct{true}
    vks::VkCommandBufferInheritanceRenderPassTransformInfoQCOM
    deps::Vector{Any}
end

struct RenderPassTransformBeginInfoQCOM <: VulkanStruct{true}
    vks::VkRenderPassTransformBeginInfoQCOM
    deps::Vector{Any}
end

struct PhysicalDeviceExtendedDynamicStateFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
    deps::Vector{Any}
end

struct PipelineLibraryCreateInfoKHR <: VulkanStruct{true}
    vks::VkPipelineLibraryCreateInfoKHR
    deps::Vector{Any}
end

struct DeferredOperationInfoKHR <: VulkanStruct{true}
    vks::VkDeferredOperationInfoKHR
    deps::Vector{Any}
end

struct RayTracingPipelineInterfaceCreateInfoKHR <: VulkanStruct{true}
    vks::VkRayTracingPipelineInterfaceCreateInfoKHR
    deps::Vector{Any}
end

struct CopyMemoryToAccelerationStructureInfoKHR <: VulkanStruct{true}
    vks::VkCopyMemoryToAccelerationStructureInfoKHR
    deps::Vector{Any}
end

struct CopyAccelerationStructureToMemoryInfoKHR <: VulkanStruct{true}
    vks::VkCopyAccelerationStructureToMemoryInfoKHR
    deps::Vector{Any}
end

struct CopyAccelerationStructureInfoKHR <: VulkanStruct{true}
    vks::VkCopyAccelerationStructureInfoKHR
    deps::Vector{Any}
end

struct AccelerationStructureVersionKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureVersionKHR
    deps::Vector{Any}
end

struct AccelerationStructureDeviceAddressInfoKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureDeviceAddressInfoKHR
    deps::Vector{Any}
end

struct AccelerationStructureInstanceKHR <: VulkanStruct{false}
    vks::VkAccelerationStructureInstanceKHR
end

struct TransformMatrixKHR <: VulkanStruct{false}
    vks::VkTransformMatrixKHR
end

struct AabbPositionsKHR <: VulkanStruct{false}
    vks::VkAabbPositionsKHR
end

struct AccelerationStructureCreateInfoKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureCreateInfoKHR
    deps::Vector{Any}
end

struct AccelerationStructureCreateGeometryTypeInfoKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureCreateGeometryTypeInfoKHR
    deps::Vector{Any}
end

struct AccelerationStructureBuildOffsetInfoKHR <: VulkanStruct{false}
    vks::VkAccelerationStructureBuildOffsetInfoKHR
end

struct AccelerationStructureBuildGeometryInfoKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureBuildGeometryInfoKHR
    deps::Vector{Any}
end

struct AccelerationStructureGeometryKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureGeometryKHR
    deps::Vector{Any}
end

struct AccelerationStructureGeometryDataKHR <: VulkanStruct{false}
    vks::VkAccelerationStructureGeometryDataKHR
end

struct AccelerationStructureGeometryInstancesDataKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureGeometryInstancesDataKHR
    deps::Vector{Any}
end

struct AccelerationStructureGeometryAabbsDataKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureGeometryAabbsDataKHR
    deps::Vector{Any}
end

struct AccelerationStructureGeometryTrianglesDataKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureGeometryTrianglesDataKHR
    deps::Vector{Any}
end

struct DeviceOrHostAddressConstKHR <: VulkanStruct{true}
    vks::VkDeviceOrHostAddressConstKHR
    deps::Vector{Any}
end

struct DeviceOrHostAddressKHR <: VulkanStruct{true}
    vks::VkDeviceOrHostAddressKHR
    deps::Vector{Any}
end

struct PhysicalDeviceCustomBorderColorFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceCustomBorderColorFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceCustomBorderColorPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_custom_border_color_samplers::UInt32
end

struct SamplerCustomBorderColorCreateInfoEXT <: VulkanStruct{true}
    vks::VkSamplerCustomBorderColorCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceToolPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    name::String
    version::String
    purposes::UInt32
    description::String
    layer::String
end

struct PhysicalDeviceCoherentMemoryFeaturesAMD <: VulkanStruct{true}
    vks::VkPhysicalDeviceCoherentMemoryFeaturesAMD
    deps::Vector{Any}
end

struct PipelineCompilerControlCreateInfoAMD <: VulkanStruct{true}
    vks::VkPipelineCompilerControlCreateInfoAMD
    deps::Vector{Any}
end

struct PhysicalDeviceVulkan12Features <: VulkanStruct{true}
    vks::VkPhysicalDeviceVulkan12Features
    deps::Vector{Any}
end

struct PhysicalDeviceVulkan11Properties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    device_uuid::String
    driver_uuid::String
    device_luid::String
    device_node_mask::UInt32
    device_luid_valid::Bool
    subgroup_size::UInt32
    subgroup_supported_stages::UInt32
    subgroup_supported_operations::UInt32
    subgroup_quad_operations_in_all_stages::Bool
    point_clipping_behavior::VkPointClippingBehavior
    max_multiview_view_count::UInt32
    max_multiview_instance_index::UInt32
    protected_no_fault::Bool
    max_per_set_descriptors::UInt32
    max_memory_allocation_size::UInt64
end

struct PhysicalDeviceVulkan11Features <: VulkanStruct{true}
    vks::VkPhysicalDeviceVulkan11Features
    deps::Vector{Any}
end

struct PhysicalDevicePipelineCreationCacheControlFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDevicePipelineCreationCacheControlFeaturesEXT
    deps::Vector{Any}
end

struct PipelineRasterizationLineStateCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineRasterizationLineStateCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceLineRasterizationPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    line_sub_pixel_precision_bits::UInt32
end

struct PhysicalDeviceLineRasterizationFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceLineRasterizationFeaturesEXT
    deps::Vector{Any}
end

struct DeviceMemoryOpaqueCaptureAddressInfo <: VulkanStruct{true}
    vks::VkDeviceMemoryOpaqueCaptureAddressInfo
    deps::Vector{Any}
end

struct MemoryOpaqueCaptureAddressAllocateInfo <: VulkanStruct{true}
    vks::VkMemoryOpaqueCaptureAddressAllocateInfo
    deps::Vector{Any}
end

struct PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    required_subgroup_size::UInt32
end

struct PhysicalDeviceSubgroupSizeControlPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    min_subgroup_size::UInt32
    max_subgroup_size::UInt32
    max_compute_workgroup_subgroups::UInt32
    required_subgroup_size_stages::UInt32
end

struct PhysicalDeviceSubgroupSizeControlFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceSubgroupSizeControlFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceTexelBufferAlignmentPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    storage_texel_buffer_offset_alignment_bytes::UInt64
    storage_texel_buffer_offset_single_texel_alignment::Bool
    uniform_texel_buffer_offset_alignment_bytes::UInt64
    uniform_texel_buffer_offset_single_texel_alignment::Bool
end

struct PhysicalDeviceTexelBufferAlignmentFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT
    deps::Vector{Any}
end

struct PipelineExecutableInternalRepresentationKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    name::String
    description::String
    is_text::Bool
    data_size::UInt
    p_data::Ptr{Cvoid}
end

struct PipelineExecutableStatisticValueKHR <: ReturnedOnly
    b32::Bool
    i64::Int64
    u64::UInt64
    f64::Float64
end

struct PipelineExecutableStatisticKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    name::String
    description::String
    format::VkPipelineExecutableStatisticFormatKHR
    value::PipelineExecutableStatisticValueKHR
end

struct PipelineExecutableInfoKHR <: VulkanStruct{true}
    vks::VkPipelineExecutableInfoKHR
    deps::Vector{Any}
end

struct PipelineExecutablePropertiesKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    stages::UInt32
    name::String
    description::String
    subgroup_size::UInt32
end

struct PipelineInfoKHR <: VulkanStruct{true}
    vks::VkPipelineInfoKHR
    deps::Vector{Any}
end

struct PhysicalDevicePipelineExecutablePropertiesFeaturesKHR <: VulkanStruct{true}
    vks::VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR
    deps::Vector{Any}
end

struct AttachmentDescriptionStencilLayout <: VulkanStruct{true}
    vks::VkAttachmentDescriptionStencilLayout
    deps::Vector{Any}
end

struct AttachmentReferenceStencilLayout <: VulkanStruct{true}
    vks::VkAttachmentReferenceStencilLayout
    deps::Vector{Any}
end

struct PhysicalDeviceSeparateDepthStencilLayoutsFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures
    deps::Vector{Any}
end

struct PhysicalDeviceFragmentShaderInterlockFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceShaderSMBuiltinsFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderSMBuiltinsFeaturesNV
    deps::Vector{Any}
end

struct PhysicalDeviceShaderSMBuiltinsPropertiesNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    shader_sm_count::UInt32
    shader_warps_per_sm::UInt32
end

struct PhysicalDeviceIndexTypeUint8FeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceIndexTypeUint8FeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceShaderClockFeaturesKHR <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderClockFeaturesKHR
    deps::Vector{Any}
end

struct PerformanceConfigurationAcquireInfoINTEL <: VulkanStruct{true}
    vks::VkPerformanceConfigurationAcquireInfoINTEL
    deps::Vector{Any}
end

struct PerformanceOverrideInfoINTEL <: VulkanStruct{true}
    vks::VkPerformanceOverrideInfoINTEL
    deps::Vector{Any}
end

struct PerformanceStreamMarkerInfoINTEL <: VulkanStruct{true}
    vks::VkPerformanceStreamMarkerInfoINTEL
    deps::Vector{Any}
end

struct PerformanceMarkerInfoINTEL <: VulkanStruct{true}
    vks::VkPerformanceMarkerInfoINTEL
    deps::Vector{Any}
end

struct QueryPoolPerformanceQueryCreateInfoINTEL <: VulkanStruct{true}
    vks::VkQueryPoolPerformanceQueryCreateInfoINTEL
    deps::Vector{Any}
end

struct InitializePerformanceApiInfoINTEL <: VulkanStruct{true}
    vks::VkInitializePerformanceApiInfoINTEL
    deps::Vector{Any}
end

struct PerformanceValueINTEL <: VulkanStruct{false}
    vks::VkPerformanceValueINTEL
end

struct PerformanceValueDataINTEL <: VulkanStruct{true}
    vks::VkPerformanceValueDataINTEL
    deps::Vector{Any}
end

struct PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL
    deps::Vector{Any}
end

struct FramebufferMixedSamplesCombinationNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    coverage_reduction_mode::VkCoverageReductionModeNV
    rasterization_samples::VkSampleCountFlagBits
    depth_stencil_samples::UInt32
    color_samples::UInt32
end

struct PipelineCoverageReductionStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineCoverageReductionStateCreateInfoNV
    deps::Vector{Any}
end

struct PhysicalDeviceCoverageReductionModeFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceCoverageReductionModeFeaturesNV
    deps::Vector{Any}
end

struct HeadlessSurfaceCreateInfoEXT <: VulkanStruct{true}
    vks::VkHeadlessSurfaceCreateInfoEXT
    deps::Vector{Any}
end

struct PerformanceQuerySubmitInfoKHR <: VulkanStruct{true}
    vks::VkPerformanceQuerySubmitInfoKHR
    deps::Vector{Any}
end

struct AcquireProfilingLockInfoKHR <: VulkanStruct{true}
    vks::VkAcquireProfilingLockInfoKHR
    deps::Vector{Any}
end

struct PerformanceCounterResultKHR <: VulkanStruct{false}
    vks::VkPerformanceCounterResultKHR
end

struct QueryPoolPerformanceCreateInfoKHR <: VulkanStruct{true}
    vks::VkQueryPoolPerformanceCreateInfoKHR
    deps::Vector{Any}
end

struct PerformanceCounterDescriptionKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    flags::UInt32
    name::String
    category::String
    description::String
end

struct PerformanceCounterKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    unit::VkPerformanceCounterUnitKHR
    scope::VkPerformanceCounterScopeKHR
    storage::VkPerformanceCounterStorageKHR
    uuid::String
end

struct PhysicalDevicePerformanceQueryPropertiesKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    allow_command_buffer_query_copies::Bool
end

struct PhysicalDevicePerformanceQueryFeaturesKHR <: VulkanStruct{true}
    vks::VkPhysicalDevicePerformanceQueryFeaturesKHR
    deps::Vector{Any}
end

struct SurfaceCapabilitiesFullScreenExclusiveEXT <: VulkanStruct{true}
    vks::VkSurfaceCapabilitiesFullScreenExclusiveEXT
    deps::Vector{Any}
end

struct SurfaceFullScreenExclusiveWin32InfoEXT <: VulkanStruct{true}
    vks::VkSurfaceFullScreenExclusiveWin32InfoEXT
    deps::Vector{Any}
end

struct SurfaceFullScreenExclusiveInfoEXT <: VulkanStruct{true}
    vks::VkSurfaceFullScreenExclusiveInfoEXT
    deps::Vector{Any}
end

struct PipelineCreationFeedbackCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineCreationFeedbackCreateInfoEXT
    deps::Vector{Any}
end

struct PipelineCreationFeedbackEXT <: ReturnedOnly
    flags::UInt32
    duration::UInt64
end

struct PresentFrameTokenGGP <: VulkanStruct{true}
    vks::VkPresentFrameTokenGGP
    deps::Vector{Any}
end

struct ImageViewAddressPropertiesNVX <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    device_address::UInt64
    size::UInt64
end

struct ImageViewHandleInfoNVX <: VulkanStruct{true}
    vks::VkImageViewHandleInfoNVX
    deps::Vector{Any}
end

struct PhysicalDeviceYcbcrImageArraysFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceYcbcrImageArraysFeaturesEXT
    deps::Vector{Any}
end

struct CooperativeMatrixPropertiesNV <: VulkanStruct{true}
    vks::VkCooperativeMatrixPropertiesNV
    deps::Vector{Any}
end

struct PhysicalDeviceCooperativeMatrixPropertiesNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    cooperative_matrix_supported_stages::UInt32
end

struct PhysicalDeviceCooperativeMatrixFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceCooperativeMatrixFeaturesNV
    deps::Vector{Any}
end

struct PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT
    deps::Vector{Any}
end

struct RenderPassAttachmentBeginInfo <: VulkanStruct{true}
    vks::VkRenderPassAttachmentBeginInfo
    deps::Vector{Any}
end

struct FramebufferAttachmentImageInfo <: VulkanStruct{true}
    vks::VkFramebufferAttachmentImageInfo
    deps::Vector{Any}
end

struct FramebufferAttachmentsCreateInfo <: VulkanStruct{true}
    vks::VkFramebufferAttachmentsCreateInfo
    deps::Vector{Any}
end

struct PhysicalDeviceImagelessFramebufferFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceImagelessFramebufferFeatures
    deps::Vector{Any}
end

struct FilterCubicImageViewImageFormatPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    filter_cubic::Bool
    filter_cubic_minmax::Bool
end

struct PhysicalDeviceImageViewImageFormatInfoEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceImageViewImageFormatInfoEXT
    deps::Vector{Any}
end

struct BufferDeviceAddressCreateInfoEXT <: VulkanStruct{true}
    vks::VkBufferDeviceAddressCreateInfoEXT
    deps::Vector{Any}
end

struct BufferOpaqueCaptureAddressCreateInfo <: VulkanStruct{true}
    vks::VkBufferOpaqueCaptureAddressCreateInfo
    deps::Vector{Any}
end

struct BufferDeviceAddressInfo <: VulkanStruct{true}
    vks::VkBufferDeviceAddressInfo
    deps::Vector{Any}
end

struct PhysicalDeviceBufferDeviceAddressFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceBufferDeviceAddressFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceBufferDeviceAddressFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceBufferDeviceAddressFeatures
    deps::Vector{Any}
end

struct MemoryPriorityAllocateInfoEXT <: VulkanStruct{true}
    vks::VkMemoryPriorityAllocateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceMemoryPriorityFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceMemoryPriorityFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceMemoryBudgetPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    heap_budget::NTuple{VK_MAX_MEMORY_HEAPS, VkDeviceSize}
    heap_usage::NTuple{VK_MAX_MEMORY_HEAPS, VkDeviceSize}
end

struct PipelineRasterizationDepthClipStateCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineRasterizationDepthClipStateCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceDepthClipEnableFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceDepthClipEnableFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceUniformBufferStandardLayoutFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceUniformBufferStandardLayoutFeatures
    deps::Vector{Any}
end

struct SurfaceProtectedCapabilitiesKHR <: VulkanStruct{true}
    vks::VkSurfaceProtectedCapabilitiesKHR
    deps::Vector{Any}
end

struct PhysicalDeviceScalarBlockLayoutFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceScalarBlockLayoutFeatures
    deps::Vector{Any}
end

struct RenderPassFragmentDensityMapCreateInfoEXT <: VulkanStruct{true}
    vks::VkRenderPassFragmentDensityMapCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceFragmentDensityMap2PropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    subsampled_loads::Bool
    subsampled_coarse_reconstruction_early_access::Bool
    max_subsampled_array_layers::UInt32
    max_descriptor_set_subsampled_samplers::UInt32
end

struct PhysicalDeviceFragmentDensityMap2FeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceFragmentDensityMap2FeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceFragmentDensityMapFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceFragmentDensityMapFeaturesEXT
    deps::Vector{Any}
end

struct DeviceMemoryOverallocationCreateInfoAMD <: VulkanStruct{true}
    vks::VkDeviceMemoryOverallocationCreateInfoAMD
    deps::Vector{Any}
end

struct ImageStencilUsageCreateInfo <: VulkanStruct{true}
    vks::VkImageStencilUsageCreateInfo
    deps::Vector{Any}
end

struct ImageDrmFormatModifierPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    drm_format_modifier::UInt64
end

struct ImageDrmFormatModifierExplicitCreateInfoEXT <: VulkanStruct{true}
    vks::VkImageDrmFormatModifierExplicitCreateInfoEXT
    deps::Vector{Any}
end

struct ImageDrmFormatModifierListCreateInfoEXT <: VulkanStruct{true}
    vks::VkImageDrmFormatModifierListCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceImageDrmFormatModifierInfoEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceImageDrmFormatModifierInfoEXT
    deps::Vector{Any}
end

struct DrmFormatModifierPropertiesEXT <: ReturnedOnly
    drm_format_modifier::UInt64
    drm_format_modifier_plane_count::UInt32
    drm_format_modifier_tiling_features::UInt32
end

struct DrmFormatModifierPropertiesListEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    drm_format_modifier_count::UInt32
    p_drm_format_modifier_properties::Vector{DrmFormatModifierPropertiesEXT}
end

struct TraceRaysIndirectCommandKHR <: VulkanStruct{false}
    vks::VkTraceRaysIndirectCommandKHR
end

struct StridedBufferRegionKHR <: VulkanStruct{false}
    vks::VkStridedBufferRegionKHR
end

struct PhysicalDeviceRayTracingPropertiesNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    shader_group_handle_size::UInt32
    max_recursion_depth::UInt32
    max_shader_group_stride::UInt32
    shader_group_base_alignment::UInt32
    max_geometry_count::UInt64
    max_instance_count::UInt64
    max_triangle_count::UInt64
    max_descriptor_set_acceleration_structures::UInt32
end

struct PhysicalDeviceRayTracingPropertiesKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    shader_group_handle_size::UInt32
    max_recursion_depth::UInt32
    max_shader_group_stride::UInt32
    shader_group_base_alignment::UInt32
    max_geometry_count::UInt64
    max_instance_count::UInt64
    max_primitive_count::UInt64
    max_descriptor_set_acceleration_structures::UInt32
    shader_group_handle_capture_replay_size::UInt32
end

struct PhysicalDeviceRayTracingFeaturesKHR <: VulkanStruct{true}
    vks::VkPhysicalDeviceRayTracingFeaturesKHR
    deps::Vector{Any}
end

struct AccelerationStructureMemoryRequirementsInfoNV <: VulkanStruct{true}
    vks::VkAccelerationStructureMemoryRequirementsInfoNV
    deps::Vector{Any}
end

struct AccelerationStructureMemoryRequirementsInfoKHR <: VulkanStruct{true}
    vks::VkAccelerationStructureMemoryRequirementsInfoKHR
    deps::Vector{Any}
end

struct WriteDescriptorSetAccelerationStructureKHR <: VulkanStruct{true}
    vks::VkWriteDescriptorSetAccelerationStructureKHR
    deps::Vector{Any}
end

struct BindAccelerationStructureMemoryInfoKHR <: VulkanStruct{true}
    vks::VkBindAccelerationStructureMemoryInfoKHR
    deps::Vector{Any}
end

struct AccelerationStructureCreateInfoNV <: VulkanStruct{true}
    vks::VkAccelerationStructureCreateInfoNV
    deps::Vector{Any}
end

struct AccelerationStructureInfoNV <: VulkanStruct{true}
    vks::VkAccelerationStructureInfoNV
    deps::Vector{Any}
end

struct GeometryNV <: VulkanStruct{true}
    vks::VkGeometryNV
    deps::Vector{Any}
end

struct GeometryDataNV <: VulkanStruct{false}
    vks::VkGeometryDataNV
end

struct GeometryAABBNV <: VulkanStruct{true}
    vks::VkGeometryAABBNV
    deps::Vector{Any}
end

struct GeometryTrianglesNV <: VulkanStruct{true}
    vks::VkGeometryTrianglesNV
    deps::Vector{Any}
end

struct RayTracingPipelineCreateInfoKHR <: VulkanStruct{true}
    vks::VkRayTracingPipelineCreateInfoKHR
    deps::Vector{Any}
end

struct RayTracingPipelineCreateInfoNV <: VulkanStruct{true}
    vks::VkRayTracingPipelineCreateInfoNV
    deps::Vector{Any}
end

struct RayTracingShaderGroupCreateInfoKHR <: VulkanStruct{true}
    vks::VkRayTracingShaderGroupCreateInfoKHR
    deps::Vector{Any}
end

struct RayTracingShaderGroupCreateInfoNV <: VulkanStruct{true}
    vks::VkRayTracingShaderGroupCreateInfoNV
    deps::Vector{Any}
end

struct DrawMeshTasksIndirectCommandNV <: VulkanStruct{false}
    vks::VkDrawMeshTasksIndirectCommandNV
end

struct PhysicalDeviceMeshShaderPropertiesNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_draw_mesh_tasks_count::UInt32
    max_task_work_group_invocations::UInt32
    max_task_work_group_size::NTuple{3, UInt32}
    max_task_total_memory_size::UInt32
    max_task_output_count::UInt32
    max_mesh_work_group_invocations::UInt32
    max_mesh_work_group_size::NTuple{3, UInt32}
    max_mesh_total_memory_size::UInt32
    max_mesh_output_vertices::UInt32
    max_mesh_output_primitives::UInt32
    max_mesh_multiview_view_count::UInt32
    mesh_output_per_vertex_granularity::UInt32
    mesh_output_per_primitive_granularity::UInt32
end

struct PhysicalDeviceMeshShaderFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceMeshShaderFeaturesNV
    deps::Vector{Any}
end

struct PipelineViewportCoarseSampleOrderStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineViewportCoarseSampleOrderStateCreateInfoNV
    deps::Vector{Any}
end

struct CoarseSampleOrderCustomNV <: VulkanStruct{true}
    vks::VkCoarseSampleOrderCustomNV
    deps::Vector{Any}
end

struct CoarseSampleLocationNV <: VulkanStruct{false}
    vks::VkCoarseSampleLocationNV
end

struct PhysicalDeviceShadingRateImageFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceShadingRateImageFeaturesNV
    deps::Vector{Any}
end

struct PipelineViewportShadingRateImageStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineViewportShadingRateImageStateCreateInfoNV
    deps::Vector{Any}
end

struct ShadingRatePaletteNV <: VulkanStruct{true}
    vks::VkShadingRatePaletteNV
    deps::Vector{Any}
end

struct PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV
    deps::Vector{Any}
end

struct PhysicalDeviceShaderImageFootprintFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderImageFootprintFeaturesNV
    deps::Vector{Any}
end

struct PhysicalDeviceFragmentShaderBarycentricFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
    deps::Vector{Any}
end

struct PhysicalDeviceComputeShaderDerivativesFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
    deps::Vector{Any}
end

struct PhysicalDeviceCornerSampledImageFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceCornerSampledImageFeaturesNV
    deps::Vector{Any}
end

struct PipelineViewportExclusiveScissorStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineViewportExclusiveScissorStateCreateInfoNV
    deps::Vector{Any}
end

struct PhysicalDeviceExclusiveScissorFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceExclusiveScissorFeaturesNV
    deps::Vector{Any}
end

struct PipelineRepresentativeFragmentTestStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineRepresentativeFragmentTestStateCreateInfoNV
    deps::Vector{Any}
end

struct PhysicalDeviceRepresentativeFragmentTestFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV
    deps::Vector{Any}
end

struct PipelineRasterizationStateStreamCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineRasterizationStateStreamCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceTransformFeedbackPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_transform_feedback_streams::UInt32
    max_transform_feedback_buffers::UInt32
    max_transform_feedback_buffer_size::UInt64
    max_transform_feedback_stream_data_size::UInt32
    max_transform_feedback_buffer_data_size::UInt32
    max_transform_feedback_buffer_data_stride::UInt32
    transform_feedback_queries::Bool
    transform_feedback_streams_lines_triangles::Bool
    transform_feedback_rasterization_stream_select::Bool
    transform_feedback_draw::Bool
end

struct PhysicalDeviceTransformFeedbackFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceTransformFeedbackFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceASTCDecodeFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceASTCDecodeFeaturesEXT
    deps::Vector{Any}
end

struct ImageViewASTCDecodeModeEXT <: VulkanStruct{true}
    vks::VkImageViewASTCDecodeModeEXT
    deps::Vector{Any}
end

struct SubpassDescriptionDepthStencilResolve <: VulkanStruct{true}
    vks::VkSubpassDescriptionDepthStencilResolve
    deps::Vector{Any}
end

struct PhysicalDeviceDepthStencilResolveProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    supported_depth_resolve_modes::UInt32
    supported_stencil_resolve_modes::UInt32
    independent_resolve_none::Bool
    independent_resolve::Bool
end

struct CheckpointDataNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    stage::VkPipelineStageFlagBits
    p_checkpoint_marker::Ptr{Cvoid}
end

struct QueueFamilyCheckpointPropertiesNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    checkpoint_execution_stage_mask::UInt32
end

struct PhysicalDeviceVertexAttributeDivisorFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceShaderAtomicFloatFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderAtomicFloatFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDeviceShaderAtomicInt64Features <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderAtomicInt64Features
    deps::Vector{Any}
end

struct PhysicalDeviceVulkanMemoryModelFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceVulkanMemoryModelFeatures
    deps::Vector{Any}
end

struct PhysicalDeviceConditionalRenderingFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceConditionalRenderingFeaturesEXT
    deps::Vector{Any}
end

struct PhysicalDevice8BitStorageFeatures <: VulkanStruct{true}
    vks::VkPhysicalDevice8BitStorageFeatures
    deps::Vector{Any}
end

struct ExternalFormatANDROID <: VulkanStruct{true}
    vks::VkExternalFormatANDROID
    deps::Vector{Any}
end

struct CommandBufferInheritanceConditionalRenderingInfoEXT <: VulkanStruct{true}
    vks::VkCommandBufferInheritanceConditionalRenderingInfoEXT
    deps::Vector{Any}
end

struct MemoryGetAndroidHardwareBufferInfoANDROID <: VulkanStruct{true}
    vks::VkMemoryGetAndroidHardwareBufferInfoANDROID
    deps::Vector{Any}
end

struct AndroidHardwareBufferPropertiesANDROID <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    allocation_size::UInt64
    memory_type_bits::UInt32
end

struct AndroidHardwareBufferUsageANDROID <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    android_hardware_buffer_usage::UInt64
end

struct ImportAndroidHardwareBufferInfoANDROID <: VulkanStruct{true}
    vks::VkImportAndroidHardwareBufferInfoANDROID
    deps::Vector{Any}
end

struct PhysicalDevicePCIBusInfoPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    pci_domain::UInt32
    pci_bus::UInt32
    pci_device::UInt32
    pci_function::UInt32
end

struct PhysicalDeviceVertexAttributeDivisorPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_vertex_attrib_divisor::UInt32
end

struct PipelineVertexInputDivisorStateCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineVertexInputDivisorStateCreateInfoEXT
    deps::Vector{Any}
end

struct VertexInputBindingDivisorDescriptionEXT <: VulkanStruct{false}
    vks::VkVertexInputBindingDivisorDescriptionEXT
end

struct SemaphoreSignalInfo <: VulkanStruct{true}
    vks::VkSemaphoreSignalInfo
    deps::Vector{Any}
end

struct SemaphoreWaitInfo <: VulkanStruct{true}
    vks::VkSemaphoreWaitInfo
    deps::Vector{Any}
end

struct TimelineSemaphoreSubmitInfo <: VulkanStruct{true}
    vks::VkTimelineSemaphoreSubmitInfo
    deps::Vector{Any}
end

struct SemaphoreTypeCreateInfo <: VulkanStruct{true}
    vks::VkSemaphoreTypeCreateInfo
    deps::Vector{Any}
end

struct PhysicalDeviceTimelineSemaphoreProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_timeline_semaphore_value_difference::UInt64
end

struct PhysicalDeviceTimelineSemaphoreFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceTimelineSemaphoreFeatures
    deps::Vector{Any}
end

struct SubpassEndInfo <: VulkanStruct{true}
    vks::VkSubpassEndInfo
    deps::Vector{Any}
end

struct SubpassBeginInfo <: VulkanStruct{true}
    vks::VkSubpassBeginInfo
    deps::Vector{Any}
end

struct RenderPassCreateInfo2 <: VulkanStruct{true}
    vks::VkRenderPassCreateInfo2
    deps::Vector{Any}
end

struct SubpassDependency2 <: VulkanStruct{true}
    vks::VkSubpassDependency2
    deps::Vector{Any}
end

struct SubpassDescription2 <: VulkanStruct{true}
    vks::VkSubpassDescription2
    deps::Vector{Any}
end

struct AttachmentReference2 <: VulkanStruct{true}
    vks::VkAttachmentReference2
    deps::Vector{Any}
end

struct AttachmentDescription2 <: VulkanStruct{true}
    vks::VkAttachmentDescription2
    deps::Vector{Any}
end

struct DescriptorSetVariableDescriptorCountLayoutSupport <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_variable_descriptor_count::UInt32
end

struct DescriptorSetVariableDescriptorCountAllocateInfo <: VulkanStruct{true}
    vks::VkDescriptorSetVariableDescriptorCountAllocateInfo
    deps::Vector{Any}
end

struct DescriptorSetLayoutBindingFlagsCreateInfo <: VulkanStruct{true}
    vks::VkDescriptorSetLayoutBindingFlagsCreateInfo
    deps::Vector{Any}
end

struct PhysicalDeviceDescriptorIndexingProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_update_after_bind_descriptors_in_all_pools::UInt32
    shader_uniform_buffer_array_non_uniform_indexing_native::Bool
    shader_sampled_image_array_non_uniform_indexing_native::Bool
    shader_storage_buffer_array_non_uniform_indexing_native::Bool
    shader_storage_image_array_non_uniform_indexing_native::Bool
    shader_input_attachment_array_non_uniform_indexing_native::Bool
    robust_buffer_access_update_after_bind::Bool
    quad_divergent_implicit_lod::Bool
    max_per_stage_descriptor_update_after_bind_samplers::UInt32
    max_per_stage_descriptor_update_after_bind_uniform_buffers::UInt32
    max_per_stage_descriptor_update_after_bind_storage_buffers::UInt32
    max_per_stage_descriptor_update_after_bind_sampled_images::UInt32
    max_per_stage_descriptor_update_after_bind_storage_images::UInt32
    max_per_stage_descriptor_update_after_bind_input_attachments::UInt32
    max_per_stage_update_after_bind_resources::UInt32
    max_descriptor_set_update_after_bind_samplers::UInt32
    max_descriptor_set_update_after_bind_uniform_buffers::UInt32
    max_descriptor_set_update_after_bind_uniform_buffers_dynamic::UInt32
    max_descriptor_set_update_after_bind_storage_buffers::UInt32
    max_descriptor_set_update_after_bind_storage_buffers_dynamic::UInt32
    max_descriptor_set_update_after_bind_sampled_images::UInt32
    max_descriptor_set_update_after_bind_storage_images::UInt32
    max_descriptor_set_update_after_bind_input_attachments::UInt32
end

struct PhysicalDeviceDescriptorIndexingFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceDescriptorIndexingFeatures
    deps::Vector{Any}
end

struct PipelineRasterizationConservativeStateCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineRasterizationConservativeStateCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceShaderCoreProperties2AMD <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    shader_core_features::UInt32
    active_compute_unit_count::UInt32
end

struct PhysicalDeviceShaderCorePropertiesAMD <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    shader_engine_count::UInt32
    shader_arrays_per_engine_count::UInt32
    compute_units_per_shader_array::UInt32
    simd_per_compute_unit::UInt32
    wavefronts_per_simd::UInt32
    wavefront_size::UInt32
    sgprs_per_simd::UInt32
    min_sgpr_allocation::UInt32
    max_sgpr_allocation::UInt32
    sgpr_allocation_granularity::UInt32
    vgprs_per_simd::UInt32
    min_vgpr_allocation::UInt32
    max_vgpr_allocation::UInt32
    vgpr_allocation_granularity::UInt32
end

struct CalibratedTimestampInfoEXT <: VulkanStruct{true}
    vks::VkCalibratedTimestampInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceConservativeRasterizationPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    primitive_overestimation_size::Float32
    max_extra_primitive_overestimation_size::Float32
    extra_primitive_overestimation_size_granularity::Float32
    primitive_underestimation::Bool
    conservative_point_and_line_rasterization::Bool
    degenerate_triangles_rasterized::Bool
    degenerate_lines_rasterized::Bool
    fully_covered_fragment_shader_input_variable::Bool
    conservative_rasterization_post_depth_coverage::Bool
end

struct PhysicalDeviceExternalMemoryHostPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    min_imported_host_pointer_alignment::UInt64
end

struct MemoryHostPointerPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    memory_type_bits::UInt32
end

struct ImportMemoryHostPointerInfoEXT <: VulkanStruct{true}
    vks::VkImportMemoryHostPointerInfoEXT
    deps::Vector{Any}
end

struct DebugUtilsMessengerCallbackDataEXT <: VulkanStruct{true}
    vks::VkDebugUtilsMessengerCallbackDataEXT
    deps::Vector{Any}
end

struct DebugUtilsMessengerCreateInfoEXT <: VulkanStruct{true}
    vks::VkDebugUtilsMessengerCreateInfoEXT
    deps::Vector{Any}
end

struct DebugUtilsLabelEXT <: VulkanStruct{true}
    vks::VkDebugUtilsLabelEXT
    deps::Vector{Any}
end

struct DebugUtilsObjectTagInfoEXT <: VulkanStruct{true}
    vks::VkDebugUtilsObjectTagInfoEXT
    deps::Vector{Any}
end

struct DebugUtilsObjectNameInfoEXT <: VulkanStruct{true}
    vks::VkDebugUtilsObjectNameInfoEXT
    deps::Vector{Any}
end

struct DeviceQueueGlobalPriorityCreateInfoEXT <: VulkanStruct{true}
    vks::VkDeviceQueueGlobalPriorityCreateInfoEXT
    deps::Vector{Any}
end

struct ShaderResourceUsageAMD <: ReturnedOnly
    num_used_vgprs::UInt32
    num_used_sgprs::UInt32
    lds_size_per_local_work_group::UInt32
    lds_usage_size_in_bytes::UInt
    scratch_mem_usage_in_bytes::UInt
end

struct ShaderStatisticsInfoAMD <: ReturnedOnly
    shader_stage_mask::UInt32
    resource_usage::ShaderResourceUsageAMD
    num_physical_vgprs::UInt32
    num_physical_sgprs::UInt32
    num_available_vgprs::UInt32
    num_available_sgprs::UInt32
    compute_work_group_size::NTuple{3, UInt32}
end

struct PhysicalDeviceHostQueryResetFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceHostQueryResetFeatures
    deps::Vector{Any}
end

struct PhysicalDeviceFloatControlsProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    denorm_behavior_independence::VkShaderFloatControlsIndependence
    rounding_mode_independence::VkShaderFloatControlsIndependence
    shader_signed_zero_inf_nan_preserve_float_16::Bool
    shader_signed_zero_inf_nan_preserve_float_32::Bool
    shader_signed_zero_inf_nan_preserve_float_64::Bool
    shader_denorm_preserve_float_16::Bool
    shader_denorm_preserve_float_32::Bool
    shader_denorm_preserve_float_64::Bool
    shader_denorm_flush_to_zero_float_16::Bool
    shader_denorm_flush_to_zero_float_32::Bool
    shader_denorm_flush_to_zero_float_64::Bool
    shader_rounding_mode_rte_float_16::Bool
    shader_rounding_mode_rte_float_32::Bool
    shader_rounding_mode_rte_float_64::Bool
    shader_rounding_mode_rtz_float_16::Bool
    shader_rounding_mode_rtz_float_32::Bool
    shader_rounding_mode_rtz_float_64::Bool
end

struct PhysicalDeviceShaderFloat16Int8Features <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderFloat16Int8Features
    deps::Vector{Any}
end

struct PhysicalDeviceShaderDrawParametersFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderDrawParametersFeatures
    deps::Vector{Any}
end

struct DescriptorSetLayoutSupport <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    supported::Bool
end

struct PhysicalDeviceMaintenance3Properties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_per_set_descriptors::UInt32
    max_memory_allocation_size::UInt64
end

struct ShaderModuleValidationCacheCreateInfoEXT <: VulkanStruct{true}
    vks::VkShaderModuleValidationCacheCreateInfoEXT
    deps::Vector{Any}
end

struct ValidationCacheCreateInfoEXT <: VulkanStruct{true}
    vks::VkValidationCacheCreateInfoEXT
    deps::Vector{Any}
end

struct ImageFormatListCreateInfo <: VulkanStruct{true}
    vks::VkImageFormatListCreateInfo
    deps::Vector{Any}
end

struct PipelineCoverageModulationStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineCoverageModulationStateCreateInfoNV
    deps::Vector{Any}
end

struct DescriptorPoolInlineUniformBlockCreateInfoEXT <: VulkanStruct{true}
    vks::VkDescriptorPoolInlineUniformBlockCreateInfoEXT
    deps::Vector{Any}
end

struct WriteDescriptorSetInlineUniformBlockEXT <: VulkanStruct{true}
    vks::VkWriteDescriptorSetInlineUniformBlockEXT
    deps::Vector{Any}
end

struct PhysicalDeviceInlineUniformBlockPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_inline_uniform_block_size::UInt32
    max_per_stage_descriptor_inline_uniform_blocks::UInt32
    max_per_stage_descriptor_update_after_bind_inline_uniform_blocks::UInt32
    max_descriptor_set_inline_uniform_blocks::UInt32
    max_descriptor_set_update_after_bind_inline_uniform_blocks::UInt32
end

struct PhysicalDeviceInlineUniformBlockFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceInlineUniformBlockFeaturesEXT
    deps::Vector{Any}
end

struct PipelineColorBlendAdvancedStateCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineColorBlendAdvancedStateCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceBlendOperationAdvancedPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    advanced_blend_max_color_attachments::UInt32
    advanced_blend_independent_blend::Bool
    advanced_blend_non_premultiplied_src_color::Bool
    advanced_blend_non_premultiplied_dst_color::Bool
    advanced_blend_correlated_overlap::Bool
    advanced_blend_all_operations::Bool
end

struct PhysicalDeviceBlendOperationAdvancedFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT
    deps::Vector{Any}
end

struct SamplerReductionModeCreateInfo <: VulkanStruct{true}
    vks::VkSamplerReductionModeCreateInfo
    deps::Vector{Any}
end

struct PipelineSampleLocationsStateCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineSampleLocationsStateCreateInfoEXT
    deps::Vector{Any}
end

struct RenderPassSampleLocationsBeginInfoEXT <: VulkanStruct{true}
    vks::VkRenderPassSampleLocationsBeginInfoEXT
    deps::Vector{Any}
end

struct SubpassSampleLocationsEXT <: VulkanStruct{false}
    vks::VkSubpassSampleLocationsEXT
end

struct AttachmentSampleLocationsEXT <: VulkanStruct{false}
    vks::VkAttachmentSampleLocationsEXT
end

struct SampleLocationsInfoEXT <: VulkanStruct{true}
    vks::VkSampleLocationsInfoEXT
    deps::Vector{Any}
end

struct SampleLocationEXT <: VulkanStruct{false}
    vks::VkSampleLocationEXT
end

struct PhysicalDeviceSamplerFilterMinmaxProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    filter_minmax_single_component_formats::Bool
    filter_minmax_image_component_mapping::Bool
end

struct PipelineCoverageToColorStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineCoverageToColorStateCreateInfoNV
    deps::Vector{Any}
end

struct DeviceQueueInfo2 <: VulkanStruct{true}
    vks::VkDeviceQueueInfo2
    deps::Vector{Any}
end

struct PhysicalDeviceProtectedMemoryProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    protected_no_fault::Bool
end

struct PhysicalDeviceProtectedMemoryFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceProtectedMemoryFeatures
    deps::Vector{Any}
end

struct ProtectedSubmitInfo <: VulkanStruct{true}
    vks::VkProtectedSubmitInfo
    deps::Vector{Any}
end

struct ConditionalRenderingBeginInfoEXT <: VulkanStruct{true}
    vks::VkConditionalRenderingBeginInfoEXT
    deps::Vector{Any}
end

struct TextureLODGatherFormatPropertiesAMD <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    supports_texture_gather_lod_bias_amd::Bool
end

struct SamplerYcbcrConversionImageFormatProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    combined_image_sampler_descriptor_count::UInt32
end

struct PhysicalDeviceSamplerYcbcrConversionFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceSamplerYcbcrConversionFeatures
    deps::Vector{Any}
end

struct ImagePlaneMemoryRequirementsInfo <: VulkanStruct{true}
    vks::VkImagePlaneMemoryRequirementsInfo
    deps::Vector{Any}
end

struct BindImagePlaneMemoryInfo <: VulkanStruct{true}
    vks::VkBindImagePlaneMemoryInfo
    deps::Vector{Any}
end

struct SamplerYcbcrConversionCreateInfo <: VulkanStruct{true}
    vks::VkSamplerYcbcrConversionCreateInfo
    deps::Vector{Any}
end

struct SamplerYcbcrConversionInfo <: VulkanStruct{true}
    vks::VkSamplerYcbcrConversionInfo
    deps::Vector{Any}
end

struct PipelineTessellationDomainOriginStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineTessellationDomainOriginStateCreateInfo
    deps::Vector{Any}
end

struct ImageViewUsageCreateInfo <: VulkanStruct{true}
    vks::VkImageViewUsageCreateInfo
    deps::Vector{Any}
end

struct MemoryDedicatedAllocateInfo <: VulkanStruct{true}
    vks::VkMemoryDedicatedAllocateInfo
    deps::Vector{Any}
end

struct MemoryDedicatedRequirements <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    prefers_dedicated_allocation::Bool
    requires_dedicated_allocation::Bool
end

struct PhysicalDevicePointClippingProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    point_clipping_behavior::VkPointClippingBehavior
end

struct ImageSparseMemoryRequirementsInfo2 <: VulkanStruct{true}
    vks::VkImageSparseMemoryRequirementsInfo2
    deps::Vector{Any}
end

struct ImageMemoryRequirementsInfo2 <: VulkanStruct{true}
    vks::VkImageMemoryRequirementsInfo2
    deps::Vector{Any}
end

struct BufferMemoryRequirementsInfo2 <: VulkanStruct{true}
    vks::VkBufferMemoryRequirementsInfo2
    deps::Vector{Any}
end

struct PhysicalDeviceShaderSubgroupExtendedTypesFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures
    deps::Vector{Any}
end

struct PhysicalDeviceSubgroupProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    subgroup_size::UInt32
    supported_stages::UInt32
    supported_operations::UInt32
    quad_operations_in_all_stages::Bool
end

struct PhysicalDevice16BitStorageFeatures <: VulkanStruct{true}
    vks::VkPhysicalDevice16BitStorageFeatures
    deps::Vector{Any}
end

struct SharedPresentSurfaceCapabilitiesKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    shared_present_supported_usage_flags::UInt32
end

struct DisplayPlaneInfo2KHR <: VulkanStruct{true}
    vks::VkDisplayPlaneInfo2KHR
    deps::Vector{Any}
end

struct PhysicalDeviceSurfaceInfo2KHR <: VulkanStruct{true}
    vks::VkPhysicalDeviceSurfaceInfo2KHR
    deps::Vector{Any}
end

struct RenderPassInputAttachmentAspectCreateInfo <: VulkanStruct{true}
    vks::VkRenderPassInputAttachmentAspectCreateInfo
    deps::Vector{Any}
end

struct InputAttachmentAspectReference <: VulkanStruct{false}
    vks::VkInputAttachmentAspectReference
end

struct PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    per_view_position_all_components::Bool
end

struct PipelineDiscardRectangleStateCreateInfoEXT <: VulkanStruct{true}
    vks::VkPipelineDiscardRectangleStateCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceDiscardRectanglePropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_discard_rectangles::UInt32
end

struct PipelineViewportSwizzleStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineViewportSwizzleStateCreateInfoNV
    deps::Vector{Any}
end

struct ViewportSwizzleNV <: VulkanStruct{false}
    vks::VkViewportSwizzleNV
end

struct PipelineViewportWScalingStateCreateInfoNV <: VulkanStruct{true}
    vks::VkPipelineViewportWScalingStateCreateInfoNV
    deps::Vector{Any}
end

struct ViewportWScalingNV <: VulkanStruct{false}
    vks::VkViewportWScalingNV
end

struct MetalSurfaceCreateInfoEXT <: VulkanStruct{true}
    vks::VkMetalSurfaceCreateInfoEXT
    deps::Vector{Any}
end

struct MacOSSurfaceCreateInfoMVK <: VulkanStruct{true}
    vks::VkMacOSSurfaceCreateInfoMVK
    deps::Vector{Any}
end

struct IOSSurfaceCreateInfoMVK <: VulkanStruct{true}
    vks::VkIOSSurfaceCreateInfoMVK
    deps::Vector{Any}
end

struct PresentTimeGOOGLE <: VulkanStruct{false}
    vks::VkPresentTimeGOOGLE
end

struct PresentTimesInfoGOOGLE <: VulkanStruct{true}
    vks::VkPresentTimesInfoGOOGLE
    deps::Vector{Any}
end

struct PastPresentationTimingGOOGLE <: ReturnedOnly
    present_id::UInt32
    desired_present_time::UInt64
    actual_present_time::UInt64
    earliest_present_time::UInt64
    present_margin::UInt64
end

struct RefreshCycleDurationGOOGLE <: ReturnedOnly
    refresh_duration::UInt64
end

struct SwapchainDisplayNativeHdrCreateInfoAMD <: VulkanStruct{true}
    vks::VkSwapchainDisplayNativeHdrCreateInfoAMD
    deps::Vector{Any}
end

struct DisplayNativeHdrSurfaceCapabilitiesAMD <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    local_dimming_support::Bool
end

struct HdrMetadataEXT <: VulkanStruct{true}
    vks::VkHdrMetadataEXT
    deps::Vector{Any}
end

struct XYColorEXT <: VulkanStruct{false}
    vks::VkXYColorEXT
end

struct DescriptorUpdateTemplateCreateInfo <: VulkanStruct{true}
    vks::VkDescriptorUpdateTemplateCreateInfo
    deps::Vector{Any}
end

struct DescriptorUpdateTemplateEntry <: VulkanStruct{false}
    vks::VkDescriptorUpdateTemplateEntry
end

struct DeviceGroupSwapchainCreateInfoKHR <: VulkanStruct{true}
    vks::VkDeviceGroupSwapchainCreateInfoKHR
    deps::Vector{Any}
end

struct DeviceGroupDeviceCreateInfo <: VulkanStruct{true}
    vks::VkDeviceGroupDeviceCreateInfo
    deps::Vector{Any}
end

struct DeviceGroupPresentInfoKHR <: VulkanStruct{true}
    vks::VkDeviceGroupPresentInfoKHR
    deps::Vector{Any}
end

struct AcquireNextImageInfoKHR <: VulkanStruct{true}
    vks::VkAcquireNextImageInfoKHR
    deps::Vector{Any}
end

struct BindImageMemorySwapchainInfoKHR <: VulkanStruct{true}
    vks::VkBindImageMemorySwapchainInfoKHR
    deps::Vector{Any}
end

struct ImageSwapchainCreateInfoKHR <: VulkanStruct{true}
    vks::VkImageSwapchainCreateInfoKHR
    deps::Vector{Any}
end

struct DeviceGroupPresentCapabilitiesKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    present_mask::NTuple{VK_MAX_DEVICE_GROUP_SIZE, UInt32}
    modes::UInt32
end

struct DeviceGroupBindSparseInfo <: VulkanStruct{true}
    vks::VkDeviceGroupBindSparseInfo
    deps::Vector{Any}
end

struct DeviceGroupSubmitInfo <: VulkanStruct{true}
    vks::VkDeviceGroupSubmitInfo
    deps::Vector{Any}
end

struct DeviceGroupCommandBufferBeginInfo <: VulkanStruct{true}
    vks::VkDeviceGroupCommandBufferBeginInfo
    deps::Vector{Any}
end

struct DeviceGroupRenderPassBeginInfo <: VulkanStruct{true}
    vks::VkDeviceGroupRenderPassBeginInfo
    deps::Vector{Any}
end

struct BindImageMemoryDeviceGroupInfo <: VulkanStruct{true}
    vks::VkBindImageMemoryDeviceGroupInfo
    deps::Vector{Any}
end

struct BindImageMemoryInfo <: VulkanStruct{true}
    vks::VkBindImageMemoryInfo
    deps::Vector{Any}
end

struct BindBufferMemoryDeviceGroupInfo <: VulkanStruct{true}
    vks::VkBindBufferMemoryDeviceGroupInfo
    deps::Vector{Any}
end

struct BindBufferMemoryInfo <: VulkanStruct{true}
    vks::VkBindBufferMemoryInfo
    deps::Vector{Any}
end

struct MemoryAllocateFlagsInfo <: VulkanStruct{true}
    vks::VkMemoryAllocateFlagsInfo
    deps::Vector{Any}
end

struct PhysicalDeviceGroupProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    physical_device_count::UInt32
    physical_devices::NTuple{VK_MAX_DEVICE_GROUP_SIZE, VkPhysicalDevice}
    subset_allocation::Bool
end

struct SwapchainCounterCreateInfoEXT <: VulkanStruct{true}
    vks::VkSwapchainCounterCreateInfoEXT
    deps::Vector{Any}
end

struct DisplayEventInfoEXT <: VulkanStruct{true}
    vks::VkDisplayEventInfoEXT
    deps::Vector{Any}
end

struct DeviceEventInfoEXT <: VulkanStruct{true}
    vks::VkDeviceEventInfoEXT
    deps::Vector{Any}
end

struct DisplayPowerInfoEXT <: VulkanStruct{true}
    vks::VkDisplayPowerInfoEXT
    deps::Vector{Any}
end

struct RenderPassMultiviewCreateInfo <: VulkanStruct{true}
    vks::VkRenderPassMultiviewCreateInfo
    deps::Vector{Any}
end

struct PhysicalDeviceMultiviewProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_multiview_view_count::UInt32
    max_multiview_instance_index::UInt32
end

struct PhysicalDeviceMultiviewFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceMultiviewFeatures
    deps::Vector{Any}
end

struct FenceGetFdInfoKHR <: VulkanStruct{true}
    vks::VkFenceGetFdInfoKHR
    deps::Vector{Any}
end

struct ImportFenceFdInfoKHR <: VulkanStruct{true}
    vks::VkImportFenceFdInfoKHR
    deps::Vector{Any}
end

struct FenceGetWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkFenceGetWin32HandleInfoKHR
    deps::Vector{Any}
end

struct ExportFenceWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkExportFenceWin32HandleInfoKHR
    deps::Vector{Any}
end

struct ImportFenceWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkImportFenceWin32HandleInfoKHR
    deps::Vector{Any}
end

struct ExportFenceCreateInfo <: VulkanStruct{true}
    vks::VkExportFenceCreateInfo
    deps::Vector{Any}
end

struct ExternalFenceProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    export_from_imported_handle_types::UInt32
    compatible_handle_types::UInt32
    external_fence_features::UInt32
end

struct PhysicalDeviceExternalFenceInfo <: VulkanStruct{true}
    vks::VkPhysicalDeviceExternalFenceInfo
    deps::Vector{Any}
end

struct SemaphoreGetFdInfoKHR <: VulkanStruct{true}
    vks::VkSemaphoreGetFdInfoKHR
    deps::Vector{Any}
end

struct ImportSemaphoreFdInfoKHR <: VulkanStruct{true}
    vks::VkImportSemaphoreFdInfoKHR
    deps::Vector{Any}
end

struct SemaphoreGetWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkSemaphoreGetWin32HandleInfoKHR
    deps::Vector{Any}
end

struct D3D12FenceSubmitInfoKHR <: VulkanStruct{true}
    vks::VkD3D12FenceSubmitInfoKHR
    deps::Vector{Any}
end

struct ExportSemaphoreWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkExportSemaphoreWin32HandleInfoKHR
    deps::Vector{Any}
end

struct ImportSemaphoreWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkImportSemaphoreWin32HandleInfoKHR
    deps::Vector{Any}
end

struct ExportSemaphoreCreateInfo <: VulkanStruct{true}
    vks::VkExportSemaphoreCreateInfo
    deps::Vector{Any}
end

struct ExternalSemaphoreProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    export_from_imported_handle_types::UInt32
    compatible_handle_types::UInt32
    external_semaphore_features::UInt32
end

struct PhysicalDeviceExternalSemaphoreInfo <: VulkanStruct{true}
    vks::VkPhysicalDeviceExternalSemaphoreInfo
    deps::Vector{Any}
end

struct Win32KeyedMutexAcquireReleaseInfoKHR <: VulkanStruct{true}
    vks::VkWin32KeyedMutexAcquireReleaseInfoKHR
    deps::Vector{Any}
end

struct MemoryGetFdInfoKHR <: VulkanStruct{true}
    vks::VkMemoryGetFdInfoKHR
    deps::Vector{Any}
end

struct MemoryFdPropertiesKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    memory_type_bits::UInt32
end

struct ImportMemoryFdInfoKHR <: VulkanStruct{true}
    vks::VkImportMemoryFdInfoKHR
    deps::Vector{Any}
end

struct MemoryGetWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkMemoryGetWin32HandleInfoKHR
    deps::Vector{Any}
end

struct MemoryWin32HandlePropertiesKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    memory_type_bits::UInt32
end

struct ExportMemoryWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkExportMemoryWin32HandleInfoKHR
    deps::Vector{Any}
end

struct ImportMemoryWin32HandleInfoKHR <: VulkanStruct{true}
    vks::VkImportMemoryWin32HandleInfoKHR
    deps::Vector{Any}
end

struct ExportMemoryAllocateInfo <: VulkanStruct{true}
    vks::VkExportMemoryAllocateInfo
    deps::Vector{Any}
end

struct ExternalMemoryBufferCreateInfo <: VulkanStruct{true}
    vks::VkExternalMemoryBufferCreateInfo
    deps::Vector{Any}
end

struct ExternalMemoryImageCreateInfo <: VulkanStruct{true}
    vks::VkExternalMemoryImageCreateInfo
    deps::Vector{Any}
end

struct PhysicalDeviceIDProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    device_uuid::String
    driver_uuid::String
    device_luid::String
    device_node_mask::UInt32
    device_luid_valid::Bool
end

struct PhysicalDeviceExternalBufferInfo <: VulkanStruct{true}
    vks::VkPhysicalDeviceExternalBufferInfo
    deps::Vector{Any}
end

struct PhysicalDeviceExternalImageFormatInfo <: VulkanStruct{true}
    vks::VkPhysicalDeviceExternalImageFormatInfo
    deps::Vector{Any}
end

struct ExternalMemoryProperties <: ReturnedOnly
    external_memory_features::UInt32
    export_from_imported_handle_types::UInt32
    compatible_handle_types::UInt32
end

struct ExternalBufferProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    external_memory_properties::ExternalMemoryProperties
end

struct ExternalImageFormatProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    external_memory_properties::ExternalMemoryProperties
end

struct PhysicalDeviceVariablePointersFeatures <: VulkanStruct{true}
    vks::VkPhysicalDeviceVariablePointersFeatures
    deps::Vector{Any}
end

struct RectLayerKHR <: VulkanStruct{false}
    vks::VkRectLayerKHR
end

struct PresentRegionKHR <: VulkanStruct{true}
    vks::VkPresentRegionKHR
    deps::Vector{Any}
end

struct PresentRegionsKHR <: VulkanStruct{true}
    vks::VkPresentRegionsKHR
    deps::Vector{Any}
end

struct ConformanceVersion <: VulkanStruct{false}
    vks::VkConformanceVersion
end

struct PhysicalDeviceVulkan12Properties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    driver_id::VkDriverId
    driver_name::String
    driver_info::String
    conformance_version::ConformanceVersion
    denorm_behavior_independence::VkShaderFloatControlsIndependence
    rounding_mode_independence::VkShaderFloatControlsIndependence
    shader_signed_zero_inf_nan_preserve_float_16::Bool
    shader_signed_zero_inf_nan_preserve_float_32::Bool
    shader_signed_zero_inf_nan_preserve_float_64::Bool
    shader_denorm_preserve_float_16::Bool
    shader_denorm_preserve_float_32::Bool
    shader_denorm_preserve_float_64::Bool
    shader_denorm_flush_to_zero_float_16::Bool
    shader_denorm_flush_to_zero_float_32::Bool
    shader_denorm_flush_to_zero_float_64::Bool
    shader_rounding_mode_rte_float_16::Bool
    shader_rounding_mode_rte_float_32::Bool
    shader_rounding_mode_rte_float_64::Bool
    shader_rounding_mode_rtz_float_16::Bool
    shader_rounding_mode_rtz_float_32::Bool
    shader_rounding_mode_rtz_float_64::Bool
    max_update_after_bind_descriptors_in_all_pools::UInt32
    shader_uniform_buffer_array_non_uniform_indexing_native::Bool
    shader_sampled_image_array_non_uniform_indexing_native::Bool
    shader_storage_buffer_array_non_uniform_indexing_native::Bool
    shader_storage_image_array_non_uniform_indexing_native::Bool
    shader_input_attachment_array_non_uniform_indexing_native::Bool
    robust_buffer_access_update_after_bind::Bool
    quad_divergent_implicit_lod::Bool
    max_per_stage_descriptor_update_after_bind_samplers::UInt32
    max_per_stage_descriptor_update_after_bind_uniform_buffers::UInt32
    max_per_stage_descriptor_update_after_bind_storage_buffers::UInt32
    max_per_stage_descriptor_update_after_bind_sampled_images::UInt32
    max_per_stage_descriptor_update_after_bind_storage_images::UInt32
    max_per_stage_descriptor_update_after_bind_input_attachments::UInt32
    max_per_stage_update_after_bind_resources::UInt32
    max_descriptor_set_update_after_bind_samplers::UInt32
    max_descriptor_set_update_after_bind_uniform_buffers::UInt32
    max_descriptor_set_update_after_bind_uniform_buffers_dynamic::UInt32
    max_descriptor_set_update_after_bind_storage_buffers::UInt32
    max_descriptor_set_update_after_bind_storage_buffers_dynamic::UInt32
    max_descriptor_set_update_after_bind_sampled_images::UInt32
    max_descriptor_set_update_after_bind_storage_images::UInt32
    max_descriptor_set_update_after_bind_input_attachments::UInt32
    supported_depth_resolve_modes::UInt32
    supported_stencil_resolve_modes::UInt32
    independent_resolve_none::Bool
    independent_resolve::Bool
    filter_minmax_single_component_formats::Bool
    filter_minmax_image_component_mapping::Bool
    max_timeline_semaphore_value_difference::UInt64
    framebuffer_integer_color_sample_counts::UInt32
end

struct PhysicalDeviceDriverProperties <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    driver_id::VkDriverId
    driver_name::String
    driver_info::String
    conformance_version::ConformanceVersion
end

struct PhysicalDevicePushDescriptorPropertiesKHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_push_descriptors::UInt32
end

struct PhysicalDeviceSparseImageFormatInfo2 <: VulkanStruct{true}
    vks::VkPhysicalDeviceSparseImageFormatInfo2
    deps::Vector{Any}
end

struct PhysicalDeviceImageFormatInfo2 <: VulkanStruct{true}
    vks::VkPhysicalDeviceImageFormatInfo2
    deps::Vector{Any}
end

struct PhysicalDeviceFeatures2 <: VulkanStruct{true}
    vks::VkPhysicalDeviceFeatures2
    deps::Vector{Any}
end

struct GeneratedCommandsMemoryRequirementsInfoNV <: VulkanStruct{true}
    vks::VkGeneratedCommandsMemoryRequirementsInfoNV
    deps::Vector{Any}
end

struct GeneratedCommandsInfoNV <: VulkanStruct{true}
    vks::VkGeneratedCommandsInfoNV
    deps::Vector{Any}
end

struct IndirectCommandsLayoutCreateInfoNV <: VulkanStruct{true}
    vks::VkIndirectCommandsLayoutCreateInfoNV
    deps::Vector{Any}
end

struct IndirectCommandsLayoutTokenNV <: VulkanStruct{true}
    vks::VkIndirectCommandsLayoutTokenNV
    deps::Vector{Any}
end

struct IndirectCommandsStreamNV <: VulkanStruct{false}
    vks::VkIndirectCommandsStreamNV
end

struct SetStateFlagsIndirectCommandNV <: VulkanStruct{false}
    vks::VkSetStateFlagsIndirectCommandNV
end

struct BindVertexBufferIndirectCommandNV <: VulkanStruct{false}
    vks::VkBindVertexBufferIndirectCommandNV
end

struct BindIndexBufferIndirectCommandNV <: VulkanStruct{false}
    vks::VkBindIndexBufferIndirectCommandNV
end

struct BindShaderGroupIndirectCommandNV <: VulkanStruct{false}
    vks::VkBindShaderGroupIndirectCommandNV
end

struct GraphicsPipelineShaderGroupsCreateInfoNV <: VulkanStruct{true}
    vks::VkGraphicsPipelineShaderGroupsCreateInfoNV
    deps::Vector{Any}
end

struct GraphicsShaderGroupCreateInfoNV <: VulkanStruct{true}
    vks::VkGraphicsShaderGroupCreateInfoNV
    deps::Vector{Any}
end

struct PhysicalDeviceDeviceGeneratedCommandsPropertiesNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_graphics_shader_group_count::UInt32
    max_indirect_sequence_count::UInt32
    max_indirect_commands_token_count::UInt32
    max_indirect_commands_stream_count::UInt32
    max_indirect_commands_token_offset::UInt32
    max_indirect_commands_stream_stride::UInt32
    min_sequences_count_buffer_offset_alignment::UInt32
    min_sequences_index_buffer_offset_alignment::UInt32
    min_indirect_commands_buffer_offset_alignment::UInt32
end

struct PhysicalDevicePrivateDataFeaturesEXT <: VulkanStruct{true}
    vks::VkPhysicalDevicePrivateDataFeaturesEXT
    deps::Vector{Any}
end

struct PrivateDataSlotCreateInfoEXT <: VulkanStruct{true}
    vks::VkPrivateDataSlotCreateInfoEXT
    deps::Vector{Any}
end

struct DevicePrivateDataCreateInfoEXT <: VulkanStruct{true}
    vks::VkDevicePrivateDataCreateInfoEXT
    deps::Vector{Any}
end

struct PhysicalDeviceDeviceGeneratedCommandsFeaturesNV <: VulkanStruct{true}
    vks::VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
    deps::Vector{Any}
end

struct Win32KeyedMutexAcquireReleaseInfoNV <: VulkanStruct{true}
    vks::VkWin32KeyedMutexAcquireReleaseInfoNV
    deps::Vector{Any}
end

struct ExportMemoryWin32HandleInfoNV <: VulkanStruct{true}
    vks::VkExportMemoryWin32HandleInfoNV
    deps::Vector{Any}
end

struct ImportMemoryWin32HandleInfoNV <: VulkanStruct{true}
    vks::VkImportMemoryWin32HandleInfoNV
    deps::Vector{Any}
end

struct ExportMemoryAllocateInfoNV <: VulkanStruct{true}
    vks::VkExportMemoryAllocateInfoNV
    deps::Vector{Any}
end

struct ExternalMemoryImageCreateInfoNV <: VulkanStruct{true}
    vks::VkExternalMemoryImageCreateInfoNV
    deps::Vector{Any}
end

struct DedicatedAllocationMemoryAllocateInfoNV <: VulkanStruct{true}
    vks::VkDedicatedAllocationMemoryAllocateInfoNV
    deps::Vector{Any}
end

struct DedicatedAllocationBufferCreateInfoNV <: VulkanStruct{true}
    vks::VkDedicatedAllocationBufferCreateInfoNV
    deps::Vector{Any}
end

struct DedicatedAllocationImageCreateInfoNV <: VulkanStruct{true}
    vks::VkDedicatedAllocationImageCreateInfoNV
    deps::Vector{Any}
end

struct DebugMarkerMarkerInfoEXT <: VulkanStruct{true}
    vks::VkDebugMarkerMarkerInfoEXT
    deps::Vector{Any}
end

struct DebugMarkerObjectTagInfoEXT <: VulkanStruct{true}
    vks::VkDebugMarkerObjectTagInfoEXT
    deps::Vector{Any}
end

struct DebugMarkerObjectNameInfoEXT <: VulkanStruct{true}
    vks::VkDebugMarkerObjectNameInfoEXT
    deps::Vector{Any}
end

struct PipelineRasterizationStateRasterizationOrderAMD <: VulkanStruct{true}
    vks::VkPipelineRasterizationStateRasterizationOrderAMD
    deps::Vector{Any}
end

struct ValidationFeaturesEXT <: VulkanStruct{true}
    vks::VkValidationFeaturesEXT
    deps::Vector{Any}
end

struct ValidationFlagsEXT <: VulkanStruct{true}
    vks::VkValidationFlagsEXT
    deps::Vector{Any}
end

struct DebugReportCallbackCreateInfoEXT <: VulkanStruct{true}
    vks::VkDebugReportCallbackCreateInfoEXT
    deps::Vector{Any}
end

struct PresentInfoKHR <: VulkanStruct{true}
    vks::VkPresentInfoKHR
    deps::Vector{Any}
end

struct SwapchainCreateInfoKHR <: VulkanStruct{true}
    vks::VkSwapchainCreateInfoKHR
    deps::Vector{Any}
end

struct SurfaceFormatKHR <: ReturnedOnly
    format::VkFormat
    color_space::VkColorSpaceKHR
end

struct SurfaceFormat2KHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    surface_format::SurfaceFormatKHR
end

struct StreamDescriptorSurfaceCreateInfoGGP <: VulkanStruct{true}
    vks::VkStreamDescriptorSurfaceCreateInfoGGP
    deps::Vector{Any}
end

struct ImagePipeSurfaceCreateInfoFUCHSIA <: VulkanStruct{true}
    vks::VkImagePipeSurfaceCreateInfoFUCHSIA
    deps::Vector{Any}
end

struct DirectFBSurfaceCreateInfoEXT <: VulkanStruct{true}
    vks::VkDirectFBSurfaceCreateInfoEXT
    deps::Vector{Any}
end

struct XcbSurfaceCreateInfoKHR <: VulkanStruct{true}
    vks::VkXcbSurfaceCreateInfoKHR
    deps::Vector{Any}
end

struct XlibSurfaceCreateInfoKHR <: VulkanStruct{true}
    vks::VkXlibSurfaceCreateInfoKHR
    deps::Vector{Any}
end

struct Win32SurfaceCreateInfoKHR <: VulkanStruct{true}
    vks::VkWin32SurfaceCreateInfoKHR
    deps::Vector{Any}
end

struct WaylandSurfaceCreateInfoKHR <: VulkanStruct{true}
    vks::VkWaylandSurfaceCreateInfoKHR
    deps::Vector{Any}
end

struct ViSurfaceCreateInfoNN <: VulkanStruct{true}
    vks::VkViSurfaceCreateInfoNN
    deps::Vector{Any}
end

struct AndroidSurfaceCreateInfoKHR <: VulkanStruct{true}
    vks::VkAndroidSurfaceCreateInfoKHR
    deps::Vector{Any}
end

struct DisplayPresentInfoKHR <: VulkanStruct{true}
    vks::VkDisplayPresentInfoKHR
    deps::Vector{Any}
end

struct DisplaySurfaceCreateInfoKHR <: VulkanStruct{true}
    vks::VkDisplaySurfaceCreateInfoKHR
    deps::Vector{Any}
end

struct DisplayModeCreateInfoKHR <: VulkanStruct{true}
    vks::VkDisplayModeCreateInfoKHR
    deps::Vector{Any}
end

struct DisplayModeParametersKHR <: VulkanStruct{false}
    vks::VkDisplayModeParametersKHR
end

struct SubmitInfo <: VulkanStruct{true}
    vks::VkSubmitInfo
    deps::Vector{Any}
end

struct DispatchIndirectCommand <: VulkanStruct{false}
    vks::VkDispatchIndirectCommand
end

struct DrawIndexedIndirectCommand <: VulkanStruct{false}
    vks::VkDrawIndexedIndirectCommand
end

struct DrawIndirectCommand <: VulkanStruct{false}
    vks::VkDrawIndirectCommand
end

struct FramebufferCreateInfo <: VulkanStruct{true}
    vks::VkFramebufferCreateInfo
    deps::Vector{Any}
end

struct QueryPoolCreateInfo <: VulkanStruct{true}
    vks::VkQueryPoolCreateInfo
    deps::Vector{Any}
end

struct SemaphoreCreateInfo <: VulkanStruct{true}
    vks::VkSemaphoreCreateInfo
    deps::Vector{Any}
end

struct PhysicalDeviceLimits <: ReturnedOnly
    max_image_dimension_1_d::UInt32
    max_image_dimension_2_d::UInt32
    max_image_dimension_3_d::UInt32
    max_image_dimension_cube::UInt32
    max_image_array_layers::UInt32
    max_texel_buffer_elements::UInt32
    max_uniform_buffer_range::UInt32
    max_storage_buffer_range::UInt32
    max_push_constants_size::UInt32
    max_memory_allocation_count::UInt32
    max_sampler_allocation_count::UInt32
    buffer_image_granularity::UInt64
    sparse_address_space_size::UInt64
    max_bound_descriptor_sets::UInt32
    max_per_stage_descriptor_samplers::UInt32
    max_per_stage_descriptor_uniform_buffers::UInt32
    max_per_stage_descriptor_storage_buffers::UInt32
    max_per_stage_descriptor_sampled_images::UInt32
    max_per_stage_descriptor_storage_images::UInt32
    max_per_stage_descriptor_input_attachments::UInt32
    max_per_stage_resources::UInt32
    max_descriptor_set_samplers::UInt32
    max_descriptor_set_uniform_buffers::UInt32
    max_descriptor_set_uniform_buffers_dynamic::UInt32
    max_descriptor_set_storage_buffers::UInt32
    max_descriptor_set_storage_buffers_dynamic::UInt32
    max_descriptor_set_sampled_images::UInt32
    max_descriptor_set_storage_images::UInt32
    max_descriptor_set_input_attachments::UInt32
    max_vertex_input_attributes::UInt32
    max_vertex_input_bindings::UInt32
    max_vertex_input_attribute_offset::UInt32
    max_vertex_input_binding_stride::UInt32
    max_vertex_output_components::UInt32
    max_tessellation_generation_level::UInt32
    max_tessellation_patch_size::UInt32
    max_tessellation_control_per_vertex_input_components::UInt32
    max_tessellation_control_per_vertex_output_components::UInt32
    max_tessellation_control_per_patch_output_components::UInt32
    max_tessellation_control_total_output_components::UInt32
    max_tessellation_evaluation_input_components::UInt32
    max_tessellation_evaluation_output_components::UInt32
    max_geometry_shader_invocations::UInt32
    max_geometry_input_components::UInt32
    max_geometry_output_components::UInt32
    max_geometry_output_vertices::UInt32
    max_geometry_total_output_components::UInt32
    max_fragment_input_components::UInt32
    max_fragment_output_attachments::UInt32
    max_fragment_dual_src_attachments::UInt32
    max_fragment_combined_output_resources::UInt32
    max_compute_shared_memory_size::UInt32
    max_compute_work_group_count::NTuple{3, UInt32}
    max_compute_work_group_invocations::UInt32
    max_compute_work_group_size::NTuple{3, UInt32}
    sub_pixel_precision_bits::UInt32
    sub_texel_precision_bits::UInt32
    mipmap_precision_bits::UInt32
    max_draw_indexed_index_value::UInt32
    max_draw_indirect_count::UInt32
    max_sampler_lod_bias::Float32
    max_sampler_anisotropy::Float32
    max_viewports::UInt32
    max_viewport_dimensions::NTuple{2, UInt32}
    viewport_bounds_range::NTuple{2, Float32}
    viewport_sub_pixel_bits::UInt32
    min_memory_map_alignment::UInt
    min_texel_buffer_offset_alignment::UInt64
    min_uniform_buffer_offset_alignment::UInt64
    min_storage_buffer_offset_alignment::UInt64
    min_texel_offset::Int32
    max_texel_offset::UInt32
    min_texel_gather_offset::Int32
    max_texel_gather_offset::UInt32
    min_interpolation_offset::Float32
    max_interpolation_offset::Float32
    sub_pixel_interpolation_offset_bits::UInt32
    max_framebuffer_width::UInt32
    max_framebuffer_height::UInt32
    max_framebuffer_layers::UInt32
    framebuffer_color_sample_counts::UInt32
    framebuffer_depth_sample_counts::UInt32
    framebuffer_stencil_sample_counts::UInt32
    framebuffer_no_attachments_sample_counts::UInt32
    max_color_attachments::UInt32
    sampled_image_color_sample_counts::UInt32
    sampled_image_integer_sample_counts::UInt32
    sampled_image_depth_sample_counts::UInt32
    sampled_image_stencil_sample_counts::UInt32
    storage_image_sample_counts::UInt32
    max_sample_mask_words::UInt32
    timestamp_compute_and_graphics::Bool
    timestamp_period::Float32
    max_clip_distances::UInt32
    max_cull_distances::UInt32
    max_combined_clip_and_cull_distances::UInt32
    discrete_queue_priorities::UInt32
    point_size_range::NTuple{2, Float32}
    line_width_range::NTuple{2, Float32}
    point_size_granularity::Float32
    line_width_granularity::Float32
    strict_lines::Bool
    standard_sample_locations::Bool
    optimal_buffer_copy_offset_alignment::UInt64
    optimal_buffer_copy_row_pitch_alignment::UInt64
    non_coherent_atom_size::UInt64
end

struct PhysicalDeviceSparseProperties <: ReturnedOnly
    residency_standard_2_d_block_shape::Bool
    residency_standard_2_d_multisample_block_shape::Bool
    residency_standard_3_d_block_shape::Bool
    residency_aligned_mip_size::Bool
    residency_non_resident_strict::Bool
end

struct PhysicalDeviceFeatures <: VulkanStruct{false}
    vks::VkPhysicalDeviceFeatures
end

struct FenceCreateInfo <: VulkanStruct{true}
    vks::VkFenceCreateInfo
    deps::Vector{Any}
end

struct EventCreateInfo <: VulkanStruct{true}
    vks::VkEventCreateInfo
    deps::Vector{Any}
end

struct RenderPassCreateInfo <: VulkanStruct{true}
    vks::VkRenderPassCreateInfo
    deps::Vector{Any}
end

struct SubpassDependency <: VulkanStruct{false}
    vks::VkSubpassDependency
end

struct SubpassDescription <: VulkanStruct{true}
    vks::VkSubpassDescription
    deps::Vector{Any}
end

struct AttachmentReference <: VulkanStruct{false}
    vks::VkAttachmentReference
end

struct AttachmentDescription <: VulkanStruct{false}
    vks::VkAttachmentDescription
end

struct ClearAttachment <: VulkanStruct{false}
    vks::VkClearAttachment
end

struct ClearValue <: VulkanStruct{false}
    vks::VkClearValue
end

struct ClearDepthStencilValue <: VulkanStruct{false}
    vks::VkClearDepthStencilValue
end

struct ClearColorValue <: VulkanStruct{false}
    vks::VkClearColorValue
end

struct RenderPassBeginInfo <: VulkanStruct{true}
    vks::VkRenderPassBeginInfo
    deps::Vector{Any}
end

struct CommandBufferBeginInfo <: VulkanStruct{true}
    vks::VkCommandBufferBeginInfo
    deps::Vector{Any}
end

struct CommandBufferInheritanceInfo <: VulkanStruct{true}
    vks::VkCommandBufferInheritanceInfo
    deps::Vector{Any}
end

struct CommandBufferAllocateInfo <: VulkanStruct{true}
    vks::VkCommandBufferAllocateInfo
    deps::Vector{Any}
end

struct CommandPoolCreateInfo <: VulkanStruct{true}
    vks::VkCommandPoolCreateInfo
    deps::Vector{Any}
end

struct SamplerCreateInfo <: VulkanStruct{true}
    vks::VkSamplerCreateInfo
    deps::Vector{Any}
end

struct PipelineLayoutCreateInfo <: VulkanStruct{true}
    vks::VkPipelineLayoutCreateInfo
    deps::Vector{Any}
end

struct PushConstantRange <: VulkanStruct{false}
    vks::VkPushConstantRange
end

struct PipelineCacheCreateInfo <: VulkanStruct{true}
    vks::VkPipelineCacheCreateInfo
    deps::Vector{Any}
end

struct GraphicsPipelineCreateInfo <: VulkanStruct{true}
    vks::VkGraphicsPipelineCreateInfo
    deps::Vector{Any}
end

struct PipelineDepthStencilStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineDepthStencilStateCreateInfo
    deps::Vector{Any}
end

struct StencilOpState <: VulkanStruct{false}
    vks::VkStencilOpState
end

struct PipelineDynamicStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineDynamicStateCreateInfo
    deps::Vector{Any}
end

struct PipelineColorBlendStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineColorBlendStateCreateInfo
    deps::Vector{Any}
end

struct PipelineColorBlendAttachmentState <: VulkanStruct{false}
    vks::VkPipelineColorBlendAttachmentState
end

struct PipelineMultisampleStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineMultisampleStateCreateInfo
    deps::Vector{Any}
end

struct PipelineRasterizationStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineRasterizationStateCreateInfo
    deps::Vector{Any}
end

struct PipelineViewportStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineViewportStateCreateInfo
    deps::Vector{Any}
end

struct PipelineTessellationStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineTessellationStateCreateInfo
    deps::Vector{Any}
end

struct PipelineInputAssemblyStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineInputAssemblyStateCreateInfo
    deps::Vector{Any}
end

struct PipelineVertexInputStateCreateInfo <: VulkanStruct{true}
    vks::VkPipelineVertexInputStateCreateInfo
    deps::Vector{Any}
end

struct VertexInputAttributeDescription <: VulkanStruct{false}
    vks::VkVertexInputAttributeDescription
end

struct VertexInputBindingDescription <: VulkanStruct{false}
    vks::VkVertexInputBindingDescription
end

struct ComputePipelineCreateInfo <: VulkanStruct{true}
    vks::VkComputePipelineCreateInfo
    deps::Vector{Any}
end

struct PipelineShaderStageCreateInfo <: VulkanStruct{true}
    vks::VkPipelineShaderStageCreateInfo
    deps::Vector{Any}
end

struct SpecializationInfo <: VulkanStruct{true}
    vks::VkSpecializationInfo
    deps::Vector{Any}
end

struct SpecializationMapEntry <: VulkanStruct{false}
    vks::VkSpecializationMapEntry
end

struct DescriptorSetAllocateInfo <: VulkanStruct{true}
    vks::VkDescriptorSetAllocateInfo
    deps::Vector{Any}
end

struct DescriptorPoolCreateInfo <: VulkanStruct{true}
    vks::VkDescriptorPoolCreateInfo
    deps::Vector{Any}
end

struct DescriptorPoolSize <: VulkanStruct{false}
    vks::VkDescriptorPoolSize
end

struct DescriptorSetLayoutCreateInfo <: VulkanStruct{true}
    vks::VkDescriptorSetLayoutCreateInfo
    deps::Vector{Any}
end

struct DescriptorSetLayoutBinding <: VulkanStruct{true}
    vks::VkDescriptorSetLayoutBinding
    deps::Vector{Any}
end

struct ShaderModuleCreateInfo <: VulkanStruct{true}
    vks::VkShaderModuleCreateInfo
    deps::Vector{Any}
end

struct ImageResolve <: VulkanStruct{false}
    vks::VkImageResolve
end

struct BufferImageCopy <: VulkanStruct{false}
    vks::VkBufferImageCopy
end

struct ImageBlit <: VulkanStruct{false}
    vks::VkImageBlit
end

struct ImageCopy <: VulkanStruct{false}
    vks::VkImageCopy
end

struct BindSparseInfo <: VulkanStruct{true}
    vks::VkBindSparseInfo
    deps::Vector{Any}
end

struct SparseImageMemoryBindInfo <: VulkanStruct{true}
    vks::VkSparseImageMemoryBindInfo
    deps::Vector{Any}
end

struct SparseImageOpaqueMemoryBindInfo <: VulkanStruct{true}
    vks::VkSparseImageOpaqueMemoryBindInfo
    deps::Vector{Any}
end

struct SparseBufferMemoryBindInfo <: VulkanStruct{true}
    vks::VkSparseBufferMemoryBindInfo
    deps::Vector{Any}
end

struct SparseImageMemoryBind <: VulkanStruct{false}
    vks::VkSparseImageMemoryBind
end

struct SparseMemoryBind <: VulkanStruct{false}
    vks::VkSparseMemoryBind
end

struct BufferCopy <: VulkanStruct{false}
    vks::VkBufferCopy
end

struct ImageViewCreateInfo <: VulkanStruct{true}
    vks::VkImageViewCreateInfo
    deps::Vector{Any}
end

struct SubresourceLayout <: ReturnedOnly
    offset::UInt64
    size::UInt64
    row_pitch::UInt64
    array_pitch::UInt64
    depth_pitch::UInt64
end

struct ImageCreateInfo <: VulkanStruct{true}
    vks::VkImageCreateInfo
    deps::Vector{Any}
end

struct ImageMemoryBarrier <: VulkanStruct{true}
    vks::VkImageMemoryBarrier
    deps::Vector{Any}
end

struct BufferMemoryBarrier <: VulkanStruct{true}
    vks::VkBufferMemoryBarrier
    deps::Vector{Any}
end

struct MemoryBarrier <: VulkanStruct{true}
    vks::VkMemoryBarrier
    deps::Vector{Any}
end

struct ImageSubresourceRange <: VulkanStruct{false}
    vks::VkImageSubresourceRange
end

struct ImageSubresourceLayers <: VulkanStruct{false}
    vks::VkImageSubresourceLayers
end

struct ImageSubresource <: VulkanStruct{false}
    vks::VkImageSubresource
end

struct BufferViewCreateInfo <: VulkanStruct{true}
    vks::VkBufferViewCreateInfo
    deps::Vector{Any}
end

struct BufferCreateInfo <: VulkanStruct{true}
    vks::VkBufferCreateInfo
    deps::Vector{Any}
end

struct CopyDescriptorSet <: VulkanStruct{true}
    vks::VkCopyDescriptorSet
    deps::Vector{Any}
end

struct WriteDescriptorSet <: VulkanStruct{true}
    vks::VkWriteDescriptorSet
    deps::Vector{Any}
end

struct DescriptorImageInfo <: VulkanStruct{false}
    vks::VkDescriptorImageInfo
end

struct DescriptorBufferInfo <: VulkanStruct{false}
    vks::VkDescriptorBufferInfo
end

struct FormatProperties <: ReturnedOnly
    linear_tiling_features::UInt32
    optimal_tiling_features::UInt32
    buffer_features::UInt32
end

struct FormatProperties2 <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    format_properties::FormatProperties
end

struct MappedMemoryRange <: VulkanStruct{true}
    vks::VkMappedMemoryRange
    deps::Vector{Any}
end

struct MemoryHeap <: ReturnedOnly
    size::UInt64
    flags::UInt32
end

struct MemoryType <: ReturnedOnly
    property_flags::UInt32
    heap_index::UInt32
end

struct MemoryRequirements <: ReturnedOnly
    size::UInt64
    alignment::UInt64
    memory_type_bits::UInt32
end

struct MemoryRequirements2 <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    memory_requirements::MemoryRequirements
end

struct MemoryAllocateInfo <: VulkanStruct{true}
    vks::VkMemoryAllocateInfo
    deps::Vector{Any}
end

struct PhysicalDeviceMemoryProperties <: ReturnedOnly
    memory_type_count::UInt32
    memory_types::NTuple{VK_MAX_MEMORY_TYPES, VkMemoryType}
    memory_heap_count::UInt32
    memory_heaps::NTuple{VK_MAX_MEMORY_HEAPS, VkMemoryHeap}
end

struct PhysicalDeviceMemoryProperties2 <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    memory_properties::PhysicalDeviceMemoryProperties
end

struct InstanceCreateInfo <: VulkanStruct{true}
    vks::VkInstanceCreateInfo
    deps::Vector{Any}
end

struct DeviceCreateInfo <: VulkanStruct{true}
    vks::VkDeviceCreateInfo
    deps::Vector{Any}
end

struct DeviceQueueCreateInfo <: VulkanStruct{true}
    vks::VkDeviceQueueCreateInfo
    deps::Vector{Any}
end

struct AllocationCallbacks <: VulkanStruct{true}
    vks::VkAllocationCallbacks
    deps::Vector{Any}
end

struct ApplicationInfo <: VulkanStruct{true}
    vks::VkApplicationInfo
    deps::Vector{Any}
end

struct LayerProperties <: ReturnedOnly
    layer_name::String
    spec_version::VersionNumber
    implementation_version::VersionNumber
    description::String
end

struct ExtensionProperties <: ReturnedOnly
    extension_name::String
    spec_version::VersionNumber
end

struct PhysicalDeviceProperties <: ReturnedOnly
    api_version::VersionNumber
    driver_version::VersionNumber
    vendor_id::UInt32
    device_id::UInt32
    device_type::VkPhysicalDeviceType
    device_name::String
    pipeline_cache_uuid::String
    limits::PhysicalDeviceLimits
    sparse_properties::PhysicalDeviceSparseProperties
end

struct PhysicalDeviceProperties2 <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    properties::PhysicalDeviceProperties
end

struct ComponentMapping <: VulkanStruct{false}
    vks::VkComponentMapping
end

struct AndroidHardwareBufferFormatPropertiesANDROID <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    format::VkFormat
    external_format::UInt64
    format_features::UInt32
    sampler_ycbcr_conversion_components::ComponentMapping
    suggested_ycbcr_model::VkSamplerYcbcrModelConversion
    suggested_ycbcr_range::VkSamplerYcbcrRange
    suggested_x_chroma_offset::VkChromaLocation
    suggested_y_chroma_offset::VkChromaLocation
end

struct ClearRect <: VulkanStruct{false}
    vks::VkClearRect
end

struct Rect2D <: VulkanStruct{false}
    vks::VkRect2D
end

struct Viewport <: VulkanStruct{false}
    vks::VkViewport
end

struct Extent3D <: VulkanStruct{false}
    vks::VkExtent3D
end

struct ImageFormatProperties <: ReturnedOnly
    max_extent::Extent3D
    max_mip_levels::UInt32
    max_array_layers::UInt32
    sample_counts::UInt32
    max_resource_size::UInt64
end

struct ImageFormatProperties2 <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    image_format_properties::ImageFormatProperties
end

struct ExternalImageFormatPropertiesNV <: ReturnedOnly
    image_format_properties::ImageFormatProperties
    external_memory_features::UInt32
    export_from_imported_handle_types::UInt32
    compatible_handle_types::UInt32
end

struct SparseImageFormatProperties <: ReturnedOnly
    aspect_mask::UInt32
    image_granularity::Extent3D
    flags::UInt32
end

struct SparseImageFormatProperties2 <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    properties::SparseImageFormatProperties
end

struct SparseImageMemoryRequirements <: ReturnedOnly
    format_properties::SparseImageFormatProperties
    image_mip_tail_first_lod::UInt32
    image_mip_tail_size::UInt64
    image_mip_tail_offset::UInt64
    image_mip_tail_stride::UInt64
end

struct SparseImageMemoryRequirements2 <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    memory_requirements::SparseImageMemoryRequirements
end

struct QueueFamilyProperties <: ReturnedOnly
    queue_flags::UInt32
    queue_count::UInt32
    timestamp_valid_bits::UInt32
    min_image_transfer_granularity::Extent3D
end

struct QueueFamilyProperties2 <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    queue_family_properties::QueueFamilyProperties
end

struct Extent2D <: VulkanStruct{false}
    vks::VkExtent2D
end

struct PhysicalDeviceFragmentDensityMapPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    min_fragment_density_texel_size::Extent2D
    max_fragment_density_texel_size::Extent2D
    fragment_density_invocations::Bool
end

struct PhysicalDeviceShadingRateImagePropertiesNV <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    shading_rate_texel_size::Extent2D
    shading_rate_palette_size::UInt32
    shading_rate_max_coarse_samples::UInt32
end

struct MultisamplePropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    max_sample_location_grid_size::Extent2D
end

struct PhysicalDeviceSampleLocationsPropertiesEXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    sample_location_sample_counts::UInt32
    max_sample_location_grid_size::Extent2D
    sample_location_coordinate_range::NTuple{2, Float32}
    sample_location_sub_pixel_bits::UInt32
    variable_sample_locations::Bool
end

struct SurfaceCapabilities2EXT <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    min_image_count::UInt32
    max_image_count::UInt32
    current_extent::Extent2D
    min_image_extent::Extent2D
    max_image_extent::Extent2D
    max_image_array_layers::UInt32
    supported_transforms::UInt32
    current_transform::VkSurfaceTransformFlagBitsKHR
    supported_composite_alpha::UInt32
    supported_usage_flags::UInt32
    supported_surface_counters::UInt32
end

struct SurfaceCapabilitiesKHR <: ReturnedOnly
    min_image_count::UInt32
    max_image_count::UInt32
    current_extent::Extent2D
    min_image_extent::Extent2D
    max_image_extent::Extent2D
    max_image_array_layers::UInt32
    supported_transforms::UInt32
    current_transform::VkSurfaceTransformFlagBitsKHR
    supported_composite_alpha::UInt32
    supported_usage_flags::UInt32
end

struct SurfaceCapabilities2KHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    surface_capabilities::SurfaceCapabilitiesKHR
end

struct Offset3D <: VulkanStruct{false}
    vks::VkOffset3D
end

struct Offset2D <: VulkanStruct{false}
    vks::VkOffset2D
end

struct DisplayPlaneCapabilitiesKHR <: ReturnedOnly
    supported_alpha::UInt32
    min_src_position::Offset2D
    max_src_position::Offset2D
    min_src_extent::Extent2D
    max_src_extent::Extent2D
    min_dst_position::Offset2D
    max_dst_position::Offset2D
    min_dst_extent::Extent2D
    max_dst_extent::Extent2D
end

struct DisplayPlaneCapabilities2KHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    capabilities::DisplayPlaneCapabilitiesKHR
end

struct BaseInStructure <: VulkanStruct{true}
    vks::VkBaseInStructure
    deps::Vector{Any}
end

struct BaseOutStructure <: VulkanStruct{true}
    vks::VkBaseOutStructure
    deps::Vector{Any}
end

mutable struct DebugUtilsMessengerEXT <: Handle
    vks::VkDebugUtilsMessengerEXT
    refcount::RefCounter
    destructor
    DebugUtilsMessengerEXT(vks::VkDebugUtilsMessengerEXT, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct DebugReportCallbackEXT <: Handle
    vks::VkDebugReportCallbackEXT
    refcount::RefCounter
    destructor
    DebugReportCallbackEXT(vks::VkDebugReportCallbackEXT, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct SwapchainKHR <: Handle
    vks::VkSwapchainKHR
    refcount::RefCounter
    destructor
    SwapchainKHR(vks::VkSwapchainKHR, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct SurfaceKHR <: Handle
    vks::VkSurfaceKHR
    refcount::RefCounter
    destructor
    SurfaceKHR(vks::VkSurfaceKHR, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct DisplayModeKHR <: Handle
    vks::VkDisplayModeKHR
    refcount::RefCounter
    destructor
    DisplayModeKHR(vks::VkDisplayModeKHR, refcount::RefCounter) = new(vks, refcount, undef)
end

struct DisplayModePropertiesKHR <: ReturnedOnly
    display_mode::DisplayModeKHR
    parameters::DisplayModeParametersKHR
end

struct DisplayModeProperties2KHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    display_mode_properties::DisplayModePropertiesKHR
end

mutable struct DisplayKHR <: Handle
    vks::VkDisplayKHR
    refcount::RefCounter
    destructor
    DisplayKHR(vks::VkDisplayKHR, refcount::RefCounter) = new(vks, refcount, undef)
end

struct DisplayPlanePropertiesKHR <: ReturnedOnly
    current_display::DisplayKHR
    current_stack_index::UInt32
end

struct DisplayPlaneProperties2KHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    display_plane_properties::DisplayPlanePropertiesKHR
end

struct DisplayPropertiesKHR <: ReturnedOnly
    display::DisplayKHR
    display_name::String
    physical_dimensions::Extent2D
    physical_resolution::Extent2D
    supported_transforms::UInt32
    plane_reorder_possible::Bool
    persistent_content::Bool
end

struct DisplayProperties2KHR <: ReturnedOnly
    s_type::VkStructureType
    p_next::Ptr{Cvoid}
    display_properties::DisplayPropertiesKHR
end

mutable struct PrivateDataSlotEXT <: Handle
    vks::VkPrivateDataSlotEXT
    refcount::RefCounter
    destructor
    PrivateDataSlotEXT(vks::VkPrivateDataSlotEXT, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct DeferredOperationKHR <: Handle
    vks::VkDeferredOperationKHR
    refcount::RefCounter
    destructor
    DeferredOperationKHR(vks::VkDeferredOperationKHR, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct PerformanceConfigurationINTEL <: Handle
    vks::VkPerformanceConfigurationINTEL
    refcount::RefCounter
    destructor
    PerformanceConfigurationINTEL(vks::VkPerformanceConfigurationINTEL, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct AccelerationStructureKHR <: Handle
    vks::VkAccelerationStructureKHR
    refcount::RefCounter
    destructor
    AccelerationStructureKHR(vks::VkAccelerationStructureKHR, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct ValidationCacheEXT <: Handle
    vks::VkValidationCacheEXT
    refcount::RefCounter
    destructor
    ValidationCacheEXT(vks::VkValidationCacheEXT, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct SamplerYcbcrConversion <: Handle
    vks::VkSamplerYcbcrConversion
    refcount::RefCounter
    destructor
    SamplerYcbcrConversion(vks::VkSamplerYcbcrConversion, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct DescriptorUpdateTemplate <: Handle
    vks::VkDescriptorUpdateTemplate
    refcount::RefCounter
    destructor
    DescriptorUpdateTemplate(vks::VkDescriptorUpdateTemplate, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct IndirectCommandsLayoutNV <: Handle
    vks::VkIndirectCommandsLayoutNV
    refcount::RefCounter
    destructor
    IndirectCommandsLayoutNV(vks::VkIndirectCommandsLayoutNV, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct PipelineCache <: Handle
    vks::VkPipelineCache
    refcount::RefCounter
    destructor
    PipelineCache(vks::VkPipelineCache, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct RenderPass <: Handle
    vks::VkRenderPass
    refcount::RefCounter
    destructor
    RenderPass(vks::VkRenderPass, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Framebuffer <: Handle
    vks::VkFramebuffer
    refcount::RefCounter
    destructor
    Framebuffer(vks::VkFramebuffer, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct QueryPool <: Handle
    vks::VkQueryPool
    refcount::RefCounter
    destructor
    QueryPool(vks::VkQueryPool, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Event <: Handle
    vks::VkEvent
    refcount::RefCounter
    destructor
    Event(vks::VkEvent, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Semaphore <: Handle
    vks::VkSemaphore
    refcount::RefCounter
    destructor
    Semaphore(vks::VkSemaphore, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Fence <: Handle
    vks::VkFence
    refcount::RefCounter
    destructor
    Fence(vks::VkFence, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct DescriptorPool <: Handle
    vks::VkDescriptorPool
    refcount::RefCounter
    destructor
    DescriptorPool(vks::VkDescriptorPool, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct DescriptorSetLayout <: Handle
    vks::VkDescriptorSetLayout
    refcount::RefCounter
    destructor
    DescriptorSetLayout(vks::VkDescriptorSetLayout, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct DescriptorSet <: Handle
    vks::VkDescriptorSet
    refcount::RefCounter
    destructor
    DescriptorSet(vks::VkDescriptorSet, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Sampler <: Handle
    vks::VkSampler
    refcount::RefCounter
    destructor
    Sampler(vks::VkSampler, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct PipelineLayout <: Handle
    vks::VkPipelineLayout
    refcount::RefCounter
    destructor
    PipelineLayout(vks::VkPipelineLayout, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Pipeline <: Handle
    vks::VkPipeline
    refcount::RefCounter
    destructor
    Pipeline(vks::VkPipeline, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct ShaderModule <: Handle
    vks::VkShaderModule
    refcount::RefCounter
    destructor
    ShaderModule(vks::VkShaderModule, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct ImageView <: Handle
    vks::VkImageView
    refcount::RefCounter
    destructor
    ImageView(vks::VkImageView, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Image <: Handle
    vks::VkImage
    refcount::RefCounter
    destructor
    Image(vks::VkImage, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct BufferView <: Handle
    vks::VkBufferView
    refcount::RefCounter
    destructor
    BufferView(vks::VkBufferView, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Buffer <: Handle
    vks::VkBuffer
    refcount::RefCounter
    destructor
    Buffer(vks::VkBuffer, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct CommandPool <: Handle
    vks::VkCommandPool
    refcount::RefCounter
    destructor
    CommandPool(vks::VkCommandPool, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct DeviceMemory <: Handle
    vks::VkDeviceMemory
    refcount::RefCounter
    destructor
    DeviceMemory(vks::VkDeviceMemory, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct CommandBuffer <: Handle
    vks::VkCommandBuffer
    refcount::RefCounter
    destructor
    CommandBuffer(vks::VkCommandBuffer, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Queue <: Handle
    vks::VkQueue
    refcount::RefCounter
    destructor
    Queue(vks::VkQueue, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Device <: Handle
    vks::VkDevice
    refcount::RefCounter
    destructor
    Device(vks::VkDevice, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct PhysicalDevice <: Handle
    vks::VkPhysicalDevice
    refcount::RefCounter
    destructor
    PhysicalDevice(vks::VkPhysicalDevice, refcount::RefCounter) = new(vks, refcount, undef)
end

mutable struct Instance <: Handle
    vks::VkInstance
    refcount::RefCounter
    destructor
    Instance(vks::VkInstance, refcount::RefCounter) = new(vks, refcount, undef)
end


DebugUtilsMessengerEXT(instance::Instance, message_severity::Integer, message_type::Integer, pfn_user_callback::FunctionPtr, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = create_debug_utils_messenger_ext(instance, DebugUtilsMessengerCreateInfoEXT(message_severity, message_type, pfn_user_callback; next, flags, user_data), fun_ptr_create, fun_ptr_destroy; allocator)

DebugReportCallbackEXT(instance::Instance, pfn_callback::FunctionPtr, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = create_debug_report_callback_ext(instance, DebugReportCallbackCreateInfoEXT(pfn_callback; next, flags, user_data), fun_ptr_create, fun_ptr_destroy; allocator)

SwapchainKHR(device::Device, surface::SurfaceKHR, min_image_count::Integer, image_format::VkFormat, image_color_space::VkColorSpaceKHR, image_extent::Extent2D, image_array_layers::Integer, image_usage::Integer, image_sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}, pre_transform::VkSurfaceTransformFlagBitsKHR, composite_alpha::VkCompositeAlphaFlagBitsKHR, present_mode::VkPresentModeKHR, clipped::Bool, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, old_swapchain = C_NULL) = create_swapchain_khr(device, SwapchainCreateInfoKHR(surface, min_image_count, image_format, image_color_space, image_extent, image_array_layers, image_usage, image_sharing_mode, queue_family_indices, pre_transform, composite_alpha, present_mode, clipped; next, flags, old_swapchain), fun_ptr_create, fun_ptr_destroy; allocator)

DisplayModeKHR(physical_device::PhysicalDevice, display::DisplayKHR, parameters::DisplayModeParametersKHR, fun_ptr_create::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_display_mode_khr(physical_device, display, DisplayModeCreateInfoKHR(parameters; next, flags), fun_ptr_create; allocator)

PrivateDataSlotEXT(device::Device, flags::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL) = create_private_data_slot_ext(device, PrivateDataSlotCreateInfoEXT(flags; next), fun_ptr_create, fun_ptr_destroy; allocator)

DeferredOperationKHR(device::Device, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_deferred_operation_khr(device, fun_ptr_create, fun_ptr_destroy; allocator)

ValidationCacheEXT(device::Device, initial_data::Ptr{Cvoid}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, initial_data_size = 0) = create_validation_cache_ext(device, ValidationCacheCreateInfoEXT(initial_data; next, flags, initial_data_size), fun_ptr_create, fun_ptr_destroy; allocator)

SamplerYcbcrConversion(device::Device, format::VkFormat, ycbcr_model::VkSamplerYcbcrModelConversion, ycbcr_range::VkSamplerYcbcrRange, components::ComponentMapping, x_chroma_offset::VkChromaLocation, y_chroma_offset::VkChromaLocation, chroma_filter::VkFilter, force_explicit_reconstruction::Bool, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL) = create_sampler_ycbcr_conversion(device, SamplerYcbcrConversionCreateInfo(format, ycbcr_model, ycbcr_range, components, x_chroma_offset, y_chroma_offset, chroma_filter, force_explicit_reconstruction; next), fun_ptr_create, fun_ptr_destroy; allocator)

DescriptorUpdateTemplate(device::Device, descriptor_update_entries::AbstractArray{<:DescriptorUpdateTemplateEntry}, template_type::VkDescriptorUpdateTemplateType, descriptor_set_layout::DescriptorSetLayout, pipeline_bind_point::VkPipelineBindPoint, pipeline_layout::PipelineLayout, set::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_update_template(device, DescriptorUpdateTemplateCreateInfo(descriptor_update_entries, template_type, descriptor_set_layout, pipeline_bind_point, pipeline_layout, set; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

IndirectCommandsLayoutNV(device::Device, flags::Integer, pipeline_bind_point::VkPipelineBindPoint, tokens::AbstractArray{<:IndirectCommandsLayoutTokenNV}, stream_strides::AbstractArray{<:Integer}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL) = create_indirect_commands_layout_nv(device, IndirectCommandsLayoutCreateInfoNV(flags, pipeline_bind_point, tokens, stream_strides; next), fun_ptr_create, fun_ptr_destroy; allocator)

PipelineCache(device::Device, initial_data::Ptr{Cvoid}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, initial_data_size = 0) = create_pipeline_cache(device, PipelineCacheCreateInfo(initial_data; next, flags, initial_data_size), fun_ptr_create, fun_ptr_destroy; allocator)

Framebuffer(device::Device, render_pass::RenderPass, attachments::AbstractArray{<:ImageView}, width::Integer, height::Integer, layers::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_framebuffer(device, FramebufferCreateInfo(render_pass, attachments, width, height, layers; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

QueryPool(device::Device, query_type::VkQueryType, query_count::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, pipeline_statistics = 0) = create_query_pool(device, QueryPoolCreateInfo(query_type, query_count; next, flags, pipeline_statistics), fun_ptr_create, fun_ptr_destroy; allocator)

Event(device::Device, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_event(device, EventCreateInfo(; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

Semaphore(device::Device, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_semaphore(device, SemaphoreCreateInfo(; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

Fence(device::Device, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_fence(device, FenceCreateInfo(; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

DescriptorPool(device::Device, max_sets::Integer, pool_sizes::AbstractArray{<:DescriptorPoolSize}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_pool(device, DescriptorPoolCreateInfo(max_sets, pool_sizes; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

DescriptorSetLayout(device::Device, bindings::AbstractArray{<:DescriptorSetLayoutBinding}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_set_layout(device, DescriptorSetLayoutCreateInfo(bindings; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

Sampler(device::Device, mag_filter::VkFilter, min_filter::VkFilter, mipmap_mode::VkSamplerMipmapMode, address_mode_u::VkSamplerAddressMode, address_mode_v::VkSamplerAddressMode, address_mode_w::VkSamplerAddressMode, mip_lod_bias::Real, anisotropy_enable::Bool, max_anisotropy::Real, compare_enable::Bool, compare_op::VkCompareOp, min_lod::Real, max_lod::Real, border_color::VkBorderColor, unnormalized_coordinates::Bool, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_sampler(device, SamplerCreateInfo(mag_filter, min_filter, mipmap_mode, address_mode_u, address_mode_v, address_mode_w, mip_lod_bias, anisotropy_enable, max_anisotropy, compare_enable, compare_op, min_lod, max_lod, border_color, unnormalized_coordinates; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

PipelineLayout(device::Device, set_layouts::AbstractArray{<:DescriptorSetLayout}, push_constant_ranges::AbstractArray{<:PushConstantRange}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_pipeline_layout(device, PipelineLayoutCreateInfo(set_layouts, push_constant_ranges; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

ShaderModule(device::Device, code_size::Integer, code::AbstractArray{<:Integer}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_shader_module(device, ShaderModuleCreateInfo(code_size, code; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

ImageView(device::Device, image::Image, view_type::VkImageViewType, format::VkFormat, components::ComponentMapping, subresource_range::ImageSubresourceRange, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_image_view(device, ImageViewCreateInfo(image, view_type, format, components, subresource_range; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

Image(device::Device, image_type::VkImageType, format::VkFormat, extent::Extent3D, mip_levels::Integer, array_layers::Integer, samples::VkSampleCountFlagBits, tiling::VkImageTiling, usage::Integer, sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}, initial_layout::VkImageLayout, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_image(device, ImageCreateInfo(image_type, format, extent, mip_levels, array_layers, samples, tiling, usage, sharing_mode, queue_family_indices, initial_layout; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

BufferView(device::Device, buffer::Buffer, format::VkFormat, offset::Integer, range::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_buffer_view(device, BufferViewCreateInfo(buffer, format, offset, range; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

Buffer(device::Device, size::Integer, usage::Integer, sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_buffer(device, BufferCreateInfo(size, usage, sharing_mode, queue_family_indices; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

CommandPool(device::Device, queue_family_index::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_command_pool(device, CommandPoolCreateInfo(queue_family_index; next, flags), fun_ptr_create, fun_ptr_destroy; allocator)

DeviceMemory(device::Device, allocation_size::Integer, memory_type_index::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL) = allocate_memory(device, MemoryAllocateInfo(allocation_size, memory_type_index; next), fun_ptr_create, fun_ptr_destroy; allocator)

Device(physical_device::PhysicalDevice, queue_create_infos::AbstractArray{<:DeviceQueueCreateInfo}, enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, enabled_features = C_NULL) = create_device(physical_device, DeviceCreateInfo(queue_create_infos, enabled_layer_names, enabled_extension_names; next, flags, enabled_features), fun_ptr_create, fun_ptr_destroy; allocator)

Instance(enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, application_info = C_NULL) = create_instance(InstanceCreateInfo(enabled_layer_names, enabled_extension_names; next, flags, application_info), fun_ptr_create, fun_ptr_destroy; allocator)

function get_private_data_ext(device::Device, object_type::VkObjectType, object_handle::Integer, private_data_slot::PrivateDataSlotEXT, fun_ptr::FunctionPtr)
    pData = Ref{UInt64}()
    vkGetPrivateDataEXT(device, object_type, object_handle, private_data_slot, pData, fun_ptr)
    pData[]
end

set_private_data_ext(device::Device, object_type::VkObjectType, object_handle::Integer, private_data_slot::PrivateDataSlotEXT, data::Integer, fun_ptr::FunctionPtr) = @check(vkSetPrivateDataEXT(device, object_type, object_handle, private_data_slot, data, fun_ptr))

destroy_private_data_slot_ext(device::Device, private_data_slot::PrivateDataSlotEXT, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyPrivateDataSlotEXT(device, private_data_slot, allocator, fun_ptr)

function create_private_data_slot_ext(device::Device, create_info::PrivateDataSlotCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pPrivateDataSlot = Ref{VkPrivateDataSlotEXT}()
    @check vkCreatePrivateDataSlotEXT(device, create_info, allocator, pPrivateDataSlot, fun_ptr_create)
    PrivateDataSlotEXT(pPrivateDataSlot[], (x->destroy_private_data_slot_ext(device, x, fun_ptr_destroy; allocator)), device)
end

cmd_set_stencil_op_ext(command_buffer::CommandBuffer, face_mask::Integer, fail_op::VkStencilOp, pass_op::VkStencilOp, depth_fail_op::VkStencilOp, compare_op::VkCompareOp, fun_ptr::FunctionPtr) = vkCmdSetStencilOpEXT(command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op, fun_ptr)

cmd_set_stencil_test_enable_ext(command_buffer::CommandBuffer, stencil_test_enable::Bool, fun_ptr::FunctionPtr) = vkCmdSetStencilTestEnableEXT(command_buffer, stencil_test_enable, fun_ptr)

cmd_set_depth_bounds_test_enable_ext(command_buffer::CommandBuffer, depth_bounds_test_enable::Bool, fun_ptr::FunctionPtr) = vkCmdSetDepthBoundsTestEnableEXT(command_buffer, depth_bounds_test_enable, fun_ptr)

cmd_set_depth_compare_op_ext(command_buffer::CommandBuffer, depth_compare_op::VkCompareOp, fun_ptr::FunctionPtr) = vkCmdSetDepthCompareOpEXT(command_buffer, depth_compare_op, fun_ptr)

cmd_set_depth_write_enable_ext(command_buffer::CommandBuffer, depth_write_enable::Bool, fun_ptr::FunctionPtr) = vkCmdSetDepthWriteEnableEXT(command_buffer, depth_write_enable, fun_ptr)

cmd_set_depth_test_enable_ext(command_buffer::CommandBuffer, depth_test_enable::Bool, fun_ptr::FunctionPtr) = vkCmdSetDepthTestEnableEXT(command_buffer, depth_test_enable, fun_ptr)

cmd_bind_vertex_buffers_2_ext(command_buffer::CommandBuffer, buffers::AbstractArray{<:Buffer}, offsets::AbstractArray{<:Integer}, fun_ptr::FunctionPtr; sizes = C_NULL, strides = C_NULL) = vkCmdBindVertexBuffers2EXT(command_buffer, 0, pointer_length(buffers), buffers, offsets, sizes, strides, fun_ptr)

cmd_set_scissor_with_count_ext(command_buffer::CommandBuffer, scissors::AbstractArray{<:Rect2D}, fun_ptr::FunctionPtr) = vkCmdSetScissorWithCountEXT(command_buffer, pointer_length(scissors), scissors, fun_ptr)

cmd_set_viewport_with_count_ext(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}, fun_ptr::FunctionPtr) = vkCmdSetViewportWithCountEXT(command_buffer, pointer_length(viewports), viewports, fun_ptr)

cmd_set_primitive_topology_ext(command_buffer::CommandBuffer, primitive_topology::VkPrimitiveTopology, fun_ptr::FunctionPtr) = vkCmdSetPrimitiveTopologyEXT(command_buffer, primitive_topology, fun_ptr)

cmd_set_front_face_ext(command_buffer::CommandBuffer, front_face::VkFrontFace, fun_ptr::FunctionPtr) = vkCmdSetFrontFaceEXT(command_buffer, front_face, fun_ptr)

cmd_set_cull_mode_ext(command_buffer::CommandBuffer, fun_ptr::FunctionPtr; cull_mode = 0) = vkCmdSetCullModeEXT(command_buffer, cull_mode, fun_ptr)

deferred_operation_join_khr(device::Device, operation::DeferredOperationKHR, fun_ptr::FunctionPtr) = @check(vkDeferredOperationJoinKHR(device, operation, fun_ptr))

get_deferred_operation_result_khr(device::Device, operation::DeferredOperationKHR, fun_ptr::FunctionPtr) = @check(vkGetDeferredOperationResultKHR(device, operation, fun_ptr))

get_deferred_operation_max_concurrency_khr(device::Device, operation::DeferredOperationKHR, fun_ptr::FunctionPtr) = vkGetDeferredOperationMaxConcurrencyKHR(device, operation, fun_ptr)

destroy_deferred_operation_khr(device::Device, operation::DeferredOperationKHR, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyDeferredOperationKHR(device, operation, allocator, fun_ptr)

function create_deferred_operation_khr(device::Device, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pDeferredOperation = Ref{VkDeferredOperationKHR}()
    @check vkCreateDeferredOperationKHR(device, allocator, pDeferredOperation, fun_ptr_create)
    DeferredOperationKHR(pDeferredOperation[], (x->destroy_deferred_operation_khr(device, x, fun_ptr_destroy; allocator)), device)
end

get_acceleration_structure_device_address_khr(device::Device, info::AccelerationStructureDeviceAddressInfoKHR, fun_ptr::FunctionPtr) = vkGetAccelerationStructureDeviceAddressKHR(device, info, fun_ptr)

build_acceleration_structure_khr(device::Device, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, offset_infos::AbstractArray{<:AccelerationStructureBuildOffsetInfoKHR}, fun_ptr::FunctionPtr) = @check(vkBuildAccelerationStructureKHR(device, pointer_length(infos), infos, offset_infos, fun_ptr))

cmd_build_acceleration_structure_indirect_khr(command_buffer::CommandBuffer, info::AccelerationStructureBuildGeometryInfoKHR, indirect_buffer::Buffer, indirect_offset::Integer, indirect_stride::Integer, fun_ptr::FunctionPtr) = vkCmdBuildAccelerationStructureIndirectKHR(command_buffer, info, indirect_buffer, indirect_offset, indirect_stride, fun_ptr)

cmd_build_acceleration_structure_khr(command_buffer::CommandBuffer, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, offset_infos::AbstractArray{<:AccelerationStructureBuildOffsetInfoKHR}, fun_ptr::FunctionPtr) = vkCmdBuildAccelerationStructureKHR(command_buffer, pointer_length(infos), infos, offset_infos, fun_ptr)

function create_acceleration_structure_khr(device::Device, create_info::AccelerationStructureCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pAccelerationStructure = Ref{VkAccelerationStructureKHR}()
    @check vkCreateAccelerationStructureKHR(device, create_info, allocator, pAccelerationStructure, fun_ptr_create)
    AccelerationStructureKHR(pAccelerationStructure[], (x->destroy_acceleration_structure_khr(device, x, fun_ptr_destroy; allocator)), device)
end

function get_physical_device_tool_properties_ext(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pToolCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceToolPropertiesEXT(physical_device, pToolCount, C_NULL, fun_ptr)
    pToolProperties = Vector{VkPhysicalDeviceToolPropertiesEXT}(undef, pToolCount[])
    @check vkGetPhysicalDeviceToolPropertiesEXT(physical_device, pToolCount, pToolProperties, fun_ptr)
    from_vk.(PhysicalDeviceToolPropertiesEXT, pToolProperties)
end

cmd_set_line_stipple_ext(command_buffer::CommandBuffer, line_stipple_factor::Integer, line_stipple_pattern::Integer, fun_ptr::FunctionPtr) = vkCmdSetLineStippleEXT(command_buffer, line_stipple_factor, line_stipple_pattern, fun_ptr)

function get_pipeline_executable_internal_representations_khr(device::Device, executable_info::PipelineExecutableInfoKHR, fun_ptr::FunctionPtr)
    pInternalRepresentationCount = Ref{UInt32}()
    @check vkGetPipelineExecutableInternalRepresentationsKHR(device, executable_info, pInternalRepresentationCount, C_NULL, fun_ptr)
    pInternalRepresentations = Vector{VkPipelineExecutableInternalRepresentationKHR}(undef, pInternalRepresentationCount[])
    @check vkGetPipelineExecutableInternalRepresentationsKHR(device, executable_info, pInternalRepresentationCount, pInternalRepresentations, fun_ptr)
    from_vk.(PipelineExecutableInternalRepresentationKHR, pInternalRepresentations)
end

function get_pipeline_executable_statistics_khr(device::Device, executable_info::PipelineExecutableInfoKHR, fun_ptr::FunctionPtr)
    pStatisticCount = Ref{UInt32}()
    @check vkGetPipelineExecutableStatisticsKHR(device, executable_info, pStatisticCount, C_NULL, fun_ptr)
    pStatistics = Vector{VkPipelineExecutableStatisticKHR}(undef, pStatisticCount[])
    @check vkGetPipelineExecutableStatisticsKHR(device, executable_info, pStatisticCount, pStatistics, fun_ptr)
    from_vk.(PipelineExecutableStatisticKHR, pStatistics)
end

function get_pipeline_executable_properties_khr(device::Device, pipeline_info::PipelineInfoKHR, fun_ptr::FunctionPtr)
    pExecutableCount = Ref{UInt32}()
    @check vkGetPipelineExecutablePropertiesKHR(device, pipeline_info, pExecutableCount, C_NULL, fun_ptr)
    pProperties = Vector{VkPipelineExecutablePropertiesKHR}(undef, pExecutableCount[])
    @check vkGetPipelineExecutablePropertiesKHR(device, pipeline_info, pExecutableCount, pProperties, fun_ptr)
    from_vk.(PipelineExecutablePropertiesKHR, pProperties)
end

get_device_memory_opaque_capture_address(device::Device, info::DeviceMemoryOpaqueCaptureAddressInfo, fun_ptr::FunctionPtr) = vkGetDeviceMemoryOpaqueCaptureAddress(device, info, fun_ptr)

function get_performance_parameter_intel(device::Device, parameter::VkPerformanceParameterTypeINTEL, fun_ptr::FunctionPtr)
    pValue = Ref{VkPerformanceValueINTEL}()
    @check vkGetPerformanceParameterINTEL(device, parameter, pValue, fun_ptr)
    from_vk(PerformanceValueINTEL, pValue[])
end

queue_set_performance_configuration_intel(queue::Queue, configuration::PerformanceConfigurationINTEL, fun_ptr::FunctionPtr) = @check(vkQueueSetPerformanceConfigurationINTEL(queue, configuration, fun_ptr))

release_performance_configuration_intel(device::Device, configuration::PerformanceConfigurationINTEL, fun_ptr::FunctionPtr) = @check(vkReleasePerformanceConfigurationINTEL(device, configuration, fun_ptr))

function acquire_performance_configuration_intel(device::Device, acquire_info::PerformanceConfigurationAcquireInfoINTEL, fun_ptr::FunctionPtr)
    pConfiguration = Ref{VkPerformanceConfigurationINTEL}()
    @check vkAcquirePerformanceConfigurationINTEL(device, acquire_info, pConfiguration, fun_ptr)
    PerformanceConfigurationINTEL(pConfiguration[], identity, device)
end

cmd_set_performance_override_intel(command_buffer::CommandBuffer, override_info::PerformanceOverrideInfoINTEL, fun_ptr::FunctionPtr) = @check(vkCmdSetPerformanceOverrideINTEL(command_buffer, override_info, fun_ptr))

cmd_set_performance_stream_marker_intel(command_buffer::CommandBuffer, marker_info::PerformanceStreamMarkerInfoINTEL, fun_ptr::FunctionPtr) = @check(vkCmdSetPerformanceStreamMarkerINTEL(command_buffer, marker_info, fun_ptr))

cmd_set_performance_marker_intel(command_buffer::CommandBuffer, marker_info::PerformanceMarkerInfoINTEL, fun_ptr::FunctionPtr) = @check(vkCmdSetPerformanceMarkerINTEL(command_buffer, marker_info, fun_ptr))

uninitialize_performance_api_intel(device::Device, fun_ptr::FunctionPtr) = vkUninitializePerformanceApiINTEL(device, fun_ptr)

initialize_performance_api_intel(device::Device, initialize_info::InitializePerformanceApiInfoINTEL, fun_ptr::FunctionPtr) = @check(vkInitializePerformanceApiINTEL(device, initialize_info, fun_ptr))

function get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pCombinationCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(physical_device, pCombinationCount, C_NULL, fun_ptr)
    pCombinations = Vector{VkFramebufferMixedSamplesCombinationNV}(undef, pCombinationCount[])
    @check vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(physical_device, pCombinationCount, pCombinations, fun_ptr)
    from_vk.(FramebufferMixedSamplesCombinationNV, pCombinations)
end

function create_headless_surface_ext(instance::Instance, create_info::HeadlessSurfaceCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateHeadlessSurfaceEXT(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

get_buffer_device_address(device::Device, info::BufferDeviceAddressInfo, fun_ptr::FunctionPtr) = vkGetBufferDeviceAddress(device, info, fun_ptr)

get_buffer_opaque_capture_address(device::Device, info::BufferDeviceAddressInfo, fun_ptr::FunctionPtr) = vkGetBufferOpaqueCaptureAddress(device, info, fun_ptr)

function get_image_drm_format_modifier_properties_ext(device::Device, image::Image, fun_ptr::FunctionPtr)
    pProperties = Ref{VkImageDrmFormatModifierPropertiesEXT}()
    @check vkGetImageDrmFormatModifierPropertiesEXT(device, image, pProperties, fun_ptr)
    from_vk(ImageDrmFormatModifierPropertiesEXT, pProperties[])
end

release_profiling_lock_khr(device::Device, fun_ptr::FunctionPtr) = vkReleaseProfilingLockKHR(device, fun_ptr)

acquire_profiling_lock_khr(device::Device, info::AcquireProfilingLockInfoKHR, fun_ptr::FunctionPtr) = @check(vkAcquireProfilingLockKHR(device, info, fun_ptr))

function get_physical_device_queue_family_performance_query_passes_khr(physical_device::PhysicalDevice, performance_query_create_info::QueryPoolPerformanceCreateInfoKHR, fun_ptr::FunctionPtr)
    pNumPasses = Ref{UInt32}()
    vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(physical_device, performance_query_create_info, pNumPasses, fun_ptr)
    pNumPasses[]
end

function enumerate_physical_device_queue_family_performance_query_counters_khr(physical_device::PhysicalDevice, queue_family_index::Integer, fun_ptr::FunctionPtr)
    pCounterCount = Ref{UInt32}()
    @check vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device, queue_family_index, pCounterCount, C_NULL, C_NULL, fun_ptr)
    pCounters = Vector{VkPerformanceCounterKHR}(undef, pCounterCount[])
    pCounterDescriptions = Vector{VkPerformanceCounterDescriptionKHR}(undef, pCounterCount[])
    @check vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device, queue_family_index, pCounterCount, pCounters, pCounterDescriptions, fun_ptr)
    (from_vk.(PerformanceCounterKHR, pCounters), from_vk.(PerformanceCounterDescriptionKHR, pCounterDescriptions))
end

release_full_screen_exclusive_mode_ext(device::Device, swapchain::SwapchainKHR, fun_ptr::FunctionPtr) = @check(vkReleaseFullScreenExclusiveModeEXT(device, swapchain, fun_ptr))

acquire_full_screen_exclusive_mode_ext(device::Device, swapchain::SwapchainKHR, fun_ptr::FunctionPtr) = @check(vkAcquireFullScreenExclusiveModeEXT(device, swapchain, fun_ptr))

function get_device_group_surface_present_modes_2_ext(device::Device, surface_info::PhysicalDeviceSurfaceInfo2KHR, modes::Integer, fun_ptr::FunctionPtr)
    pModes = Ref{VkDeviceGroupPresentModeFlagsKHR}()
    @check vkGetDeviceGroupSurfacePresentModes2EXT(device, surface_info, pModes, fun_ptr)
    pModes[]
end

function get_physical_device_surface_present_modes_2_ext(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR, fun_ptr::FunctionPtr)
    pPresentModeCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSurfacePresentModes2EXT(physical_device, surface_info, pPresentModeCount, C_NULL, fun_ptr)
    pPresentModes = Vector{VkPresentModeKHR}(undef, pPresentModeCount[])
    @check vkGetPhysicalDeviceSurfacePresentModes2EXT(physical_device, surface_info, pPresentModeCount, pPresentModes, fun_ptr)
    pPresentModes
end

function get_image_view_address_nvx(device::Device, image_view::ImageView, fun_ptr::FunctionPtr)
    pProperties = Ref{VkImageViewAddressPropertiesNVX}()
    @check vkGetImageViewAddressNVX(device, image_view, pProperties, fun_ptr)
    from_vk(ImageViewAddressPropertiesNVX, pProperties[])
end

get_image_view_handle_nvx(device::Device, info::ImageViewHandleInfoNVX, fun_ptr::FunctionPtr) = vkGetImageViewHandleNVX(device, info, fun_ptr)

get_device_acceleration_structure_compatibility_khr(device::Device, version::AccelerationStructureVersionKHR, fun_ptr::FunctionPtr) = @check(vkGetDeviceAccelerationStructureCompatibilityKHR(device, version, fun_ptr))

cmd_trace_rays_indirect_khr(command_buffer::CommandBuffer, raygen_shader_binding_table::StridedBufferRegionKHR, miss_shader_binding_table::StridedBufferRegionKHR, hit_shader_binding_table::StridedBufferRegionKHR, callable_shader_binding_table::StridedBufferRegionKHR, buffer::Buffer, offset::Integer, fun_ptr::FunctionPtr) = vkCmdTraceRaysIndirectKHR(command_buffer, raygen_shader_binding_table, miss_shader_binding_table, hit_shader_binding_table, callable_shader_binding_table, buffer, offset, fun_ptr)

function get_physical_device_cooperative_matrix_properties_nv(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(physical_device, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkCooperativeMatrixPropertiesNV}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(physical_device, pPropertyCount, pProperties, fun_ptr)
    from_vk.(CooperativeMatrixPropertiesNV, pProperties)
end

function create_ray_tracing_pipelines_khr(device::Device, create_infos::AbstractArray{<:RayTracingPipelineCreateInfoKHR}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; pipeline_cache = C_NULL, allocator = C_NULL)
    pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
    @check vkCreateRayTracingPipelinesKHR(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines, fun_ptr_create)
    Pipeline.(pPipelines, (x->destroy_pipeline(device, x, fun_ptr_destroy; allocator)), device)
end

function create_ray_tracing_pipelines_nv(device::Device, create_infos::AbstractArray{<:RayTracingPipelineCreateInfoNV}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; pipeline_cache = C_NULL, allocator = C_NULL)
    pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
    @check vkCreateRayTracingPipelinesNV(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines, fun_ptr_create)
    Pipeline.(pPipelines, (x->destroy_pipeline(device, x, fun_ptr_destroy; allocator)), device)
end

function get_acceleration_structure_handle_nv(device::Device, acceleration_structure::AccelerationStructureKHR, data_size::Integer, fun_ptr::FunctionPtr)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetAccelerationStructureHandleNV(device, acceleration_structure, data_size, pData, fun_ptr)
    pData[]
end

function get_ray_tracing_capture_replay_shader_group_handles_khr(device::Device, pipeline::Pipeline, first_group::Integer, group_count::Integer, data_size::Integer, fun_ptr::FunctionPtr)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetRayTracingCaptureReplayShaderGroupHandlesKHR(device, pipeline, first_group, group_count, data_size, pData, fun_ptr)
    pData[]
end

function get_ray_tracing_shader_group_handles_khr(device::Device, pipeline::Pipeline, first_group::Integer, group_count::Integer, data_size::Integer, fun_ptr::FunctionPtr)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetRayTracingShaderGroupHandlesKHR(device, pipeline, first_group, group_count, data_size, pData, fun_ptr)
    pData[]
end

cmd_trace_rays_nv(command_buffer::CommandBuffer, raygen_shader_binding_table_buffer::Buffer, raygen_shader_binding_offset::Integer, miss_shader_binding_offset::Integer, miss_shader_binding_stride::Integer, hit_shader_binding_offset::Integer, hit_shader_binding_stride::Integer, callable_shader_binding_offset::Integer, callable_shader_binding_stride::Integer, width::Integer, height::Integer, depth::Integer, fun_ptr::FunctionPtr; miss_shader_binding_table_buffer = C_NULL, hit_shader_binding_table_buffer = C_NULL, callable_shader_binding_table_buffer = C_NULL) = vkCmdTraceRaysNV(command_buffer, raygen_shader_binding_table_buffer, raygen_shader_binding_offset, miss_shader_binding_table_buffer, miss_shader_binding_offset, miss_shader_binding_stride, hit_shader_binding_table_buffer, hit_shader_binding_offset, hit_shader_binding_stride, callable_shader_binding_table_buffer, callable_shader_binding_offset, callable_shader_binding_stride, width, height, depth, fun_ptr)

cmd_trace_rays_khr(command_buffer::CommandBuffer, raygen_shader_binding_table::StridedBufferRegionKHR, miss_shader_binding_table::StridedBufferRegionKHR, hit_shader_binding_table::StridedBufferRegionKHR, callable_shader_binding_table::StridedBufferRegionKHR, width::Integer, height::Integer, depth::Integer, fun_ptr::FunctionPtr) = vkCmdTraceRaysKHR(command_buffer, raygen_shader_binding_table, miss_shader_binding_table, hit_shader_binding_table, callable_shader_binding_table, width, height, depth, fun_ptr)

function write_acceleration_structures_properties_khr(device::Device, acceleration_structures::AbstractArray{<:AccelerationStructureKHR}, query_type::VkQueryType, data_size::Integer, stride::Integer, fun_ptr::FunctionPtr)
    pData = Ref{Ptr{Cvoid}}()
    @check vkWriteAccelerationStructuresPropertiesKHR(device, pointer_length(acceleration_structures), acceleration_structures, query_type, data_size, pData, stride, fun_ptr)
    pData[]
end

cmd_build_acceleration_structure_nv(command_buffer::CommandBuffer, info::AccelerationStructureInfoNV, instance_offset::Integer, update::Bool, dst::AccelerationStructureKHR, scratch::Buffer, scratch_offset::Integer, fun_ptr::FunctionPtr; instance_data = C_NULL, src = C_NULL) = vkCmdBuildAccelerationStructureNV(command_buffer, info, instance_data, instance_offset, update, dst, src, scratch, scratch_offset, fun_ptr)

cmd_write_acceleration_structures_properties_khr(command_buffer::CommandBuffer, acceleration_structures::AbstractArray{<:AccelerationStructureKHR}, query_type::VkQueryType, query_pool::QueryPool, first_query::Integer, fun_ptr::FunctionPtr) = vkCmdWriteAccelerationStructuresPropertiesKHR(command_buffer, pointer_length(acceleration_structures), acceleration_structures, query_type, query_pool, first_query, fun_ptr)

copy_memory_to_acceleration_structure_khr(device::Device, info::CopyMemoryToAccelerationStructureInfoKHR, fun_ptr::FunctionPtr) = @check(vkCopyMemoryToAccelerationStructureKHR(device, info, fun_ptr))

cmd_copy_memory_to_acceleration_structure_khr(command_buffer::CommandBuffer, info::CopyMemoryToAccelerationStructureInfoKHR, fun_ptr::FunctionPtr) = vkCmdCopyMemoryToAccelerationStructureKHR(command_buffer, info, fun_ptr)

copy_acceleration_structure_to_memory_khr(device::Device, info::CopyAccelerationStructureToMemoryInfoKHR, fun_ptr::FunctionPtr) = @check(vkCopyAccelerationStructureToMemoryKHR(device, info, fun_ptr))

cmd_copy_acceleration_structure_to_memory_khr(command_buffer::CommandBuffer, info::CopyAccelerationStructureToMemoryInfoKHR, fun_ptr::FunctionPtr) = vkCmdCopyAccelerationStructureToMemoryKHR(command_buffer, info, fun_ptr)

copy_acceleration_structure_khr(device::Device, info::CopyAccelerationStructureInfoKHR, fun_ptr::FunctionPtr) = @check(vkCopyAccelerationStructureKHR(device, info, fun_ptr))

cmd_copy_acceleration_structure_khr(command_buffer::CommandBuffer, info::CopyAccelerationStructureInfoKHR, fun_ptr::FunctionPtr) = vkCmdCopyAccelerationStructureKHR(command_buffer, info, fun_ptr)

cmd_copy_acceleration_structure_nv(command_buffer::CommandBuffer, dst::AccelerationStructureKHR, src::AccelerationStructureKHR, mode::VkCopyAccelerationStructureModeKHR, fun_ptr::FunctionPtr) = vkCmdCopyAccelerationStructureNV(command_buffer, dst, src, mode, fun_ptr)

bind_acceleration_structure_memory_khr(device::Device, bind_infos::AbstractArray{<:BindAccelerationStructureMemoryInfoKHR}, fun_ptr::FunctionPtr) = @check(vkBindAccelerationStructureMemoryKHR(device, pointer_length(bind_infos), bind_infos, fun_ptr))

function get_acceleration_structure_memory_requirements_nv(device::Device, info::AccelerationStructureMemoryRequirementsInfoNV, fun_ptr::FunctionPtr)
    pMemoryRequirements = Ref{VkMemoryRequirements2KHR}()
    vkGetAccelerationStructureMemoryRequirementsNV(device, info, pMemoryRequirements, fun_ptr)
    from_vk(VkMemoryRequirements2KHR, pMemoryRequirements[])
end

function get_acceleration_structure_memory_requirements_khr(device::Device, info::AccelerationStructureMemoryRequirementsInfoKHR, fun_ptr::FunctionPtr)
    pMemoryRequirements = Ref{VkMemoryRequirements2}()
    vkGetAccelerationStructureMemoryRequirementsKHR(device, info, pMemoryRequirements, fun_ptr)
    from_vk(MemoryRequirements2, pMemoryRequirements[])
end

destroy_acceleration_structure_khr(device::Device, acceleration_structure::AccelerationStructureKHR, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyAccelerationStructureKHR(device, acceleration_structure, allocator, fun_ptr)

function create_acceleration_structure_nv(device::Device, create_info::AccelerationStructureCreateInfoNV, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pAccelerationStructure = Ref{VkAccelerationStructureNV}()
    @check vkCreateAccelerationStructureNV(device, create_info, allocator, pAccelerationStructure, fun_ptr_create)
    AccelerationStructureKHR(pAccelerationStructure[], (x->destroy_acceleration_structure_khr(device, x, fun_ptr_destroy; allocator)), device)
end

compile_deferred_nv(device::Device, pipeline::Pipeline, shader::Integer, fun_ptr::FunctionPtr) = @check(vkCompileDeferredNV(device, pipeline, shader, fun_ptr))

cmd_draw_mesh_tasks_indirect_count_nv(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, count_buffer::Buffer, count_buffer_offset::Integer, max_draw_count::Integer, stride::Integer, fun_ptr::FunctionPtr) = vkCmdDrawMeshTasksIndirectCountNV(command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride, fun_ptr)

cmd_draw_mesh_tasks_indirect_nv(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, draw_count::Integer, stride::Integer, fun_ptr::FunctionPtr) = vkCmdDrawMeshTasksIndirectNV(command_buffer, buffer, offset, draw_count, stride, fun_ptr)

cmd_draw_mesh_tasks_nv(command_buffer::CommandBuffer, task_count::Integer, first_task::Integer, fun_ptr::FunctionPtr) = vkCmdDrawMeshTasksNV(command_buffer, task_count, first_task, fun_ptr)

cmd_set_coarse_sample_order_nv(command_buffer::CommandBuffer, sample_order_type::VkCoarseSampleOrderTypeNV, custom_sample_orders::AbstractArray{<:CoarseSampleOrderCustomNV}, fun_ptr::FunctionPtr) = vkCmdSetCoarseSampleOrderNV(command_buffer, sample_order_type, pointer_length(custom_sample_orders), custom_sample_orders, fun_ptr)

cmd_set_viewport_shading_rate_palette_nv(command_buffer::CommandBuffer, shading_rate_palettes::AbstractArray{<:ShadingRatePaletteNV}, fun_ptr::FunctionPtr) = vkCmdSetViewportShadingRatePaletteNV(command_buffer, 0, pointer_length(shading_rate_palettes), shading_rate_palettes, fun_ptr)

cmd_bind_shading_rate_image_nv(command_buffer::CommandBuffer, image_layout::VkImageLayout, fun_ptr::FunctionPtr; image_view = C_NULL) = vkCmdBindShadingRateImageNV(command_buffer, image_view, image_layout, fun_ptr)

cmd_set_exclusive_scissor_nv(command_buffer::CommandBuffer, exclusive_scissors::AbstractArray{<:Rect2D}, fun_ptr::FunctionPtr) = vkCmdSetExclusiveScissorNV(command_buffer, 0, pointer_length(exclusive_scissors), exclusive_scissors, fun_ptr)

cmd_draw_indirect_byte_count_ext(command_buffer::CommandBuffer, instance_count::Integer, first_instance::Integer, counter_buffer::Buffer, counter_buffer_offset::Integer, counter_offset::Integer, vertex_stride::Integer, fun_ptr::FunctionPtr) = vkCmdDrawIndirectByteCountEXT(command_buffer, instance_count, first_instance, counter_buffer, counter_buffer_offset, counter_offset, vertex_stride, fun_ptr)

cmd_end_query_indexed_ext(command_buffer::CommandBuffer, query_pool::QueryPool, query::Integer, index::Integer, fun_ptr::FunctionPtr) = vkCmdEndQueryIndexedEXT(command_buffer, query_pool, query, index, fun_ptr)

cmd_begin_query_indexed_ext(command_buffer::CommandBuffer, query_pool::QueryPool, query::Integer, index::Integer, fun_ptr::FunctionPtr; flags = 0) = vkCmdBeginQueryIndexedEXT(command_buffer, query_pool, query, flags, index, fun_ptr)

cmd_end_transform_feedback_ext(command_buffer::CommandBuffer, counter_buffers::AbstractArray{<:Buffer}, fun_ptr::FunctionPtr; counter_buffer_offsets = C_NULL) = vkCmdEndTransformFeedbackEXT(command_buffer, 0, pointer_length(counter_buffers), counter_buffers, counter_buffer_offsets, fun_ptr)

cmd_begin_transform_feedback_ext(command_buffer::CommandBuffer, counter_buffers::AbstractArray{<:Buffer}, fun_ptr::FunctionPtr; counter_buffer_offsets = C_NULL) = vkCmdBeginTransformFeedbackEXT(command_buffer, 0, pointer_length(counter_buffers), counter_buffers, counter_buffer_offsets, fun_ptr)

cmd_bind_transform_feedback_buffers_ext(command_buffer::CommandBuffer, buffers::AbstractArray{<:Buffer}, offsets::AbstractArray{<:Integer}, fun_ptr::FunctionPtr; sizes = C_NULL) = vkCmdBindTransformFeedbackBuffersEXT(command_buffer, 0, pointer_length(buffers), buffers, offsets, sizes, fun_ptr)

function get_queue_checkpoint_data_nv(queue::Queue, fun_ptr::FunctionPtr)
    pCheckpointDataCount = Ref{UInt32}()
    vkGetQueueCheckpointDataNV(queue, pCheckpointDataCount, C_NULL, fun_ptr)
    pCheckpointData = Vector{VkCheckpointDataNV}(undef, pCheckpointDataCount[])
    vkGetQueueCheckpointDataNV(queue, pCheckpointDataCount, pCheckpointData, fun_ptr)
    from_vk.(CheckpointDataNV, pCheckpointData)
end

cmd_set_checkpoint_nv(command_buffer::CommandBuffer, checkpoint_marker::Ptr{Cvoid}, fun_ptr::FunctionPtr) = vkCmdSetCheckpointNV(command_buffer, Ref(checkpoint_marker), fun_ptr)

cmd_draw_indexed_indirect_count(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, count_buffer::Buffer, count_buffer_offset::Integer, max_draw_count::Integer, stride::Integer, fun_ptr::FunctionPtr) = vkCmdDrawIndexedIndirectCount(command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride, fun_ptr)

cmd_draw_indirect_count(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, count_buffer::Buffer, count_buffer_offset::Integer, max_draw_count::Integer, stride::Integer, fun_ptr::FunctionPtr) = vkCmdDrawIndirectCount(command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride, fun_ptr)

function get_memory_android_hardware_buffer_android(device::Device, info::MemoryGetAndroidHardwareBufferInfoANDROID, fun_ptr::FunctionPtr)
    pBuffer = Ref{Ptr{AHardwareBuffer}}()
    @check vkGetMemoryAndroidHardwareBufferANDROID(device, info, pBuffer, fun_ptr)
    from_vk(Cvoid, pBuffer[])
end

function get_android_hardware_buffer_properties_android(device::Device, buffer::Cvoid, fun_ptr::FunctionPtr)
    pProperties = Ref{VkAndroidHardwareBufferPropertiesANDROID}()
    @check vkGetAndroidHardwareBufferPropertiesANDROID(device, Ref(buffer), pProperties, fun_ptr)
    from_vk(AndroidHardwareBufferPropertiesANDROID, pProperties[])
end

signal_semaphore(device::Device, signal_info::SemaphoreSignalInfo, fun_ptr::FunctionPtr) = @check(vkSignalSemaphore(device, signal_info, fun_ptr))

wait_semaphores(device::Device, wait_info::SemaphoreWaitInfo, timeout::Integer, fun_ptr::FunctionPtr) = @check(vkWaitSemaphores(device, wait_info, timeout, fun_ptr))

function get_semaphore_counter_value(device::Device, semaphore::Semaphore, fun_ptr::FunctionPtr)
    pValue = Ref{UInt64}()
    @check vkGetSemaphoreCounterValue(device, semaphore, pValue, fun_ptr)
    pValue[]
end

cmd_end_render_pass_2(command_buffer::CommandBuffer, subpass_end_info::SubpassEndInfo, fun_ptr::FunctionPtr) = vkCmdEndRenderPass2(command_buffer, subpass_end_info, fun_ptr)

cmd_next_subpass_2(command_buffer::CommandBuffer, subpass_begin_info::SubpassBeginInfo, subpass_end_info::SubpassEndInfo, fun_ptr::FunctionPtr) = vkCmdNextSubpass2(command_buffer, subpass_begin_info, subpass_end_info, fun_ptr)

cmd_begin_render_pass_2(command_buffer::CommandBuffer, render_pass_begin::RenderPassBeginInfo, subpass_begin_info::SubpassBeginInfo, fun_ptr::FunctionPtr) = vkCmdBeginRenderPass2(command_buffer, render_pass_begin, subpass_begin_info, fun_ptr)

function create_render_pass_2(device::Device, create_info::RenderPassCreateInfo2, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pRenderPass = Ref{VkRenderPass}()
    @check vkCreateRenderPass2(device, create_info, allocator, pRenderPass, fun_ptr_create)
    RenderPass(pRenderPass[], (x->destroy_render_pass(device, x, fun_ptr_destroy; allocator)), device)
end

cmd_write_buffer_marker_amd(command_buffer::CommandBuffer, pipeline_stage::VkPipelineStageFlagBits, dst_buffer::Buffer, dst_offset::Integer, marker::Integer, fun_ptr::FunctionPtr) = vkCmdWriteBufferMarkerAMD(command_buffer, pipeline_stage, dst_buffer, dst_offset, marker, fun_ptr)

function get_memory_host_pointer_properties_ext(device::Device, handle_type::VkExternalMemoryHandleTypeFlagBits, host_pointer::Ptr{Cvoid}, fun_ptr::FunctionPtr)
    pMemoryHostPointerProperties = Ref{VkMemoryHostPointerPropertiesEXT}()
    @check vkGetMemoryHostPointerPropertiesEXT(device, handle_type, Ref(host_pointer), pMemoryHostPointerProperties, fun_ptr)
    from_vk(MemoryHostPointerPropertiesEXT, pMemoryHostPointerProperties[])
end

submit_debug_utils_message_ext(instance::Instance, message_severity::VkDebugUtilsMessageSeverityFlagBitsEXT, message_types::Integer, callback_data::DebugUtilsMessengerCallbackDataEXT, fun_ptr::FunctionPtr) = vkSubmitDebugUtilsMessageEXT(instance, message_severity, message_types, callback_data, fun_ptr)

destroy_debug_utils_messenger_ext(instance::Instance, messenger::DebugUtilsMessengerEXT, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyDebugUtilsMessengerEXT(instance, messenger, allocator, fun_ptr)

function create_debug_utils_messenger_ext(instance::Instance, create_info::DebugUtilsMessengerCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pMessenger = Ref{VkDebugUtilsMessengerEXT}()
    @check vkCreateDebugUtilsMessengerEXT(instance, create_info, allocator, pMessenger, fun_ptr_create)
    DebugUtilsMessengerEXT(pMessenger[], (x->destroy_debug_utils_messenger_ext(instance, x, fun_ptr_destroy; allocator)), instance)
end

cmd_insert_debug_utils_label_ext(command_buffer::CommandBuffer, label_info::DebugUtilsLabelEXT, fun_ptr::FunctionPtr) = vkCmdInsertDebugUtilsLabelEXT(command_buffer, label_info, fun_ptr)

cmd_end_debug_utils_label_ext(command_buffer::CommandBuffer, fun_ptr::FunctionPtr) = vkCmdEndDebugUtilsLabelEXT(command_buffer, fun_ptr)

cmd_begin_debug_utils_label_ext(command_buffer::CommandBuffer, label_info::DebugUtilsLabelEXT, fun_ptr::FunctionPtr) = vkCmdBeginDebugUtilsLabelEXT(command_buffer, label_info, fun_ptr)

queue_insert_debug_utils_label_ext(queue::Queue, label_info::DebugUtilsLabelEXT, fun_ptr::FunctionPtr) = vkQueueInsertDebugUtilsLabelEXT(queue, label_info, fun_ptr)

queue_end_debug_utils_label_ext(queue::Queue, fun_ptr::FunctionPtr) = vkQueueEndDebugUtilsLabelEXT(queue, fun_ptr)

queue_begin_debug_utils_label_ext(queue::Queue, label_info::DebugUtilsLabelEXT, fun_ptr::FunctionPtr) = vkQueueBeginDebugUtilsLabelEXT(queue, label_info, fun_ptr)

set_debug_utils_object_tag_ext(device::Device, tag_info::DebugUtilsObjectTagInfoEXT, fun_ptr::FunctionPtr) = @check(vkSetDebugUtilsObjectTagEXT(device, tag_info, fun_ptr))

set_debug_utils_object_name_ext(device::Device, name_info::DebugUtilsObjectNameInfoEXT, fun_ptr::FunctionPtr) = @check(vkSetDebugUtilsObjectNameEXT(device, name_info, fun_ptr))

function get_calibrated_timestamps_ext(device::Device, timestamp_infos::AbstractArray{<:CalibratedTimestampInfoEXT}, fun_ptr::FunctionPtr)
    pTimestamps = Vector{UInt64}(undef, pointer_length(timestamp_infos))
    pMaxDeviation = Ref{UInt64}()
    @check vkGetCalibratedTimestampsEXT(device, pointer_length(timestamp_infos), timestamp_infos, pTimestamps, pMaxDeviation, fun_ptr)
    (pTimestamps, pMaxDeviation[])
end

function get_physical_device_calibrateable_time_domains_ext(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pTimeDomainCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceCalibrateableTimeDomainsEXT(physical_device, pTimeDomainCount, C_NULL, fun_ptr)
    pTimeDomains = Vector{VkTimeDomainEXT}(undef, pTimeDomainCount[])
    @check vkGetPhysicalDeviceCalibrateableTimeDomainsEXT(physical_device, pTimeDomainCount, pTimeDomains, fun_ptr)
    pTimeDomains
end

set_local_dimming_amd(device::Device, swap_chain::SwapchainKHR, local_dimming_enable::Bool, fun_ptr::FunctionPtr) = vkSetLocalDimmingAMD(device, swap_chain, local_dimming_enable, fun_ptr)

function get_shader_info_amd(device::Device, pipeline::Pipeline, shader_stage::VkShaderStageFlagBits, info_type::VkShaderInfoTypeAMD, info_size::Integer, fun_ptr::FunctionPtr)
    pInfoSize = Ref(info_size)
    pInfo = Ref{Ptr{Cvoid}}()
    @check vkGetShaderInfoAMD(device, pipeline, shader_stage, info_type, pInfoSize, pInfo, fun_ptr)
    (pInfoSize[], pInfo[])
end

function get_descriptor_set_layout_support(device::Device, create_info::DescriptorSetLayoutCreateInfo, fun_ptr::FunctionPtr)
    pSupport = Ref{VkDescriptorSetLayoutSupport}()
    vkGetDescriptorSetLayoutSupport(device, create_info, pSupport, fun_ptr)
    from_vk(DescriptorSetLayoutSupport, pSupport[])
end

merge_validation_caches_ext(device::Device, dst_cache::ValidationCacheEXT, src_caches::AbstractArray{<:ValidationCacheEXT}, fun_ptr::FunctionPtr) = @check(vkMergeValidationCachesEXT(device, dst_cache, pointer_length(src_caches), src_caches, fun_ptr))

function get_validation_cache_data_ext(device::Device, validation_cache::ValidationCacheEXT, data_size::Integer, fun_ptr::FunctionPtr)
    pDataSize = Ref(data_size)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetValidationCacheDataEXT(device, validation_cache, pDataSize, pData, fun_ptr)
    (pDataSize[], pData[])
end

destroy_validation_cache_ext(device::Device, validation_cache::ValidationCacheEXT, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyValidationCacheEXT(device, validation_cache, allocator, fun_ptr)

function create_validation_cache_ext(device::Device, create_info::ValidationCacheCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pValidationCache = Ref{VkValidationCacheEXT}()
    @check vkCreateValidationCacheEXT(device, create_info, allocator, pValidationCache, fun_ptr_create)
    ValidationCacheEXT(pValidationCache[], (x->destroy_validation_cache_ext(device, x, fun_ptr_destroy; allocator)), device)
end

function get_device_queue_2(device::Device, queue_info::DeviceQueueInfo2, fun_ptr::FunctionPtr)
    pQueue = Ref{VkQueue}()
    vkGetDeviceQueue2(device, queue_info, pQueue, fun_ptr)
    Queue(pQueue[], identity, device)
end

destroy_sampler_ycbcr_conversion(device::Device, ycbcr_conversion::SamplerYcbcrConversion, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroySamplerYcbcrConversion(device, ycbcr_conversion, allocator, fun_ptr)

function create_sampler_ycbcr_conversion(device::Device, create_info::SamplerYcbcrConversionCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pYcbcrConversion = Ref{VkSamplerYcbcrConversion}()
    @check vkCreateSamplerYcbcrConversion(device, create_info, allocator, pYcbcrConversion, fun_ptr_create)
    SamplerYcbcrConversion(pYcbcrConversion[], (x->destroy_sampler_ycbcr_conversion(device, x, fun_ptr_destroy; allocator)), device)
end

function get_image_sparse_memory_requirements_2(device::Device, info::ImageSparseMemoryRequirementsInfo2, fun_ptr::FunctionPtr)
    pSparseMemoryRequirementCount = Ref{UInt32}()
    vkGetImageSparseMemoryRequirements2(device, info, pSparseMemoryRequirementCount, C_NULL, fun_ptr)
    pSparseMemoryRequirements = Vector{VkSparseImageMemoryRequirements2}(undef, pSparseMemoryRequirementCount[])
    vkGetImageSparseMemoryRequirements2(device, info, pSparseMemoryRequirementCount, pSparseMemoryRequirements, fun_ptr)
    from_vk.(SparseImageMemoryRequirements2, pSparseMemoryRequirements)
end

function get_image_memory_requirements_2(device::Device, info::ImageMemoryRequirementsInfo2, fun_ptr::FunctionPtr)
    pMemoryRequirements = Ref{VkMemoryRequirements2}()
    vkGetImageMemoryRequirements2(device, info, pMemoryRequirements, fun_ptr)
    from_vk(MemoryRequirements2, pMemoryRequirements[])
end

function get_buffer_memory_requirements_2(device::Device, info::BufferMemoryRequirementsInfo2, fun_ptr::FunctionPtr)
    pMemoryRequirements = Ref{VkMemoryRequirements2}()
    vkGetBufferMemoryRequirements2(device, info, pMemoryRequirements, fun_ptr)
    from_vk(MemoryRequirements2, pMemoryRequirements[])
end

function get_display_plane_capabilities_2_khr(physical_device::PhysicalDevice, display_plane_info::DisplayPlaneInfo2KHR, fun_ptr::FunctionPtr)
    pCapabilities = Ref{VkDisplayPlaneCapabilities2KHR}()
    @check vkGetDisplayPlaneCapabilities2KHR(physical_device, display_plane_info, pCapabilities, fun_ptr)
    from_vk(DisplayPlaneCapabilities2KHR, pCapabilities[])
end

function get_display_mode_properties_2_khr(physical_device::PhysicalDevice, display::DisplayKHR, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkGetDisplayModeProperties2KHR(physical_device, display, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkDisplayModeProperties2KHR}(undef, pPropertyCount[])
    @check vkGetDisplayModeProperties2KHR(physical_device, display, pPropertyCount, pProperties, fun_ptr)
    from_vk.(DisplayModeProperties2KHR, pProperties)
end

function get_physical_device_display_plane_properties_2_khr(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceDisplayPlaneProperties2KHR(physical_device, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkDisplayPlaneProperties2KHR}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceDisplayPlaneProperties2KHR(physical_device, pPropertyCount, pProperties, fun_ptr)
    from_vk.(DisplayPlaneProperties2KHR, pProperties)
end

function get_physical_device_display_properties_2_khr(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceDisplayProperties2KHR(physical_device, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkDisplayProperties2KHR}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceDisplayProperties2KHR(physical_device, pPropertyCount, pProperties, fun_ptr)
    from_vk.(DisplayProperties2KHR, pProperties)
end

function get_physical_device_surface_formats_2_khr(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR, fun_ptr::FunctionPtr)
    pSurfaceFormatCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSurfaceFormats2KHR(physical_device, surface_info, pSurfaceFormatCount, C_NULL, fun_ptr)
    pSurfaceFormats = Vector{VkSurfaceFormat2KHR}(undef, pSurfaceFormatCount[])
    @check vkGetPhysicalDeviceSurfaceFormats2KHR(physical_device, surface_info, pSurfaceFormatCount, pSurfaceFormats, fun_ptr)
    from_vk.(SurfaceFormat2KHR, pSurfaceFormats)
end

function get_physical_device_surface_capabilities_2_khr(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR, fun_ptr::FunctionPtr)
    pSurfaceCapabilities = Ref{VkSurfaceCapabilities2KHR}()
    @check vkGetPhysicalDeviceSurfaceCapabilities2KHR(physical_device, surface_info, pSurfaceCapabilities, fun_ptr)
    from_vk(SurfaceCapabilities2KHR, pSurfaceCapabilities[])
end

function get_physical_device_multisample_properties_ext(physical_device::PhysicalDevice, samples::VkSampleCountFlagBits, fun_ptr::FunctionPtr)
    pMultisampleProperties = Ref{VkMultisamplePropertiesEXT}()
    vkGetPhysicalDeviceMultisamplePropertiesEXT(physical_device, samples, pMultisampleProperties, fun_ptr)
    from_vk(MultisamplePropertiesEXT, pMultisampleProperties[])
end

cmd_set_sample_locations_ext(command_buffer::CommandBuffer, sample_locations_info::SampleLocationsInfoEXT, fun_ptr::FunctionPtr) = vkCmdSetSampleLocationsEXT(command_buffer, sample_locations_info, fun_ptr)

cmd_set_discard_rectangle_ext(command_buffer::CommandBuffer, discard_rectangles::AbstractArray{<:Rect2D}, fun_ptr::FunctionPtr) = vkCmdSetDiscardRectangleEXT(command_buffer, 0, pointer_length(discard_rectangles), discard_rectangles, fun_ptr)

cmd_set_viewport_w_scaling_nv(command_buffer::CommandBuffer, viewport_w_scalings::AbstractArray{<:ViewportWScalingNV}, fun_ptr::FunctionPtr) = vkCmdSetViewportWScalingNV(command_buffer, 0, pointer_length(viewport_w_scalings), viewport_w_scalings, fun_ptr)

function create_metal_surface_ext(instance::Instance, create_info::MetalSurfaceCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateMetalSurfaceEXT(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

function create_mac_os_surface_mvk(instance::Instance, create_info::MacOSSurfaceCreateInfoMVK, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateMacOSSurfaceMVK(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

function create_ios_surface_mvk(instance::Instance, create_info::IOSSurfaceCreateInfoMVK, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateIOSSurfaceMVK(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

function get_past_presentation_timing_google(device::Device, swapchain::SwapchainKHR, fun_ptr::FunctionPtr)
    pPresentationTimingCount = Ref{UInt32}()
    @check vkGetPastPresentationTimingGOOGLE(device, swapchain, pPresentationTimingCount, C_NULL, fun_ptr)
    pPresentationTimings = Vector{VkPastPresentationTimingGOOGLE}(undef, pPresentationTimingCount[])
    @check vkGetPastPresentationTimingGOOGLE(device, swapchain, pPresentationTimingCount, pPresentationTimings, fun_ptr)
    from_vk.(PastPresentationTimingGOOGLE, pPresentationTimings)
end

function get_refresh_cycle_duration_google(device::Device, swapchain::SwapchainKHR, fun_ptr::FunctionPtr)
    pDisplayTimingProperties = Ref{VkRefreshCycleDurationGOOGLE}()
    @check vkGetRefreshCycleDurationGOOGLE(device, swapchain, pDisplayTimingProperties, fun_ptr)
    from_vk(RefreshCycleDurationGOOGLE, pDisplayTimingProperties[])
end

get_swapchain_status_khr(device::Device, swapchain::SwapchainKHR, fun_ptr::FunctionPtr) = @check(vkGetSwapchainStatusKHR(device, swapchain, fun_ptr))

set_hdr_metadata_ext(device::Device, swapchains::AbstractArray{<:SwapchainKHR}, metadata::AbstractArray{<:HdrMetadataEXT}, fun_ptr::FunctionPtr) = vkSetHdrMetadataEXT(device, pointer_length(swapchains), swapchains, metadata, fun_ptr)

cmd_push_descriptor_set_with_template_khr(command_buffer::CommandBuffer, descriptor_update_template::DescriptorUpdateTemplate, layout::PipelineLayout, set::Integer, data::Ptr{Cvoid}, fun_ptr::FunctionPtr) = vkCmdPushDescriptorSetWithTemplateKHR(command_buffer, descriptor_update_template, layout, set, Ref(data), fun_ptr)

update_descriptor_set_with_template(device::Device, descriptor_set::DescriptorSet, descriptor_update_template::DescriptorUpdateTemplate, data::Ptr{Cvoid}, fun_ptr::FunctionPtr) = vkUpdateDescriptorSetWithTemplate(device, descriptor_set, descriptor_update_template, Ref(data), fun_ptr)

destroy_descriptor_update_template(device::Device, descriptor_update_template::DescriptorUpdateTemplate, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyDescriptorUpdateTemplate(device, descriptor_update_template, allocator, fun_ptr)

function create_descriptor_update_template(device::Device, create_info::DescriptorUpdateTemplateCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pDescriptorUpdateTemplate = Ref{VkDescriptorUpdateTemplate}()
    @check vkCreateDescriptorUpdateTemplate(device, create_info, allocator, pDescriptorUpdateTemplate, fun_ptr_create)
    DescriptorUpdateTemplate(pDescriptorUpdateTemplate[], (x->destroy_descriptor_update_template(device, x, fun_ptr_destroy; allocator)), device)
end

function get_physical_device_present_rectangles_khr(physical_device::PhysicalDevice, surface::SurfaceKHR, fun_ptr::FunctionPtr)
    pRectCount = Ref{UInt32}()
    @check vkGetPhysicalDevicePresentRectanglesKHR(physical_device, surface, pRectCount, C_NULL, fun_ptr)
    pRects = Vector{VkRect2D}(undef, pRectCount[])
    @check vkGetPhysicalDevicePresentRectanglesKHR(physical_device, surface, pRectCount, pRects, fun_ptr)
    from_vk.(Rect2D, pRects)
end

cmd_dispatch_base(command_buffer::CommandBuffer, base_group_x::Integer, base_group_y::Integer, base_group_z::Integer, group_count_x::Integer, group_count_y::Integer, group_count_z::Integer, fun_ptr::FunctionPtr) = vkCmdDispatchBase(command_buffer, base_group_x, base_group_y, base_group_z, group_count_x, group_count_y, group_count_z, fun_ptr)

function acquire_next_image_2_khr(device::Device, acquire_info::AcquireNextImageInfoKHR, fun_ptr::FunctionPtr)
    pImageIndex = Ref{UInt32}()
    @check vkAcquireNextImage2KHR(device, acquire_info, pImageIndex, fun_ptr)
    pImageIndex[]
end

function get_device_group_surface_present_modes_khr(device::Device, surface::SurfaceKHR, modes::Integer, fun_ptr::FunctionPtr)
    pModes = Ref{VkDeviceGroupPresentModeFlagsKHR}()
    @check vkGetDeviceGroupSurfacePresentModesKHR(device, surface, pModes, fun_ptr)
    pModes[]
end

function get_device_group_present_capabilities_khr(device::Device, fun_ptr::FunctionPtr)
    pDeviceGroupPresentCapabilities = Ref{VkDeviceGroupPresentCapabilitiesKHR}()
    @check vkGetDeviceGroupPresentCapabilitiesKHR(device, pDeviceGroupPresentCapabilities, fun_ptr)
    from_vk(DeviceGroupPresentCapabilitiesKHR, pDeviceGroupPresentCapabilities[])
end

cmd_set_device_mask(command_buffer::CommandBuffer, device_mask::Integer, fun_ptr::FunctionPtr) = vkCmdSetDeviceMask(command_buffer, device_mask, fun_ptr)

bind_image_memory_2(device::Device, bind_infos::AbstractArray{<:BindImageMemoryInfo}, fun_ptr::FunctionPtr) = @check(vkBindImageMemory2(device, pointer_length(bind_infos), bind_infos, fun_ptr))

bind_buffer_memory_2(device::Device, bind_infos::AbstractArray{<:BindBufferMemoryInfo}, fun_ptr::FunctionPtr) = @check(vkBindBufferMemory2(device, pointer_length(bind_infos), bind_infos, fun_ptr))

function get_device_group_peer_memory_features(device::Device, heap_index::Integer, local_device_index::Integer, remote_device_index::Integer, fun_ptr::FunctionPtr)
    pPeerMemoryFeatures = Ref{VkPeerMemoryFeatureFlags}()
    vkGetDeviceGroupPeerMemoryFeatures(device, heap_index, local_device_index, remote_device_index, pPeerMemoryFeatures, fun_ptr)
    pPeerMemoryFeatures[]
end

function enumerate_physical_device_groups(instance::Instance, fun_ptr::FunctionPtr)
    pPhysicalDeviceGroupCount = Ref{UInt32}()
    @check vkEnumeratePhysicalDeviceGroups(instance, pPhysicalDeviceGroupCount, C_NULL, fun_ptr)
    pPhysicalDeviceGroupProperties = Vector{VkPhysicalDeviceGroupProperties}(undef, pPhysicalDeviceGroupCount[])
    @check vkEnumeratePhysicalDeviceGroups(instance, pPhysicalDeviceGroupCount, pPhysicalDeviceGroupProperties, fun_ptr)
    from_vk.(PhysicalDeviceGroupProperties, pPhysicalDeviceGroupProperties)
end

function get_physical_device_surface_capabilities_2_ext(physical_device::PhysicalDevice, surface::SurfaceKHR, fun_ptr::FunctionPtr)
    pSurfaceCapabilities = Ref{VkSurfaceCapabilities2EXT}()
    @check vkGetPhysicalDeviceSurfaceCapabilities2EXT(physical_device, surface, pSurfaceCapabilities, fun_ptr)
    from_vk(SurfaceCapabilities2EXT, pSurfaceCapabilities[])
end

function get_swapchain_counter_ext(device::Device, swapchain::SwapchainKHR, counter::VkSurfaceCounterFlagBitsEXT, fun_ptr::FunctionPtr)
    pCounterValue = Ref{UInt64}()
    @check vkGetSwapchainCounterEXT(device, swapchain, counter, pCounterValue, fun_ptr)
    pCounterValue[]
end

function register_display_event_ext(device::Device, display::DisplayKHR, display_event_info::DisplayEventInfoEXT, fun_ptr::FunctionPtr; allocator = C_NULL)
    pFence = Ref{VkFence}()
    @check vkRegisterDisplayEventEXT(device, display, display_event_info, allocator, pFence, fun_ptr)
    Fence(pFence[], (x->destroy_fence(device, x, fun_ptr_destroy; allocator)), device)
end

function register_device_event_ext(device::Device, device_event_info::DeviceEventInfoEXT, fun_ptr::FunctionPtr; allocator = C_NULL)
    pFence = Ref{VkFence}()
    @check vkRegisterDeviceEventEXT(device, device_event_info, allocator, pFence, fun_ptr)
    Fence(pFence[], (x->destroy_fence(device, x, fun_ptr_destroy; allocator)), device)
end

display_power_control_ext(device::Device, display::DisplayKHR, display_power_info::DisplayPowerInfoEXT, fun_ptr::FunctionPtr) = @check(vkDisplayPowerControlEXT(device, display, display_power_info, fun_ptr))

function get_rand_r_output_display_ext(physical_device::PhysicalDevice, dpy::vk.Display, rr_output::vk.RROutput, fun_ptr::FunctionPtr)
    pDisplay = Ref{VkDisplayKHR}()
    @check vkGetRandROutputDisplayEXT(physical_device, Ref(dpy), rr_output, pDisplay, fun_ptr)
    DisplayKHR(pDisplay[], identity, physical_device)
end

acquire_xlib_display_ext(physical_device::PhysicalDevice, dpy::vk.Display, display::DisplayKHR, fun_ptr::FunctionPtr) = @check(vkAcquireXlibDisplayEXT(physical_device, to_vk(Ptr{Display}, dpy), display, fun_ptr))

release_display_ext(physical_device::PhysicalDevice, display::DisplayKHR, fun_ptr::FunctionPtr) = @check(vkReleaseDisplayEXT(physical_device, display, fun_ptr))

import_fence_fd_khr(device::Device, import_fence_fd_info::ImportFenceFdInfoKHR, fun_ptr::FunctionPtr) = @check(vkImportFenceFdKHR(device, import_fence_fd_info, fun_ptr))

function get_fence_fd_khr(device::Device, get_fd_info::FenceGetFdInfoKHR, fun_ptr::FunctionPtr)
    pFd = Ref{Int}()
    @check vkGetFenceFdKHR(device, get_fd_info, pFd, fun_ptr)
    pFd[]
end

import_fence_win_32_handle_khr(device::Device, import_fence_win_32_handle_info::ImportFenceWin32HandleInfoKHR, fun_ptr::FunctionPtr) = @check(vkImportFenceWin32HandleKHR(device, import_fence_win_32_handle_info, fun_ptr))

get_fence_win_32_handle_khr(device::Device, get_win_32_handle_info::FenceGetWin32HandleInfoKHR, handle::vk.HANDLE, fun_ptr::FunctionPtr) = @check(vkGetFenceWin32HandleKHR(device, get_win_32_handle_info, to_vk(Ptr{HANDLE}, handle), fun_ptr))

function get_physical_device_external_fence_properties(physical_device::PhysicalDevice, external_fence_info::PhysicalDeviceExternalFenceInfo, fun_ptr::FunctionPtr)
    pExternalFenceProperties = Ref{VkExternalFenceProperties}()
    vkGetPhysicalDeviceExternalFenceProperties(physical_device, external_fence_info, pExternalFenceProperties, fun_ptr)
    from_vk(ExternalFenceProperties, pExternalFenceProperties[])
end

import_semaphore_fd_khr(device::Device, import_semaphore_fd_info::ImportSemaphoreFdInfoKHR, fun_ptr::FunctionPtr) = @check(vkImportSemaphoreFdKHR(device, import_semaphore_fd_info, fun_ptr))

function get_semaphore_fd_khr(device::Device, get_fd_info::SemaphoreGetFdInfoKHR, fun_ptr::FunctionPtr)
    pFd = Ref{Int}()
    @check vkGetSemaphoreFdKHR(device, get_fd_info, pFd, fun_ptr)
    pFd[]
end

import_semaphore_win_32_handle_khr(device::Device, import_semaphore_win_32_handle_info::ImportSemaphoreWin32HandleInfoKHR, fun_ptr::FunctionPtr) = @check(vkImportSemaphoreWin32HandleKHR(device, import_semaphore_win_32_handle_info, fun_ptr))

get_semaphore_win_32_handle_khr(device::Device, get_win_32_handle_info::SemaphoreGetWin32HandleInfoKHR, handle::vk.HANDLE, fun_ptr::FunctionPtr) = @check(vkGetSemaphoreWin32HandleKHR(device, get_win_32_handle_info, to_vk(Ptr{HANDLE}, handle), fun_ptr))

function get_physical_device_external_semaphore_properties(physical_device::PhysicalDevice, external_semaphore_info::PhysicalDeviceExternalSemaphoreInfo, fun_ptr::FunctionPtr)
    pExternalSemaphoreProperties = Ref{VkExternalSemaphoreProperties}()
    vkGetPhysicalDeviceExternalSemaphoreProperties(physical_device, external_semaphore_info, pExternalSemaphoreProperties, fun_ptr)
    from_vk(ExternalSemaphoreProperties, pExternalSemaphoreProperties[])
end

function get_memory_fd_properties_khr(device::Device, handle_type::VkExternalMemoryHandleTypeFlagBits, fd::Integer, fun_ptr::FunctionPtr)
    pMemoryFdProperties = Ref{VkMemoryFdPropertiesKHR}()
    @check vkGetMemoryFdPropertiesKHR(device, handle_type, fd, pMemoryFdProperties, fun_ptr)
    from_vk(MemoryFdPropertiesKHR, pMemoryFdProperties[])
end

function get_memory_fd_khr(device::Device, get_fd_info::MemoryGetFdInfoKHR, fun_ptr::FunctionPtr)
    pFd = Ref{Int}()
    @check vkGetMemoryFdKHR(device, get_fd_info, pFd, fun_ptr)
    pFd[]
end

function get_memory_win_32_handle_properties_khr(device::Device, handle_type::VkExternalMemoryHandleTypeFlagBits, handle::vk.HANDLE, fun_ptr::FunctionPtr)
    pMemoryWin32HandleProperties = Ref{VkMemoryWin32HandlePropertiesKHR}()
    @check vkGetMemoryWin32HandlePropertiesKHR(device, handle_type, handle, pMemoryWin32HandleProperties, fun_ptr)
    from_vk(MemoryWin32HandlePropertiesKHR, pMemoryWin32HandleProperties[])
end

get_memory_win_32_handle_khr(device::Device, get_win_32_handle_info::MemoryGetWin32HandleInfoKHR, handle::vk.HANDLE, fun_ptr::FunctionPtr) = @check(vkGetMemoryWin32HandleKHR(device, get_win_32_handle_info, to_vk(Ptr{HANDLE}, handle), fun_ptr))

function get_physical_device_external_buffer_properties(physical_device::PhysicalDevice, external_buffer_info::PhysicalDeviceExternalBufferInfo, fun_ptr::FunctionPtr)
    pExternalBufferProperties = Ref{VkExternalBufferProperties}()
    vkGetPhysicalDeviceExternalBufferProperties(physical_device, external_buffer_info, pExternalBufferProperties, fun_ptr)
    from_vk(ExternalBufferProperties, pExternalBufferProperties[])
end

trim_command_pool(device::Device, command_pool::CommandPool, fun_ptr::FunctionPtr; flags = 0) = vkTrimCommandPool(device, command_pool, flags, fun_ptr)

cmd_push_descriptor_set_khr(command_buffer::CommandBuffer, pipeline_bind_point::VkPipelineBindPoint, layout::PipelineLayout, set::Integer, descriptor_writes::AbstractArray{<:WriteDescriptorSet}, fun_ptr::FunctionPtr) = vkCmdPushDescriptorSetKHR(command_buffer, pipeline_bind_point, layout, set, pointer_length(descriptor_writes), descriptor_writes, fun_ptr)

function get_physical_device_sparse_image_format_properties_2(physical_device::PhysicalDevice, format_info::PhysicalDeviceSparseImageFormatInfo2, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    vkGetPhysicalDeviceSparseImageFormatProperties2(physical_device, format_info, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkSparseImageFormatProperties2}(undef, pPropertyCount[])
    vkGetPhysicalDeviceSparseImageFormatProperties2(physical_device, format_info, pPropertyCount, pProperties, fun_ptr)
    from_vk.(SparseImageFormatProperties2, pProperties)
end

function get_physical_device_memory_properties_2(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pMemoryProperties = Ref{VkPhysicalDeviceMemoryProperties2}()
    vkGetPhysicalDeviceMemoryProperties2(physical_device, pMemoryProperties, fun_ptr)
    from_vk(PhysicalDeviceMemoryProperties2, pMemoryProperties[])
end

function get_physical_device_queue_family_properties_2(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pQueueFamilyPropertyCount = Ref{UInt32}()
    vkGetPhysicalDeviceQueueFamilyProperties2(physical_device, pQueueFamilyPropertyCount, C_NULL, fun_ptr)
    pQueueFamilyProperties = Vector{VkQueueFamilyProperties2}(undef, pQueueFamilyPropertyCount[])
    vkGetPhysicalDeviceQueueFamilyProperties2(physical_device, pQueueFamilyPropertyCount, pQueueFamilyProperties, fun_ptr)
    from_vk.(QueueFamilyProperties2, pQueueFamilyProperties)
end

function get_physical_device_image_format_properties_2(physical_device::PhysicalDevice, image_format_info::PhysicalDeviceImageFormatInfo2, fun_ptr::FunctionPtr)
    pImageFormatProperties = Ref{VkImageFormatProperties2}()
    @check vkGetPhysicalDeviceImageFormatProperties2(physical_device, image_format_info, pImageFormatProperties, fun_ptr)
    from_vk(ImageFormatProperties2, pImageFormatProperties[])
end

function get_physical_device_format_properties_2(physical_device::PhysicalDevice, format::VkFormat, fun_ptr::FunctionPtr)
    pFormatProperties = Ref{VkFormatProperties2}()
    vkGetPhysicalDeviceFormatProperties2(physical_device, format, pFormatProperties, fun_ptr)
    from_vk(FormatProperties2, pFormatProperties[])
end

function get_physical_device_properties_2(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pProperties = Ref{VkPhysicalDeviceProperties2}()
    vkGetPhysicalDeviceProperties2(physical_device, pProperties, fun_ptr)
    from_vk(PhysicalDeviceProperties2, pProperties[])
end

function get_physical_device_features_2(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pFeatures = Ref{VkPhysicalDeviceFeatures2}()
    vkGetPhysicalDeviceFeatures2(physical_device, pFeatures, fun_ptr)
    from_vk(PhysicalDeviceFeatures2, pFeatures[])
end

destroy_indirect_commands_layout_nv(device::Device, indirect_commands_layout::IndirectCommandsLayoutNV, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyIndirectCommandsLayoutNV(device, indirect_commands_layout, allocator, fun_ptr)

function create_indirect_commands_layout_nv(device::Device, create_info::IndirectCommandsLayoutCreateInfoNV, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pIndirectCommandsLayout = Ref{VkIndirectCommandsLayoutNV}()
    @check vkCreateIndirectCommandsLayoutNV(device, create_info, allocator, pIndirectCommandsLayout, fun_ptr_create)
    IndirectCommandsLayoutNV(pIndirectCommandsLayout[], (x->destroy_indirect_commands_layout_nv(device, x, fun_ptr_destroy; allocator)), device)
end

function get_generated_commands_memory_requirements_nv(device::Device, info::GeneratedCommandsMemoryRequirementsInfoNV, fun_ptr::FunctionPtr)
    pMemoryRequirements = Ref{VkMemoryRequirements2}()
    vkGetGeneratedCommandsMemoryRequirementsNV(device, info, pMemoryRequirements, fun_ptr)
    from_vk(MemoryRequirements2, pMemoryRequirements[])
end

cmd_bind_pipeline_shader_group_nv(command_buffer::CommandBuffer, pipeline_bind_point::VkPipelineBindPoint, pipeline::Pipeline, group_index::Integer, fun_ptr::FunctionPtr) = vkCmdBindPipelineShaderGroupNV(command_buffer, pipeline_bind_point, pipeline, group_index, fun_ptr)

cmd_preprocess_generated_commands_nv(command_buffer::CommandBuffer, generated_commands_info::GeneratedCommandsInfoNV, fun_ptr::FunctionPtr) = vkCmdPreprocessGeneratedCommandsNV(command_buffer, generated_commands_info, fun_ptr)

cmd_execute_generated_commands_nv(command_buffer::CommandBuffer, is_preprocessed::Bool, generated_commands_info::GeneratedCommandsInfoNV, fun_ptr::FunctionPtr) = vkCmdExecuteGeneratedCommandsNV(command_buffer, is_preprocessed, generated_commands_info, fun_ptr)

get_memory_win_32_handle_nv(device::Device, memory::DeviceMemory, handle_type::Integer, handle::vk.HANDLE, fun_ptr::FunctionPtr) = @check(vkGetMemoryWin32HandleNV(device, memory, handle_type, to_vk(Ptr{HANDLE}, handle), fun_ptr))

function get_physical_device_external_image_format_properties_nv(physical_device::PhysicalDevice, format::VkFormat, type::VkImageType, tiling::VkImageTiling, usage::Integer, fun_ptr::FunctionPtr; flags = 0, external_handle_type = 0)
    pExternalImageFormatProperties = Ref{VkExternalImageFormatPropertiesNV}()
    @check vkGetPhysicalDeviceExternalImageFormatPropertiesNV(physical_device, format, type, tiling, usage, flags, external_handle_type, pExternalImageFormatProperties, fun_ptr)
    from_vk(ExternalImageFormatPropertiesNV, pExternalImageFormatProperties[])
end

cmd_debug_marker_insert_ext(command_buffer::CommandBuffer, marker_info::DebugMarkerMarkerInfoEXT, fun_ptr::FunctionPtr) = vkCmdDebugMarkerInsertEXT(command_buffer, marker_info, fun_ptr)

cmd_debug_marker_end_ext(command_buffer::CommandBuffer, fun_ptr::FunctionPtr) = vkCmdDebugMarkerEndEXT(command_buffer, fun_ptr)

cmd_debug_marker_begin_ext(command_buffer::CommandBuffer, marker_info::DebugMarkerMarkerInfoEXT, fun_ptr::FunctionPtr) = vkCmdDebugMarkerBeginEXT(command_buffer, marker_info, fun_ptr)

debug_marker_set_object_tag_ext(device::Device, tag_info::DebugMarkerObjectTagInfoEXT, fun_ptr::FunctionPtr) = @check(vkDebugMarkerSetObjectTagEXT(device, tag_info, fun_ptr))

debug_marker_set_object_name_ext(device::Device, name_info::DebugMarkerObjectNameInfoEXT, fun_ptr::FunctionPtr) = @check(vkDebugMarkerSetObjectNameEXT(device, name_info, fun_ptr))

debug_report_message_ext(instance::Instance, flags::Integer, object_type::VkDebugReportObjectTypeEXT, object::Integer, location::Integer, message_code::Integer, layer_prefix::AbstractString, message::AbstractString, fun_ptr::FunctionPtr) = vkDebugReportMessageEXT(instance, flags, object_type, object, location, message_code, layer_prefix, message, fun_ptr)

destroy_debug_report_callback_ext(instance::Instance, callback::DebugReportCallbackEXT, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyDebugReportCallbackEXT(instance, callback, allocator, fun_ptr)

function create_debug_report_callback_ext(instance::Instance, create_info::DebugReportCallbackCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pCallback = Ref{VkDebugReportCallbackEXT}()
    @check vkCreateDebugReportCallbackEXT(instance, create_info, allocator, pCallback, fun_ptr_create)
    DebugReportCallbackEXT(pCallback[], (x->destroy_debug_report_callback_ext(instance, x, fun_ptr_destroy; allocator)), instance)
end

function create_stream_descriptor_surface_ggp(instance::Instance, create_info::StreamDescriptorSurfaceCreateInfoGGP, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateStreamDescriptorSurfaceGGP(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

function create_image_pipe_surface_fuchsia(instance::Instance, create_info::ImagePipeSurfaceCreateInfoFUCHSIA, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateImagePipeSurfaceFUCHSIA(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

get_physical_device_direct_fb_presentation_support_ext(physical_device::PhysicalDevice, queue_family_index::Integer, dfb::vk.IDirectFB, fun_ptr::FunctionPtr) = from_vk(Bool, vkGetPhysicalDeviceDirectFBPresentationSupportEXT(physical_device, queue_family_index, to_vk(Ptr{IDirectFB}, dfb), fun_ptr))

function create_direct_fb_surface_ext(instance::Instance, create_info::DirectFBSurfaceCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateDirectFBSurfaceEXT(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

get_physical_device_xcb_presentation_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, connection::vk.xcb_connection_t, visual_id::vk.xcb_visualid_t, fun_ptr::FunctionPtr) = from_vk(Bool, vkGetPhysicalDeviceXcbPresentationSupportKHR(physical_device, queue_family_index, Ref(connection), visual_id, fun_ptr))

function create_xcb_surface_khr(instance::Instance, create_info::XcbSurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateXcbSurfaceKHR(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

get_physical_device_xlib_presentation_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, dpy::vk.Display, visual_id::vk.VisualID, fun_ptr::FunctionPtr) = from_vk(Bool, vkGetPhysicalDeviceXlibPresentationSupportKHR(physical_device, queue_family_index, Ref(dpy), visual_id, fun_ptr))

function create_xlib_surface_khr(instance::Instance, create_info::XlibSurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateXlibSurfaceKHR(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

get_physical_device_win_32_presentation_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, fun_ptr::FunctionPtr) = from_vk(Bool, vkGetPhysicalDeviceWin32PresentationSupportKHR(physical_device, queue_family_index, fun_ptr))

function create_win_32_surface_khr(instance::Instance, create_info::Win32SurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateWin32SurfaceKHR(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

get_physical_device_wayland_presentation_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, display::vk.wl_display, fun_ptr::FunctionPtr) = from_vk(Bool, vkGetPhysicalDeviceWaylandPresentationSupportKHR(physical_device, queue_family_index, to_vk(Ptr{wl_display}, display), fun_ptr))

function create_wayland_surface_khr(instance::Instance, create_info::WaylandSurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateWaylandSurfaceKHR(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

function create_vi_surface_nn(instance::Instance, create_info::ViSurfaceCreateInfoNN, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateViSurfaceNN(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

queue_present_khr(queue::Queue, present_info::PresentInfoKHR, fun_ptr::FunctionPtr) = @check(vkQueuePresentKHR(queue, present_info, fun_ptr))

function acquire_next_image_khr(device::Device, swapchain::SwapchainKHR, timeout::Integer, fun_ptr::FunctionPtr; semaphore = C_NULL, fence = C_NULL)
    pImageIndex = Ref{UInt32}()
    @check vkAcquireNextImageKHR(device, swapchain, timeout, semaphore, fence, pImageIndex, fun_ptr)
    pImageIndex[]
end

function get_swapchain_images_khr(device::Device, swapchain::SwapchainKHR, fun_ptr::FunctionPtr)
    pSwapchainImageCount = Ref{UInt32}()
    @check vkGetSwapchainImagesKHR(device, swapchain, pSwapchainImageCount, C_NULL, fun_ptr)
    pSwapchainImages = Vector{VkImage}(undef, pSwapchainImageCount[])
    @check vkGetSwapchainImagesKHR(device, swapchain, pSwapchainImageCount, pSwapchainImages, fun_ptr)
    Image.(pSwapchainImages, (x->destroy_image(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_swapchain_khr(device::Device, swapchain::SwapchainKHR, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroySwapchainKHR(device, swapchain, allocator, fun_ptr)

function create_swapchain_khr(device::Device, create_info::SwapchainCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSwapchain = Ref{VkSwapchainKHR}()
    @check vkCreateSwapchainKHR(device, create_info, allocator, pSwapchain, fun_ptr_create)
    parent = getproperty(create_info, :surface)
    SwapchainKHR(pSwapchain[], (x->destroy_swapchain_khr(device, x, fun_ptr_destroy; allocator)), getproperty(create_info, :surface))
end

function get_physical_device_surface_present_modes_khr(physical_device::PhysicalDevice, surface::SurfaceKHR, fun_ptr::FunctionPtr)
    pPresentModeCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, C_NULL, fun_ptr)
    pPresentModes = Vector{VkPresentModeKHR}(undef, pPresentModeCount[])
    @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, pPresentModes, fun_ptr)
    pPresentModes
end

function get_physical_device_surface_formats_khr(physical_device::PhysicalDevice, surface::SurfaceKHR, fun_ptr::FunctionPtr)
    pSurfaceFormatCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, pSurfaceFormatCount, C_NULL, fun_ptr)
    pSurfaceFormats = Vector{VkSurfaceFormatKHR}(undef, pSurfaceFormatCount[])
    @check vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, pSurfaceFormatCount, pSurfaceFormats, fun_ptr)
    from_vk.(SurfaceFormatKHR, pSurfaceFormats)
end

function get_physical_device_surface_capabilities_khr(physical_device::PhysicalDevice, surface::SurfaceKHR, fun_ptr::FunctionPtr)
    pSurfaceCapabilities = Ref{VkSurfaceCapabilitiesKHR}()
    @check vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physical_device, surface, pSurfaceCapabilities, fun_ptr)
    from_vk(SurfaceCapabilitiesKHR, pSurfaceCapabilities[])
end

function get_physical_device_surface_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, surface::SurfaceKHR, fun_ptr::FunctionPtr)
    pSupported = Ref{VkBool32}()
    @check vkGetPhysicalDeviceSurfaceSupportKHR(physical_device, queue_family_index, surface, pSupported, fun_ptr)
    from_vk(Bool, pSupported[])
end

destroy_surface_khr(instance::Instance, surface::SurfaceKHR, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroySurfaceKHR(instance, surface, allocator, fun_ptr)

function create_shared_swapchains_khr(device::Device, create_infos::AbstractArray{<:SwapchainCreateInfoKHR}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSwapchains = Vector{VkSwapchainKHR}(undef, pointer_length(create_infos))
    @check vkCreateSharedSwapchainsKHR(device, pointer_length(create_infos), create_infos, allocator, pSwapchains, fun_ptr_create)
    parent = getproperty(create_infos, :surface)
    SwapchainKHR.(pSwapchains, (x->destroy_swapchain_khr(device, x, fun_ptr_destroy; allocator)), getproperty(create_infos, :surface))
end

function create_display_plane_surface_khr(instance::Instance, create_info::DisplaySurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateDisplayPlaneSurfaceKHR(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

function get_display_plane_capabilities_khr(physical_device::PhysicalDevice, mode::DisplayModeKHR, plane_index::Integer, fun_ptr::FunctionPtr)
    pCapabilities = Ref{VkDisplayPlaneCapabilitiesKHR}()
    @check vkGetDisplayPlaneCapabilitiesKHR(physical_device, mode, plane_index, pCapabilities, fun_ptr)
    from_vk(DisplayPlaneCapabilitiesKHR, pCapabilities[])
end

function create_display_mode_khr(physical_device::PhysicalDevice, display::DisplayKHR, create_info::DisplayModeCreateInfoKHR, fun_ptr_create::FunctionPtr; allocator = C_NULL)
    pMode = Ref{VkDisplayModeKHR}()
    @check vkCreateDisplayModeKHR(physical_device, display, create_info, allocator, pMode, fun_ptr_create)
    DisplayModeKHR(pMode[], identity, display)
end

function get_display_mode_properties_khr(physical_device::PhysicalDevice, display::DisplayKHR, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkGetDisplayModePropertiesKHR(physical_device, display, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkDisplayModePropertiesKHR}(undef, pPropertyCount[])
    @check vkGetDisplayModePropertiesKHR(physical_device, display, pPropertyCount, pProperties, fun_ptr)
    from_vk.(DisplayModePropertiesKHR, pProperties)
end

function get_display_plane_supported_displays_khr(physical_device::PhysicalDevice, plane_index::Integer, fun_ptr::FunctionPtr)
    pDisplayCount = Ref{UInt32}()
    @check vkGetDisplayPlaneSupportedDisplaysKHR(physical_device, plane_index, pDisplayCount, C_NULL, fun_ptr)
    pDisplays = Vector{VkDisplayKHR}(undef, pDisplayCount[])
    @check vkGetDisplayPlaneSupportedDisplaysKHR(physical_device, plane_index, pDisplayCount, pDisplays, fun_ptr)
    DisplayKHR.(pDisplays, identity, physical_device)
end

function get_physical_device_display_plane_properties_khr(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceDisplayPlanePropertiesKHR(physical_device, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkDisplayPlanePropertiesKHR}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceDisplayPlanePropertiesKHR(physical_device, pPropertyCount, pProperties, fun_ptr)
    from_vk.(DisplayPlanePropertiesKHR, pProperties)
end

function get_physical_device_display_properties_khr(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceDisplayPropertiesKHR(physical_device, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkDisplayPropertiesKHR}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceDisplayPropertiesKHR(physical_device, pPropertyCount, pProperties, fun_ptr)
    from_vk.(DisplayPropertiesKHR, pProperties)
end

function create_android_surface_khr(instance::Instance, create_info::AndroidSurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateAndroidSurfaceKHR(instance, create_info, allocator, pSurface, fun_ptr_create)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x, fun_ptr_destroy; allocator)), instance)
end

cmd_execute_commands(command_buffer::CommandBuffer, command_buffers::AbstractArray{<:CommandBuffer}, fun_ptr::FunctionPtr) = vkCmdExecuteCommands(command_buffer, pointer_length(command_buffers), command_buffers, fun_ptr)

cmd_end_render_pass(command_buffer::CommandBuffer, fun_ptr::FunctionPtr) = vkCmdEndRenderPass(command_buffer, fun_ptr)

cmd_next_subpass(command_buffer::CommandBuffer, contents::VkSubpassContents, fun_ptr::FunctionPtr) = vkCmdNextSubpass(command_buffer, contents, fun_ptr)

cmd_begin_render_pass(command_buffer::CommandBuffer, render_pass_begin::RenderPassBeginInfo, contents::VkSubpassContents, fun_ptr::FunctionPtr) = vkCmdBeginRenderPass(command_buffer, render_pass_begin, contents, fun_ptr)

cmd_push_constants(command_buffer::CommandBuffer, layout::PipelineLayout, stage_flags::Integer, offset::Integer, values::Ptr{Cvoid}, fun_ptr::FunctionPtr) = vkCmdPushConstants(command_buffer, layout, stage_flags, offset, pointer_length(values), Ref(values), fun_ptr)

cmd_copy_query_pool_results(command_buffer::CommandBuffer, query_pool::QueryPool, first_query::Integer, query_count::Integer, dst_buffer::Buffer, dst_offset::Integer, stride::Integer, fun_ptr::FunctionPtr; flags = 0) = vkCmdCopyQueryPoolResults(command_buffer, query_pool, first_query, query_count, dst_buffer, dst_offset, stride, flags, fun_ptr)

cmd_write_timestamp(command_buffer::CommandBuffer, pipeline_stage::VkPipelineStageFlagBits, query_pool::QueryPool, query::Integer, fun_ptr::FunctionPtr) = vkCmdWriteTimestamp(command_buffer, pipeline_stage, query_pool, query, fun_ptr)

cmd_reset_query_pool(command_buffer::CommandBuffer, query_pool::QueryPool, first_query::Integer, query_count::Integer, fun_ptr::FunctionPtr) = vkCmdResetQueryPool(command_buffer, query_pool, first_query, query_count, fun_ptr)

cmd_end_conditional_rendering_ext(command_buffer::CommandBuffer, fun_ptr::FunctionPtr) = vkCmdEndConditionalRenderingEXT(command_buffer, fun_ptr)

cmd_begin_conditional_rendering_ext(command_buffer::CommandBuffer, conditional_rendering_begin::ConditionalRenderingBeginInfoEXT, fun_ptr::FunctionPtr) = vkCmdBeginConditionalRenderingEXT(command_buffer, conditional_rendering_begin, fun_ptr)

cmd_end_query(command_buffer::CommandBuffer, query_pool::QueryPool, query::Integer, fun_ptr::FunctionPtr) = vkCmdEndQuery(command_buffer, query_pool, query, fun_ptr)

cmd_begin_query(command_buffer::CommandBuffer, query_pool::QueryPool, query::Integer, fun_ptr::FunctionPtr; flags = 0) = vkCmdBeginQuery(command_buffer, query_pool, query, flags, fun_ptr)

cmd_pipeline_barrier(command_buffer::CommandBuffer, src_stage_mask::Integer, dst_stage_mask::Integer, memory_barriers::AbstractArray{<:MemoryBarrier}, buffer_memory_barriers::AbstractArray{<:BufferMemoryBarrier}, image_memory_barriers::AbstractArray{<:ImageMemoryBarrier}, fun_ptr::FunctionPtr; dependency_flags = 0) = vkCmdPipelineBarrier(command_buffer, src_stage_mask, dst_stage_mask, dependency_flags, pointer_length(memory_barriers), memory_barriers, pointer_length(buffer_memory_barriers), buffer_memory_barriers, pointer_length(image_memory_barriers), image_memory_barriers, fun_ptr)

cmd_wait_events(command_buffer::CommandBuffer, events::AbstractArray{<:Event}, src_stage_mask::Integer, dst_stage_mask::Integer, memory_barriers::AbstractArray{<:MemoryBarrier}, buffer_memory_barriers::AbstractArray{<:BufferMemoryBarrier}, image_memory_barriers::AbstractArray{<:ImageMemoryBarrier}, fun_ptr::FunctionPtr) = vkCmdWaitEvents(command_buffer, pointer_length(events), events, src_stage_mask, dst_stage_mask, pointer_length(memory_barriers), memory_barriers, pointer_length(buffer_memory_barriers), buffer_memory_barriers, pointer_length(image_memory_barriers), image_memory_barriers, fun_ptr)

cmd_reset_event(command_buffer::CommandBuffer, event::Event, stage_mask::Integer, fun_ptr::FunctionPtr) = vkCmdResetEvent(command_buffer, event, stage_mask, fun_ptr)

cmd_set_event(command_buffer::CommandBuffer, event::Event, stage_mask::Integer, fun_ptr::FunctionPtr) = vkCmdSetEvent(command_buffer, event, stage_mask, fun_ptr)

cmd_resolve_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::VkImageLayout, dst_image::Image, dst_image_layout::VkImageLayout, regions::AbstractArray{<:ImageResolve}, fun_ptr::FunctionPtr) = vkCmdResolveImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, pointer_length(regions), regions, fun_ptr)

cmd_clear_attachments(command_buffer::CommandBuffer, attachments::AbstractArray{<:ClearAttachment}, rects::AbstractArray{<:ClearRect}, fun_ptr::FunctionPtr) = vkCmdClearAttachments(command_buffer, pointer_length(attachments), attachments, pointer_length(rects), rects, fun_ptr)

cmd_clear_depth_stencil_image(command_buffer::CommandBuffer, image::Image, image_layout::VkImageLayout, depth_stencil::ClearDepthStencilValue, ranges::AbstractArray{<:ImageSubresourceRange}, fun_ptr::FunctionPtr) = vkCmdClearDepthStencilImage(command_buffer, image, image_layout, depth_stencil, pointer_length(ranges), ranges, fun_ptr)

cmd_clear_color_image(command_buffer::CommandBuffer, image::Image, image_layout::VkImageLayout, color::ClearColorValue, ranges::AbstractArray{<:ImageSubresourceRange}, fun_ptr::FunctionPtr) = vkCmdClearColorImage(command_buffer, image, image_layout, color, pointer_length(ranges), ranges, fun_ptr)

cmd_fill_buffer(command_buffer::CommandBuffer, dst_buffer::Buffer, dst_offset::Integer, size::Integer, data::Integer, fun_ptr::FunctionPtr) = vkCmdFillBuffer(command_buffer, dst_buffer, dst_offset, size, data, fun_ptr)

cmd_update_buffer(command_buffer::CommandBuffer, dst_buffer::Buffer, dst_offset::Integer, data_size::Integer, data::Ptr{Cvoid}, fun_ptr::FunctionPtr) = vkCmdUpdateBuffer(command_buffer, dst_buffer, dst_offset, data_size, Ref(data), fun_ptr)

cmd_copy_image_to_buffer(command_buffer::CommandBuffer, src_image::Image, src_image_layout::VkImageLayout, dst_buffer::Buffer, regions::AbstractArray{<:BufferImageCopy}, fun_ptr::FunctionPtr) = vkCmdCopyImageToBuffer(command_buffer, src_image, src_image_layout, dst_buffer, pointer_length(regions), regions, fun_ptr)

cmd_copy_buffer_to_image(command_buffer::CommandBuffer, src_buffer::Buffer, dst_image::Image, dst_image_layout::VkImageLayout, regions::AbstractArray{<:BufferImageCopy}, fun_ptr::FunctionPtr) = vkCmdCopyBufferToImage(command_buffer, src_buffer, dst_image, dst_image_layout, pointer_length(regions), regions, fun_ptr)

cmd_blit_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::VkImageLayout, dst_image::Image, dst_image_layout::VkImageLayout, regions::AbstractArray{<:ImageBlit}, filter::VkFilter, fun_ptr::FunctionPtr) = vkCmdBlitImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, pointer_length(regions), regions, filter, fun_ptr)

cmd_copy_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::VkImageLayout, dst_image::Image, dst_image_layout::VkImageLayout, regions::AbstractArray{<:ImageCopy}, fun_ptr::FunctionPtr) = vkCmdCopyImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, pointer_length(regions), regions, fun_ptr)

cmd_copy_buffer(command_buffer::CommandBuffer, src_buffer::Buffer, dst_buffer::Buffer, regions::AbstractArray{<:BufferCopy}, fun_ptr::FunctionPtr) = vkCmdCopyBuffer(command_buffer, src_buffer, dst_buffer, pointer_length(regions), regions, fun_ptr)

cmd_dispatch_indirect(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, fun_ptr::FunctionPtr) = vkCmdDispatchIndirect(command_buffer, buffer, offset, fun_ptr)

cmd_dispatch(command_buffer::CommandBuffer, group_count_x::Integer, group_count_y::Integer, group_count_z::Integer, fun_ptr::FunctionPtr) = vkCmdDispatch(command_buffer, group_count_x, group_count_y, group_count_z, fun_ptr)

cmd_draw_indexed_indirect(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, draw_count::Integer, stride::Integer, fun_ptr::FunctionPtr) = vkCmdDrawIndexedIndirect(command_buffer, buffer, offset, draw_count, stride, fun_ptr)

cmd_draw_indirect(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, draw_count::Integer, stride::Integer, fun_ptr::FunctionPtr) = vkCmdDrawIndirect(command_buffer, buffer, offset, draw_count, stride, fun_ptr)

cmd_draw_indexed(command_buffer::CommandBuffer, index_count::Integer, instance_count::Integer, first_index::Integer, vertex_offset::Integer, first_instance::Integer, fun_ptr::FunctionPtr) = vkCmdDrawIndexed(command_buffer, index_count, instance_count, first_index, vertex_offset, first_instance, fun_ptr)

cmd_draw(command_buffer::CommandBuffer, vertex_count::Integer, instance_count::Integer, first_vertex::Integer, first_instance::Integer, fun_ptr::FunctionPtr) = vkCmdDraw(command_buffer, vertex_count, instance_count, first_vertex, first_instance, fun_ptr)

cmd_bind_vertex_buffers(command_buffer::CommandBuffer, buffers::AbstractArray{<:Buffer}, offsets::AbstractArray{<:Integer}, fun_ptr::FunctionPtr) = vkCmdBindVertexBuffers(command_buffer, 0, pointer_length(buffers), buffers, offsets, fun_ptr)

cmd_bind_index_buffer(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, index_type::VkIndexType, fun_ptr::FunctionPtr) = vkCmdBindIndexBuffer(command_buffer, buffer, offset, index_type, fun_ptr)

cmd_bind_descriptor_sets(command_buffer::CommandBuffer, pipeline_bind_point::VkPipelineBindPoint, layout::PipelineLayout, first_set::Integer, descriptor_sets::AbstractArray{<:DescriptorSet}, dynamic_offsets::AbstractArray{<:Integer}, fun_ptr::FunctionPtr) = vkCmdBindDescriptorSets(command_buffer, pipeline_bind_point, layout, first_set, pointer_length(descriptor_sets), descriptor_sets, pointer_length(dynamic_offsets), dynamic_offsets, fun_ptr)

cmd_set_stencil_reference(command_buffer::CommandBuffer, face_mask::Integer, reference::Integer, fun_ptr::FunctionPtr) = vkCmdSetStencilReference(command_buffer, face_mask, reference, fun_ptr)

cmd_set_stencil_write_mask(command_buffer::CommandBuffer, face_mask::Integer, write_mask::Integer, fun_ptr::FunctionPtr) = vkCmdSetStencilWriteMask(command_buffer, face_mask, write_mask, fun_ptr)

cmd_set_stencil_compare_mask(command_buffer::CommandBuffer, face_mask::Integer, compare_mask::Integer, fun_ptr::FunctionPtr) = vkCmdSetStencilCompareMask(command_buffer, face_mask, compare_mask, fun_ptr)

cmd_set_depth_bounds(command_buffer::CommandBuffer, min_depth_bounds::Real, max_depth_bounds::Real, fun_ptr::FunctionPtr) = vkCmdSetDepthBounds(command_buffer, min_depth_bounds, max_depth_bounds, fun_ptr)

cmd_set_blend_constants(command_buffer::CommandBuffer, blend_constants::NTuple{4, Float32}, fun_ptr::FunctionPtr) = vkCmdSetBlendConstants(command_buffer, blend_constants, fun_ptr)

cmd_set_depth_bias(command_buffer::CommandBuffer, depth_bias_constant_factor::Real, depth_bias_clamp::Real, depth_bias_slope_factor::Real, fun_ptr::FunctionPtr) = vkCmdSetDepthBias(command_buffer, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor, fun_ptr)

cmd_set_line_width(command_buffer::CommandBuffer, line_width::Real, fun_ptr::FunctionPtr) = vkCmdSetLineWidth(command_buffer, line_width, fun_ptr)

cmd_set_scissor(command_buffer::CommandBuffer, scissors::AbstractArray{<:Rect2D}, fun_ptr::FunctionPtr) = vkCmdSetScissor(command_buffer, 0, pointer_length(scissors), scissors, fun_ptr)

cmd_set_viewport(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}, fun_ptr::FunctionPtr) = vkCmdSetViewport(command_buffer, 0, pointer_length(viewports), viewports, fun_ptr)

cmd_bind_pipeline(command_buffer::CommandBuffer, pipeline_bind_point::VkPipelineBindPoint, pipeline::Pipeline, fun_ptr::FunctionPtr) = vkCmdBindPipeline(command_buffer, pipeline_bind_point, pipeline, fun_ptr)

reset_command_buffer(command_buffer::CommandBuffer, fun_ptr::FunctionPtr; flags = 0) = @check(vkResetCommandBuffer(command_buffer, flags, fun_ptr))

end_command_buffer(command_buffer::CommandBuffer, fun_ptr::FunctionPtr) = @check(vkEndCommandBuffer(command_buffer, fun_ptr))

begin_command_buffer(command_buffer::CommandBuffer, begin_info::CommandBufferBeginInfo, fun_ptr::FunctionPtr) = @check(vkBeginCommandBuffer(command_buffer, begin_info, fun_ptr))

free_command_buffers(device::Device, command_pool::CommandPool, command_buffers::AbstractArray{<:CommandBuffer}, fun_ptr::FunctionPtr) = vkFreeCommandBuffers(device, command_pool, pointer_length(command_buffers), command_buffers, fun_ptr)

function allocate_command_buffers(device::Device, allocate_info::CommandBufferAllocateInfo, fun_ptr_create::FunctionPtr)
    pCommandBuffers = Vector{VkCommandBuffer}(undef, allocate_info.vks.commandBufferCount)
    @check vkAllocateCommandBuffers(device, allocate_info, pCommandBuffers, fun_ptr_create)
    parent = getproperty(allocate_info, :command_pool)
    CommandBuffer.(pCommandBuffers, identity, getproperty(allocate_info, :command_pool))
end

reset_command_pool(device::Device, command_pool::CommandPool, fun_ptr::FunctionPtr; flags = 0) = @check(vkResetCommandPool(device, command_pool, flags, fun_ptr))

destroy_command_pool(device::Device, command_pool::CommandPool, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyCommandPool(device, command_pool, allocator, fun_ptr)

function create_command_pool(device::Device, create_info::CommandPoolCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pCommandPool = Ref{VkCommandPool}()
    @check vkCreateCommandPool(device, create_info, allocator, pCommandPool, fun_ptr_create)
    CommandPool(pCommandPool[], (x->destroy_command_pool(device, x, fun_ptr_destroy; allocator)), device)
end

function get_render_area_granularity(device::Device, render_pass::RenderPass, fun_ptr::FunctionPtr)
    pGranularity = Ref{VkExtent2D}()
    vkGetRenderAreaGranularity(device, render_pass, pGranularity, fun_ptr)
    from_vk(Extent2D, pGranularity[])
end

destroy_render_pass(device::Device, render_pass::RenderPass, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyRenderPass(device, render_pass, allocator, fun_ptr)

function create_render_pass(device::Device, create_info::RenderPassCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pRenderPass = Ref{VkRenderPass}()
    @check vkCreateRenderPass(device, create_info, allocator, pRenderPass, fun_ptr_create)
    RenderPass(pRenderPass[], (x->destroy_render_pass(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_framebuffer(device::Device, framebuffer::Framebuffer, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyFramebuffer(device, framebuffer, allocator, fun_ptr)

function create_framebuffer(device::Device, create_info::FramebufferCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pFramebuffer = Ref{VkFramebuffer}()
    @check vkCreateFramebuffer(device, create_info, allocator, pFramebuffer, fun_ptr_create)
    Framebuffer(pFramebuffer[], (x->destroy_framebuffer(device, x, fun_ptr_destroy; allocator)), device)
end

update_descriptor_sets(device::Device, descriptor_writes::AbstractArray{<:WriteDescriptorSet}, descriptor_copies::AbstractArray{<:CopyDescriptorSet}, fun_ptr::FunctionPtr) = vkUpdateDescriptorSets(device, pointer_length(descriptor_writes), descriptor_writes, pointer_length(descriptor_copies), descriptor_copies, fun_ptr)

free_descriptor_sets(device::Device, descriptor_pool::DescriptorPool, descriptor_sets::AbstractArray{<:DescriptorSet}, fun_ptr::FunctionPtr) = @check(vkFreeDescriptorSets(device, descriptor_pool, pointer_length(descriptor_sets), descriptor_sets, fun_ptr))

function allocate_descriptor_sets(device::Device, allocate_info::DescriptorSetAllocateInfo, fun_ptr_create::FunctionPtr)
    pDescriptorSets = Vector{VkDescriptorSet}(undef, allocate_info.vks.descriptorSetCount)
    @check vkAllocateDescriptorSets(device, allocate_info, pDescriptorSets, fun_ptr_create)
    parent = getproperty(allocate_info, :descriptor_pool)
    DescriptorSet.(pDescriptorSets, identity, getproperty(allocate_info, :descriptor_pool))
end

reset_descriptor_pool(device::Device, descriptor_pool::DescriptorPool, fun_ptr::FunctionPtr; flags = 0) = @check(vkResetDescriptorPool(device, descriptor_pool, flags, fun_ptr))

destroy_descriptor_pool(device::Device, descriptor_pool::DescriptorPool, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyDescriptorPool(device, descriptor_pool, allocator, fun_ptr)

function create_descriptor_pool(device::Device, create_info::DescriptorPoolCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pDescriptorPool = Ref{VkDescriptorPool}()
    @check vkCreateDescriptorPool(device, create_info, allocator, pDescriptorPool, fun_ptr_create)
    DescriptorPool(pDescriptorPool[], (x->destroy_descriptor_pool(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_descriptor_set_layout(device::Device, descriptor_set_layout::DescriptorSetLayout, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyDescriptorSetLayout(device, descriptor_set_layout, allocator, fun_ptr)

function create_descriptor_set_layout(device::Device, create_info::DescriptorSetLayoutCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSetLayout = Ref{VkDescriptorSetLayout}()
    @check vkCreateDescriptorSetLayout(device, create_info, allocator, pSetLayout, fun_ptr_create)
    DescriptorSetLayout(pSetLayout[], (x->destroy_descriptor_set_layout(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_sampler(device::Device, sampler::Sampler, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroySampler(device, sampler, allocator, fun_ptr)

function create_sampler(device::Device, create_info::SamplerCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSampler = Ref{VkSampler}()
    @check vkCreateSampler(device, create_info, allocator, pSampler, fun_ptr_create)
    Sampler(pSampler[], (x->destroy_sampler(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_pipeline_layout(device::Device, pipeline_layout::PipelineLayout, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyPipelineLayout(device, pipeline_layout, allocator, fun_ptr)

function create_pipeline_layout(device::Device, create_info::PipelineLayoutCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pPipelineLayout = Ref{VkPipelineLayout}()
    @check vkCreatePipelineLayout(device, create_info, allocator, pPipelineLayout, fun_ptr_create)
    PipelineLayout(pPipelineLayout[], (x->destroy_pipeline_layout(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_pipeline(device::Device, pipeline::Pipeline, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyPipeline(device, pipeline, allocator, fun_ptr)

function create_compute_pipelines(device::Device, create_infos::AbstractArray{<:ComputePipelineCreateInfo}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; pipeline_cache = C_NULL, allocator = C_NULL)
    pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
    @check vkCreateComputePipelines(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines, fun_ptr_create)
    Pipeline.(pPipelines, (x->destroy_pipeline(device, x, fun_ptr_destroy; allocator)), device)
end

function create_graphics_pipelines(device::Device, create_infos::AbstractArray{<:GraphicsPipelineCreateInfo}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; pipeline_cache = C_NULL, allocator = C_NULL)
    pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
    @check vkCreateGraphicsPipelines(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines, fun_ptr_create)
    Pipeline.(pPipelines, (x->destroy_pipeline(device, x, fun_ptr_destroy; allocator)), device)
end

merge_pipeline_caches(device::Device, dst_cache::PipelineCache, src_caches::AbstractArray{<:PipelineCache}, fun_ptr::FunctionPtr) = @check(vkMergePipelineCaches(device, dst_cache, pointer_length(src_caches), src_caches, fun_ptr))

function get_pipeline_cache_data(device::Device, pipeline_cache::PipelineCache, data_size::Integer, fun_ptr::FunctionPtr)
    pDataSize = Ref(data_size)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetPipelineCacheData(device, pipeline_cache, pDataSize, pData, fun_ptr)
    (pDataSize[], pData[])
end

destroy_pipeline_cache(device::Device, pipeline_cache::PipelineCache, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyPipelineCache(device, pipeline_cache, allocator, fun_ptr)

function create_pipeline_cache(device::Device, create_info::PipelineCacheCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pPipelineCache = Ref{VkPipelineCache}()
    @check vkCreatePipelineCache(device, create_info, allocator, pPipelineCache, fun_ptr_create)
    PipelineCache(pPipelineCache[], (x->destroy_pipeline_cache(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_shader_module(device::Device, shader_module::ShaderModule, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyShaderModule(device, shader_module, allocator, fun_ptr)

function create_shader_module(device::Device, create_info::ShaderModuleCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pShaderModule = Ref{VkShaderModule}()
    @check vkCreateShaderModule(device, create_info, allocator, pShaderModule, fun_ptr_create)
    ShaderModule(pShaderModule[], (x->destroy_shader_module(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_image_view(device::Device, image_view::ImageView, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyImageView(device, image_view, allocator, fun_ptr)

function create_image_view(device::Device, create_info::ImageViewCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pView = Ref{VkImageView}()
    @check vkCreateImageView(device, create_info, allocator, pView, fun_ptr_create)
    ImageView(pView[], (x->destroy_image_view(device, x, fun_ptr_destroy; allocator)), device)
end

function get_image_subresource_layout(device::Device, image::Image, subresource::ImageSubresource, fun_ptr::FunctionPtr)
    pLayout = Ref{VkSubresourceLayout}()
    vkGetImageSubresourceLayout(device, image, subresource, pLayout, fun_ptr)
    from_vk(SubresourceLayout, pLayout[])
end

destroy_image(device::Device, image::Image, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyImage(device, image, allocator, fun_ptr)

function create_image(device::Device, create_info::ImageCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pImage = Ref{VkImage}()
    @check vkCreateImage(device, create_info, allocator, pImage, fun_ptr_create)
    Image(pImage[], (x->destroy_image(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_buffer_view(device::Device, buffer_view::BufferView, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyBufferView(device, buffer_view, allocator, fun_ptr)

function create_buffer_view(device::Device, create_info::BufferViewCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pView = Ref{VkBufferView}()
    @check vkCreateBufferView(device, create_info, allocator, pView, fun_ptr_create)
    BufferView(pView[], (x->destroy_buffer_view(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_buffer(device::Device, buffer::Buffer, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyBuffer(device, buffer, allocator, fun_ptr)

function create_buffer(device::Device, create_info::BufferCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pBuffer = Ref{VkBuffer}()
    @check vkCreateBuffer(device, create_info, allocator, pBuffer, fun_ptr_create)
    Buffer(pBuffer[], (x->destroy_buffer(device, x, fun_ptr_destroy; allocator)), device)
end

reset_query_pool(device::Device, query_pool::QueryPool, first_query::Integer, query_count::Integer, fun_ptr::FunctionPtr) = vkResetQueryPool(device, query_pool, first_query, query_count, fun_ptr)

function get_query_pool_results(device::Device, query_pool::QueryPool, first_query::Integer, query_count::Integer, data_size::Integer, stride::Integer, fun_ptr::FunctionPtr; flags = 0)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetQueryPoolResults(device, query_pool, first_query, query_count, data_size, pData, stride, flags, fun_ptr)
    pData[]
end

destroy_query_pool(device::Device, query_pool::QueryPool, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyQueryPool(device, query_pool, allocator, fun_ptr)

function create_query_pool(device::Device, create_info::QueryPoolCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pQueryPool = Ref{VkQueryPool}()
    @check vkCreateQueryPool(device, create_info, allocator, pQueryPool, fun_ptr_create)
    QueryPool(pQueryPool[], (x->destroy_query_pool(device, x, fun_ptr_destroy; allocator)), device)
end

reset_event(device::Device, event::Event, fun_ptr::FunctionPtr) = @check(vkResetEvent(device, event, fun_ptr))

set_event(device::Device, event::Event, fun_ptr::FunctionPtr) = @check(vkSetEvent(device, event, fun_ptr))

get_event_status(device::Device, event::Event, fun_ptr::FunctionPtr) = @check(vkGetEventStatus(device, event, fun_ptr))

destroy_event(device::Device, event::Event, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyEvent(device, event, allocator, fun_ptr)

function create_event(device::Device, create_info::EventCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pEvent = Ref{VkEvent}()
    @check vkCreateEvent(device, create_info, allocator, pEvent, fun_ptr_create)
    Event(pEvent[], (x->destroy_event(device, x, fun_ptr_destroy; allocator)), device)
end

destroy_semaphore(device::Device, semaphore::Semaphore, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroySemaphore(device, semaphore, allocator, fun_ptr)

function create_semaphore(device::Device, create_info::SemaphoreCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pSemaphore = Ref{VkSemaphore}()
    @check vkCreateSemaphore(device, create_info, allocator, pSemaphore, fun_ptr_create)
    Semaphore(pSemaphore[], (x->destroy_semaphore(device, x, fun_ptr_destroy; allocator)), device)
end

wait_for_fences(device::Device, fences::AbstractArray{<:Fence}, wait_all::Bool, timeout::Integer, fun_ptr::FunctionPtr) = @check(vkWaitForFences(device, pointer_length(fences), fences, wait_all, timeout, fun_ptr))

get_fence_status(device::Device, fence::Fence, fun_ptr::FunctionPtr) = @check(vkGetFenceStatus(device, fence, fun_ptr))

reset_fences(device::Device, fences::AbstractArray{<:Fence}, fun_ptr::FunctionPtr) = @check(vkResetFences(device, pointer_length(fences), fences, fun_ptr))

destroy_fence(device::Device, fence::Fence, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyFence(device, fence, allocator, fun_ptr)

function create_fence(device::Device, create_info::FenceCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pFence = Ref{VkFence}()
    @check vkCreateFence(device, create_info, allocator, pFence, fun_ptr_create)
    Fence(pFence[], (x->destroy_fence(device, x, fun_ptr_destroy; allocator)), device)
end

queue_bind_sparse(queue::Queue, bind_info::AbstractArray{<:BindSparseInfo}, fun_ptr::FunctionPtr; fence = C_NULL) = @check(vkQueueBindSparse(queue, pointer_length(bind_info), bind_info, fence, fun_ptr))

function get_physical_device_sparse_image_format_properties(physical_device::PhysicalDevice, format::VkFormat, type::VkImageType, samples::VkSampleCountFlagBits, usage::Integer, tiling::VkImageTiling, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    vkGetPhysicalDeviceSparseImageFormatProperties(physical_device, format, type, samples, usage, tiling, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkSparseImageFormatProperties}(undef, pPropertyCount[])
    vkGetPhysicalDeviceSparseImageFormatProperties(physical_device, format, type, samples, usage, tiling, pPropertyCount, pProperties, fun_ptr)
    from_vk.(SparseImageFormatProperties, pProperties)
end

function get_image_sparse_memory_requirements(device::Device, image::Image, fun_ptr::FunctionPtr)
    pSparseMemoryRequirementCount = Ref{UInt32}()
    vkGetImageSparseMemoryRequirements(device, image, pSparseMemoryRequirementCount, C_NULL, fun_ptr)
    pSparseMemoryRequirements = Vector{VkSparseImageMemoryRequirements}(undef, pSparseMemoryRequirementCount[])
    vkGetImageSparseMemoryRequirements(device, image, pSparseMemoryRequirementCount, pSparseMemoryRequirements, fun_ptr)
    from_vk.(SparseImageMemoryRequirements, pSparseMemoryRequirements)
end

bind_image_memory(device::Device, image::Image, memory::DeviceMemory, memory_offset::Integer, fun_ptr::FunctionPtr) = @check(vkBindImageMemory(device, image, memory, memory_offset, fun_ptr))

function get_image_memory_requirements(device::Device, image::Image, fun_ptr::FunctionPtr)
    pMemoryRequirements = Ref{VkMemoryRequirements}()
    vkGetImageMemoryRequirements(device, image, pMemoryRequirements, fun_ptr)
    from_vk(MemoryRequirements, pMemoryRequirements[])
end

bind_buffer_memory(device::Device, buffer::Buffer, memory::DeviceMemory, memory_offset::Integer, fun_ptr::FunctionPtr) = @check(vkBindBufferMemory(device, buffer, memory, memory_offset, fun_ptr))

function get_buffer_memory_requirements(device::Device, buffer::Buffer, fun_ptr::FunctionPtr)
    pMemoryRequirements = Ref{VkMemoryRequirements}()
    vkGetBufferMemoryRequirements(device, buffer, pMemoryRequirements, fun_ptr)
    from_vk(MemoryRequirements, pMemoryRequirements[])
end

function get_device_memory_commitment(device::Device, memory::DeviceMemory, fun_ptr::FunctionPtr)
    pCommittedMemoryInBytes = Ref{VkDeviceSize}()
    vkGetDeviceMemoryCommitment(device, memory, pCommittedMemoryInBytes, fun_ptr)
    pCommittedMemoryInBytes[]
end

invalidate_mapped_memory_ranges(device::Device, memory_ranges::AbstractArray{<:MappedMemoryRange}, fun_ptr::FunctionPtr) = @check(vkInvalidateMappedMemoryRanges(device, pointer_length(memory_ranges), memory_ranges, fun_ptr))

flush_mapped_memory_ranges(device::Device, memory_ranges::AbstractArray{<:MappedMemoryRange}, fun_ptr::FunctionPtr) = @check(vkFlushMappedMemoryRanges(device, pointer_length(memory_ranges), memory_ranges, fun_ptr))

unmap_memory(device::Device, memory::DeviceMemory, fun_ptr::FunctionPtr) = vkUnmapMemory(device, memory, fun_ptr)

function map_memory(device::Device, memory::DeviceMemory, offset::Integer, size::Integer, fun_ptr::FunctionPtr; flags = 0)
    ppData = Ref{Ptr{Cvoid}}()
    @check vkMapMemory(device, memory, offset, size, flags, ppData, fun_ptr)
    ppData[]
end

free_memory(device::Device, memory::DeviceMemory, fun_ptr::FunctionPtr; allocator = C_NULL) = vkFreeMemory(device, memory, allocator, fun_ptr)

function allocate_memory(device::Device, allocate_info::MemoryAllocateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pMemory = Ref{VkDeviceMemory}()
    @check vkAllocateMemory(device, allocate_info, allocator, pMemory, fun_ptr_create)
    DeviceMemory(pMemory[], (x->free_memory(device, x, fun_ptr_destroy; allocator)), device)
end

device_wait_idle(device::Device, fun_ptr::FunctionPtr) = @check(vkDeviceWaitIdle(device, fun_ptr))

queue_wait_idle(queue::Queue, fun_ptr::FunctionPtr) = @check(vkQueueWaitIdle(queue, fun_ptr))

queue_submit(queue::Queue, submits::AbstractArray{<:SubmitInfo}, fun_ptr::FunctionPtr; fence = C_NULL) = @check(vkQueueSubmit(queue, pointer_length(submits), submits, fence, fun_ptr))

function get_device_queue(device::Device, queue_family_index::Integer, queue_index::Integer, fun_ptr::FunctionPtr)
    pQueue = Ref{VkQueue}()
    vkGetDeviceQueue(device, queue_family_index, queue_index, pQueue, fun_ptr)
    Queue(pQueue[], identity, device)
end

function enumerate_device_extension_properties(physical_device::PhysicalDevice, fun_ptr::FunctionPtr; layer_name = C_NULL)
    pPropertyCount = Ref{UInt32}()
    @check vkEnumerateDeviceExtensionProperties(physical_device, layer_name, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkExtensionProperties}(undef, pPropertyCount[])
    @check vkEnumerateDeviceExtensionProperties(physical_device, layer_name, pPropertyCount, pProperties, fun_ptr)
    from_vk.(ExtensionProperties, pProperties)
end

function enumerate_device_layer_properties(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkEnumerateDeviceLayerProperties(physical_device, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkLayerProperties}(undef, pPropertyCount[])
    @check vkEnumerateDeviceLayerProperties(physical_device, pPropertyCount, pProperties, fun_ptr)
    from_vk.(LayerProperties, pProperties)
end

function enumerate_instance_extension_properties(fun_ptr::FunctionPtr; layer_name = C_NULL)
    pPropertyCount = Ref{UInt32}()
    @check vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkExtensionProperties}(undef, pPropertyCount[])
    @check vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, pProperties, fun_ptr)
    from_vk.(ExtensionProperties, pProperties)
end

function enumerate_instance_layer_properties(fun_ptr::FunctionPtr)
    pPropertyCount = Ref{UInt32}()
    @check vkEnumerateInstanceLayerProperties(pPropertyCount, C_NULL, fun_ptr)
    pProperties = Vector{VkLayerProperties}(undef, pPropertyCount[])
    @check vkEnumerateInstanceLayerProperties(pPropertyCount, pProperties, fun_ptr)
    from_vk.(LayerProperties, pProperties)
end

function enumerate_instance_version(fun_ptr::FunctionPtr)
    pApiVersion = Ref{UInt32}()
    @check vkEnumerateInstanceVersion(pApiVersion, fun_ptr)
    from_vk(VersionNumber, pApiVersion[])
end

destroy_device(device::Device, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyDevice(device, allocator, fun_ptr)

function create_device(physical_device::PhysicalDevice, create_info::DeviceCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pDevice = Ref{VkDevice}()
    @check vkCreateDevice(physical_device, create_info, allocator, pDevice, fun_ptr_create)
    Device(pDevice[], (x->destroy_device(x, fun_ptr_destroy; allocator)), physical_device)
end

function get_physical_device_image_format_properties(physical_device::PhysicalDevice, format::VkFormat, type::VkImageType, tiling::VkImageTiling, usage::Integer, fun_ptr::FunctionPtr; flags = 0)
    pImageFormatProperties = Ref{VkImageFormatProperties}()
    @check vkGetPhysicalDeviceImageFormatProperties(physical_device, format, type, tiling, usage, flags, pImageFormatProperties, fun_ptr)
    from_vk(ImageFormatProperties, pImageFormatProperties[])
end

function get_physical_device_format_properties(physical_device::PhysicalDevice, format::VkFormat, fun_ptr::FunctionPtr)
    pFormatProperties = Ref{VkFormatProperties}()
    vkGetPhysicalDeviceFormatProperties(physical_device, format, pFormatProperties, fun_ptr)
    from_vk(FormatProperties, pFormatProperties[])
end

function get_physical_device_features(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pFeatures = Ref{VkPhysicalDeviceFeatures}()
    vkGetPhysicalDeviceFeatures(physical_device, pFeatures, fun_ptr)
    from_vk(PhysicalDeviceFeatures, pFeatures[])
end

function get_physical_device_memory_properties(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pMemoryProperties = Ref{VkPhysicalDeviceMemoryProperties}()
    vkGetPhysicalDeviceMemoryProperties(physical_device, pMemoryProperties, fun_ptr)
    from_vk(PhysicalDeviceMemoryProperties, pMemoryProperties[])
end

function get_physical_device_queue_family_properties(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pQueueFamilyPropertyCount = Ref{UInt32}()
    vkGetPhysicalDeviceQueueFamilyProperties(physical_device, pQueueFamilyPropertyCount, C_NULL, fun_ptr)
    pQueueFamilyProperties = Vector{VkQueueFamilyProperties}(undef, pQueueFamilyPropertyCount[])
    vkGetPhysicalDeviceQueueFamilyProperties(physical_device, pQueueFamilyPropertyCount, pQueueFamilyProperties, fun_ptr)
    from_vk.(QueueFamilyProperties, pQueueFamilyProperties)
end

function get_physical_device_properties(physical_device::PhysicalDevice, fun_ptr::FunctionPtr)
    pProperties = Ref{VkPhysicalDeviceProperties}()
    vkGetPhysicalDeviceProperties(physical_device, pProperties, fun_ptr)
    from_vk(PhysicalDeviceProperties, pProperties[])
end

get_instance_proc_addr(name::AbstractString, fun_ptr::FunctionPtr; instance = C_NULL) = vkGetInstanceProcAddr(instance, name, fun_ptr)

get_device_proc_addr(device::Device, name::AbstractString, fun_ptr::FunctionPtr) = vkGetDeviceProcAddr(device, name, fun_ptr)

function enumerate_physical_devices(instance::Instance, fun_ptr::FunctionPtr)
    pPhysicalDeviceCount = Ref{UInt32}()
    @check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL, fun_ptr)
    pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])
    @check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices, fun_ptr)
    PhysicalDevice.(pPhysicalDevices, identity, instance)
end

destroy_instance(instance::Instance, fun_ptr::FunctionPtr; allocator = C_NULL) = vkDestroyInstance(instance, allocator, fun_ptr)

function create_instance(create_info::InstanceCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL)
    pInstance = Ref{VkInstance}()
    @check vkCreateInstance(create_info, allocator, pInstance, fun_ptr_create)
    Instance(pInstance[], (x->destroy_instance(x, fun_ptr_destroy; allocator)))
end

DebugUtilsMessengerEXT(instance::Instance, message_severity::Integer, message_type::Integer, pfn_user_callback::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = create_debug_utils_messenger_ext(instance, DebugUtilsMessengerCreateInfoEXT(message_severity, message_type, pfn_user_callback; next, flags, user_data); allocator)

DebugReportCallbackEXT(instance::Instance, pfn_callback::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, user_data = C_NULL) = create_debug_report_callback_ext(instance, DebugReportCallbackCreateInfoEXT(pfn_callback; next, flags, user_data); allocator)

SwapchainKHR(device::Device, surface::SurfaceKHR, min_image_count::Integer, image_format::VkFormat, image_color_space::VkColorSpaceKHR, image_extent::Extent2D, image_array_layers::Integer, image_usage::Integer, image_sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}, pre_transform::VkSurfaceTransformFlagBitsKHR, composite_alpha::VkCompositeAlphaFlagBitsKHR, present_mode::VkPresentModeKHR, clipped::Bool; allocator = C_NULL, next = C_NULL, flags = 0, old_swapchain = C_NULL) = create_swapchain_khr(device, SwapchainCreateInfoKHR(surface, min_image_count, image_format, image_color_space, image_extent, image_array_layers, image_usage, image_sharing_mode, queue_family_indices, pre_transform, composite_alpha, present_mode, clipped; next, flags, old_swapchain); allocator)

DisplayModeKHR(physical_device::PhysicalDevice, display::DisplayKHR, parameters::DisplayModeParametersKHR; allocator = C_NULL, next = C_NULL, flags = 0) = create_display_mode_khr(physical_device, display, DisplayModeCreateInfoKHR(parameters; next, flags); allocator)

PrivateDataSlotEXT(device::Device, flags::Integer; allocator = C_NULL, next = C_NULL) = create_private_data_slot_ext(device, PrivateDataSlotCreateInfoEXT(flags; next); allocator)

DeferredOperationKHR(device::Device; allocator = C_NULL) = create_deferred_operation_khr(device; allocator)

ValidationCacheEXT(device::Device, initial_data::Ptr{Cvoid}; allocator = C_NULL, next = C_NULL, flags = 0, initial_data_size = 0) = create_validation_cache_ext(device, ValidationCacheCreateInfoEXT(initial_data; next, flags, initial_data_size); allocator)

SamplerYcbcrConversion(device::Device, format::VkFormat, ycbcr_model::VkSamplerYcbcrModelConversion, ycbcr_range::VkSamplerYcbcrRange, components::ComponentMapping, x_chroma_offset::VkChromaLocation, y_chroma_offset::VkChromaLocation, chroma_filter::VkFilter, force_explicit_reconstruction::Bool; allocator = C_NULL, next = C_NULL) = create_sampler_ycbcr_conversion(device, SamplerYcbcrConversionCreateInfo(format, ycbcr_model, ycbcr_range, components, x_chroma_offset, y_chroma_offset, chroma_filter, force_explicit_reconstruction; next); allocator)

DescriptorUpdateTemplate(device::Device, descriptor_update_entries::AbstractArray{<:DescriptorUpdateTemplateEntry}, template_type::VkDescriptorUpdateTemplateType, descriptor_set_layout::DescriptorSetLayout, pipeline_bind_point::VkPipelineBindPoint, pipeline_layout::PipelineLayout, set::Integer; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_update_template(device, DescriptorUpdateTemplateCreateInfo(descriptor_update_entries, template_type, descriptor_set_layout, pipeline_bind_point, pipeline_layout, set; next, flags); allocator)

IndirectCommandsLayoutNV(device::Device, flags::Integer, pipeline_bind_point::VkPipelineBindPoint, tokens::AbstractArray{<:IndirectCommandsLayoutTokenNV}, stream_strides::AbstractArray{<:Integer}; allocator = C_NULL, next = C_NULL) = create_indirect_commands_layout_nv(device, IndirectCommandsLayoutCreateInfoNV(flags, pipeline_bind_point, tokens, stream_strides; next); allocator)

PipelineCache(device::Device, initial_data::Ptr{Cvoid}; allocator = C_NULL, next = C_NULL, flags = 0, initial_data_size = 0) = create_pipeline_cache(device, PipelineCacheCreateInfo(initial_data; next, flags, initial_data_size); allocator)

Framebuffer(device::Device, render_pass::RenderPass, attachments::AbstractArray{<:ImageView}, width::Integer, height::Integer, layers::Integer; allocator = C_NULL, next = C_NULL, flags = 0) = create_framebuffer(device, FramebufferCreateInfo(render_pass, attachments, width, height, layers; next, flags); allocator)

QueryPool(device::Device, query_type::VkQueryType, query_count::Integer; allocator = C_NULL, next = C_NULL, flags = 0, pipeline_statistics = 0) = create_query_pool(device, QueryPoolCreateInfo(query_type, query_count; next, flags, pipeline_statistics); allocator)

Event(device::Device; allocator = C_NULL, next = C_NULL, flags = 0) = create_event(device, EventCreateInfo(; next, flags); allocator)

Semaphore(device::Device; allocator = C_NULL, next = C_NULL, flags = 0) = create_semaphore(device, SemaphoreCreateInfo(; next, flags); allocator)

Fence(device::Device; allocator = C_NULL, next = C_NULL, flags = 0) = create_fence(device, FenceCreateInfo(; next, flags); allocator)

DescriptorPool(device::Device, max_sets::Integer, pool_sizes::AbstractArray{<:DescriptorPoolSize}; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_pool(device, DescriptorPoolCreateInfo(max_sets, pool_sizes; next, flags); allocator)

DescriptorSetLayout(device::Device, bindings::AbstractArray{<:DescriptorSetLayoutBinding}; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_set_layout(device, DescriptorSetLayoutCreateInfo(bindings; next, flags); allocator)

Sampler(device::Device, mag_filter::VkFilter, min_filter::VkFilter, mipmap_mode::VkSamplerMipmapMode, address_mode_u::VkSamplerAddressMode, address_mode_v::VkSamplerAddressMode, address_mode_w::VkSamplerAddressMode, mip_lod_bias::Real, anisotropy_enable::Bool, max_anisotropy::Real, compare_enable::Bool, compare_op::VkCompareOp, min_lod::Real, max_lod::Real, border_color::VkBorderColor, unnormalized_coordinates::Bool; allocator = C_NULL, next = C_NULL, flags = 0) = create_sampler(device, SamplerCreateInfo(mag_filter, min_filter, mipmap_mode, address_mode_u, address_mode_v, address_mode_w, mip_lod_bias, anisotropy_enable, max_anisotropy, compare_enable, compare_op, min_lod, max_lod, border_color, unnormalized_coordinates; next, flags); allocator)

PipelineLayout(device::Device, set_layouts::AbstractArray{<:DescriptorSetLayout}, push_constant_ranges::AbstractArray{<:PushConstantRange}; allocator = C_NULL, next = C_NULL, flags = 0) = create_pipeline_layout(device, PipelineLayoutCreateInfo(set_layouts, push_constant_ranges; next, flags); allocator)

ShaderModule(device::Device, code_size::Integer, code::AbstractArray{<:Integer}; allocator = C_NULL, next = C_NULL, flags = 0) = create_shader_module(device, ShaderModuleCreateInfo(code_size, code; next, flags); allocator)

ImageView(device::Device, image::Image, view_type::VkImageViewType, format::VkFormat, components::ComponentMapping, subresource_range::ImageSubresourceRange; allocator = C_NULL, next = C_NULL, flags = 0) = create_image_view(device, ImageViewCreateInfo(image, view_type, format, components, subresource_range; next, flags); allocator)

Image(device::Device, image_type::VkImageType, format::VkFormat, extent::Extent3D, mip_levels::Integer, array_layers::Integer, samples::VkSampleCountFlagBits, tiling::VkImageTiling, usage::Integer, sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}, initial_layout::VkImageLayout; allocator = C_NULL, next = C_NULL, flags = 0) = create_image(device, ImageCreateInfo(image_type, format, extent, mip_levels, array_layers, samples, tiling, usage, sharing_mode, queue_family_indices, initial_layout; next, flags); allocator)

BufferView(device::Device, buffer::Buffer, format::VkFormat, offset::Integer, range::Integer; allocator = C_NULL, next = C_NULL, flags = 0) = create_buffer_view(device, BufferViewCreateInfo(buffer, format, offset, range; next, flags); allocator)

Buffer(device::Device, size::Integer, usage::Integer, sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}; allocator = C_NULL, next = C_NULL, flags = 0) = create_buffer(device, BufferCreateInfo(size, usage, sharing_mode, queue_family_indices; next, flags); allocator)

CommandPool(device::Device, queue_family_index::Integer; allocator = C_NULL, next = C_NULL, flags = 0) = create_command_pool(device, CommandPoolCreateInfo(queue_family_index; next, flags); allocator)

DeviceMemory(device::Device, allocation_size::Integer, memory_type_index::Integer; allocator = C_NULL, next = C_NULL) = allocate_memory(device, MemoryAllocateInfo(allocation_size, memory_type_index; next); allocator)

Device(physical_device::PhysicalDevice, queue_create_infos::AbstractArray{<:DeviceQueueCreateInfo}, enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; allocator = C_NULL, next = C_NULL, flags = 0, enabled_features = C_NULL) = create_device(physical_device, DeviceCreateInfo(queue_create_infos, enabled_layer_names, enabled_extension_names; next, flags, enabled_features); allocator)

Instance(enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; allocator = C_NULL, next = C_NULL, flags = 0, application_info = C_NULL) = create_instance(InstanceCreateInfo(enabled_layer_names, enabled_extension_names; next, flags, application_info); allocator)

from_vk(T::Type{PhysicalDeviceRobustness2PropertiesEXT}, x::VkPhysicalDeviceRobustness2PropertiesEXT) = T(x.sType, x.pNext, x.robustStorageBufferAccessSizeAlignment, x.robustUniformBufferAccessSizeAlignment)

from_vk(T::Type{PhysicalDeviceCustomBorderColorPropertiesEXT}, x::VkPhysicalDeviceCustomBorderColorPropertiesEXT) = T(x.sType, x.pNext, x.maxCustomBorderColorSamplers)

from_vk(T::Type{PhysicalDeviceToolPropertiesEXT}, x::VkPhysicalDeviceToolPropertiesEXT) = T(x.sType, x.pNext, from_vk(String, x.name), from_vk(String, x.version), x.purposes, from_vk(String, x.description), from_vk(String, x.layer))

from_vk(T::Type{PhysicalDeviceVulkan12Properties}, x::VkPhysicalDeviceVulkan12Properties) = T(x.sType, x.pNext, x.driverID, from_vk(String, x.driverName), from_vk(String, x.driverInfo), from_vk(ConformanceVersion, x.conformanceVersion), x.denormBehaviorIndependence, x.roundingModeIndependence, from_vk(Bool, x.shaderSignedZeroInfNanPreserveFloat16), from_vk(Bool, x.shaderSignedZeroInfNanPreserveFloat32), from_vk(Bool, x.shaderSignedZeroInfNanPreserveFloat64), from_vk(Bool, x.shaderDenormPreserveFloat16), from_vk(Bool, x.shaderDenormPreserveFloat32), from_vk(Bool, x.shaderDenormPreserveFloat64), from_vk(Bool, x.shaderDenormFlushToZeroFloat16), from_vk(Bool, x.shaderDenormFlushToZeroFloat32), from_vk(Bool, x.shaderDenormFlushToZeroFloat64), from_vk(Bool, x.shaderRoundingModeRTEFloat16), from_vk(Bool, x.shaderRoundingModeRTEFloat32), from_vk(Bool, x.shaderRoundingModeRTEFloat64), from_vk(Bool, x.shaderRoundingModeRTZFloat16), from_vk(Bool, x.shaderRoundingModeRTZFloat32), from_vk(Bool, x.shaderRoundingModeRTZFloat64), x.maxUpdateAfterBindDescriptorsInAllPools, from_vk(Bool, x.shaderUniformBufferArrayNonUniformIndexingNative), from_vk(Bool, x.shaderSampledImageArrayNonUniformIndexingNative), from_vk(Bool, x.shaderStorageBufferArrayNonUniformIndexingNative), from_vk(Bool, x.shaderStorageImageArrayNonUniformIndexingNative), from_vk(Bool, x.shaderInputAttachmentArrayNonUniformIndexingNative), from_vk(Bool, x.robustBufferAccessUpdateAfterBind), from_vk(Bool, x.quadDivergentImplicitLod), x.maxPerStageDescriptorUpdateAfterBindSamplers, x.maxPerStageDescriptorUpdateAfterBindUniformBuffers, x.maxPerStageDescriptorUpdateAfterBindStorageBuffers, x.maxPerStageDescriptorUpdateAfterBindSampledImages, x.maxPerStageDescriptorUpdateAfterBindStorageImages, x.maxPerStageDescriptorUpdateAfterBindInputAttachments, x.maxPerStageUpdateAfterBindResources, x.maxDescriptorSetUpdateAfterBindSamplers, x.maxDescriptorSetUpdateAfterBindUniformBuffers, x.maxDescriptorSetUpdateAfterBindUniformBuffersDynamic, x.maxDescriptorSetUpdateAfterBindStorageBuffers, x.maxDescriptorSetUpdateAfterBindStorageBuffersDynamic, x.maxDescriptorSetUpdateAfterBindSampledImages, x.maxDescriptorSetUpdateAfterBindStorageImages, x.maxDescriptorSetUpdateAfterBindInputAttachments, x.supportedDepthResolveModes, x.supportedStencilResolveModes, from_vk(Bool, x.independentResolveNone), from_vk(Bool, x.independentResolve), from_vk(Bool, x.filterMinmaxSingleComponentFormats), from_vk(Bool, x.filterMinmaxImageComponentMapping), x.maxTimelineSemaphoreValueDifference, x.framebufferIntegerColorSampleCounts)

from_vk(T::Type{PhysicalDeviceVulkan11Properties}, x::VkPhysicalDeviceVulkan11Properties) = T(x.sType, x.pNext, from_vk(String, x.deviceUUID), from_vk(String, x.driverUUID), from_vk(String, x.deviceLUID), x.deviceNodeMask, from_vk(Bool, x.deviceLUIDValid), x.subgroupSize, x.subgroupSupportedStages, x.subgroupSupportedOperations, from_vk(Bool, x.subgroupQuadOperationsInAllStages), x.pointClippingBehavior, x.maxMultiviewViewCount, x.maxMultiviewInstanceIndex, from_vk(Bool, x.protectedNoFault), x.maxPerSetDescriptors, x.maxMemoryAllocationSize)

from_vk(T::Type{PhysicalDeviceLineRasterizationPropertiesEXT}, x::VkPhysicalDeviceLineRasterizationPropertiesEXT) = T(x.sType, x.pNext, x.lineSubPixelPrecisionBits)

from_vk(T::Type{PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT}, x::VkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT) = T(x.sType, x.pNext, x.requiredSubgroupSize)

from_vk(T::Type{PhysicalDeviceSubgroupSizeControlPropertiesEXT}, x::VkPhysicalDeviceSubgroupSizeControlPropertiesEXT) = T(x.sType, x.pNext, x.minSubgroupSize, x.maxSubgroupSize, x.maxComputeWorkgroupSubgroups, x.requiredSubgroupSizeStages)

from_vk(T::Type{PhysicalDeviceTexelBufferAlignmentPropertiesEXT}, x::VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT) = T(x.sType, x.pNext, x.storageTexelBufferOffsetAlignmentBytes, from_vk(Bool, x.storageTexelBufferOffsetSingleTexelAlignment), x.uniformTexelBufferOffsetAlignmentBytes, from_vk(Bool, x.uniformTexelBufferOffsetSingleTexelAlignment))

from_vk(T::Type{PipelineExecutableInternalRepresentationKHR}, x::VkPipelineExecutableInternalRepresentationKHR) = T(x.sType, x.pNext, from_vk(String, x.name), from_vk(String, x.description), from_vk(Bool, x.isText), x.dataSize, x.pData)

from_vk(T::Type{PipelineExecutableStatisticKHR}, x::VkPipelineExecutableStatisticKHR) = T(x.sType, x.pNext, from_vk(String, x.name), from_vk(String, x.description), x.format, from_vk(PipelineExecutableStatisticValueKHR, x.value))

from_vk(T::Type{PipelineExecutableStatisticValueKHR}, x::VkPipelineExecutableStatisticValueKHR) = T(from_vk(Bool, x.b32), x.i64, x.u64, x.f64)

from_vk(T::Type{PipelineExecutablePropertiesKHR}, x::VkPipelineExecutablePropertiesKHR) = T(x.sType, x.pNext, x.stages, from_vk(String, x.name), from_vk(String, x.description), x.subgroupSize)

from_vk(T::Type{PhysicalDeviceShaderSMBuiltinsPropertiesNV}, x::VkPhysicalDeviceShaderSMBuiltinsPropertiesNV) = T(x.sType, x.pNext, x.shaderSMCount, x.shaderWarpsPerSM)

from_vk(T::Type{FramebufferMixedSamplesCombinationNV}, x::VkFramebufferMixedSamplesCombinationNV) = T(x.sType, x.pNext, x.coverageReductionMode, x.rasterizationSamples, x.depthStencilSamples, x.colorSamples)

from_vk(T::Type{PerformanceCounterDescriptionKHR}, x::VkPerformanceCounterDescriptionKHR) = T(x.sType, x.pNext, x.flags, from_vk(String, x.name), from_vk(String, x.category), from_vk(String, x.description))

from_vk(T::Type{PerformanceCounterKHR}, x::VkPerformanceCounterKHR) = T(x.sType, x.pNext, x.unit, x.scope, x.storage, from_vk(String, x.uuid))

from_vk(T::Type{PhysicalDevicePerformanceQueryPropertiesKHR}, x::VkPhysicalDevicePerformanceQueryPropertiesKHR) = T(x.sType, x.pNext, from_vk(Bool, x.allowCommandBufferQueryCopies))

from_vk(T::Type{PipelineCreationFeedbackEXT}, x::VkPipelineCreationFeedbackEXT) = T(x.flags, x.duration)

from_vk(T::Type{ImageViewAddressPropertiesNVX}, x::VkImageViewAddressPropertiesNVX) = T(x.sType, x.pNext, x.deviceAddress, x.size)

from_vk(T::Type{PhysicalDeviceCooperativeMatrixPropertiesNV}, x::VkPhysicalDeviceCooperativeMatrixPropertiesNV) = T(x.sType, x.pNext, x.cooperativeMatrixSupportedStages)

from_vk(T::Type{FilterCubicImageViewImageFormatPropertiesEXT}, x::VkFilterCubicImageViewImageFormatPropertiesEXT) = T(x.sType, x.pNext, from_vk(Bool, x.filterCubic), from_vk(Bool, x.filterCubicMinmax))

from_vk(T::Type{PhysicalDeviceMemoryBudgetPropertiesEXT}, x::VkPhysicalDeviceMemoryBudgetPropertiesEXT) = T(x.sType, x.pNext, x.heapBudget, x.heapUsage)

from_vk(T::Type{PhysicalDeviceFragmentDensityMap2PropertiesEXT}, x::VkPhysicalDeviceFragmentDensityMap2PropertiesEXT) = T(x.sType, x.pNext, from_vk(Bool, x.subsampledLoads), from_vk(Bool, x.subsampledCoarseReconstructionEarlyAccess), x.maxSubsampledArrayLayers, x.maxDescriptorSetSubsampledSamplers)

from_vk(T::Type{PhysicalDeviceFragmentDensityMapPropertiesEXT}, x::VkPhysicalDeviceFragmentDensityMapPropertiesEXT) = T(x.sType, x.pNext, from_vk(Extent2D, x.minFragmentDensityTexelSize), from_vk(Extent2D, x.maxFragmentDensityTexelSize), from_vk(Bool, x.fragmentDensityInvocations))

from_vk(T::Type{ImageDrmFormatModifierPropertiesEXT}, x::VkImageDrmFormatModifierPropertiesEXT) = T(x.sType, x.pNext, x.drmFormatModifier)

from_vk(T::Type{DrmFormatModifierPropertiesEXT}, x::VkDrmFormatModifierPropertiesEXT) = T(x.drmFormatModifier, x.drmFormatModifierPlaneCount, x.drmFormatModifierTilingFeatures)

from_vk(T::Type{DrmFormatModifierPropertiesListEXT}, x::VkDrmFormatModifierPropertiesListEXT) = T(x.sType, x.pNext, unsafe_wrap(Vector{DrmFormatModifierPropertiesEXT}, x.pDrmFormatModifierProperties, x.drmFormatModifierCount; own = true))

from_vk(T::Type{PhysicalDeviceRayTracingPropertiesNV}, x::VkPhysicalDeviceRayTracingPropertiesNV) = T(x.sType, x.pNext, x.shaderGroupHandleSize, x.maxRecursionDepth, x.maxShaderGroupStride, x.shaderGroupBaseAlignment, x.maxGeometryCount, x.maxInstanceCount, x.maxTriangleCount, x.maxDescriptorSetAccelerationStructures)

from_vk(T::Type{PhysicalDeviceRayTracingPropertiesKHR}, x::VkPhysicalDeviceRayTracingPropertiesKHR) = T(x.sType, x.pNext, x.shaderGroupHandleSize, x.maxRecursionDepth, x.maxShaderGroupStride, x.shaderGroupBaseAlignment, x.maxGeometryCount, x.maxInstanceCount, x.maxPrimitiveCount, x.maxDescriptorSetAccelerationStructures, x.shaderGroupHandleCaptureReplaySize)

from_vk(T::Type{PhysicalDeviceMeshShaderPropertiesNV}, x::VkPhysicalDeviceMeshShaderPropertiesNV) = T(x.sType, x.pNext, x.maxDrawMeshTasksCount, x.maxTaskWorkGroupInvocations, x.maxTaskWorkGroupSize, x.maxTaskTotalMemorySize, x.maxTaskOutputCount, x.maxMeshWorkGroupInvocations, x.maxMeshWorkGroupSize, x.maxMeshTotalMemorySize, x.maxMeshOutputVertices, x.maxMeshOutputPrimitives, x.maxMeshMultiviewViewCount, x.meshOutputPerVertexGranularity, x.meshOutputPerPrimitiveGranularity)

from_vk(T::Type{PhysicalDeviceShadingRateImagePropertiesNV}, x::VkPhysicalDeviceShadingRateImagePropertiesNV) = T(x.sType, x.pNext, from_vk(Extent2D, x.shadingRateTexelSize), x.shadingRatePaletteSize, x.shadingRateMaxCoarseSamples)

from_vk(T::Type{PhysicalDeviceTransformFeedbackPropertiesEXT}, x::VkPhysicalDeviceTransformFeedbackPropertiesEXT) = T(x.sType, x.pNext, x.maxTransformFeedbackStreams, x.maxTransformFeedbackBuffers, x.maxTransformFeedbackBufferSize, x.maxTransformFeedbackStreamDataSize, x.maxTransformFeedbackBufferDataSize, x.maxTransformFeedbackBufferDataStride, from_vk(Bool, x.transformFeedbackQueries), from_vk(Bool, x.transformFeedbackStreamsLinesTriangles), from_vk(Bool, x.transformFeedbackRasterizationStreamSelect), from_vk(Bool, x.transformFeedbackDraw))

from_vk(T::Type{PhysicalDeviceDepthStencilResolveProperties}, x::VkPhysicalDeviceDepthStencilResolveProperties) = T(x.sType, x.pNext, x.supportedDepthResolveModes, x.supportedStencilResolveModes, from_vk(Bool, x.independentResolveNone), from_vk(Bool, x.independentResolve))

from_vk(T::Type{CheckpointDataNV}, x::VkCheckpointDataNV) = T(x.sType, x.pNext, x.stage, x.pCheckpointMarker)

from_vk(T::Type{QueueFamilyCheckpointPropertiesNV}, x::VkQueueFamilyCheckpointPropertiesNV) = T(x.sType, x.pNext, x.checkpointExecutionStageMask)

from_vk(T::Type{AndroidHardwareBufferFormatPropertiesANDROID}, x::VkAndroidHardwareBufferFormatPropertiesANDROID) = T(x.sType, x.pNext, x.format, x.externalFormat, x.formatFeatures, from_vk(ComponentMapping, x.samplerYcbcrConversionComponents), x.suggestedYcbcrModel, x.suggestedYcbcrRange, x.suggestedXChromaOffset, x.suggestedYChromaOffset)

from_vk(T::Type{AndroidHardwareBufferPropertiesANDROID}, x::VkAndroidHardwareBufferPropertiesANDROID) = T(x.sType, x.pNext, x.allocationSize, x.memoryTypeBits)

from_vk(T::Type{AndroidHardwareBufferUsageANDROID}, x::VkAndroidHardwareBufferUsageANDROID) = T(x.sType, x.pNext, x.androidHardwareBufferUsage)

from_vk(T::Type{PhysicalDevicePCIBusInfoPropertiesEXT}, x::VkPhysicalDevicePCIBusInfoPropertiesEXT) = T(x.sType, x.pNext, x.pciDomain, x.pciBus, x.pciDevice, x.pciFunction)

from_vk(T::Type{PhysicalDeviceVertexAttributeDivisorPropertiesEXT}, x::VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT) = T(x.sType, x.pNext, x.maxVertexAttribDivisor)

from_vk(T::Type{PhysicalDeviceTimelineSemaphoreProperties}, x::VkPhysicalDeviceTimelineSemaphoreProperties) = T(x.sType, x.pNext, x.maxTimelineSemaphoreValueDifference)

from_vk(T::Type{DescriptorSetVariableDescriptorCountLayoutSupport}, x::VkDescriptorSetVariableDescriptorCountLayoutSupport) = T(x.sType, x.pNext, x.maxVariableDescriptorCount)

from_vk(T::Type{PhysicalDeviceDescriptorIndexingProperties}, x::VkPhysicalDeviceDescriptorIndexingProperties) = T(x.sType, x.pNext, x.maxUpdateAfterBindDescriptorsInAllPools, from_vk(Bool, x.shaderUniformBufferArrayNonUniformIndexingNative), from_vk(Bool, x.shaderSampledImageArrayNonUniformIndexingNative), from_vk(Bool, x.shaderStorageBufferArrayNonUniformIndexingNative), from_vk(Bool, x.shaderStorageImageArrayNonUniformIndexingNative), from_vk(Bool, x.shaderInputAttachmentArrayNonUniformIndexingNative), from_vk(Bool, x.robustBufferAccessUpdateAfterBind), from_vk(Bool, x.quadDivergentImplicitLod), x.maxPerStageDescriptorUpdateAfterBindSamplers, x.maxPerStageDescriptorUpdateAfterBindUniformBuffers, x.maxPerStageDescriptorUpdateAfterBindStorageBuffers, x.maxPerStageDescriptorUpdateAfterBindSampledImages, x.maxPerStageDescriptorUpdateAfterBindStorageImages, x.maxPerStageDescriptorUpdateAfterBindInputAttachments, x.maxPerStageUpdateAfterBindResources, x.maxDescriptorSetUpdateAfterBindSamplers, x.maxDescriptorSetUpdateAfterBindUniformBuffers, x.maxDescriptorSetUpdateAfterBindUniformBuffersDynamic, x.maxDescriptorSetUpdateAfterBindStorageBuffers, x.maxDescriptorSetUpdateAfterBindStorageBuffersDynamic, x.maxDescriptorSetUpdateAfterBindSampledImages, x.maxDescriptorSetUpdateAfterBindStorageImages, x.maxDescriptorSetUpdateAfterBindInputAttachments)

from_vk(T::Type{PhysicalDeviceShaderCoreProperties2AMD}, x::VkPhysicalDeviceShaderCoreProperties2AMD) = T(x.sType, x.pNext, x.shaderCoreFeatures, x.activeComputeUnitCount)

from_vk(T::Type{PhysicalDeviceShaderCorePropertiesAMD}, x::VkPhysicalDeviceShaderCorePropertiesAMD) = T(x.sType, x.pNext, x.shaderEngineCount, x.shaderArraysPerEngineCount, x.computeUnitsPerShaderArray, x.simdPerComputeUnit, x.wavefrontsPerSimd, x.wavefrontSize, x.sgprsPerSimd, x.minSgprAllocation, x.maxSgprAllocation, x.sgprAllocationGranularity, x.vgprsPerSimd, x.minVgprAllocation, x.maxVgprAllocation, x.vgprAllocationGranularity)

from_vk(T::Type{PhysicalDeviceConservativeRasterizationPropertiesEXT}, x::VkPhysicalDeviceConservativeRasterizationPropertiesEXT) = T(x.sType, x.pNext, x.primitiveOverestimationSize, x.maxExtraPrimitiveOverestimationSize, x.extraPrimitiveOverestimationSizeGranularity, from_vk(Bool, x.primitiveUnderestimation), from_vk(Bool, x.conservativePointAndLineRasterization), from_vk(Bool, x.degenerateTrianglesRasterized), from_vk(Bool, x.degenerateLinesRasterized), from_vk(Bool, x.fullyCoveredFragmentShaderInputVariable), from_vk(Bool, x.conservativeRasterizationPostDepthCoverage))

from_vk(T::Type{PhysicalDeviceExternalMemoryHostPropertiesEXT}, x::VkPhysicalDeviceExternalMemoryHostPropertiesEXT) = T(x.sType, x.pNext, x.minImportedHostPointerAlignment)

from_vk(T::Type{MemoryHostPointerPropertiesEXT}, x::VkMemoryHostPointerPropertiesEXT) = T(x.sType, x.pNext, x.memoryTypeBits)

from_vk(T::Type{ShaderStatisticsInfoAMD}, x::VkShaderStatisticsInfoAMD) = T(x.shaderStageMask, from_vk(ShaderResourceUsageAMD, x.resourceUsage), x.numPhysicalVgprs, x.numPhysicalSgprs, x.numAvailableVgprs, x.numAvailableSgprs, x.computeWorkGroupSize)

from_vk(T::Type{ShaderResourceUsageAMD}, x::VkShaderResourceUsageAMD) = T(x.numUsedVgprs, x.numUsedSgprs, x.ldsSizePerLocalWorkGroup, x.ldsUsageSizeInBytes, x.scratchMemUsageInBytes)

from_vk(T::Type{PhysicalDeviceFloatControlsProperties}, x::VkPhysicalDeviceFloatControlsProperties) = T(x.sType, x.pNext, x.denormBehaviorIndependence, x.roundingModeIndependence, from_vk(Bool, x.shaderSignedZeroInfNanPreserveFloat16), from_vk(Bool, x.shaderSignedZeroInfNanPreserveFloat32), from_vk(Bool, x.shaderSignedZeroInfNanPreserveFloat64), from_vk(Bool, x.shaderDenormPreserveFloat16), from_vk(Bool, x.shaderDenormPreserveFloat32), from_vk(Bool, x.shaderDenormPreserveFloat64), from_vk(Bool, x.shaderDenormFlushToZeroFloat16), from_vk(Bool, x.shaderDenormFlushToZeroFloat32), from_vk(Bool, x.shaderDenormFlushToZeroFloat64), from_vk(Bool, x.shaderRoundingModeRTEFloat16), from_vk(Bool, x.shaderRoundingModeRTEFloat32), from_vk(Bool, x.shaderRoundingModeRTEFloat64), from_vk(Bool, x.shaderRoundingModeRTZFloat16), from_vk(Bool, x.shaderRoundingModeRTZFloat32), from_vk(Bool, x.shaderRoundingModeRTZFloat64))

from_vk(T::Type{DescriptorSetLayoutSupport}, x::VkDescriptorSetLayoutSupport) = T(x.sType, x.pNext, from_vk(Bool, x.supported))

from_vk(T::Type{PhysicalDeviceMaintenance3Properties}, x::VkPhysicalDeviceMaintenance3Properties) = T(x.sType, x.pNext, x.maxPerSetDescriptors, x.maxMemoryAllocationSize)

from_vk(T::Type{PhysicalDeviceInlineUniformBlockPropertiesEXT}, x::VkPhysicalDeviceInlineUniformBlockPropertiesEXT) = T(x.sType, x.pNext, x.maxInlineUniformBlockSize, x.maxPerStageDescriptorInlineUniformBlocks, x.maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks, x.maxDescriptorSetInlineUniformBlocks, x.maxDescriptorSetUpdateAfterBindInlineUniformBlocks)

from_vk(T::Type{PhysicalDeviceBlendOperationAdvancedPropertiesEXT}, x::VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT) = T(x.sType, x.pNext, x.advancedBlendMaxColorAttachments, from_vk(Bool, x.advancedBlendIndependentBlend), from_vk(Bool, x.advancedBlendNonPremultipliedSrcColor), from_vk(Bool, x.advancedBlendNonPremultipliedDstColor), from_vk(Bool, x.advancedBlendCorrelatedOverlap), from_vk(Bool, x.advancedBlendAllOperations))

from_vk(T::Type{MultisamplePropertiesEXT}, x::VkMultisamplePropertiesEXT) = T(x.sType, x.pNext, from_vk(Extent2D, x.maxSampleLocationGridSize))

from_vk(T::Type{PhysicalDeviceSampleLocationsPropertiesEXT}, x::VkPhysicalDeviceSampleLocationsPropertiesEXT) = T(x.sType, x.pNext, x.sampleLocationSampleCounts, from_vk(Extent2D, x.maxSampleLocationGridSize), x.sampleLocationCoordinateRange, x.sampleLocationSubPixelBits, from_vk(Bool, x.variableSampleLocations))

from_vk(T::Type{PhysicalDeviceSamplerFilterMinmaxProperties}, x::VkPhysicalDeviceSamplerFilterMinmaxProperties) = T(x.sType, x.pNext, from_vk(Bool, x.filterMinmaxSingleComponentFormats), from_vk(Bool, x.filterMinmaxImageComponentMapping))

from_vk(T::Type{PhysicalDeviceProtectedMemoryProperties}, x::VkPhysicalDeviceProtectedMemoryProperties) = T(x.sType, x.pNext, from_vk(Bool, x.protectedNoFault))

from_vk(T::Type{TextureLODGatherFormatPropertiesAMD}, x::VkTextureLODGatherFormatPropertiesAMD) = T(x.sType, x.pNext, from_vk(Bool, x.supportsTextureGatherLODBiasAMD))

from_vk(T::Type{SamplerYcbcrConversionImageFormatProperties}, x::VkSamplerYcbcrConversionImageFormatProperties) = T(x.sType, x.pNext, x.combinedImageSamplerDescriptorCount)

from_vk(T::Type{MemoryDedicatedRequirements}, x::VkMemoryDedicatedRequirements) = T(x.sType, x.pNext, from_vk(Bool, x.prefersDedicatedAllocation), from_vk(Bool, x.requiresDedicatedAllocation))

from_vk(T::Type{PhysicalDevicePointClippingProperties}, x::VkPhysicalDevicePointClippingProperties) = T(x.sType, x.pNext, x.pointClippingBehavior)

from_vk(T::Type{SparseImageMemoryRequirements2}, x::VkSparseImageMemoryRequirements2) = T(x.sType, x.pNext, from_vk(SparseImageMemoryRequirements, x.memoryRequirements))

from_vk(T::Type{MemoryRequirements2}, x::VkMemoryRequirements2) = T(x.sType, x.pNext, from_vk(MemoryRequirements, x.memoryRequirements))

from_vk(T::Type{PhysicalDeviceSubgroupProperties}, x::VkPhysicalDeviceSubgroupProperties) = T(x.sType, x.pNext, x.subgroupSize, x.supportedStages, x.supportedOperations, from_vk(Bool, x.quadOperationsInAllStages))

from_vk(T::Type{SharedPresentSurfaceCapabilitiesKHR}, x::VkSharedPresentSurfaceCapabilitiesKHR) = T(x.sType, x.pNext, x.sharedPresentSupportedUsageFlags)

from_vk(T::Type{DisplayPlaneCapabilities2KHR}, x::VkDisplayPlaneCapabilities2KHR) = T(x.sType, x.pNext, from_vk(DisplayPlaneCapabilitiesKHR, x.capabilities))

from_vk(T::Type{DisplayModeProperties2KHR}, x::VkDisplayModeProperties2KHR) = T(x.sType, x.pNext, from_vk(DisplayModePropertiesKHR, x.displayModeProperties))

from_vk(T::Type{DisplayPlaneProperties2KHR}, x::VkDisplayPlaneProperties2KHR) = T(x.sType, x.pNext, from_vk(DisplayPlanePropertiesKHR, x.displayPlaneProperties))

from_vk(T::Type{DisplayProperties2KHR}, x::VkDisplayProperties2KHR) = T(x.sType, x.pNext, from_vk(DisplayPropertiesKHR, x.displayProperties))

from_vk(T::Type{SurfaceFormat2KHR}, x::VkSurfaceFormat2KHR) = T(x.sType, x.pNext, from_vk(SurfaceFormatKHR, x.surfaceFormat))

from_vk(T::Type{SurfaceCapabilities2KHR}, x::VkSurfaceCapabilities2KHR) = T(x.sType, x.pNext, from_vk(SurfaceCapabilitiesKHR, x.surfaceCapabilities))

from_vk(T::Type{PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX}, x::VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX) = T(x.sType, x.pNext, from_vk(Bool, x.perViewPositionAllComponents))

from_vk(T::Type{PhysicalDeviceDiscardRectanglePropertiesEXT}, x::VkPhysicalDeviceDiscardRectanglePropertiesEXT) = T(x.sType, x.pNext, x.maxDiscardRectangles)

from_vk(T::Type{PastPresentationTimingGOOGLE}, x::VkPastPresentationTimingGOOGLE) = T(x.presentID, x.desiredPresentTime, x.actualPresentTime, x.earliestPresentTime, x.presentMargin)

from_vk(T::Type{RefreshCycleDurationGOOGLE}, x::VkRefreshCycleDurationGOOGLE) = T(x.refreshDuration)

from_vk(T::Type{DisplayNativeHdrSurfaceCapabilitiesAMD}, x::VkDisplayNativeHdrSurfaceCapabilitiesAMD) = T(x.sType, x.pNext, from_vk(Bool, x.localDimmingSupport))

from_vk(T::Type{DeviceGroupPresentCapabilitiesKHR}, x::VkDeviceGroupPresentCapabilitiesKHR) = T(x.sType, x.pNext, x.presentMask, x.modes)

from_vk(T::Type{PhysicalDeviceGroupProperties}, x::VkPhysicalDeviceGroupProperties) = T(x.sType, x.pNext, x.physicalDeviceCount, x.physicalDevices, from_vk(Bool, x.subsetAllocation))

from_vk(T::Type{SurfaceCapabilities2EXT}, x::VkSurfaceCapabilities2EXT) = T(x.sType, x.pNext, x.minImageCount, x.maxImageCount, from_vk(Extent2D, x.currentExtent), from_vk(Extent2D, x.minImageExtent), from_vk(Extent2D, x.maxImageExtent), x.maxImageArrayLayers, x.supportedTransforms, x.currentTransform, x.supportedCompositeAlpha, x.supportedUsageFlags, x.supportedSurfaceCounters)

from_vk(T::Type{PhysicalDeviceMultiviewProperties}, x::VkPhysicalDeviceMultiviewProperties) = T(x.sType, x.pNext, x.maxMultiviewViewCount, x.maxMultiviewInstanceIndex)

from_vk(T::Type{ExternalFenceProperties}, x::VkExternalFenceProperties) = T(x.sType, x.pNext, x.exportFromImportedHandleTypes, x.compatibleHandleTypes, x.externalFenceFeatures)

from_vk(T::Type{ExternalSemaphoreProperties}, x::VkExternalSemaphoreProperties) = T(x.sType, x.pNext, x.exportFromImportedHandleTypes, x.compatibleHandleTypes, x.externalSemaphoreFeatures)

from_vk(T::Type{MemoryFdPropertiesKHR}, x::VkMemoryFdPropertiesKHR) = T(x.sType, x.pNext, x.memoryTypeBits)

from_vk(T::Type{MemoryWin32HandlePropertiesKHR}, x::VkMemoryWin32HandlePropertiesKHR) = T(x.sType, x.pNext, x.memoryTypeBits)

from_vk(T::Type{PhysicalDeviceIDProperties}, x::VkPhysicalDeviceIDProperties) = T(x.sType, x.pNext, from_vk(String, x.deviceUUID), from_vk(String, x.driverUUID), from_vk(String, x.deviceLUID), x.deviceNodeMask, from_vk(Bool, x.deviceLUIDValid))

from_vk(T::Type{ExternalBufferProperties}, x::VkExternalBufferProperties) = T(x.sType, x.pNext, from_vk(ExternalMemoryProperties, x.externalMemoryProperties))

from_vk(T::Type{ExternalImageFormatProperties}, x::VkExternalImageFormatProperties) = T(x.sType, x.pNext, from_vk(ExternalMemoryProperties, x.externalMemoryProperties))

from_vk(T::Type{ExternalMemoryProperties}, x::VkExternalMemoryProperties) = T(x.externalMemoryFeatures, x.exportFromImportedHandleTypes, x.compatibleHandleTypes)

from_vk(T::Type{PhysicalDeviceDriverProperties}, x::VkPhysicalDeviceDriverProperties) = T(x.sType, x.pNext, x.driverID, from_vk(String, x.driverName), from_vk(String, x.driverInfo), from_vk(ConformanceVersion, x.conformanceVersion))

from_vk(T::Type{PhysicalDevicePushDescriptorPropertiesKHR}, x::VkPhysicalDevicePushDescriptorPropertiesKHR) = T(x.sType, x.pNext, x.maxPushDescriptors)

from_vk(T::Type{SparseImageFormatProperties2}, x::VkSparseImageFormatProperties2) = T(x.sType, x.pNext, from_vk(SparseImageFormatProperties, x.properties))

from_vk(T::Type{PhysicalDeviceMemoryProperties2}, x::VkPhysicalDeviceMemoryProperties2) = T(x.sType, x.pNext, from_vk(PhysicalDeviceMemoryProperties, x.memoryProperties))

from_vk(T::Type{QueueFamilyProperties2}, x::VkQueueFamilyProperties2) = T(x.sType, x.pNext, from_vk(QueueFamilyProperties, x.queueFamilyProperties))

from_vk(T::Type{ImageFormatProperties2}, x::VkImageFormatProperties2) = T(x.sType, x.pNext, from_vk(ImageFormatProperties, x.imageFormatProperties))

from_vk(T::Type{FormatProperties2}, x::VkFormatProperties2) = T(x.sType, x.pNext, from_vk(FormatProperties, x.formatProperties))

from_vk(T::Type{PhysicalDeviceProperties2}, x::VkPhysicalDeviceProperties2) = T(x.sType, x.pNext, from_vk(PhysicalDeviceProperties, x.properties))

from_vk(T::Type{PhysicalDeviceDeviceGeneratedCommandsPropertiesNV}, x::VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV) = T(x.sType, x.pNext, x.maxGraphicsShaderGroupCount, x.maxIndirectSequenceCount, x.maxIndirectCommandsTokenCount, x.maxIndirectCommandsStreamCount, x.maxIndirectCommandsTokenOffset, x.maxIndirectCommandsStreamStride, x.minSequencesCountBufferOffsetAlignment, x.minSequencesIndexBufferOffsetAlignment, x.minIndirectCommandsBufferOffsetAlignment)

from_vk(T::Type{ExternalImageFormatPropertiesNV}, x::VkExternalImageFormatPropertiesNV) = T(from_vk(ImageFormatProperties, x.imageFormatProperties), x.externalMemoryFeatures, x.exportFromImportedHandleTypes, x.compatibleHandleTypes)

from_vk(T::Type{SurfaceFormatKHR}, x::VkSurfaceFormatKHR) = T(x.format, x.colorSpace)

from_vk(T::Type{SurfaceCapabilitiesKHR}, x::VkSurfaceCapabilitiesKHR) = T(x.minImageCount, x.maxImageCount, from_vk(Extent2D, x.currentExtent), from_vk(Extent2D, x.minImageExtent), from_vk(Extent2D, x.maxImageExtent), x.maxImageArrayLayers, x.supportedTransforms, x.currentTransform, x.supportedCompositeAlpha, x.supportedUsageFlags)

from_vk(T::Type{DisplayPlaneCapabilitiesKHR}, x::VkDisplayPlaneCapabilitiesKHR) = T(x.supportedAlpha, from_vk(Offset2D, x.minSrcPosition), from_vk(Offset2D, x.maxSrcPosition), from_vk(Extent2D, x.minSrcExtent), from_vk(Extent2D, x.maxSrcExtent), from_vk(Offset2D, x.minDstPosition), from_vk(Offset2D, x.maxDstPosition), from_vk(Extent2D, x.minDstExtent), from_vk(Extent2D, x.maxDstExtent))

from_vk(T::Type{DisplayModePropertiesKHR}, x::VkDisplayModePropertiesKHR) = T(DisplayModeKHR(x.displayMode), from_vk(DisplayModeParametersKHR, x.parameters))

from_vk(T::Type{DisplayPlanePropertiesKHR}, x::VkDisplayPlanePropertiesKHR) = T(DisplayKHR(x.currentDisplay), x.currentStackIndex)

from_vk(T::Type{DisplayPropertiesKHR}, x::VkDisplayPropertiesKHR) = T(DisplayKHR(x.display), unsafe_string(x.displayName), from_vk(Extent2D, x.physicalDimensions), from_vk(Extent2D, x.physicalResolution), x.supportedTransforms, from_vk(Bool, x.planeReorderPossible), from_vk(Bool, x.persistentContent))

from_vk(T::Type{PhysicalDeviceLimits}, x::VkPhysicalDeviceLimits) = T(x.maxImageDimension1D, x.maxImageDimension2D, x.maxImageDimension3D, x.maxImageDimensionCube, x.maxImageArrayLayers, x.maxTexelBufferElements, x.maxUniformBufferRange, x.maxStorageBufferRange, x.maxPushConstantsSize, x.maxMemoryAllocationCount, x.maxSamplerAllocationCount, x.bufferImageGranularity, x.sparseAddressSpaceSize, x.maxBoundDescriptorSets, x.maxPerStageDescriptorSamplers, x.maxPerStageDescriptorUniformBuffers, x.maxPerStageDescriptorStorageBuffers, x.maxPerStageDescriptorSampledImages, x.maxPerStageDescriptorStorageImages, x.maxPerStageDescriptorInputAttachments, x.maxPerStageResources, x.maxDescriptorSetSamplers, x.maxDescriptorSetUniformBuffers, x.maxDescriptorSetUniformBuffersDynamic, x.maxDescriptorSetStorageBuffers, x.maxDescriptorSetStorageBuffersDynamic, x.maxDescriptorSetSampledImages, x.maxDescriptorSetStorageImages, x.maxDescriptorSetInputAttachments, x.maxVertexInputAttributes, x.maxVertexInputBindings, x.maxVertexInputAttributeOffset, x.maxVertexInputBindingStride, x.maxVertexOutputComponents, x.maxTessellationGenerationLevel, x.maxTessellationPatchSize, x.maxTessellationControlPerVertexInputComponents, x.maxTessellationControlPerVertexOutputComponents, x.maxTessellationControlPerPatchOutputComponents, x.maxTessellationControlTotalOutputComponents, x.maxTessellationEvaluationInputComponents, x.maxTessellationEvaluationOutputComponents, x.maxGeometryShaderInvocations, x.maxGeometryInputComponents, x.maxGeometryOutputComponents, x.maxGeometryOutputVertices, x.maxGeometryTotalOutputComponents, x.maxFragmentInputComponents, x.maxFragmentOutputAttachments, x.maxFragmentDualSrcAttachments, x.maxFragmentCombinedOutputResources, x.maxComputeSharedMemorySize, x.maxComputeWorkGroupCount, x.maxComputeWorkGroupInvocations, x.maxComputeWorkGroupSize, x.subPixelPrecisionBits, x.subTexelPrecisionBits, x.mipmapPrecisionBits, x.maxDrawIndexedIndexValue, x.maxDrawIndirectCount, x.maxSamplerLodBias, x.maxSamplerAnisotropy, x.maxViewports, x.maxViewportDimensions, x.viewportBoundsRange, x.viewportSubPixelBits, x.minMemoryMapAlignment, x.minTexelBufferOffsetAlignment, x.minUniformBufferOffsetAlignment, x.minStorageBufferOffsetAlignment, x.minTexelOffset, x.maxTexelOffset, x.minTexelGatherOffset, x.maxTexelGatherOffset, x.minInterpolationOffset, x.maxInterpolationOffset, x.subPixelInterpolationOffsetBits, x.maxFramebufferWidth, x.maxFramebufferHeight, x.maxFramebufferLayers, x.framebufferColorSampleCounts, x.framebufferDepthSampleCounts, x.framebufferStencilSampleCounts, x.framebufferNoAttachmentsSampleCounts, x.maxColorAttachments, x.sampledImageColorSampleCounts, x.sampledImageIntegerSampleCounts, x.sampledImageDepthSampleCounts, x.sampledImageStencilSampleCounts, x.storageImageSampleCounts, x.maxSampleMaskWords, from_vk(Bool, x.timestampComputeAndGraphics), x.timestampPeriod, x.maxClipDistances, x.maxCullDistances, x.maxCombinedClipAndCullDistances, x.discreteQueuePriorities, x.pointSizeRange, x.lineWidthRange, x.pointSizeGranularity, x.lineWidthGranularity, from_vk(Bool, x.strictLines), from_vk(Bool, x.standardSampleLocations), x.optimalBufferCopyOffsetAlignment, x.optimalBufferCopyRowPitchAlignment, x.nonCoherentAtomSize)

from_vk(T::Type{PhysicalDeviceSparseProperties}, x::VkPhysicalDeviceSparseProperties) = T(from_vk(Bool, x.residencyStandard2DBlockShape), from_vk(Bool, x.residencyStandard2DMultisampleBlockShape), from_vk(Bool, x.residencyStandard3DBlockShape), from_vk(Bool, x.residencyAlignedMipSize), from_vk(Bool, x.residencyNonResidentStrict))

from_vk(T::Type{SubresourceLayout}, x::VkSubresourceLayout) = T(x.offset, x.size, x.rowPitch, x.arrayPitch, x.depthPitch)

from_vk(T::Type{ImageFormatProperties}, x::VkImageFormatProperties) = T(from_vk(Extent3D, x.maxExtent), x.maxMipLevels, x.maxArrayLayers, x.sampleCounts, x.maxResourceSize)

from_vk(T::Type{FormatProperties}, x::VkFormatProperties) = T(x.linearTilingFeatures, x.optimalTilingFeatures, x.bufferFeatures)

from_vk(T::Type{MemoryHeap}, x::VkMemoryHeap) = T(x.size, x.flags)

from_vk(T::Type{MemoryType}, x::VkMemoryType) = T(x.propertyFlags, x.heapIndex)

from_vk(T::Type{SparseImageMemoryRequirements}, x::VkSparseImageMemoryRequirements) = T(from_vk(SparseImageFormatProperties, x.formatProperties), x.imageMipTailFirstLod, x.imageMipTailSize, x.imageMipTailOffset, x.imageMipTailStride)

from_vk(T::Type{SparseImageFormatProperties}, x::VkSparseImageFormatProperties) = T(x.aspectMask, from_vk(Extent3D, x.imageGranularity), x.flags)

from_vk(T::Type{MemoryRequirements}, x::VkMemoryRequirements) = T(x.size, x.alignment, x.memoryTypeBits)

from_vk(T::Type{PhysicalDeviceMemoryProperties}, x::VkPhysicalDeviceMemoryProperties) = T(x.memoryTypeCount, from_vk.(MemoryType, x.memoryTypes), x.memoryHeapCount, from_vk.(MemoryHeap, x.memoryHeaps))

from_vk(T::Type{QueueFamilyProperties}, x::VkQueueFamilyProperties) = T(x.queueFlags, x.queueCount, x.timestampValidBits, from_vk(Extent3D, x.minImageTransferGranularity))

from_vk(T::Type{LayerProperties}, x::VkLayerProperties) = T(from_vk(String, x.layerName), from_vk(VersionNumber, x.specVersion), from_vk(VersionNumber, x.implementationVersion), from_vk(String, x.description))

from_vk(T::Type{ExtensionProperties}, x::VkExtensionProperties) = T(from_vk(String, x.extensionName), from_vk(VersionNumber, x.specVersion))

from_vk(T::Type{PhysicalDeviceProperties}, x::VkPhysicalDeviceProperties) = T(from_vk(VersionNumber, x.apiVersion), from_vk(VersionNumber, x.driverVersion), x.vendorID, x.deviceID, x.deviceType, from_vk(String, x.deviceName), from_vk(String, x.pipelineCacheUUID), from_vk(PhysicalDeviceLimits, x.limits), from_vk(PhysicalDeviceSparseProperties, x.sparseProperties))

function PhysicalDevice4444FormatsFeaturesEXT(format_a4r4g4b4::Bool, format_a4b4g4r4::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDevice4444FormatsFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), format_a4r4g4b4, format_a4b4g4r4)
    PhysicalDevice4444FormatsFeaturesEXT(vks, deps)
end

function PhysicalDeviceImageRobustnessFeaturesEXT(robust_image_access::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceImageRobustnessFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), robust_image_access)
    PhysicalDeviceImageRobustnessFeaturesEXT(vks, deps)
end

function PhysicalDeviceRobustness2FeaturesEXT(robust_buffer_access_2::Bool, robust_image_access_2::Bool, null_descriptor::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceRobustness2FeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), robust_buffer_access_2, robust_image_access_2, null_descriptor)
    PhysicalDeviceRobustness2FeaturesEXT(vks, deps)
end

function DeviceDiagnosticsConfigCreateInfoNV(; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceDiagnosticsConfigCreateInfoNV(VK_STRUCTURE_TYPE_DEVICE_DIAGNOSTICS_CONFIG_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), flags)
    DeviceDiagnosticsConfigCreateInfoNV(vks, deps)
end

function PhysicalDeviceDiagnosticsConfigFeaturesNV(diagnostics_config::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceDiagnosticsConfigFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DIAGNOSTICS_CONFIG_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), diagnostics_config)
    PhysicalDeviceDiagnosticsConfigFeaturesNV(vks, deps)
end

function CommandBufferInheritanceRenderPassTransformInfoQCOM(transform::VkSurfaceTransformFlagBitsKHR, render_area::Rect2D; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCommandBufferInheritanceRenderPassTransformInfoQCOM(VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDER_PASS_TRANSFORM_INFO_QCOM, unsafe_convert(Ptr{Cvoid}, next), transform, render_area.vks)
    CommandBufferInheritanceRenderPassTransformInfoQCOM(vks, deps)
end

function RenderPassTransformBeginInfoQCOM(transform::VkSurfaceTransformFlagBitsKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkRenderPassTransformBeginInfoQCOM(VK_STRUCTURE_TYPE_RENDER_PASS_TRANSFORM_BEGIN_INFO_QCOM, unsafe_convert(Ptr{Cvoid}, next), transform)
    RenderPassTransformBeginInfoQCOM(vks, deps)
end

function PhysicalDeviceExtendedDynamicStateFeaturesEXT(extended_dynamic_state::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceExtendedDynamicStateFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), extended_dynamic_state)
    PhysicalDeviceExtendedDynamicStateFeaturesEXT(vks, deps)
end

function PipelineLibraryCreateInfoKHR(libraries::AbstractArray{<:Pipeline}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    libraries = cconvert(Ptr{VkPipeline}, libraries)
    deps = [next, libraries]
    vks = VkPipelineLibraryCreateInfoKHR(VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), pointer_length(libraries), unsafe_convert(Ptr{VkPipeline}, libraries))
    PipelineLibraryCreateInfoKHR(vks, deps)
end

function DeferredOperationInfoKHR(operation_handle::DeferredOperationKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeferredOperationInfoKHR(VK_STRUCTURE_TYPE_DEFERRED_OPERATION_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), operation_handle)
    DeferredOperationInfoKHR(vks, deps)
end

function RayTracingPipelineInterfaceCreateInfoKHR(max_payload_size::Integer, max_attribute_size::Integer, max_callable_size::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkRayTracingPipelineInterfaceCreateInfoKHR(VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), max_payload_size, max_attribute_size, max_callable_size)
    RayTracingPipelineInterfaceCreateInfoKHR(vks, deps)
end

function CopyMemoryToAccelerationStructureInfoKHR(src::DeviceOrHostAddressConstKHR, dst::AccelerationStructureKHR, mode::VkCopyAccelerationStructureModeKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCopyMemoryToAccelerationStructureInfoKHR(VK_STRUCTURE_TYPE_COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), src.vks, dst, mode)
    CopyMemoryToAccelerationStructureInfoKHR(vks, deps)
end

function CopyAccelerationStructureToMemoryInfoKHR(src::AccelerationStructureKHR, dst::DeviceOrHostAddressKHR, mode::VkCopyAccelerationStructureModeKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCopyAccelerationStructureToMemoryInfoKHR(VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_TO_MEMORY_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), src, dst.vks, mode)
    CopyAccelerationStructureToMemoryInfoKHR(vks, deps)
end

function CopyAccelerationStructureInfoKHR(src::AccelerationStructureKHR, dst::AccelerationStructureKHR, mode::VkCopyAccelerationStructureModeKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCopyAccelerationStructureInfoKHR(VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), src, dst, mode)
    CopyAccelerationStructureInfoKHR(vks, deps)
end

function AccelerationStructureVersionKHR(version_data::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    version_data = cconvert(Ptr{UInt8}, version_data)
    deps = [next, version_data]
    vks = VkAccelerationStructureVersionKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_KHR, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Ptr{UInt8}, version_data))
    AccelerationStructureVersionKHR(vks, deps)
end

function AccelerationStructureDeviceAddressInfoKHR(acceleration_structure::AccelerationStructureKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureDeviceAddressInfoKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), acceleration_structure)
    AccelerationStructureDeviceAddressInfoKHR(vks, deps)
end

function AccelerationStructureInstanceKHR(transform::TransformMatrixKHR, instance_custom_index::Integer, mask::Integer, instance_shader_binding_table_record_offset::Integer, acceleration_structure_reference::Integer; flags = 0)
    AccelerationStructureInstanceKHR(VkAccelerationStructureInstanceKHR(transform.vks, instance_custom_index, mask, instance_shader_binding_table_record_offset, flags, acceleration_structure_reference))
end

function TransformMatrixKHR(matrix::NTuple{3, NTuple{4, Float32}})
    TransformMatrixKHR(VkTransformMatrixKHR(matrix))
end

function AabbPositionsKHR(min_x::Real, min_y::Real, min_z::Real, max_x::Real, max_y::Real, max_z::Real)
    AabbPositionsKHR(VkAabbPositionsKHR(min_x, min_y, min_z, max_x, max_y, max_z))
end

function AccelerationStructureCreateInfoKHR(compacted_size::Integer, type::VkAccelerationStructureTypeKHR, geometry_infos::AbstractArray{<:AccelerationStructureCreateGeometryTypeInfoKHR}; next = C_NULL, flags = 0, device_address = 0)
    next = cconvert(Ptr{Cvoid}, next)
    geometry_infos = cconvert(Ptr{VkAccelerationStructureCreateGeometryTypeInfoKHR}, geometry_infos)
    deps = [next, geometry_infos]
    vks = VkAccelerationStructureCreateInfoKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), compacted_size, type, flags, pointer_length(geometry_infos), unsafe_convert(Ptr{VkAccelerationStructureCreateGeometryTypeInfoKHR}, geometry_infos), device_address)
    AccelerationStructureCreateInfoKHR(vks, deps)
end

function AccelerationStructureCreateGeometryTypeInfoKHR(geometry_type::VkGeometryTypeKHR, max_primitive_count::Integer, index_type::VkIndexType; next = C_NULL, max_vertex_count = 0, vertex_format = 0, allows_transforms = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureCreateGeometryTypeInfoKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_GEOMETRY_TYPE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), geometry_type, max_primitive_count, index_type, max_vertex_count, vertex_format, allows_transforms)
    AccelerationStructureCreateGeometryTypeInfoKHR(vks, deps)
end

function AccelerationStructureBuildOffsetInfoKHR(primitive_count::Integer, primitive_offset::Integer; first_vertex = 0, transform_offset = 0)
    AccelerationStructureBuildOffsetInfoKHR(VkAccelerationStructureBuildOffsetInfoKHR(primitive_count, primitive_offset, first_vertex, transform_offset))
end

function AccelerationStructureBuildGeometryInfoKHR(type::VkAccelerationStructureTypeKHR, update::Bool, dst_acceleration_structure::AccelerationStructureKHR, geometry_array_of_pointers::Bool, geometries::AccelerationStructureGeometryKHR, scratch_data::DeviceOrHostAddressKHR; next = C_NULL, flags = 0, src_acceleration_structure = C_NULL, geometry_count = 0)
    next = cconvert(Ptr{Cvoid}, next)
    geometries = cconvert(Ptr{Ptr{VkAccelerationStructureGeometryKHR}}, geometries)
    deps = [next, geometries]
    vks = VkAccelerationStructureBuildGeometryInfoKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), type, flags, update, src_acceleration_structure, dst_acceleration_structure, geometry_array_of_pointers, geometry_count, unsafe_convert(Ptr{Ptr{VkAccelerationStructureGeometryKHR}}, geometries), scratch_data.vks)
    AccelerationStructureBuildGeometryInfoKHR(vks, deps)
end

function AccelerationStructureGeometryKHR(geometry_type::VkGeometryTypeKHR, geometry::AccelerationStructureGeometryDataKHR; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureGeometryKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_KHR, unsafe_convert(Ptr{Cvoid}, next), geometry_type, geometry.vks, flags)
    AccelerationStructureGeometryKHR(vks, deps)
end

function AccelerationStructureGeometryDataKHR(triangles::AccelerationStructureGeometryTrianglesDataKHR, aabbs::AccelerationStructureGeometryAabbsDataKHR, instances::AccelerationStructureGeometryInstancesDataKHR)
    AccelerationStructureGeometryDataKHR(VkAccelerationStructureGeometryDataKHR(triangles.vks, aabbs.vks, instances.vks))
end

function AccelerationStructureGeometryInstancesDataKHR(array_of_pointers::Bool, data::DeviceOrHostAddressConstKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureGeometryInstancesDataKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR, unsafe_convert(Ptr{Cvoid}, next), array_of_pointers, data.vks)
    AccelerationStructureGeometryInstancesDataKHR(vks, deps)
end

function AccelerationStructureGeometryAabbsDataKHR(data::DeviceOrHostAddressConstKHR, stride::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureGeometryAabbsDataKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR, unsafe_convert(Ptr{Cvoid}, next), data.vks, stride)
    AccelerationStructureGeometryAabbsDataKHR(vks, deps)
end

function AccelerationStructureGeometryTrianglesDataKHR(vertex_format::VkFormat, vertex_data::DeviceOrHostAddressConstKHR, vertex_stride::Integer, index_type::VkIndexType; next = C_NULL, index_data = 0, transform_data = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureGeometryTrianglesDataKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR, unsafe_convert(Ptr{Cvoid}, next), vertex_format, vertex_data.vks, vertex_stride, index_type, index_data.vks, transform_data.vks)
    AccelerationStructureGeometryTrianglesDataKHR(vks, deps)
end

function DeviceOrHostAddressConstKHR(device_address::Integer, host_address::Ptr{Cvoid})
    host_address = cconvert(Ptr{Cvoid}, host_address)
    deps = [host_address]
    vks = VkDeviceOrHostAddressConstKHR(device_address, unsafe_convert(Ptr{Cvoid}, host_address))
    DeviceOrHostAddressConstKHR(vks, deps)
end

function DeviceOrHostAddressKHR(device_address::Integer, host_address::Ptr{Cvoid})
    host_address = cconvert(Ptr{Cvoid}, host_address)
    deps = [host_address]
    vks = VkDeviceOrHostAddressKHR(device_address, unsafe_convert(Ptr{Cvoid}, host_address))
    DeviceOrHostAddressKHR(vks, deps)
end

function PhysicalDeviceCustomBorderColorFeaturesEXT(custom_border_colors::Bool, custom_border_color_without_format::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceCustomBorderColorFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), custom_border_colors, custom_border_color_without_format)
    PhysicalDeviceCustomBorderColorFeaturesEXT(vks, deps)
end

function SamplerCustomBorderColorCreateInfoEXT(custom_border_color::ClearColorValue, format::VkFormat; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSamplerCustomBorderColorCreateInfoEXT(VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), custom_border_color.vks, format)
    SamplerCustomBorderColorCreateInfoEXT(vks, deps)
end

function PhysicalDeviceCoherentMemoryFeaturesAMD(device_coherent_memory::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceCoherentMemoryFeaturesAMD(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COHERENT_MEMORY_FEATURES_AMD, unsafe_convert(Ptr{Cvoid}, next), device_coherent_memory)
    PhysicalDeviceCoherentMemoryFeaturesAMD(vks, deps)
end

function PipelineCompilerControlCreateInfoAMD(; next = C_NULL, compiler_control_flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineCompilerControlCreateInfoAMD(VK_STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD, unsafe_convert(Ptr{Cvoid}, next), compiler_control_flags)
    PipelineCompilerControlCreateInfoAMD(vks, deps)
end

function PhysicalDeviceVulkan12Features(sampler_mirror_clamp_to_edge::Bool, draw_indirect_count::Bool, storage_buffer_8_bit_access::Bool, uniform_and_storage_buffer_8_bit_access::Bool, storage_push_constant_8::Bool, shader_buffer_int_64_atomics::Bool, shader_shared_int_64_atomics::Bool, shader_float_16::Bool, shader_int_8::Bool, descriptor_indexing::Bool, shader_input_attachment_array_dynamic_indexing::Bool, shader_uniform_texel_buffer_array_dynamic_indexing::Bool, shader_storage_texel_buffer_array_dynamic_indexing::Bool, shader_uniform_buffer_array_non_uniform_indexing::Bool, shader_sampled_image_array_non_uniform_indexing::Bool, shader_storage_buffer_array_non_uniform_indexing::Bool, shader_storage_image_array_non_uniform_indexing::Bool, shader_input_attachment_array_non_uniform_indexing::Bool, shader_uniform_texel_buffer_array_non_uniform_indexing::Bool, shader_storage_texel_buffer_array_non_uniform_indexing::Bool, descriptor_binding_uniform_buffer_update_after_bind::Bool, descriptor_binding_sampled_image_update_after_bind::Bool, descriptor_binding_storage_image_update_after_bind::Bool, descriptor_binding_storage_buffer_update_after_bind::Bool, descriptor_binding_uniform_texel_buffer_update_after_bind::Bool, descriptor_binding_storage_texel_buffer_update_after_bind::Bool, descriptor_binding_update_unused_while_pending::Bool, descriptor_binding_partially_bound::Bool, descriptor_binding_variable_descriptor_count::Bool, runtime_descriptor_array::Bool, sampler_filter_minmax::Bool, scalar_block_layout::Bool, imageless_framebuffer::Bool, uniform_buffer_standard_layout::Bool, shader_subgroup_extended_types::Bool, separate_depth_stencil_layouts::Bool, host_query_reset::Bool, timeline_semaphore::Bool, buffer_device_address::Bool, buffer_device_address_capture_replay::Bool, buffer_device_address_multi_device::Bool, vulkan_memory_model::Bool, vulkan_memory_model_device_scope::Bool, vulkan_memory_model_availability_visibility_chains::Bool, shader_output_viewport_index::Bool, shader_output_layer::Bool, subgroup_broadcast_dynamic_id::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceVulkan12Features(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES, unsafe_convert(Ptr{Cvoid}, next), sampler_mirror_clamp_to_edge, draw_indirect_count, storage_buffer_8_bit_access, uniform_and_storage_buffer_8_bit_access, storage_push_constant_8, shader_buffer_int_64_atomics, shader_shared_int_64_atomics, shader_float_16, shader_int_8, descriptor_indexing, shader_input_attachment_array_dynamic_indexing, shader_uniform_texel_buffer_array_dynamic_indexing, shader_storage_texel_buffer_array_dynamic_indexing, shader_uniform_buffer_array_non_uniform_indexing, shader_sampled_image_array_non_uniform_indexing, shader_storage_buffer_array_non_uniform_indexing, shader_storage_image_array_non_uniform_indexing, shader_input_attachment_array_non_uniform_indexing, shader_uniform_texel_buffer_array_non_uniform_indexing, shader_storage_texel_buffer_array_non_uniform_indexing, descriptor_binding_uniform_buffer_update_after_bind, descriptor_binding_sampled_image_update_after_bind, descriptor_binding_storage_image_update_after_bind, descriptor_binding_storage_buffer_update_after_bind, descriptor_binding_uniform_texel_buffer_update_after_bind, descriptor_binding_storage_texel_buffer_update_after_bind, descriptor_binding_update_unused_while_pending, descriptor_binding_partially_bound, descriptor_binding_variable_descriptor_count, runtime_descriptor_array, sampler_filter_minmax, scalar_block_layout, imageless_framebuffer, uniform_buffer_standard_layout, shader_subgroup_extended_types, separate_depth_stencil_layouts, host_query_reset, timeline_semaphore, buffer_device_address, buffer_device_address_capture_replay, buffer_device_address_multi_device, vulkan_memory_model, vulkan_memory_model_device_scope, vulkan_memory_model_availability_visibility_chains, shader_output_viewport_index, shader_output_layer, subgroup_broadcast_dynamic_id)
    PhysicalDeviceVulkan12Features(vks, deps)
end

function PhysicalDeviceVulkan11Features(storage_buffer_16_bit_access::Bool, uniform_and_storage_buffer_16_bit_access::Bool, storage_push_constant_16::Bool, storage_input_output_16::Bool, multiview::Bool, multiview_geometry_shader::Bool, multiview_tessellation_shader::Bool, variable_pointers_storage_buffer::Bool, variable_pointers::Bool, protected_memory::Bool, sampler_ycbcr_conversion::VersionNumber, shader_draw_parameters::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceVulkan11Features(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES, unsafe_convert(Ptr{Cvoid}, next), storage_buffer_16_bit_access, uniform_and_storage_buffer_16_bit_access, storage_push_constant_16, storage_input_output_16, multiview, multiview_geometry_shader, multiview_tessellation_shader, variable_pointers_storage_buffer, variable_pointers, protected_memory, to_vk(VkBool32, sampler_ycbcr_conversion), shader_draw_parameters)
    PhysicalDeviceVulkan11Features(vks, deps)
end

function PhysicalDevicePipelineCreationCacheControlFeaturesEXT(pipeline_creation_cache_control::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDevicePipelineCreationCacheControlFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), pipeline_creation_cache_control)
    PhysicalDevicePipelineCreationCacheControlFeaturesEXT(vks, deps)
end

function PipelineRasterizationLineStateCreateInfoEXT(line_rasterization_mode::VkLineRasterizationModeEXT, stippled_line_enable::Bool; next = C_NULL, line_stipple_factor = 0, line_stipple_pattern = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineRasterizationLineStateCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), line_rasterization_mode, stippled_line_enable, line_stipple_factor, line_stipple_pattern)
    PipelineRasterizationLineStateCreateInfoEXT(vks, deps)
end

function PhysicalDeviceLineRasterizationFeaturesEXT(rectangular_lines::Bool, bresenham_lines::Bool, smooth_lines::Bool, stippled_rectangular_lines::Bool, stippled_bresenham_lines::Bool, stippled_smooth_lines::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceLineRasterizationFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), rectangular_lines, bresenham_lines, smooth_lines, stippled_rectangular_lines, stippled_bresenham_lines, stippled_smooth_lines)
    PhysicalDeviceLineRasterizationFeaturesEXT(vks, deps)
end

function DeviceMemoryOpaqueCaptureAddressInfo(memory::DeviceMemory; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceMemoryOpaqueCaptureAddressInfo(VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO, unsafe_convert(Ptr{Cvoid}, next), memory)
    DeviceMemoryOpaqueCaptureAddressInfo(vks, deps)
end

function MemoryOpaqueCaptureAddressAllocateInfo(opaque_capture_address::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryOpaqueCaptureAddressAllocateInfo(VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), opaque_capture_address)
    MemoryOpaqueCaptureAddressAllocateInfo(vks, deps)
end

function PhysicalDeviceSubgroupSizeControlFeaturesEXT(subgroup_size_control::Bool, compute_full_subgroups::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceSubgroupSizeControlFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), subgroup_size_control, compute_full_subgroups)
    PhysicalDeviceSubgroupSizeControlFeaturesEXT(vks, deps)
end

function PhysicalDeviceTexelBufferAlignmentFeaturesEXT(texel_buffer_alignment::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), texel_buffer_alignment)
    PhysicalDeviceTexelBufferAlignmentFeaturesEXT(vks, deps)
end

function PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT(shader_demote_to_helper_invocation::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), shader_demote_to_helper_invocation)
    PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT(vks, deps)
end

function PipelineExecutableInfoKHR(pipeline::Pipeline, executable_index::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineExecutableInfoKHR(VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), pipeline, executable_index)
    PipelineExecutableInfoKHR(vks, deps)
end

function PipelineInfoKHR(pipeline::Pipeline; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineInfoKHR(VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), pipeline)
    PipelineInfoKHR(vks, deps)
end

function PhysicalDevicePipelineExecutablePropertiesFeaturesKHR(pipeline_executable_info::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_EXECUTABLE_PROPERTIES_FEATURES_KHR, unsafe_convert(Ptr{Cvoid}, next), pipeline_executable_info)
    PhysicalDevicePipelineExecutablePropertiesFeaturesKHR(vks, deps)
end

function AttachmentDescriptionStencilLayout(stencil_initial_layout::VkImageLayout, stencil_final_layout::VkImageLayout; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAttachmentDescriptionStencilLayout(VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT, unsafe_convert(Ptr{Cvoid}, next), stencil_initial_layout, stencil_final_layout)
    AttachmentDescriptionStencilLayout(vks, deps)
end

function AttachmentReferenceStencilLayout(stencil_layout::VkImageLayout; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAttachmentReferenceStencilLayout(VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT, unsafe_convert(Ptr{Cvoid}, next), stencil_layout)
    AttachmentReferenceStencilLayout(vks, deps)
end

function PhysicalDeviceSeparateDepthStencilLayoutsFeatures(separate_depth_stencil_layouts::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES, unsafe_convert(Ptr{Cvoid}, next), separate_depth_stencil_layouts)
    PhysicalDeviceSeparateDepthStencilLayoutsFeatures(vks, deps)
end

function PhysicalDeviceFragmentShaderInterlockFeaturesEXT(fragment_shader_sample_interlock::Bool, fragment_shader_pixel_interlock::Bool, fragment_shader_shading_rate_interlock::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), fragment_shader_sample_interlock, fragment_shader_pixel_interlock, fragment_shader_shading_rate_interlock)
    PhysicalDeviceFragmentShaderInterlockFeaturesEXT(vks, deps)
end

function PhysicalDeviceShaderSMBuiltinsFeaturesNV(shader_sm_builtins::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderSMBuiltinsFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), shader_sm_builtins)
    PhysicalDeviceShaderSMBuiltinsFeaturesNV(vks, deps)
end

function PhysicalDeviceIndexTypeUint8FeaturesEXT(index_type_uint_8::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceIndexTypeUint8FeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), index_type_uint_8)
    PhysicalDeviceIndexTypeUint8FeaturesEXT(vks, deps)
end

function PhysicalDeviceShaderClockFeaturesKHR(shader_subgroup_clock::Bool, shader_device_clock::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderClockFeaturesKHR(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR, unsafe_convert(Ptr{Cvoid}, next), shader_subgroup_clock, shader_device_clock)
    PhysicalDeviceShaderClockFeaturesKHR(vks, deps)
end

function PerformanceConfigurationAcquireInfoINTEL(type::VkPerformanceConfigurationTypeINTEL; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPerformanceConfigurationAcquireInfoINTEL(VK_STRUCTURE_TYPE_PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL, unsafe_convert(Ptr{Cvoid}, next), type)
    PerformanceConfigurationAcquireInfoINTEL(vks, deps)
end

function PerformanceOverrideInfoINTEL(type::VkPerformanceOverrideTypeINTEL, enable::Bool, parameter::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPerformanceOverrideInfoINTEL(VK_STRUCTURE_TYPE_PERFORMANCE_OVERRIDE_INFO_INTEL, unsafe_convert(Ptr{Cvoid}, next), type, enable, parameter)
    PerformanceOverrideInfoINTEL(vks, deps)
end

function PerformanceStreamMarkerInfoINTEL(marker::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPerformanceStreamMarkerInfoINTEL(VK_STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL, unsafe_convert(Ptr{Cvoid}, next), marker)
    PerformanceStreamMarkerInfoINTEL(vks, deps)
end

function PerformanceMarkerInfoINTEL(marker::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPerformanceMarkerInfoINTEL(VK_STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL, unsafe_convert(Ptr{Cvoid}, next), marker)
    PerformanceMarkerInfoINTEL(vks, deps)
end

function QueryPoolPerformanceQueryCreateInfoINTEL(performance_counters_sampling::VkQueryPoolSamplingModeINTEL; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkQueryPoolPerformanceQueryCreateInfoINTEL(VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL, unsafe_convert(Ptr{Cvoid}, next), performance_counters_sampling)
    QueryPoolPerformanceQueryCreateInfoINTEL(vks, deps)
end

function InitializePerformanceApiInfoINTEL(user_data::Ptr{Cvoid}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    user_data = cconvert(Ptr{Cvoid}, user_data)
    deps = [next, user_data]
    vks = VkInitializePerformanceApiInfoINTEL(VK_STRUCTURE_TYPE_INITIALIZE_PERFORMANCE_API_INFO_INTEL, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Ptr{Cvoid}, user_data))
    InitializePerformanceApiInfoINTEL(vks, deps)
end

function PerformanceValueINTEL(type::VkPerformanceValueTypeINTEL, data::PerformanceValueDataINTEL)
    PerformanceValueINTEL(VkPerformanceValueINTEL(type, data.vks))
end

function PerformanceValueDataINTEL(value32::Integer, value64::Integer, value_float::Real, value_bool::Bool, value_string::AbstractString)
    value_string = cconvert(Cstring, value_string)
    deps = [value_string]
    vks = VkPerformanceValueDataINTEL(value32, value64, value_float, value_bool, unsafe_convert(Cstring, value_string))
    PerformanceValueDataINTEL(vks, deps)
end

function PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL(shader_integer_functions_2::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL, unsafe_convert(Ptr{Cvoid}, next), shader_integer_functions_2)
    PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL(vks, deps)
end

function PipelineCoverageReductionStateCreateInfoNV(coverage_reduction_mode::VkCoverageReductionModeNV; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineCoverageReductionStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_REDUCTION_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), flags, coverage_reduction_mode)
    PipelineCoverageReductionStateCreateInfoNV(vks, deps)
end

function PhysicalDeviceCoverageReductionModeFeaturesNV(coverage_reduction_mode::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceCoverageReductionModeFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COVERAGE_REDUCTION_MODE_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), coverage_reduction_mode)
    PhysicalDeviceCoverageReductionModeFeaturesNV(vks, deps)
end

function HeadlessSurfaceCreateInfoEXT(; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkHeadlessSurfaceCreateInfoEXT(VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags)
    HeadlessSurfaceCreateInfoEXT(vks, deps)
end

function PerformanceQuerySubmitInfoKHR(counter_pass_index::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPerformanceQuerySubmitInfoKHR(VK_STRUCTURE_TYPE_PERFORMANCE_QUERY_SUBMIT_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), counter_pass_index)
    PerformanceQuerySubmitInfoKHR(vks, deps)
end

function AcquireProfilingLockInfoKHR(timeout::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAcquireProfilingLockInfoKHR(VK_STRUCTURE_TYPE_ACQUIRE_PROFILING_LOCK_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, timeout)
    AcquireProfilingLockInfoKHR(vks, deps)
end

function PerformanceCounterResultKHR(int32::Integer, int64::Integer, uint32::Integer, uint64::Integer, float32::Real, float64::Real)
    PerformanceCounterResultKHR(VkPerformanceCounterResultKHR(int32, int64, uint32, uint64, float32, float64))
end

function QueryPoolPerformanceCreateInfoKHR(queue_family_index::Integer, counter_indices::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    counter_indices = cconvert(Ptr{UInt32}, counter_indices)
    deps = [next, counter_indices]
    vks = VkQueryPoolPerformanceCreateInfoKHR(VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), queue_family_index, pointer_length(counter_indices), unsafe_convert(Ptr{UInt32}, counter_indices))
    QueryPoolPerformanceCreateInfoKHR(vks, deps)
end

function PhysicalDevicePerformanceQueryFeaturesKHR(performance_counter_query_pools::Bool, performance_counter_multiple_query_pools::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDevicePerformanceQueryFeaturesKHR(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_FEATURES_KHR, unsafe_convert(Ptr{Cvoid}, next), performance_counter_query_pools, performance_counter_multiple_query_pools)
    PhysicalDevicePerformanceQueryFeaturesKHR(vks, deps)
end

function SurfaceCapabilitiesFullScreenExclusiveEXT(full_screen_exclusive_supported::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSurfaceCapabilitiesFullScreenExclusiveEXT(VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT, unsafe_convert(Ptr{Cvoid}, next), full_screen_exclusive_supported)
    SurfaceCapabilitiesFullScreenExclusiveEXT(vks, deps)
end

function SurfaceFullScreenExclusiveWin32InfoEXT(hmonitor::vk.HMONITOR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSurfaceFullScreenExclusiveWin32InfoEXT(VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), hmonitor)
    SurfaceFullScreenExclusiveWin32InfoEXT(vks, deps)
end

function SurfaceFullScreenExclusiveInfoEXT(full_screen_exclusive::VkFullScreenExclusiveEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSurfaceFullScreenExclusiveInfoEXT(VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), full_screen_exclusive)
    SurfaceFullScreenExclusiveInfoEXT(vks, deps)
end

function PipelineCreationFeedbackCreateInfoEXT(pipeline_creation_feedback::PipelineCreationFeedbackEXT, pipeline_stage_creation_feedbacks::AbstractArray{<:PipelineCreationFeedbackEXT}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    pipeline_creation_feedback = cconvert(Ptr{VkPipelineCreationFeedbackEXT}, pipeline_creation_feedback)
    pipeline_stage_creation_feedbacks = cconvert(Ptr{Ptr{VkPipelineCreationFeedbackEXT}}, pipeline_stage_creation_feedbacks)
    deps = [next, pipeline_creation_feedback, pipeline_stage_creation_feedbacks]
    vks = VkPipelineCreationFeedbackCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Ptr{VkPipelineCreationFeedbackEXT}, pipeline_creation_feedback), pointer_length(pipeline_stage_creation_feedbacks), unsafe_convert(Ptr{Ptr{VkPipelineCreationFeedbackEXT}}, pipeline_stage_creation_feedbacks))
    PipelineCreationFeedbackCreateInfoEXT(vks, deps)
end

function PresentFrameTokenGGP(frame_token::vk.GgpFrameToken; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPresentFrameTokenGGP(VK_STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP, unsafe_convert(Ptr{Cvoid}, next), frame_token)
    PresentFrameTokenGGP(vks, deps)
end

function ImageViewHandleInfoNVX(image_view::ImageView, descriptor_type::VkDescriptorType; next = C_NULL, sampler = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageViewHandleInfoNVX(VK_STRUCTURE_TYPE_IMAGE_VIEW_HANDLE_INFO_NVX, unsafe_convert(Ptr{Cvoid}, next), image_view, descriptor_type, sampler)
    ImageViewHandleInfoNVX(vks, deps)
end

function PhysicalDeviceYcbcrImageArraysFeaturesEXT(ycbcr_image_arrays::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceYcbcrImageArraysFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), ycbcr_image_arrays)
    PhysicalDeviceYcbcrImageArraysFeaturesEXT(vks, deps)
end

function CooperativeMatrixPropertiesNV(m_size::Integer, n_size::Integer, k_size::Integer, a_type::VkComponentTypeNV, b_type::VkComponentTypeNV, c_type::VkComponentTypeNV, d_type::VkComponentTypeNV, scope::VkScopeNV; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCooperativeMatrixPropertiesNV(VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV, unsafe_convert(Ptr{Cvoid}, next), m_size, n_size, k_size, a_type, b_type, c_type, d_type, scope)
    CooperativeMatrixPropertiesNV(vks, deps)
end

function PhysicalDeviceCooperativeMatrixFeaturesNV(cooperative_matrix::Bool, cooperative_matrix_robust_buffer_access::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceCooperativeMatrixFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), cooperative_matrix, cooperative_matrix_robust_buffer_access)
    PhysicalDeviceCooperativeMatrixFeaturesNV(vks, deps)
end

function PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT(texture_compression_astc_hdr::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), texture_compression_astc_hdr)
    PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT(vks, deps)
end

function RenderPassAttachmentBeginInfo(attachments::AbstractArray{<:ImageView}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    attachments = cconvert(Ptr{VkImageView}, attachments)
    deps = [next, attachments]
    vks = VkRenderPassAttachmentBeginInfo(VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(attachments), unsafe_convert(Ptr{VkImageView}, attachments))
    RenderPassAttachmentBeginInfo(vks, deps)
end

function FramebufferAttachmentImageInfo(usage::Integer, width::Integer, height::Integer, layer_count::Integer, view_formats::AbstractArray{<:VkFormat}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    view_formats = cconvert(Ptr{VkFormat}, view_formats)
    deps = [next, view_formats]
    vks = VkFramebufferAttachmentImageInfo(VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, usage, width, height, layer_count, pointer_length(view_formats), unsafe_convert(Ptr{VkFormat}, view_formats))
    FramebufferAttachmentImageInfo(vks, deps)
end

function FramebufferAttachmentsCreateInfo(attachment_image_infos::AbstractArray{<:FramebufferAttachmentImageInfo}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    attachment_image_infos = cconvert(Ptr{VkFramebufferAttachmentImageInfo}, attachment_image_infos)
    deps = [next, attachment_image_infos]
    vks = VkFramebufferAttachmentsCreateInfo(VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(attachment_image_infos), unsafe_convert(Ptr{VkFramebufferAttachmentImageInfo}, attachment_image_infos))
    FramebufferAttachmentsCreateInfo(vks, deps)
end

function PhysicalDeviceImagelessFramebufferFeatures(imageless_framebuffer::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceImagelessFramebufferFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES, unsafe_convert(Ptr{Cvoid}, next), imageless_framebuffer)
    PhysicalDeviceImagelessFramebufferFeatures(vks, deps)
end

function PhysicalDeviceImageViewImageFormatInfoEXT(image_view_type::VkImageViewType; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceImageViewImageFormatInfoEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_IMAGE_FORMAT_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), image_view_type)
    PhysicalDeviceImageViewImageFormatInfoEXT(vks, deps)
end

function BufferDeviceAddressCreateInfoEXT(device_address::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBufferDeviceAddressCreateInfoEXT(VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), device_address)
    BufferDeviceAddressCreateInfoEXT(vks, deps)
end

function BufferOpaqueCaptureAddressCreateInfo(opaque_capture_address::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBufferOpaqueCaptureAddressCreateInfo(VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), opaque_capture_address)
    BufferOpaqueCaptureAddressCreateInfo(vks, deps)
end

function BufferDeviceAddressInfo(buffer::Buffer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBufferDeviceAddressInfo(VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO, unsafe_convert(Ptr{Cvoid}, next), buffer)
    BufferDeviceAddressInfo(vks, deps)
end

function PhysicalDeviceBufferDeviceAddressFeaturesEXT(buffer_device_address::Bool, buffer_device_address_capture_replay::Bool, buffer_device_address_multi_device::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceBufferDeviceAddressFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), buffer_device_address, buffer_device_address_capture_replay, buffer_device_address_multi_device)
    PhysicalDeviceBufferDeviceAddressFeaturesEXT(vks, deps)
end

function PhysicalDeviceBufferDeviceAddressFeatures(buffer_device_address::Bool, buffer_device_address_capture_replay::Bool, buffer_device_address_multi_device::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceBufferDeviceAddressFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES, unsafe_convert(Ptr{Cvoid}, next), buffer_device_address, buffer_device_address_capture_replay, buffer_device_address_multi_device)
    PhysicalDeviceBufferDeviceAddressFeatures(vks, deps)
end

function MemoryPriorityAllocateInfoEXT(priority::Real; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryPriorityAllocateInfoEXT(VK_STRUCTURE_TYPE_MEMORY_PRIORITY_ALLOCATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), priority)
    MemoryPriorityAllocateInfoEXT(vks, deps)
end

function PhysicalDeviceMemoryPriorityFeaturesEXT(memory_priority::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceMemoryPriorityFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), memory_priority)
    PhysicalDeviceMemoryPriorityFeaturesEXT(vks, deps)
end

function PipelineRasterizationDepthClipStateCreateInfoEXT(depth_clip_enable::Bool; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineRasterizationDepthClipStateCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, depth_clip_enable)
    PipelineRasterizationDepthClipStateCreateInfoEXT(vks, deps)
end

function PhysicalDeviceDepthClipEnableFeaturesEXT(depth_clip_enable::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceDepthClipEnableFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), depth_clip_enable)
    PhysicalDeviceDepthClipEnableFeaturesEXT(vks, deps)
end

function PhysicalDeviceUniformBufferStandardLayoutFeatures(uniform_buffer_standard_layout::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceUniformBufferStandardLayoutFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES, unsafe_convert(Ptr{Cvoid}, next), uniform_buffer_standard_layout)
    PhysicalDeviceUniformBufferStandardLayoutFeatures(vks, deps)
end

function SurfaceProtectedCapabilitiesKHR(supports_protected::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSurfaceProtectedCapabilitiesKHR(VK_STRUCTURE_TYPE_SURFACE_PROTECTED_CAPABILITIES_KHR, unsafe_convert(Ptr{Cvoid}, next), supports_protected)
    SurfaceProtectedCapabilitiesKHR(vks, deps)
end

function PhysicalDeviceScalarBlockLayoutFeatures(scalar_block_layout::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceScalarBlockLayoutFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES, unsafe_convert(Ptr{Cvoid}, next), scalar_block_layout)
    PhysicalDeviceScalarBlockLayoutFeatures(vks, deps)
end

function RenderPassFragmentDensityMapCreateInfoEXT(fragment_density_map_attachment::AttachmentReference; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkRenderPassFragmentDensityMapCreateInfoEXT(VK_STRUCTURE_TYPE_RENDER_PASS_FRAGMENT_DENSITY_MAP_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), fragment_density_map_attachment.vks)
    RenderPassFragmentDensityMapCreateInfoEXT(vks, deps)
end

function PhysicalDeviceFragmentDensityMap2FeaturesEXT(fragment_density_map_deferred::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceFragmentDensityMap2FeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), fragment_density_map_deferred)
    PhysicalDeviceFragmentDensityMap2FeaturesEXT(vks, deps)
end

function PhysicalDeviceFragmentDensityMapFeaturesEXT(fragment_density_map::Bool, fragment_density_map_dynamic::Bool, fragment_density_map_non_subsampled_images::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceFragmentDensityMapFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), fragment_density_map, fragment_density_map_dynamic, fragment_density_map_non_subsampled_images)
    PhysicalDeviceFragmentDensityMapFeaturesEXT(vks, deps)
end

function DeviceMemoryOverallocationCreateInfoAMD(overallocation_behavior::VkMemoryOverallocationBehaviorAMD; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceMemoryOverallocationCreateInfoAMD(VK_STRUCTURE_TYPE_DEVICE_MEMORY_OVERALLOCATION_CREATE_INFO_AMD, unsafe_convert(Ptr{Cvoid}, next), overallocation_behavior)
    DeviceMemoryOverallocationCreateInfoAMD(vks, deps)
end

function ImageStencilUsageCreateInfo(stencil_usage::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageStencilUsageCreateInfo(VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), stencil_usage)
    ImageStencilUsageCreateInfo(vks, deps)
end

function ImageDrmFormatModifierExplicitCreateInfoEXT(drm_format_modifier::Integer, plane_layouts::AbstractArray{<:SubresourceLayout}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    plane_layouts = cconvert(Ptr{VkSubresourceLayout}, plane_layouts)
    deps = [next, plane_layouts]
    vks = VkImageDrmFormatModifierExplicitCreateInfoEXT(VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_EXPLICIT_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), drm_format_modifier, pointer_length(plane_layouts), unsafe_convert(Ptr{VkSubresourceLayout}, plane_layouts))
    ImageDrmFormatModifierExplicitCreateInfoEXT(vks, deps)
end

function ImageDrmFormatModifierListCreateInfoEXT(drm_format_modifiers::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    drm_format_modifiers = cconvert(Ptr{UInt64}, drm_format_modifiers)
    deps = [next, drm_format_modifiers]
    vks = VkImageDrmFormatModifierListCreateInfoEXT(VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_LIST_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), pointer_length(drm_format_modifiers), unsafe_convert(Ptr{UInt64}, drm_format_modifiers))
    ImageDrmFormatModifierListCreateInfoEXT(vks, deps)
end

function PhysicalDeviceImageDrmFormatModifierInfoEXT(drm_format_modifier::Integer, sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    queue_family_indices = cconvert(Ptr{UInt32}, queue_family_indices)
    deps = [next, queue_family_indices]
    vks = VkPhysicalDeviceImageDrmFormatModifierInfoEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_DRM_FORMAT_MODIFIER_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), drm_format_modifier, sharing_mode, pointer_length(queue_family_indices), unsafe_convert(Ptr{UInt32}, queue_family_indices))
    PhysicalDeviceImageDrmFormatModifierInfoEXT(vks, deps)
end

function TraceRaysIndirectCommandKHR(width::Integer, height::Integer, depth::Integer)
    TraceRaysIndirectCommandKHR(VkTraceRaysIndirectCommandKHR(width, height, depth))
end

function StridedBufferRegionKHR(offset::Integer, stride::Integer, size::Integer; buffer = C_NULL)
    StridedBufferRegionKHR(VkStridedBufferRegionKHR(buffer, offset, stride, size))
end

function PhysicalDeviceRayTracingFeaturesKHR(ray_tracing::Bool, ray_tracing_shader_group_handle_capture_replay::Bool, ray_tracing_shader_group_handle_capture_replay_mixed::Bool, ray_tracing_acceleration_structure_capture_replay::Bool, ray_tracing_indirect_trace_rays::Bool, ray_tracing_indirect_acceleration_structure_build::Bool, ray_tracing_host_acceleration_structure_commands::Bool, ray_query::Bool, ray_tracing_primitive_culling::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceRayTracingFeaturesKHR(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR, unsafe_convert(Ptr{Cvoid}, next), ray_tracing, ray_tracing_shader_group_handle_capture_replay, ray_tracing_shader_group_handle_capture_replay_mixed, ray_tracing_acceleration_structure_capture_replay, ray_tracing_indirect_trace_rays, ray_tracing_indirect_acceleration_structure_build, ray_tracing_host_acceleration_structure_commands, ray_query, ray_tracing_primitive_culling)
    PhysicalDeviceRayTracingFeaturesKHR(vks, deps)
end

function AccelerationStructureMemoryRequirementsInfoNV(type::VkAccelerationStructureMemoryRequirementsTypeNV, acceleration_structure::VkAccelerationStructureNV; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureMemoryRequirementsInfoNV(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), type, acceleration_structure)
    AccelerationStructureMemoryRequirementsInfoNV(vks, deps)
end

function AccelerationStructureMemoryRequirementsInfoKHR(type::VkAccelerationStructureMemoryRequirementsTypeKHR, build_type::VkAccelerationStructureBuildTypeKHR, acceleration_structure::AccelerationStructureKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureMemoryRequirementsInfoKHR(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), type, build_type, acceleration_structure)
    AccelerationStructureMemoryRequirementsInfoKHR(vks, deps)
end

function WriteDescriptorSetAccelerationStructureKHR(acceleration_structures::AbstractArray{<:AccelerationStructureKHR}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    acceleration_structures = cconvert(Ptr{VkAccelerationStructureKHR}, acceleration_structures)
    deps = [next, acceleration_structures]
    vks = VkWriteDescriptorSetAccelerationStructureKHR(VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR, unsafe_convert(Ptr{Cvoid}, next), pointer_length(acceleration_structures), unsafe_convert(Ptr{VkAccelerationStructureKHR}, acceleration_structures))
    WriteDescriptorSetAccelerationStructureKHR(vks, deps)
end

function BindAccelerationStructureMemoryInfoKHR(acceleration_structure::AccelerationStructureKHR, memory::DeviceMemory, memory_offset::Integer, device_indices::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    device_indices = cconvert(Ptr{UInt32}, device_indices)
    deps = [next, device_indices]
    vks = VkBindAccelerationStructureMemoryInfoKHR(VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), acceleration_structure, memory, memory_offset, pointer_length(device_indices), unsafe_convert(Ptr{UInt32}, device_indices))
    BindAccelerationStructureMemoryInfoKHR(vks, deps)
end

function AccelerationStructureCreateInfoNV(compacted_size::Integer, info::AccelerationStructureInfoNV; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAccelerationStructureCreateInfoNV(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), compacted_size, info.vks)
    AccelerationStructureCreateInfoNV(vks, deps)
end

function AccelerationStructureInfoNV(type::VkAccelerationStructureTypeNV, geometries::AbstractArray{<:GeometryNV}; next = C_NULL, flags = 0, instance_count = 0)
    next = cconvert(Ptr{Cvoid}, next)
    geometries = cconvert(Ptr{VkGeometryNV}, geometries)
    deps = [next, geometries]
    vks = VkAccelerationStructureInfoNV(VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), type, flags, instance_count, pointer_length(geometries), unsafe_convert(Ptr{VkGeometryNV}, geometries))
    AccelerationStructureInfoNV(vks, deps)
end

function GeometryNV(geometry_type::VkGeometryTypeKHR, geometry::GeometryDataNV; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkGeometryNV(VK_STRUCTURE_TYPE_GEOMETRY_NV, unsafe_convert(Ptr{Cvoid}, next), geometry_type, geometry.vks, flags)
    GeometryNV(vks, deps)
end

function GeometryDataNV(triangles::GeometryTrianglesNV, aabbs::GeometryAABBNV)
    GeometryDataNV(VkGeometryDataNV(triangles.vks, aabbs.vks))
end

function GeometryAABBNV(num_aab_bs::Integer, stride::Integer, offset::Integer; next = C_NULL, aabb_data = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkGeometryAABBNV(VK_STRUCTURE_TYPE_GEOMETRY_AABB_NV, unsafe_convert(Ptr{Cvoid}, next), aabb_data, num_aab_bs, stride, offset)
    GeometryAABBNV(vks, deps)
end

function GeometryTrianglesNV(vertex_offset::Integer, vertex_count::Integer, vertex_stride::Integer, vertex_format::VkFormat, index_offset::Integer, index_count::Integer, index_type::VkIndexType, transform_offset::Integer; next = C_NULL, vertex_data = C_NULL, index_data = C_NULL, transform_data = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkGeometryTrianglesNV(VK_STRUCTURE_TYPE_GEOMETRY_TRIANGLES_NV, unsafe_convert(Ptr{Cvoid}, next), vertex_data, vertex_offset, vertex_count, vertex_stride, vertex_format, index_data, index_offset, index_count, index_type, transform_data, transform_offset)
    GeometryTrianglesNV(vks, deps)
end

function RayTracingPipelineCreateInfoKHR(stages::AbstractArray{<:PipelineShaderStageCreateInfo}, groups::AbstractArray{<:RayTracingShaderGroupCreateInfoKHR}, max_recursion_depth::Integer, libraries::PipelineLibraryCreateInfoKHR, layout::PipelineLayout, base_pipeline_index::Integer; next = C_NULL, flags = 0, library_interface = C_NULL, base_pipeline_handle = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    stages = cconvert(Ptr{VkPipelineShaderStageCreateInfo}, stages)
    groups = cconvert(Ptr{VkRayTracingShaderGroupCreateInfoKHR}, groups)
    library_interface = cconvert(Ptr{VkRayTracingPipelineInterfaceCreateInfoKHR}, library_interface)
    deps = [next, stages, groups, library_interface]
    vks = VkRayTracingPipelineCreateInfoKHR(VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(stages), unsafe_convert(Ptr{VkPipelineShaderStageCreateInfo}, stages), pointer_length(groups), unsafe_convert(Ptr{VkRayTracingShaderGroupCreateInfoKHR}, groups), max_recursion_depth, libraries.vks, unsafe_convert(Ptr{VkRayTracingPipelineInterfaceCreateInfoKHR}, library_interface), layout, base_pipeline_handle, base_pipeline_index)
    RayTracingPipelineCreateInfoKHR(vks, deps)
end

function RayTracingPipelineCreateInfoNV(stages::AbstractArray{<:PipelineShaderStageCreateInfo}, groups::AbstractArray{<:RayTracingShaderGroupCreateInfoNV}, max_recursion_depth::Integer, layout::PipelineLayout, base_pipeline_index::Integer; next = C_NULL, flags = 0, base_pipeline_handle = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    stages = cconvert(Ptr{VkPipelineShaderStageCreateInfo}, stages)
    groups = cconvert(Ptr{VkRayTracingShaderGroupCreateInfoNV}, groups)
    deps = [next, stages, groups]
    vks = VkRayTracingPipelineCreateInfoNV(VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(stages), unsafe_convert(Ptr{VkPipelineShaderStageCreateInfo}, stages), pointer_length(groups), unsafe_convert(Ptr{VkRayTracingShaderGroupCreateInfoNV}, groups), max_recursion_depth, layout, base_pipeline_handle, base_pipeline_index)
    RayTracingPipelineCreateInfoNV(vks, deps)
end

function RayTracingShaderGroupCreateInfoKHR(type::VkRayTracingShaderGroupTypeKHR, general_shader::Integer, closest_hit_shader::Integer, any_hit_shader::Integer, intersection_shader::Integer; next = C_NULL, shader_group_capture_replay_handle = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    shader_group_capture_replay_handle = cconvert(Ptr{Cvoid}, shader_group_capture_replay_handle)
    deps = [next, shader_group_capture_replay_handle]
    vks = VkRayTracingShaderGroupCreateInfoKHR(VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), type, general_shader, closest_hit_shader, any_hit_shader, intersection_shader, unsafe_convert(Ptr{Cvoid}, shader_group_capture_replay_handle))
    RayTracingShaderGroupCreateInfoKHR(vks, deps)
end

function RayTracingShaderGroupCreateInfoNV(type::VkRayTracingShaderGroupTypeKHR, general_shader::Integer, closest_hit_shader::Integer, any_hit_shader::Integer, intersection_shader::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkRayTracingShaderGroupCreateInfoNV(VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), type, general_shader, closest_hit_shader, any_hit_shader, intersection_shader)
    RayTracingShaderGroupCreateInfoNV(vks, deps)
end

function DrawMeshTasksIndirectCommandNV(task_count::Integer, first_task::Integer)
    DrawMeshTasksIndirectCommandNV(VkDrawMeshTasksIndirectCommandNV(task_count, first_task))
end

function PhysicalDeviceMeshShaderFeaturesNV(task_shader::Bool, mesh_shader::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceMeshShaderFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), task_shader, mesh_shader)
    PhysicalDeviceMeshShaderFeaturesNV(vks, deps)
end

function PipelineViewportCoarseSampleOrderStateCreateInfoNV(sample_order_type::VkCoarseSampleOrderTypeNV, custom_sample_orders::AbstractArray{<:CoarseSampleOrderCustomNV}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    custom_sample_orders = cconvert(Ptr{VkCoarseSampleOrderCustomNV}, custom_sample_orders)
    deps = [next, custom_sample_orders]
    vks = VkPipelineViewportCoarseSampleOrderStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_COARSE_SAMPLE_ORDER_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), sample_order_type, pointer_length(custom_sample_orders), unsafe_convert(Ptr{VkCoarseSampleOrderCustomNV}, custom_sample_orders))
    PipelineViewportCoarseSampleOrderStateCreateInfoNV(vks, deps)
end

function CoarseSampleOrderCustomNV(shading_rate::VkShadingRatePaletteEntryNV, sample_count::Integer, sample_locations::AbstractArray{<:CoarseSampleLocationNV})
    sample_locations = cconvert(Ptr{VkCoarseSampleLocationNV}, sample_locations)
    deps = [sample_locations]
    vks = VkCoarseSampleOrderCustomNV(shading_rate, sample_count, pointer_length(sample_locations), unsafe_convert(Ptr{VkCoarseSampleLocationNV}, sample_locations))
    CoarseSampleOrderCustomNV(vks, deps)
end

function CoarseSampleLocationNV(pixel_x::Integer, pixel_y::Integer, sample::Integer)
    CoarseSampleLocationNV(VkCoarseSampleLocationNV(pixel_x, pixel_y, sample))
end

function PhysicalDeviceShadingRateImageFeaturesNV(shading_rate_image::Bool, shading_rate_coarse_sample_order::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShadingRateImageFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), shading_rate_image, shading_rate_coarse_sample_order)
    PhysicalDeviceShadingRateImageFeaturesNV(vks, deps)
end

function PipelineViewportShadingRateImageStateCreateInfoNV(shading_rate_image_enable::Bool, shading_rate_palettes::AbstractArray{<:ShadingRatePaletteNV}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    shading_rate_palettes = cconvert(Ptr{VkShadingRatePaletteNV}, shading_rate_palettes)
    deps = [next, shading_rate_palettes]
    vks = VkPipelineViewportShadingRateImageStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), shading_rate_image_enable, pointer_length(shading_rate_palettes), unsafe_convert(Ptr{VkShadingRatePaletteNV}, shading_rate_palettes))
    PipelineViewportShadingRateImageStateCreateInfoNV(vks, deps)
end

function ShadingRatePaletteNV(shading_rate_palette_entries::AbstractArray{<:VkShadingRatePaletteEntryNV})
    shading_rate_palette_entries = cconvert(Ptr{VkShadingRatePaletteEntryNV}, shading_rate_palette_entries)
    deps = [shading_rate_palette_entries]
    vks = VkShadingRatePaletteNV(pointer_length(shading_rate_palette_entries), unsafe_convert(Ptr{VkShadingRatePaletteEntryNV}, shading_rate_palette_entries))
    ShadingRatePaletteNV(vks, deps)
end

function PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV(dedicated_allocation_image_aliasing::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEDICATED_ALLOCATION_IMAGE_ALIASING_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), dedicated_allocation_image_aliasing)
    PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV(vks, deps)
end

function PhysicalDeviceShaderImageFootprintFeaturesNV(image_footprint::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderImageFootprintFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_FOOTPRINT_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), image_footprint)
    PhysicalDeviceShaderImageFootprintFeaturesNV(vks, deps)
end

function PhysicalDeviceFragmentShaderBarycentricFeaturesNV(fragment_shader_barycentric::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), fragment_shader_barycentric)
    PhysicalDeviceFragmentShaderBarycentricFeaturesNV(vks, deps)
end

function PhysicalDeviceComputeShaderDerivativesFeaturesNV(compute_derivative_group_quads::Bool, compute_derivative_group_linear::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceComputeShaderDerivativesFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), compute_derivative_group_quads, compute_derivative_group_linear)
    PhysicalDeviceComputeShaderDerivativesFeaturesNV(vks, deps)
end

function PhysicalDeviceCornerSampledImageFeaturesNV(corner_sampled_image::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceCornerSampledImageFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), corner_sampled_image)
    PhysicalDeviceCornerSampledImageFeaturesNV(vks, deps)
end

function PipelineViewportExclusiveScissorStateCreateInfoNV(exclusive_scissors::AbstractArray{<:Rect2D}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    exclusive_scissors = cconvert(Ptr{VkRect2D}, exclusive_scissors)
    deps = [next, exclusive_scissors]
    vks = VkPipelineViewportExclusiveScissorStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), pointer_length(exclusive_scissors), unsafe_convert(Ptr{VkRect2D}, exclusive_scissors))
    PipelineViewportExclusiveScissorStateCreateInfoNV(vks, deps)
end

function PhysicalDeviceExclusiveScissorFeaturesNV(exclusive_scissor::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceExclusiveScissorFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), exclusive_scissor)
    PhysicalDeviceExclusiveScissorFeaturesNV(vks, deps)
end

function PipelineRepresentativeFragmentTestStateCreateInfoNV(representative_fragment_test_enable::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineRepresentativeFragmentTestStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_REPRESENTATIVE_FRAGMENT_TEST_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), representative_fragment_test_enable)
    PipelineRepresentativeFragmentTestStateCreateInfoNV(vks, deps)
end

function PhysicalDeviceRepresentativeFragmentTestFeaturesNV(representative_fragment_test::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), representative_fragment_test)
    PhysicalDeviceRepresentativeFragmentTestFeaturesNV(vks, deps)
end

function PipelineRasterizationStateStreamCreateInfoEXT(rasterization_stream::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineRasterizationStateStreamCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_STREAM_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, rasterization_stream)
    PipelineRasterizationStateStreamCreateInfoEXT(vks, deps)
end

function PhysicalDeviceTransformFeedbackFeaturesEXT(transform_feedback::Bool, geometry_streams::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceTransformFeedbackFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), transform_feedback, geometry_streams)
    PhysicalDeviceTransformFeedbackFeaturesEXT(vks, deps)
end

function PhysicalDeviceASTCDecodeFeaturesEXT(decode_mode_shared_exponent::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceASTCDecodeFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), decode_mode_shared_exponent)
    PhysicalDeviceASTCDecodeFeaturesEXT(vks, deps)
end

function ImageViewASTCDecodeModeEXT(decode_mode::VkFormat; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageViewASTCDecodeModeEXT(VK_STRUCTURE_TYPE_IMAGE_VIEW_ASTC_DECODE_MODE_EXT, unsafe_convert(Ptr{Cvoid}, next), decode_mode)
    ImageViewASTCDecodeModeEXT(vks, deps)
end

function SubpassDescriptionDepthStencilResolve(depth_resolve_mode::VkResolveModeFlagBits, stencil_resolve_mode::VkResolveModeFlagBits; next = C_NULL, depth_stencil_resolve_attachment = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    depth_stencil_resolve_attachment = cconvert(Ptr{VkAttachmentReference2}, depth_stencil_resolve_attachment)
    deps = [next, depth_stencil_resolve_attachment]
    vks = VkSubpassDescriptionDepthStencilResolve(VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE, unsafe_convert(Ptr{Cvoid}, next), depth_resolve_mode, stencil_resolve_mode, unsafe_convert(Ptr{VkAttachmentReference2}, depth_stencil_resolve_attachment))
    SubpassDescriptionDepthStencilResolve(vks, deps)
end

function PhysicalDeviceVertexAttributeDivisorFeaturesEXT(vertex_attribute_instance_rate_divisor::Bool, vertex_attribute_instance_rate_zero_divisor::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), vertex_attribute_instance_rate_divisor, vertex_attribute_instance_rate_zero_divisor)
    PhysicalDeviceVertexAttributeDivisorFeaturesEXT(vks, deps)
end

function PhysicalDeviceShaderAtomicFloatFeaturesEXT(shader_buffer_float_32_atomics::Bool, shader_buffer_float_32_atomic_add::Bool, shader_buffer_float_64_atomics::Bool, shader_buffer_float_64_atomic_add::Bool, shader_shared_float_32_atomics::Bool, shader_shared_float_32_atomic_add::Bool, shader_shared_float_64_atomics::Bool, shader_shared_float_64_atomic_add::Bool, shader_image_float_32_atomics::Bool, shader_image_float_32_atomic_add::Bool, sparse_image_float_32_atomics::Bool, sparse_image_float_32_atomic_add::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderAtomicFloatFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), shader_buffer_float_32_atomics, shader_buffer_float_32_atomic_add, shader_buffer_float_64_atomics, shader_buffer_float_64_atomic_add, shader_shared_float_32_atomics, shader_shared_float_32_atomic_add, shader_shared_float_64_atomics, shader_shared_float_64_atomic_add, shader_image_float_32_atomics, shader_image_float_32_atomic_add, sparse_image_float_32_atomics, sparse_image_float_32_atomic_add)
    PhysicalDeviceShaderAtomicFloatFeaturesEXT(vks, deps)
end

function PhysicalDeviceShaderAtomicInt64Features(shader_buffer_int_64_atomics::Bool, shader_shared_int_64_atomics::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderAtomicInt64Features(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES, unsafe_convert(Ptr{Cvoid}, next), shader_buffer_int_64_atomics, shader_shared_int_64_atomics)
    PhysicalDeviceShaderAtomicInt64Features(vks, deps)
end

function PhysicalDeviceVulkanMemoryModelFeatures(vulkan_memory_model::Bool, vulkan_memory_model_device_scope::Bool, vulkan_memory_model_availability_visibility_chains::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceVulkanMemoryModelFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES, unsafe_convert(Ptr{Cvoid}, next), vulkan_memory_model, vulkan_memory_model_device_scope, vulkan_memory_model_availability_visibility_chains)
    PhysicalDeviceVulkanMemoryModelFeatures(vks, deps)
end

function PhysicalDeviceConditionalRenderingFeaturesEXT(conditional_rendering::Bool, inherited_conditional_rendering::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceConditionalRenderingFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONDITIONAL_RENDERING_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), conditional_rendering, inherited_conditional_rendering)
    PhysicalDeviceConditionalRenderingFeaturesEXT(vks, deps)
end

function PhysicalDevice8BitStorageFeatures(storage_buffer_8_bit_access::Bool, uniform_and_storage_buffer_8_bit_access::Bool, storage_push_constant_8::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDevice8BitStorageFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES, unsafe_convert(Ptr{Cvoid}, next), storage_buffer_8_bit_access, uniform_and_storage_buffer_8_bit_access, storage_push_constant_8)
    PhysicalDevice8BitStorageFeatures(vks, deps)
end

function ExternalFormatANDROID(external_format::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkExternalFormatANDROID(VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID, unsafe_convert(Ptr{Cvoid}, next), external_format)
    ExternalFormatANDROID(vks, deps)
end

function CommandBufferInheritanceConditionalRenderingInfoEXT(conditional_rendering_enable::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCommandBufferInheritanceConditionalRenderingInfoEXT(VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_CONDITIONAL_RENDERING_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), conditional_rendering_enable)
    CommandBufferInheritanceConditionalRenderingInfoEXT(vks, deps)
end

function MemoryGetAndroidHardwareBufferInfoANDROID(memory::DeviceMemory; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryGetAndroidHardwareBufferInfoANDROID(VK_STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID, unsafe_convert(Ptr{Cvoid}, next), memory)
    MemoryGetAndroidHardwareBufferInfoANDROID(vks, deps)
end

function ImportAndroidHardwareBufferInfoANDROID(buffer::Cvoid; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    buffer = cconvert(Ptr{AHardwareBuffer}, buffer)
    deps = [next, buffer]
    vks = VkImportAndroidHardwareBufferInfoANDROID(VK_STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Ptr{AHardwareBuffer}, buffer))
    ImportAndroidHardwareBufferInfoANDROID(vks, deps)
end

function PipelineVertexInputDivisorStateCreateInfoEXT(vertex_binding_divisors::AbstractArray{<:VertexInputBindingDivisorDescriptionEXT}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    vertex_binding_divisors = cconvert(Ptr{VkVertexInputBindingDivisorDescriptionEXT}, vertex_binding_divisors)
    deps = [next, vertex_binding_divisors]
    vks = VkPipelineVertexInputDivisorStateCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), pointer_length(vertex_binding_divisors), unsafe_convert(Ptr{VkVertexInputBindingDivisorDescriptionEXT}, vertex_binding_divisors))
    PipelineVertexInputDivisorStateCreateInfoEXT(vks, deps)
end

function VertexInputBindingDivisorDescriptionEXT(binding::Integer, divisor::Integer)
    VertexInputBindingDivisorDescriptionEXT(VkVertexInputBindingDivisorDescriptionEXT(binding, divisor))
end

function SemaphoreSignalInfo(semaphore::Semaphore, value::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSemaphoreSignalInfo(VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO, unsafe_convert(Ptr{Cvoid}, next), semaphore, value)
    SemaphoreSignalInfo(vks, deps)
end

function SemaphoreWaitInfo(semaphores::AbstractArray{<:Semaphore}, values::AbstractArray{<:Integer}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    semaphores = cconvert(Ptr{VkSemaphore}, semaphores)
    values = cconvert(Ptr{UInt64}, values)
    deps = [next, semaphores, values]
    vks = VkSemaphoreWaitInfo(VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(semaphores), unsafe_convert(Ptr{VkSemaphore}, semaphores), unsafe_convert(Ptr{UInt64}, values))
    SemaphoreWaitInfo(vks, deps)
end

function TimelineSemaphoreSubmitInfo(; next = C_NULL, wait_semaphore_values = C_NULL, signal_semaphore_values = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    wait_semaphore_values = cconvert(Ptr{UInt64}, wait_semaphore_values)
    signal_semaphore_values = cconvert(Ptr{UInt64}, signal_semaphore_values)
    deps = [next, wait_semaphore_values, signal_semaphore_values]
    vks = VkTimelineSemaphoreSubmitInfo(VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(wait_semaphore_values), unsafe_convert(Ptr{UInt64}, wait_semaphore_values), pointer_length(signal_semaphore_values), unsafe_convert(Ptr{UInt64}, signal_semaphore_values))
    TimelineSemaphoreSubmitInfo(vks, deps)
end

function SemaphoreTypeCreateInfo(semaphore_type::VkSemaphoreType, initial_value::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSemaphoreTypeCreateInfo(VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), semaphore_type, initial_value)
    SemaphoreTypeCreateInfo(vks, deps)
end

function PhysicalDeviceTimelineSemaphoreFeatures(timeline_semaphore::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceTimelineSemaphoreFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES, unsafe_convert(Ptr{Cvoid}, next), timeline_semaphore)
    PhysicalDeviceTimelineSemaphoreFeatures(vks, deps)
end

function SubpassEndInfo(; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSubpassEndInfo(VK_STRUCTURE_TYPE_SUBPASS_END_INFO, unsafe_convert(Ptr{Cvoid}, next))
    SubpassEndInfo(vks, deps)
end

function SubpassBeginInfo(contents::VkSubpassContents; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSubpassBeginInfo(VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO, unsafe_convert(Ptr{Cvoid}, next), contents)
    SubpassBeginInfo(vks, deps)
end

function RenderPassCreateInfo2(attachments::AbstractArray{<:AttachmentDescription2}, subpasses::AbstractArray{<:SubpassDescription2}, dependencies::AbstractArray{<:SubpassDependency2}, correlated_view_masks::AbstractArray{<:Integer}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    attachments = cconvert(Ptr{VkAttachmentDescription2}, attachments)
    subpasses = cconvert(Ptr{VkSubpassDescription2}, subpasses)
    dependencies = cconvert(Ptr{VkSubpassDependency2}, dependencies)
    correlated_view_masks = cconvert(Ptr{UInt32}, correlated_view_masks)
    deps = [next, attachments, subpasses, dependencies, correlated_view_masks]
    vks = VkRenderPassCreateInfo2(VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(attachments), unsafe_convert(Ptr{VkAttachmentDescription2}, attachments), pointer_length(subpasses), unsafe_convert(Ptr{VkSubpassDescription2}, subpasses), pointer_length(dependencies), unsafe_convert(Ptr{VkSubpassDependency2}, dependencies), pointer_length(correlated_view_masks), unsafe_convert(Ptr{UInt32}, correlated_view_masks))
    RenderPassCreateInfo2(vks, deps)
end

function SubpassDependency2(src_subpass::Integer, dst_subpass::Integer, src_stage_mask::Integer, dst_stage_mask::Integer; next = C_NULL, src_access_mask = 0, dst_access_mask = 0, dependency_flags = 0, view_offset = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSubpassDependency2(VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2, unsafe_convert(Ptr{Cvoid}, next), src_subpass, dst_subpass, src_stage_mask, dst_stage_mask, src_access_mask, dst_access_mask, dependency_flags, view_offset)
    SubpassDependency2(vks, deps)
end

function SubpassDescription2(pipeline_bind_point::VkPipelineBindPoint, view_mask::Integer, input_attachments::AbstractArray{<:AttachmentReference2}, color_attachments::AbstractArray{<:AttachmentReference2}, preserve_attachments::AbstractArray{<:Integer}; next = C_NULL, flags = 0, resolve_attachments = C_NULL, depth_stencil_attachment = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    input_attachments = cconvert(Ptr{VkAttachmentReference2}, input_attachments)
    color_attachments = cconvert(Ptr{VkAttachmentReference2}, color_attachments)
    resolve_attachments = cconvert(Ptr{VkAttachmentReference2}, resolve_attachments)
    depth_stencil_attachment = cconvert(Ptr{VkAttachmentReference2}, depth_stencil_attachment)
    preserve_attachments = cconvert(Ptr{UInt32}, preserve_attachments)
    deps = [next, input_attachments, color_attachments, resolve_attachments, depth_stencil_attachment, preserve_attachments]
    vks = VkSubpassDescription2(VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2, unsafe_convert(Ptr{Cvoid}, next), flags, pipeline_bind_point, view_mask, pointer_length(input_attachments), unsafe_convert(Ptr{VkAttachmentReference2}, input_attachments), pointer_length(color_attachments), unsafe_convert(Ptr{VkAttachmentReference2}, color_attachments), unsafe_convert(Ptr{VkAttachmentReference2}, resolve_attachments), unsafe_convert(Ptr{VkAttachmentReference2}, depth_stencil_attachment), pointer_length(preserve_attachments), unsafe_convert(Ptr{UInt32}, preserve_attachments))
    SubpassDescription2(vks, deps)
end

function AttachmentReference2(attachment::Integer, layout::VkImageLayout, aspect_mask::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAttachmentReference2(VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2, unsafe_convert(Ptr{Cvoid}, next), attachment, layout, aspect_mask)
    AttachmentReference2(vks, deps)
end

function AttachmentDescription2(format::VkFormat, samples::VkSampleCountFlagBits, load_op::VkAttachmentLoadOp, store_op::VkAttachmentStoreOp, stencil_load_op::VkAttachmentLoadOp, stencil_store_op::VkAttachmentStoreOp, initial_layout::VkImageLayout, final_layout::VkImageLayout; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAttachmentDescription2(VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2, unsafe_convert(Ptr{Cvoid}, next), flags, format, samples, load_op, store_op, stencil_load_op, stencil_store_op, initial_layout, final_layout)
    AttachmentDescription2(vks, deps)
end

function DescriptorSetVariableDescriptorCountAllocateInfo(descriptor_counts::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    descriptor_counts = cconvert(Ptr{UInt32}, descriptor_counts)
    deps = [next, descriptor_counts]
    vks = VkDescriptorSetVariableDescriptorCountAllocateInfo(VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(descriptor_counts), unsafe_convert(Ptr{UInt32}, descriptor_counts))
    DescriptorSetVariableDescriptorCountAllocateInfo(vks, deps)
end

function DescriptorSetLayoutBindingFlagsCreateInfo(binding_flags::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    binding_flags = cconvert(Ptr{VkDescriptorBindingFlags}, binding_flags)
    deps = [next, binding_flags]
    vks = VkDescriptorSetLayoutBindingFlagsCreateInfo(VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(binding_flags), unsafe_convert(Ptr{VkDescriptorBindingFlags}, binding_flags))
    DescriptorSetLayoutBindingFlagsCreateInfo(vks, deps)
end

function PhysicalDeviceDescriptorIndexingFeatures(shader_input_attachment_array_dynamic_indexing::Bool, shader_uniform_texel_buffer_array_dynamic_indexing::Bool, shader_storage_texel_buffer_array_dynamic_indexing::Bool, shader_uniform_buffer_array_non_uniform_indexing::Bool, shader_sampled_image_array_non_uniform_indexing::Bool, shader_storage_buffer_array_non_uniform_indexing::Bool, shader_storage_image_array_non_uniform_indexing::Bool, shader_input_attachment_array_non_uniform_indexing::Bool, shader_uniform_texel_buffer_array_non_uniform_indexing::Bool, shader_storage_texel_buffer_array_non_uniform_indexing::Bool, descriptor_binding_uniform_buffer_update_after_bind::Bool, descriptor_binding_sampled_image_update_after_bind::Bool, descriptor_binding_storage_image_update_after_bind::Bool, descriptor_binding_storage_buffer_update_after_bind::Bool, descriptor_binding_uniform_texel_buffer_update_after_bind::Bool, descriptor_binding_storage_texel_buffer_update_after_bind::Bool, descriptor_binding_update_unused_while_pending::Bool, descriptor_binding_partially_bound::Bool, descriptor_binding_variable_descriptor_count::Bool, runtime_descriptor_array::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceDescriptorIndexingFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES, unsafe_convert(Ptr{Cvoid}, next), shader_input_attachment_array_dynamic_indexing, shader_uniform_texel_buffer_array_dynamic_indexing, shader_storage_texel_buffer_array_dynamic_indexing, shader_uniform_buffer_array_non_uniform_indexing, shader_sampled_image_array_non_uniform_indexing, shader_storage_buffer_array_non_uniform_indexing, shader_storage_image_array_non_uniform_indexing, shader_input_attachment_array_non_uniform_indexing, shader_uniform_texel_buffer_array_non_uniform_indexing, shader_storage_texel_buffer_array_non_uniform_indexing, descriptor_binding_uniform_buffer_update_after_bind, descriptor_binding_sampled_image_update_after_bind, descriptor_binding_storage_image_update_after_bind, descriptor_binding_storage_buffer_update_after_bind, descriptor_binding_uniform_texel_buffer_update_after_bind, descriptor_binding_storage_texel_buffer_update_after_bind, descriptor_binding_update_unused_while_pending, descriptor_binding_partially_bound, descriptor_binding_variable_descriptor_count, runtime_descriptor_array)
    PhysicalDeviceDescriptorIndexingFeatures(vks, deps)
end

function PipelineRasterizationConservativeStateCreateInfoEXT(conservative_rasterization_mode::VkConservativeRasterizationModeEXT, extra_primitive_overestimation_size::Real; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineRasterizationConservativeStateCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_CONSERVATIVE_STATE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, conservative_rasterization_mode, extra_primitive_overestimation_size)
    PipelineRasterizationConservativeStateCreateInfoEXT(vks, deps)
end

function CalibratedTimestampInfoEXT(time_domain::VkTimeDomainEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCalibratedTimestampInfoEXT(VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), time_domain)
    CalibratedTimestampInfoEXT(vks, deps)
end

function ImportMemoryHostPointerInfoEXT(handle_type::VkExternalMemoryHandleTypeFlagBits, host_pointer::Ptr{Cvoid}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    host_pointer = cconvert(Ptr{Cvoid}, host_pointer)
    deps = [next, host_pointer]
    vks = VkImportMemoryHostPointerInfoEXT(VK_STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), handle_type, unsafe_convert(Ptr{Cvoid}, host_pointer))
    ImportMemoryHostPointerInfoEXT(vks, deps)
end

function DebugUtilsMessengerCallbackDataEXT(message::AbstractString, queue_labels::AbstractArray{<:DebugUtilsLabelEXT}, cmd_buf_labels::AbstractArray{<:DebugUtilsLabelEXT}, objects::AbstractArray{<:DebugUtilsObjectNameInfoEXT}; next = C_NULL, flags = 0, message_id_name = C_NULL, message_id_number = 0)
    next = cconvert(Ptr{Cvoid}, next)
    message_id_name = cconvert(Cstring, message_id_name)
    message = cconvert(Cstring, message)
    queue_labels = cconvert(Ptr{VkDebugUtilsLabelEXT}, queue_labels)
    cmd_buf_labels = cconvert(Ptr{VkDebugUtilsLabelEXT}, cmd_buf_labels)
    objects = cconvert(Ptr{VkDebugUtilsObjectNameInfoEXT}, objects)
    deps = [next, message_id_name, message, queue_labels, cmd_buf_labels, objects]
    vks = VkDebugUtilsMessengerCallbackDataEXT(VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Cstring, message_id_name), message_id_number, unsafe_convert(Cstring, message), pointer_length(queue_labels), unsafe_convert(Ptr{VkDebugUtilsLabelEXT}, queue_labels), pointer_length(cmd_buf_labels), unsafe_convert(Ptr{VkDebugUtilsLabelEXT}, cmd_buf_labels), pointer_length(objects), unsafe_convert(Ptr{VkDebugUtilsObjectNameInfoEXT}, objects))
    DebugUtilsMessengerCallbackDataEXT(vks, deps)
end

function DebugUtilsMessengerCreateInfoEXT(message_severity::Integer, message_type::Integer, pfn_user_callback::FunctionPtr; next = C_NULL, flags = 0, user_data = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    user_data = cconvert(Ptr{Cvoid}, user_data)
    deps = [next, user_data]
    vks = VkDebugUtilsMessengerCreateInfoEXT(VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, message_severity, message_type, pfn_user_callback, unsafe_convert(Ptr{Cvoid}, user_data))
    DebugUtilsMessengerCreateInfoEXT(vks, deps)
end

function DebugUtilsLabelEXT(label_name::AbstractString; next = C_NULL, color = 0)
    next = cconvert(Ptr{Cvoid}, next)
    label_name = cconvert(Cstring, label_name)
    deps = [next, label_name]
    vks = VkDebugUtilsLabelEXT(VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Cstring, label_name), color)
    DebugUtilsLabelEXT(vks, deps)
end

function DebugUtilsObjectTagInfoEXT(object_type::VkObjectType, object_handle::Integer, tag_name::Integer, tag_size::Integer, tag::Ptr{Cvoid}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    tag = cconvert(Ptr{Cvoid}, tag)
    deps = [next, tag]
    vks = VkDebugUtilsObjectTagInfoEXT(VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_TAG_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), object_type, object_handle, tag_name, tag_size, unsafe_convert(Ptr{Cvoid}, tag))
    DebugUtilsObjectTagInfoEXT(vks, deps)
end

function DebugUtilsObjectNameInfoEXT(object_type::VkObjectType, object_handle::Integer; next = C_NULL, object_name = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    object_name = cconvert(Cstring, object_name)
    deps = [next, object_name]
    vks = VkDebugUtilsObjectNameInfoEXT(VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), object_type, object_handle, unsafe_convert(Cstring, object_name))
    DebugUtilsObjectNameInfoEXT(vks, deps)
end

function DeviceQueueGlobalPriorityCreateInfoEXT(global_priority::VkQueueGlobalPriorityEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceQueueGlobalPriorityCreateInfoEXT(VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), global_priority)
    DeviceQueueGlobalPriorityCreateInfoEXT(vks, deps)
end

function PhysicalDeviceHostQueryResetFeatures(host_query_reset::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceHostQueryResetFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES, unsafe_convert(Ptr{Cvoid}, next), host_query_reset)
    PhysicalDeviceHostQueryResetFeatures(vks, deps)
end

function PhysicalDeviceShaderFloat16Int8Features(shader_float_16::Bool, shader_int_8::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderFloat16Int8Features(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES, unsafe_convert(Ptr{Cvoid}, next), shader_float_16, shader_int_8)
    PhysicalDeviceShaderFloat16Int8Features(vks, deps)
end

function PhysicalDeviceShaderDrawParametersFeatures(shader_draw_parameters::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderDrawParametersFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES, unsafe_convert(Ptr{Cvoid}, next), shader_draw_parameters)
    PhysicalDeviceShaderDrawParametersFeatures(vks, deps)
end

function ShaderModuleValidationCacheCreateInfoEXT(validation_cache::ValidationCacheEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkShaderModuleValidationCacheCreateInfoEXT(VK_STRUCTURE_TYPE_SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), validation_cache)
    ShaderModuleValidationCacheCreateInfoEXT(vks, deps)
end

function ValidationCacheCreateInfoEXT(initial_data::Ptr{Cvoid}; next = C_NULL, flags = 0, initial_data_size = 0)
    next = cconvert(Ptr{Cvoid}, next)
    initial_data = cconvert(Ptr{Cvoid}, initial_data)
    deps = [next, initial_data]
    vks = VkValidationCacheCreateInfoEXT(VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, initial_data_size, unsafe_convert(Ptr{Cvoid}, initial_data))
    ValidationCacheCreateInfoEXT(vks, deps)
end

function ImageFormatListCreateInfo(view_formats::AbstractArray{<:VkFormat}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    view_formats = cconvert(Ptr{VkFormat}, view_formats)
    deps = [next, view_formats]
    vks = VkImageFormatListCreateInfo(VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(view_formats), unsafe_convert(Ptr{VkFormat}, view_formats))
    ImageFormatListCreateInfo(vks, deps)
end

function PipelineCoverageModulationStateCreateInfoNV(coverage_modulation_mode::VkCoverageModulationModeNV, coverage_modulation_table_enable::Bool; next = C_NULL, flags = 0, coverage_modulation_table = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    coverage_modulation_table = cconvert(Ptr{Float32}, coverage_modulation_table)
    deps = [next, coverage_modulation_table]
    vks = VkPipelineCoverageModulationStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), flags, coverage_modulation_mode, coverage_modulation_table_enable, pointer_length(coverage_modulation_table), unsafe_convert(Ptr{Float32}, coverage_modulation_table))
    PipelineCoverageModulationStateCreateInfoNV(vks, deps)
end

function DescriptorPoolInlineUniformBlockCreateInfoEXT(max_inline_uniform_block_bindings::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDescriptorPoolInlineUniformBlockCreateInfoEXT(VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), max_inline_uniform_block_bindings)
    DescriptorPoolInlineUniformBlockCreateInfoEXT(vks, deps)
end

function WriteDescriptorSetInlineUniformBlockEXT(data_size::Integer, data::Ptr{Cvoid}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    data = cconvert(Ptr{Cvoid}, data)
    deps = [next, data]
    vks = VkWriteDescriptorSetInlineUniformBlockEXT(VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK_EXT, unsafe_convert(Ptr{Cvoid}, next), data_size, unsafe_convert(Ptr{Cvoid}, data))
    WriteDescriptorSetInlineUniformBlockEXT(vks, deps)
end

function PhysicalDeviceInlineUniformBlockFeaturesEXT(inline_uniform_block::Bool, descriptor_binding_inline_uniform_block_update_after_bind::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceInlineUniformBlockFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), inline_uniform_block, descriptor_binding_inline_uniform_block_update_after_bind)
    PhysicalDeviceInlineUniformBlockFeaturesEXT(vks, deps)
end

function PipelineColorBlendAdvancedStateCreateInfoEXT(src_premultiplied::Bool, dst_premultiplied::Bool, blend_overlap::VkBlendOverlapEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineColorBlendAdvancedStateCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_ADVANCED_STATE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), src_premultiplied, dst_premultiplied, blend_overlap)
    PipelineColorBlendAdvancedStateCreateInfoEXT(vks, deps)
end

function PhysicalDeviceBlendOperationAdvancedFeaturesEXT(advanced_blend_coherent_operations::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), advanced_blend_coherent_operations)
    PhysicalDeviceBlendOperationAdvancedFeaturesEXT(vks, deps)
end

function SamplerReductionModeCreateInfo(reduction_mode::VkSamplerReductionMode; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSamplerReductionModeCreateInfo(VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), reduction_mode)
    SamplerReductionModeCreateInfo(vks, deps)
end

function PipelineSampleLocationsStateCreateInfoEXT(sample_locations_enable::Bool, sample_locations_info::SampleLocationsInfoEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineSampleLocationsStateCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_SAMPLE_LOCATIONS_STATE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), sample_locations_enable, sample_locations_info.vks)
    PipelineSampleLocationsStateCreateInfoEXT(vks, deps)
end

function RenderPassSampleLocationsBeginInfoEXT(attachment_initial_sample_locations::AbstractArray{<:AttachmentSampleLocationsEXT}, post_subpass_sample_locations::AbstractArray{<:SubpassSampleLocationsEXT}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    attachment_initial_sample_locations = cconvert(Ptr{VkAttachmentSampleLocationsEXT}, attachment_initial_sample_locations)
    post_subpass_sample_locations = cconvert(Ptr{VkSubpassSampleLocationsEXT}, post_subpass_sample_locations)
    deps = [next, attachment_initial_sample_locations, post_subpass_sample_locations]
    vks = VkRenderPassSampleLocationsBeginInfoEXT(VK_STRUCTURE_TYPE_RENDER_PASS_SAMPLE_LOCATIONS_BEGIN_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), pointer_length(attachment_initial_sample_locations), unsafe_convert(Ptr{VkAttachmentSampleLocationsEXT}, attachment_initial_sample_locations), pointer_length(post_subpass_sample_locations), unsafe_convert(Ptr{VkSubpassSampleLocationsEXT}, post_subpass_sample_locations))
    RenderPassSampleLocationsBeginInfoEXT(vks, deps)
end

function SubpassSampleLocationsEXT(subpass_index::Integer, sample_locations_info::SampleLocationsInfoEXT)
    SubpassSampleLocationsEXT(VkSubpassSampleLocationsEXT(subpass_index, sample_locations_info.vks))
end

function AttachmentSampleLocationsEXT(attachment_index::Integer, sample_locations_info::SampleLocationsInfoEXT)
    AttachmentSampleLocationsEXT(VkAttachmentSampleLocationsEXT(attachment_index, sample_locations_info.vks))
end

function SampleLocationsInfoEXT(sample_location_grid_size::Extent2D, sample_locations::AbstractArray{<:SampleLocationEXT}; next = C_NULL, sample_locations_per_pixel = 0)
    next = cconvert(Ptr{Cvoid}, next)
    sample_locations = cconvert(Ptr{VkSampleLocationEXT}, sample_locations)
    deps = [next, sample_locations]
    vks = VkSampleLocationsInfoEXT(VK_STRUCTURE_TYPE_SAMPLE_LOCATIONS_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), sample_locations_per_pixel, sample_location_grid_size.vks, pointer_length(sample_locations), unsafe_convert(Ptr{VkSampleLocationEXT}, sample_locations))
    SampleLocationsInfoEXT(vks, deps)
end

function SampleLocationEXT(x::Real, y::Real)
    SampleLocationEXT(VkSampleLocationEXT(x, y))
end

function PipelineCoverageToColorStateCreateInfoNV(coverage_to_color_enable::Bool; next = C_NULL, flags = 0, coverage_to_color_location = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineCoverageToColorStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_TO_COLOR_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), flags, coverage_to_color_enable, coverage_to_color_location)
    PipelineCoverageToColorStateCreateInfoNV(vks, deps)
end

function DeviceQueueInfo2(queue_family_index::Integer, queue_index::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceQueueInfo2(VK_STRUCTURE_TYPE_DEVICE_QUEUE_INFO_2, unsafe_convert(Ptr{Cvoid}, next), flags, queue_family_index, queue_index)
    DeviceQueueInfo2(vks, deps)
end

function PhysicalDeviceProtectedMemoryFeatures(protected_memory::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceProtectedMemoryFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES, unsafe_convert(Ptr{Cvoid}, next), protected_memory)
    PhysicalDeviceProtectedMemoryFeatures(vks, deps)
end

function ProtectedSubmitInfo(protected_submit::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkProtectedSubmitInfo(VK_STRUCTURE_TYPE_PROTECTED_SUBMIT_INFO, unsafe_convert(Ptr{Cvoid}, next), protected_submit)
    ProtectedSubmitInfo(vks, deps)
end

function ConditionalRenderingBeginInfoEXT(buffer::Buffer, offset::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkConditionalRenderingBeginInfoEXT(VK_STRUCTURE_TYPE_CONDITIONAL_RENDERING_BEGIN_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), buffer, offset, flags)
    ConditionalRenderingBeginInfoEXT(vks, deps)
end

function PhysicalDeviceSamplerYcbcrConversionFeatures(sampler_ycbcr_conversion::VersionNumber; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceSamplerYcbcrConversionFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES, unsafe_convert(Ptr{Cvoid}, next), to_vk(VkBool32, sampler_ycbcr_conversion))
    PhysicalDeviceSamplerYcbcrConversionFeatures(vks, deps)
end

function ImagePlaneMemoryRequirementsInfo(plane_aspect::VkImageAspectFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImagePlaneMemoryRequirementsInfo(VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO, unsafe_convert(Ptr{Cvoid}, next), plane_aspect)
    ImagePlaneMemoryRequirementsInfo(vks, deps)
end

function BindImagePlaneMemoryInfo(plane_aspect::VkImageAspectFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBindImagePlaneMemoryInfo(VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO, unsafe_convert(Ptr{Cvoid}, next), plane_aspect)
    BindImagePlaneMemoryInfo(vks, deps)
end

function SamplerYcbcrConversionCreateInfo(format::VkFormat, ycbcr_model::VkSamplerYcbcrModelConversion, ycbcr_range::VkSamplerYcbcrRange, components::ComponentMapping, x_chroma_offset::VkChromaLocation, y_chroma_offset::VkChromaLocation, chroma_filter::VkFilter, force_explicit_reconstruction::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSamplerYcbcrConversionCreateInfo(VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), format, ycbcr_model, ycbcr_range, components.vks, x_chroma_offset, y_chroma_offset, chroma_filter, force_explicit_reconstruction)
    SamplerYcbcrConversionCreateInfo(vks, deps)
end

function SamplerYcbcrConversionInfo(conversion::SamplerYcbcrConversion; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSamplerYcbcrConversionInfo(VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO, unsafe_convert(Ptr{Cvoid}, next), conversion)
    SamplerYcbcrConversionInfo(vks, deps)
end

function PipelineTessellationDomainOriginStateCreateInfo(domain_origin::VkTessellationDomainOrigin; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineTessellationDomainOriginStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), domain_origin)
    PipelineTessellationDomainOriginStateCreateInfo(vks, deps)
end

function ImageViewUsageCreateInfo(usage::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageViewUsageCreateInfo(VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), usage)
    ImageViewUsageCreateInfo(vks, deps)
end

function MemoryDedicatedAllocateInfo(; next = C_NULL, image = C_NULL, buffer = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryDedicatedAllocateInfo(VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), image, buffer)
    MemoryDedicatedAllocateInfo(vks, deps)
end

function ImageSparseMemoryRequirementsInfo2(image::Image; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageSparseMemoryRequirementsInfo2(VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2, unsafe_convert(Ptr{Cvoid}, next), image)
    ImageSparseMemoryRequirementsInfo2(vks, deps)
end

function ImageMemoryRequirementsInfo2(image::Image; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageMemoryRequirementsInfo2(VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2, unsafe_convert(Ptr{Cvoid}, next), image)
    ImageMemoryRequirementsInfo2(vks, deps)
end

function BufferMemoryRequirementsInfo2(buffer::Buffer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBufferMemoryRequirementsInfo2(VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2, unsafe_convert(Ptr{Cvoid}, next), buffer)
    BufferMemoryRequirementsInfo2(vks, deps)
end

function PhysicalDeviceShaderSubgroupExtendedTypesFeatures(shader_subgroup_extended_types::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES, unsafe_convert(Ptr{Cvoid}, next), shader_subgroup_extended_types)
    PhysicalDeviceShaderSubgroupExtendedTypesFeatures(vks, deps)
end

function PhysicalDevice16BitStorageFeatures(storage_buffer_16_bit_access::Bool, uniform_and_storage_buffer_16_bit_access::Bool, storage_push_constant_16::Bool, storage_input_output_16::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDevice16BitStorageFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES, unsafe_convert(Ptr{Cvoid}, next), storage_buffer_16_bit_access, uniform_and_storage_buffer_16_bit_access, storage_push_constant_16, storage_input_output_16)
    PhysicalDevice16BitStorageFeatures(vks, deps)
end

function DisplayPlaneInfo2KHR(mode::DisplayModeKHR, plane_index::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDisplayPlaneInfo2KHR(VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR, unsafe_convert(Ptr{Cvoid}, next), mode, plane_index)
    DisplayPlaneInfo2KHR(vks, deps)
end

function PhysicalDeviceSurfaceInfo2KHR(surface::SurfaceKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceSurfaceInfo2KHR(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR, unsafe_convert(Ptr{Cvoid}, next), surface)
    PhysicalDeviceSurfaceInfo2KHR(vks, deps)
end

function RenderPassInputAttachmentAspectCreateInfo(aspect_references::AbstractArray{<:InputAttachmentAspectReference}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    aspect_references = cconvert(Ptr{VkInputAttachmentAspectReference}, aspect_references)
    deps = [next, aspect_references]
    vks = VkRenderPassInputAttachmentAspectCreateInfo(VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(aspect_references), unsafe_convert(Ptr{VkInputAttachmentAspectReference}, aspect_references))
    RenderPassInputAttachmentAspectCreateInfo(vks, deps)
end

function InputAttachmentAspectReference(subpass::Integer, input_attachment_index::Integer, aspect_mask::Integer)
    InputAttachmentAspectReference(VkInputAttachmentAspectReference(subpass, input_attachment_index, aspect_mask))
end

function PipelineDiscardRectangleStateCreateInfoEXT(discard_rectangle_mode::VkDiscardRectangleModeEXT, discard_rectangles::AbstractArray{<:Rect2D}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    discard_rectangles = cconvert(Ptr{VkRect2D}, discard_rectangles)
    deps = [next, discard_rectangles]
    vks = VkPipelineDiscardRectangleStateCreateInfoEXT(VK_STRUCTURE_TYPE_PIPELINE_DISCARD_RECTANGLE_STATE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, discard_rectangle_mode, pointer_length(discard_rectangles), unsafe_convert(Ptr{VkRect2D}, discard_rectangles))
    PipelineDiscardRectangleStateCreateInfoEXT(vks, deps)
end

function PipelineViewportSwizzleStateCreateInfoNV(viewport_swizzles::AbstractArray{<:ViewportSwizzleNV}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    viewport_swizzles = cconvert(Ptr{VkViewportSwizzleNV}, viewport_swizzles)
    deps = [next, viewport_swizzles]
    vks = VkPipelineViewportSwizzleStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SWIZZLE_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(viewport_swizzles), unsafe_convert(Ptr{VkViewportSwizzleNV}, viewport_swizzles))
    PipelineViewportSwizzleStateCreateInfoNV(vks, deps)
end

function ViewportSwizzleNV(x::VkViewportCoordinateSwizzleNV, y::VkViewportCoordinateSwizzleNV, z::VkViewportCoordinateSwizzleNV, w::VkViewportCoordinateSwizzleNV)
    ViewportSwizzleNV(VkViewportSwizzleNV(x, y, z, w))
end

function PipelineViewportWScalingStateCreateInfoNV(viewport_w_scaling_enable::Bool; next = C_NULL, viewport_w_scalings = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    viewport_w_scalings = cconvert(Ptr{VkViewportWScalingNV}, viewport_w_scalings)
    deps = [next, viewport_w_scalings]
    vks = VkPipelineViewportWScalingStateCreateInfoNV(VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_W_SCALING_STATE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), viewport_w_scaling_enable, pointer_length(viewport_w_scalings), unsafe_convert(Ptr{VkViewportWScalingNV}, viewport_w_scalings))
    PipelineViewportWScalingStateCreateInfoNV(vks, deps)
end

function ViewportWScalingNV(xcoeff::Real, ycoeff::Real)
    ViewportWScalingNV(VkViewportWScalingNV(xcoeff, ycoeff))
end

function MetalSurfaceCreateInfoEXT(layer::Cvoid; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    layer = cconvert(Ptr{CAMetalLayer}, layer)
    deps = [next, layer]
    vks = VkMetalSurfaceCreateInfoEXT(VK_STRUCTURE_TYPE_METAL_SURFACE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{CAMetalLayer}, layer))
    MetalSurfaceCreateInfoEXT(vks, deps)
end

function MacOSSurfaceCreateInfoMVK(view::Ptr{Cvoid}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    view = cconvert(Ptr{Cvoid}, view)
    deps = [next, view]
    vks = VkMacOSSurfaceCreateInfoMVK(VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{Cvoid}, view))
    MacOSSurfaceCreateInfoMVK(vks, deps)
end

function IOSSurfaceCreateInfoMVK(view::Ptr{Cvoid}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    view = cconvert(Ptr{Cvoid}, view)
    deps = [next, view]
    vks = VkIOSSurfaceCreateInfoMVK(VK_STRUCTURE_TYPE_IOS_SURFACE_CREATE_INFO_MVK, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{Cvoid}, view))
    IOSSurfaceCreateInfoMVK(vks, deps)
end

function PresentTimeGOOGLE(present_id::Integer, desired_present_time::Integer)
    PresentTimeGOOGLE(VkPresentTimeGOOGLE(present_id, desired_present_time))
end

function PresentTimesInfoGOOGLE(; next = C_NULL, times = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    times = cconvert(Ptr{VkPresentTimeGOOGLE}, times)
    deps = [next, times]
    vks = VkPresentTimesInfoGOOGLE(VK_STRUCTURE_TYPE_PRESENT_TIMES_INFO_GOOGLE, unsafe_convert(Ptr{Cvoid}, next), pointer_length(times), unsafe_convert(Ptr{VkPresentTimeGOOGLE}, times))
    PresentTimesInfoGOOGLE(vks, deps)
end

function SwapchainDisplayNativeHdrCreateInfoAMD(local_dimming_enable::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSwapchainDisplayNativeHdrCreateInfoAMD(VK_STRUCTURE_TYPE_SWAPCHAIN_DISPLAY_NATIVE_HDR_CREATE_INFO_AMD, unsafe_convert(Ptr{Cvoid}, next), local_dimming_enable)
    SwapchainDisplayNativeHdrCreateInfoAMD(vks, deps)
end

function HdrMetadataEXT(display_primary_red::XYColorEXT, display_primary_green::XYColorEXT, display_primary_blue::XYColorEXT, white_point::XYColorEXT, max_luminance::Real, min_luminance::Real, max_content_light_level::Real, max_frame_average_light_level::Real; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkHdrMetadataEXT(VK_STRUCTURE_TYPE_HDR_METADATA_EXT, unsafe_convert(Ptr{Cvoid}, next), display_primary_red.vks, display_primary_green.vks, display_primary_blue.vks, white_point.vks, max_luminance, min_luminance, max_content_light_level, max_frame_average_light_level)
    HdrMetadataEXT(vks, deps)
end

function XYColorEXT(x::Real, y::Real)
    XYColorEXT(VkXYColorEXT(x, y))
end

function DescriptorUpdateTemplateCreateInfo(descriptor_update_entries::AbstractArray{<:DescriptorUpdateTemplateEntry}, template_type::VkDescriptorUpdateTemplateType, descriptor_set_layout::DescriptorSetLayout, pipeline_bind_point::VkPipelineBindPoint, pipeline_layout::PipelineLayout, set::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    descriptor_update_entries = cconvert(Ptr{VkDescriptorUpdateTemplateEntry}, descriptor_update_entries)
    deps = [next, descriptor_update_entries]
    vks = VkDescriptorUpdateTemplateCreateInfo(VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(descriptor_update_entries), unsafe_convert(Ptr{VkDescriptorUpdateTemplateEntry}, descriptor_update_entries), template_type, descriptor_set_layout, pipeline_bind_point, pipeline_layout, set)
    DescriptorUpdateTemplateCreateInfo(vks, deps)
end

function DescriptorUpdateTemplateEntry(dst_binding::Integer, dst_array_element::Integer, descriptor_count::Integer, descriptor_type::VkDescriptorType, offset::Integer, stride::Integer)
    DescriptorUpdateTemplateEntry(VkDescriptorUpdateTemplateEntry(dst_binding, dst_array_element, descriptor_count, descriptor_type, offset, stride))
end

function DeviceGroupSwapchainCreateInfoKHR(modes::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceGroupSwapchainCreateInfoKHR(VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), modes)
    DeviceGroupSwapchainCreateInfoKHR(vks, deps)
end

function DeviceGroupDeviceCreateInfo(physical_devices::AbstractArray{<:PhysicalDevice}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    physical_devices = cconvert(Ptr{VkPhysicalDevice}, physical_devices)
    deps = [next, physical_devices]
    vks = VkDeviceGroupDeviceCreateInfo(VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(physical_devices), unsafe_convert(Ptr{VkPhysicalDevice}, physical_devices))
    DeviceGroupDeviceCreateInfo(vks, deps)
end

function DeviceGroupPresentInfoKHR(device_masks::AbstractArray{<:Integer}, mode::VkDeviceGroupPresentModeFlagBitsKHR; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    device_masks = cconvert(Ptr{UInt32}, device_masks)
    deps = [next, device_masks]
    vks = VkDeviceGroupPresentInfoKHR(VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), pointer_length(device_masks), unsafe_convert(Ptr{UInt32}, device_masks), mode)
    DeviceGroupPresentInfoKHR(vks, deps)
end

function AcquireNextImageInfoKHR(swapchain::SwapchainKHR, timeout::Integer, device_mask::Integer; next = C_NULL, semaphore = C_NULL, fence = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkAcquireNextImageInfoKHR(VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), swapchain, timeout, semaphore, fence, device_mask)
    AcquireNextImageInfoKHR(vks, deps)
end

function BindImageMemorySwapchainInfoKHR(swapchain::SwapchainKHR, image_index::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBindImageMemorySwapchainInfoKHR(VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), swapchain, image_index)
    BindImageMemorySwapchainInfoKHR(vks, deps)
end

function ImageSwapchainCreateInfoKHR(; next = C_NULL, swapchain = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageSwapchainCreateInfoKHR(VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), swapchain)
    ImageSwapchainCreateInfoKHR(vks, deps)
end

function DeviceGroupBindSparseInfo(resource_device_index::Integer, memory_device_index::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceGroupBindSparseInfo(VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO, unsafe_convert(Ptr{Cvoid}, next), resource_device_index, memory_device_index)
    DeviceGroupBindSparseInfo(vks, deps)
end

function DeviceGroupSubmitInfo(wait_semaphore_device_indices::AbstractArray{<:Integer}, command_buffer_device_masks::AbstractArray{<:Integer}, signal_semaphore_device_indices::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    wait_semaphore_device_indices = cconvert(Ptr{UInt32}, wait_semaphore_device_indices)
    command_buffer_device_masks = cconvert(Ptr{UInt32}, command_buffer_device_masks)
    signal_semaphore_device_indices = cconvert(Ptr{UInt32}, signal_semaphore_device_indices)
    deps = [next, wait_semaphore_device_indices, command_buffer_device_masks, signal_semaphore_device_indices]
    vks = VkDeviceGroupSubmitInfo(VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(wait_semaphore_device_indices), unsafe_convert(Ptr{UInt32}, wait_semaphore_device_indices), pointer_length(command_buffer_device_masks), unsafe_convert(Ptr{UInt32}, command_buffer_device_masks), pointer_length(signal_semaphore_device_indices), unsafe_convert(Ptr{UInt32}, signal_semaphore_device_indices))
    DeviceGroupSubmitInfo(vks, deps)
end

function DeviceGroupCommandBufferBeginInfo(device_mask::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceGroupCommandBufferBeginInfo(VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO, unsafe_convert(Ptr{Cvoid}, next), device_mask)
    DeviceGroupCommandBufferBeginInfo(vks, deps)
end

function DeviceGroupRenderPassBeginInfo(device_mask::Integer, device_render_areas::AbstractArray{<:Rect2D}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    device_render_areas = cconvert(Ptr{VkRect2D}, device_render_areas)
    deps = [next, device_render_areas]
    vks = VkDeviceGroupRenderPassBeginInfo(VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO, unsafe_convert(Ptr{Cvoid}, next), device_mask, pointer_length(device_render_areas), unsafe_convert(Ptr{VkRect2D}, device_render_areas))
    DeviceGroupRenderPassBeginInfo(vks, deps)
end

function BindImageMemoryDeviceGroupInfo(device_indices::AbstractArray{<:Integer}, split_instance_bind_regions::AbstractArray{<:Rect2D}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    device_indices = cconvert(Ptr{UInt32}, device_indices)
    split_instance_bind_regions = cconvert(Ptr{VkRect2D}, split_instance_bind_regions)
    deps = [next, device_indices, split_instance_bind_regions]
    vks = VkBindImageMemoryDeviceGroupInfo(VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(device_indices), unsafe_convert(Ptr{UInt32}, device_indices), pointer_length(split_instance_bind_regions), unsafe_convert(Ptr{VkRect2D}, split_instance_bind_regions))
    BindImageMemoryDeviceGroupInfo(vks, deps)
end

function BindImageMemoryInfo(image::Image, memory::DeviceMemory, memory_offset::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBindImageMemoryInfo(VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO, unsafe_convert(Ptr{Cvoid}, next), image, memory, memory_offset)
    BindImageMemoryInfo(vks, deps)
end

function BindBufferMemoryDeviceGroupInfo(device_indices::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    device_indices = cconvert(Ptr{UInt32}, device_indices)
    deps = [next, device_indices]
    vks = VkBindBufferMemoryDeviceGroupInfo(VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(device_indices), unsafe_convert(Ptr{UInt32}, device_indices))
    BindBufferMemoryDeviceGroupInfo(vks, deps)
end

function BindBufferMemoryInfo(buffer::Buffer, memory::DeviceMemory, memory_offset::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBindBufferMemoryInfo(VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO, unsafe_convert(Ptr{Cvoid}, next), buffer, memory, memory_offset)
    BindBufferMemoryInfo(vks, deps)
end

function MemoryAllocateFlagsInfo(device_mask::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryAllocateFlagsInfo(VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, device_mask)
    MemoryAllocateFlagsInfo(vks, deps)
end

function SwapchainCounterCreateInfoEXT(; next = C_NULL, surface_counters = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSwapchainCounterCreateInfoEXT(VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), surface_counters)
    SwapchainCounterCreateInfoEXT(vks, deps)
end

function DisplayEventInfoEXT(display_event::VkDisplayEventTypeEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDisplayEventInfoEXT(VK_STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), display_event)
    DisplayEventInfoEXT(vks, deps)
end

function DeviceEventInfoEXT(device_event::VkDeviceEventTypeEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDeviceEventInfoEXT(VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), device_event)
    DeviceEventInfoEXT(vks, deps)
end

function DisplayPowerInfoEXT(power_state::VkDisplayPowerStateEXT; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDisplayPowerInfoEXT(VK_STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), power_state)
    DisplayPowerInfoEXT(vks, deps)
end

function RenderPassMultiviewCreateInfo(view_masks::AbstractArray{<:Integer}, view_offsets::AbstractArray{<:Integer}, correlation_masks::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    view_masks = cconvert(Ptr{UInt32}, view_masks)
    view_offsets = cconvert(Ptr{Int32}, view_offsets)
    correlation_masks = cconvert(Ptr{UInt32}, correlation_masks)
    deps = [next, view_masks, view_offsets, correlation_masks]
    vks = VkRenderPassMultiviewCreateInfo(VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(view_masks), unsafe_convert(Ptr{UInt32}, view_masks), pointer_length(view_offsets), unsafe_convert(Ptr{Int32}, view_offsets), pointer_length(correlation_masks), unsafe_convert(Ptr{UInt32}, correlation_masks))
    RenderPassMultiviewCreateInfo(vks, deps)
end

function PhysicalDeviceMultiviewFeatures(multiview::Bool, multiview_geometry_shader::Bool, multiview_tessellation_shader::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceMultiviewFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES, unsafe_convert(Ptr{Cvoid}, next), multiview, multiview_geometry_shader, multiview_tessellation_shader)
    PhysicalDeviceMultiviewFeatures(vks, deps)
end

function FenceGetFdInfoKHR(fence::Fence, handle_type::VkExternalFenceHandleTypeFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkFenceGetFdInfoKHR(VK_STRUCTURE_TYPE_FENCE_GET_FD_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), fence, handle_type)
    FenceGetFdInfoKHR(vks, deps)
end

function ImportFenceFdInfoKHR(fence::Fence, handle_type::VkExternalFenceHandleTypeFlagBits, fd::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImportFenceFdInfoKHR(VK_STRUCTURE_TYPE_IMPORT_FENCE_FD_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), fence, flags, handle_type, fd)
    ImportFenceFdInfoKHR(vks, deps)
end

function FenceGetWin32HandleInfoKHR(fence::Fence, handle_type::VkExternalFenceHandleTypeFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkFenceGetWin32HandleInfoKHR(VK_STRUCTURE_TYPE_FENCE_GET_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), fence, handle_type)
    FenceGetWin32HandleInfoKHR(vks, deps)
end

function ExportFenceWin32HandleInfoKHR(dw_access::vk.DWORD, name::vk.LPCWSTR; next = C_NULL, attributes = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    attributes = cconvert(Ptr{SECURITY_ATTRIBUTES}, attributes)
    deps = [next, attributes]
    vks = VkExportFenceWin32HandleInfoKHR(VK_STRUCTURE_TYPE_EXPORT_FENCE_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Ptr{SECURITY_ATTRIBUTES}, attributes), dw_access, name)
    ExportFenceWin32HandleInfoKHR(vks, deps)
end

function ImportFenceWin32HandleInfoKHR(fence::Fence; next = C_NULL, flags = 0, handle_type = 0, handle = 0, name = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImportFenceWin32HandleInfoKHR(VK_STRUCTURE_TYPE_IMPORT_FENCE_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), fence, flags, handle_type, handle, name)
    ImportFenceWin32HandleInfoKHR(vks, deps)
end

function ExportFenceCreateInfo(; next = C_NULL, handle_types = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkExportFenceCreateInfo(VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), handle_types)
    ExportFenceCreateInfo(vks, deps)
end

function PhysicalDeviceExternalFenceInfo(handle_type::VkExternalFenceHandleTypeFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceExternalFenceInfo(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO, unsafe_convert(Ptr{Cvoid}, next), handle_type)
    PhysicalDeviceExternalFenceInfo(vks, deps)
end

function SemaphoreGetFdInfoKHR(semaphore::Semaphore, handle_type::VkExternalSemaphoreHandleTypeFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSemaphoreGetFdInfoKHR(VK_STRUCTURE_TYPE_SEMAPHORE_GET_FD_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), semaphore, handle_type)
    SemaphoreGetFdInfoKHR(vks, deps)
end

function ImportSemaphoreFdInfoKHR(semaphore::Semaphore, handle_type::VkExternalSemaphoreHandleTypeFlagBits, fd::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImportSemaphoreFdInfoKHR(VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_FD_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), semaphore, flags, handle_type, fd)
    ImportSemaphoreFdInfoKHR(vks, deps)
end

function SemaphoreGetWin32HandleInfoKHR(semaphore::Semaphore, handle_type::VkExternalSemaphoreHandleTypeFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSemaphoreGetWin32HandleInfoKHR(VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), semaphore, handle_type)
    SemaphoreGetWin32HandleInfoKHR(vks, deps)
end

function D3D12FenceSubmitInfoKHR(; next = C_NULL, wait_semaphore_values = C_NULL, signal_semaphore_values = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    wait_semaphore_values = cconvert(Ptr{UInt64}, wait_semaphore_values)
    signal_semaphore_values = cconvert(Ptr{UInt64}, signal_semaphore_values)
    deps = [next, wait_semaphore_values, signal_semaphore_values]
    vks = VkD3D12FenceSubmitInfoKHR(VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), pointer_length(wait_semaphore_values), unsafe_convert(Ptr{UInt64}, wait_semaphore_values), pointer_length(signal_semaphore_values), unsafe_convert(Ptr{UInt64}, signal_semaphore_values))
    D3D12FenceSubmitInfoKHR(vks, deps)
end

function ExportSemaphoreWin32HandleInfoKHR(dw_access::vk.DWORD, name::vk.LPCWSTR; next = C_NULL, attributes = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    attributes = cconvert(Ptr{SECURITY_ATTRIBUTES}, attributes)
    deps = [next, attributes]
    vks = VkExportSemaphoreWin32HandleInfoKHR(VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Ptr{SECURITY_ATTRIBUTES}, attributes), dw_access, name)
    ExportSemaphoreWin32HandleInfoKHR(vks, deps)
end

function ImportSemaphoreWin32HandleInfoKHR(semaphore::Semaphore; next = C_NULL, flags = 0, handle_type = 0, handle = 0, name = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImportSemaphoreWin32HandleInfoKHR(VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), semaphore, flags, handle_type, handle, name)
    ImportSemaphoreWin32HandleInfoKHR(vks, deps)
end

function ExportSemaphoreCreateInfo(; next = C_NULL, handle_types = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkExportSemaphoreCreateInfo(VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), handle_types)
    ExportSemaphoreCreateInfo(vks, deps)
end

function PhysicalDeviceExternalSemaphoreInfo(handle_type::VkExternalSemaphoreHandleTypeFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceExternalSemaphoreInfo(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO, unsafe_convert(Ptr{Cvoid}, next), handle_type)
    PhysicalDeviceExternalSemaphoreInfo(vks, deps)
end

function Win32KeyedMutexAcquireReleaseInfoKHR(acquire_syncs::AbstractArray{<:DeviceMemory}, acquire_keys::AbstractArray{<:Integer}, acquire_timeouts::AbstractArray{<:Integer}, release_syncs::AbstractArray{<:DeviceMemory}, release_keys::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    acquire_syncs = cconvert(Ptr{VkDeviceMemory}, acquire_syncs)
    acquire_keys = cconvert(Ptr{UInt64}, acquire_keys)
    acquire_timeouts = cconvert(Ptr{UInt32}, acquire_timeouts)
    release_syncs = cconvert(Ptr{VkDeviceMemory}, release_syncs)
    release_keys = cconvert(Ptr{UInt64}, release_keys)
    deps = [next, acquire_syncs, acquire_keys, acquire_timeouts, release_syncs, release_keys]
    vks = VkWin32KeyedMutexAcquireReleaseInfoKHR(VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), pointer_length(acquire_syncs), unsafe_convert(Ptr{VkDeviceMemory}, acquire_syncs), unsafe_convert(Ptr{UInt64}, acquire_keys), unsafe_convert(Ptr{UInt32}, acquire_timeouts), pointer_length(release_syncs), unsafe_convert(Ptr{VkDeviceMemory}, release_syncs), unsafe_convert(Ptr{UInt64}, release_keys))
    Win32KeyedMutexAcquireReleaseInfoKHR(vks, deps)
end

function MemoryGetFdInfoKHR(memory::DeviceMemory, handle_type::VkExternalMemoryHandleTypeFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryGetFdInfoKHR(VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), memory, handle_type)
    MemoryGetFdInfoKHR(vks, deps)
end

function ImportMemoryFdInfoKHR(fd::Integer; next = C_NULL, handle_type = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImportMemoryFdInfoKHR(VK_STRUCTURE_TYPE_IMPORT_MEMORY_FD_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), handle_type, fd)
    ImportMemoryFdInfoKHR(vks, deps)
end

function MemoryGetWin32HandleInfoKHR(memory::DeviceMemory, handle_type::VkExternalMemoryHandleTypeFlagBits; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryGetWin32HandleInfoKHR(VK_STRUCTURE_TYPE_MEMORY_GET_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), memory, handle_type)
    MemoryGetWin32HandleInfoKHR(vks, deps)
end

function ExportMemoryWin32HandleInfoKHR(dw_access::vk.DWORD, name::vk.LPCWSTR; next = C_NULL, attributes = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    attributes = cconvert(Ptr{SECURITY_ATTRIBUTES}, attributes)
    deps = [next, attributes]
    vks = VkExportMemoryWin32HandleInfoKHR(VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Ptr{SECURITY_ATTRIBUTES}, attributes), dw_access, name)
    ExportMemoryWin32HandleInfoKHR(vks, deps)
end

function ImportMemoryWin32HandleInfoKHR(; next = C_NULL, handle_type = 0, handle = 0, name = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImportMemoryWin32HandleInfoKHR(VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), handle_type, handle, name)
    ImportMemoryWin32HandleInfoKHR(vks, deps)
end

function ExportMemoryAllocateInfo(; next = C_NULL, handle_types = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkExportMemoryAllocateInfo(VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), handle_types)
    ExportMemoryAllocateInfo(vks, deps)
end

function ExternalMemoryBufferCreateInfo(; next = C_NULL, handle_types = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkExternalMemoryBufferCreateInfo(VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), handle_types)
    ExternalMemoryBufferCreateInfo(vks, deps)
end

function ExternalMemoryImageCreateInfo(handle_types::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkExternalMemoryImageCreateInfo(VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), handle_types)
    ExternalMemoryImageCreateInfo(vks, deps)
end

function PhysicalDeviceExternalBufferInfo(usage::Integer, handle_type::VkExternalMemoryHandleTypeFlagBits; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceExternalBufferInfo(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, usage, handle_type)
    PhysicalDeviceExternalBufferInfo(vks, deps)
end

function PhysicalDeviceExternalImageFormatInfo(; next = C_NULL, handle_type = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceExternalImageFormatInfo(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO, unsafe_convert(Ptr{Cvoid}, next), handle_type)
    PhysicalDeviceExternalImageFormatInfo(vks, deps)
end

function PhysicalDeviceVariablePointersFeatures(variable_pointers_storage_buffer::Bool, variable_pointers::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceVariablePointersFeatures(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES, unsafe_convert(Ptr{Cvoid}, next), variable_pointers_storage_buffer, variable_pointers)
    PhysicalDeviceVariablePointersFeatures(vks, deps)
end

function RectLayerKHR(offset::Offset2D, extent::Extent2D, layer::Integer)
    RectLayerKHR(VkRectLayerKHR(offset.vks, extent.vks, layer))
end

function PresentRegionKHR(; rectangles = C_NULL)
    rectangles = cconvert(Ptr{VkRectLayerKHR}, rectangles)
    deps = [rectangles]
    vks = VkPresentRegionKHR(pointer_length(rectangles), unsafe_convert(Ptr{VkRectLayerKHR}, rectangles))
    PresentRegionKHR(vks, deps)
end

function PresentRegionsKHR(; next = C_NULL, regions = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    regions = cconvert(Ptr{VkPresentRegionKHR}, regions)
    deps = [next, regions]
    vks = VkPresentRegionsKHR(VK_STRUCTURE_TYPE_PRESENT_REGIONS_KHR, unsafe_convert(Ptr{Cvoid}, next), pointer_length(regions), unsafe_convert(Ptr{VkPresentRegionKHR}, regions))
    PresentRegionsKHR(vks, deps)
end

function ConformanceVersion(major::Integer, minor::Integer, subminor::Integer, patch::Integer)
    ConformanceVersion(VkConformanceVersion(major, minor, subminor, patch))
end

function PhysicalDeviceSparseImageFormatInfo2(format::VkFormat, type::VkImageType, samples::VkSampleCountFlagBits, usage::Integer, tiling::VkImageTiling; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceSparseImageFormatInfo2(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2, unsafe_convert(Ptr{Cvoid}, next), format, type, samples, usage, tiling)
    PhysicalDeviceSparseImageFormatInfo2(vks, deps)
end

function PhysicalDeviceImageFormatInfo2(format::VkFormat, type::VkImageType, tiling::VkImageTiling, usage::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceImageFormatInfo2(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2, unsafe_convert(Ptr{Cvoid}, next), format, type, tiling, usage, flags)
    PhysicalDeviceImageFormatInfo2(vks, deps)
end

function PhysicalDeviceFeatures2(features::PhysicalDeviceFeatures; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceFeatures2(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2, unsafe_convert(Ptr{Cvoid}, next), features.vks)
    PhysicalDeviceFeatures2(vks, deps)
end

function GeneratedCommandsMemoryRequirementsInfoNV(pipeline_bind_point::VkPipelineBindPoint, pipeline::Pipeline, indirect_commands_layout::IndirectCommandsLayoutNV, max_sequences_count::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkGeneratedCommandsMemoryRequirementsInfoNV(VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), pipeline_bind_point, pipeline, indirect_commands_layout, max_sequences_count)
    GeneratedCommandsMemoryRequirementsInfoNV(vks, deps)
end

function GeneratedCommandsInfoNV(pipeline_bind_point::VkPipelineBindPoint, pipeline::Pipeline, indirect_commands_layout::IndirectCommandsLayoutNV, streams::AbstractArray{<:IndirectCommandsStreamNV}, sequences_count::Integer, preprocess_buffer::Buffer, preprocess_offset::Integer, preprocess_size::Integer; next = C_NULL, sequences_count_buffer = C_NULL, sequences_count_offset = 0, sequences_index_buffer = C_NULL, sequences_index_offset = 0)
    next = cconvert(Ptr{Cvoid}, next)
    streams = cconvert(Ptr{VkIndirectCommandsStreamNV}, streams)
    deps = [next, streams]
    vks = VkGeneratedCommandsInfoNV(VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), pipeline_bind_point, pipeline, indirect_commands_layout, pointer_length(streams), unsafe_convert(Ptr{VkIndirectCommandsStreamNV}, streams), sequences_count, preprocess_buffer, preprocess_offset, preprocess_size, sequences_count_buffer, sequences_count_offset, sequences_index_buffer, sequences_index_offset)
    GeneratedCommandsInfoNV(vks, deps)
end

function IndirectCommandsLayoutCreateInfoNV(flags::Integer, pipeline_bind_point::VkPipelineBindPoint, tokens::AbstractArray{<:IndirectCommandsLayoutTokenNV}, stream_strides::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    tokens = cconvert(Ptr{VkIndirectCommandsLayoutTokenNV}, tokens)
    stream_strides = cconvert(Ptr{UInt32}, stream_strides)
    deps = [next, tokens, stream_strides]
    vks = VkIndirectCommandsLayoutCreateInfoNV(VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), flags, pipeline_bind_point, pointer_length(tokens), unsafe_convert(Ptr{VkIndirectCommandsLayoutTokenNV}, tokens), pointer_length(stream_strides), unsafe_convert(Ptr{UInt32}, stream_strides))
    IndirectCommandsLayoutCreateInfoNV(vks, deps)
end

function IndirectCommandsLayoutTokenNV(token_type::VkIndirectCommandsTokenTypeNV, stream::Integer, offset::Integer, vertex_binding_unit::Integer, vertex_dynamic_stride::Bool, pushconstant_offset::Integer, pushconstant_size::Integer, index_types::AbstractArray{<:VkIndexType}, index_type_values::AbstractArray{<:Integer}; next = C_NULL, pushconstant_pipeline_layout = C_NULL, pushconstant_shader_stage_flags = 0, indirect_state_flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    index_types = cconvert(Ptr{VkIndexType}, index_types)
    index_type_values = cconvert(Ptr{UInt32}, index_type_values)
    deps = [next, index_types, index_type_values]
    vks = VkIndirectCommandsLayoutTokenNV(VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_NV, unsafe_convert(Ptr{Cvoid}, next), token_type, stream, offset, vertex_binding_unit, vertex_dynamic_stride, pushconstant_pipeline_layout, pushconstant_shader_stage_flags, pushconstant_offset, pushconstant_size, indirect_state_flags, pointer_length(index_types), unsafe_convert(Ptr{VkIndexType}, index_types), unsafe_convert(Ptr{UInt32}, index_type_values))
    IndirectCommandsLayoutTokenNV(vks, deps)
end

function IndirectCommandsStreamNV(buffer::Buffer, offset::Integer)
    IndirectCommandsStreamNV(VkIndirectCommandsStreamNV(buffer, offset))
end

function SetStateFlagsIndirectCommandNV(data::Integer)
    SetStateFlagsIndirectCommandNV(VkSetStateFlagsIndirectCommandNV(data))
end

function BindVertexBufferIndirectCommandNV(buffer_address::Integer, size::Integer, stride::Integer)
    BindVertexBufferIndirectCommandNV(VkBindVertexBufferIndirectCommandNV(buffer_address, size, stride))
end

function BindIndexBufferIndirectCommandNV(buffer_address::Integer, size::Integer, index_type::VkIndexType)
    BindIndexBufferIndirectCommandNV(VkBindIndexBufferIndirectCommandNV(buffer_address, size, index_type))
end

function BindShaderGroupIndirectCommandNV(group_index::Integer)
    BindShaderGroupIndirectCommandNV(VkBindShaderGroupIndirectCommandNV(group_index))
end

function GraphicsPipelineShaderGroupsCreateInfoNV(groups::AbstractArray{<:GraphicsShaderGroupCreateInfoNV}, pipelines::AbstractArray{<:Pipeline}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    groups = cconvert(Ptr{VkGraphicsShaderGroupCreateInfoNV}, groups)
    pipelines = cconvert(Ptr{VkPipeline}, pipelines)
    deps = [next, groups, pipelines]
    vks = VkGraphicsPipelineShaderGroupsCreateInfoNV(VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), pointer_length(groups), unsafe_convert(Ptr{VkGraphicsShaderGroupCreateInfoNV}, groups), pointer_length(pipelines), unsafe_convert(Ptr{VkPipeline}, pipelines))
    GraphicsPipelineShaderGroupsCreateInfoNV(vks, deps)
end

function GraphicsShaderGroupCreateInfoNV(stages::AbstractArray{<:PipelineShaderStageCreateInfo}; next = C_NULL, vertex_input_state = C_NULL, tessellation_state = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    stages = cconvert(Ptr{VkPipelineShaderStageCreateInfo}, stages)
    vertex_input_state = cconvert(Ptr{VkPipelineVertexInputStateCreateInfo}, vertex_input_state)
    tessellation_state = cconvert(Ptr{VkPipelineTessellationStateCreateInfo}, tessellation_state)
    deps = [next, stages, vertex_input_state, tessellation_state]
    vks = VkGraphicsShaderGroupCreateInfoNV(VK_STRUCTURE_TYPE_GRAPHICS_SHADER_GROUP_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), pointer_length(stages), unsafe_convert(Ptr{VkPipelineShaderStageCreateInfo}, stages), unsafe_convert(Ptr{VkPipelineVertexInputStateCreateInfo}, vertex_input_state), unsafe_convert(Ptr{VkPipelineTessellationStateCreateInfo}, tessellation_state))
    GraphicsShaderGroupCreateInfoNV(vks, deps)
end

function PhysicalDevicePrivateDataFeaturesEXT(private_data::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDevicePrivateDataFeaturesEXT(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), private_data)
    PhysicalDevicePrivateDataFeaturesEXT(vks, deps)
end

function PrivateDataSlotCreateInfoEXT(flags::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPrivateDataSlotCreateInfoEXT(VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags)
    PrivateDataSlotCreateInfoEXT(vks, deps)
end

function DevicePrivateDataCreateInfoEXT(private_data_slot_request_count::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDevicePrivateDataCreateInfoEXT(VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), private_data_slot_request_count)
    DevicePrivateDataCreateInfoEXT(vks, deps)
end

function PhysicalDeviceDeviceGeneratedCommandsFeaturesNV(device_generated_commands::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV, unsafe_convert(Ptr{Cvoid}, next), device_generated_commands)
    PhysicalDeviceDeviceGeneratedCommandsFeaturesNV(vks, deps)
end

function Win32KeyedMutexAcquireReleaseInfoNV(acquire_syncs::AbstractArray{<:DeviceMemory}, acquire_keys::AbstractArray{<:Integer}, acquire_timeout_milliseconds::AbstractArray{<:Integer}, release_syncs::AbstractArray{<:DeviceMemory}, release_keys::AbstractArray{<:Integer}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    acquire_syncs = cconvert(Ptr{VkDeviceMemory}, acquire_syncs)
    acquire_keys = cconvert(Ptr{UInt64}, acquire_keys)
    acquire_timeout_milliseconds = cconvert(Ptr{UInt32}, acquire_timeout_milliseconds)
    release_syncs = cconvert(Ptr{VkDeviceMemory}, release_syncs)
    release_keys = cconvert(Ptr{UInt64}, release_keys)
    deps = [next, acquire_syncs, acquire_keys, acquire_timeout_milliseconds, release_syncs, release_keys]
    vks = VkWin32KeyedMutexAcquireReleaseInfoNV(VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), pointer_length(acquire_syncs), unsafe_convert(Ptr{VkDeviceMemory}, acquire_syncs), unsafe_convert(Ptr{UInt64}, acquire_keys), unsafe_convert(Ptr{UInt32}, acquire_timeout_milliseconds), pointer_length(release_syncs), unsafe_convert(Ptr{VkDeviceMemory}, release_syncs), unsafe_convert(Ptr{UInt64}, release_keys))
    Win32KeyedMutexAcquireReleaseInfoNV(vks, deps)
end

function ExportMemoryWin32HandleInfoNV(; next = C_NULL, attributes = C_NULL, dw_access = 0)
    next = cconvert(Ptr{Cvoid}, next)
    attributes = cconvert(Ptr{SECURITY_ATTRIBUTES}, attributes)
    deps = [next, attributes]
    vks = VkExportMemoryWin32HandleInfoNV(VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Ptr{SECURITY_ATTRIBUTES}, attributes), dw_access)
    ExportMemoryWin32HandleInfoNV(vks, deps)
end

function ImportMemoryWin32HandleInfoNV(; next = C_NULL, handle_type = 0, handle = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImportMemoryWin32HandleInfoNV(VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), handle_type, handle)
    ImportMemoryWin32HandleInfoNV(vks, deps)
end

function ExportMemoryAllocateInfoNV(; next = C_NULL, handle_types = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkExportMemoryAllocateInfoNV(VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), handle_types)
    ExportMemoryAllocateInfoNV(vks, deps)
end

function ExternalMemoryImageCreateInfoNV(; next = C_NULL, handle_types = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkExternalMemoryImageCreateInfoNV(VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), handle_types)
    ExternalMemoryImageCreateInfoNV(vks, deps)
end

function DedicatedAllocationMemoryAllocateInfoNV(; next = C_NULL, image = C_NULL, buffer = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDedicatedAllocationMemoryAllocateInfoNV(VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), image, buffer)
    DedicatedAllocationMemoryAllocateInfoNV(vks, deps)
end

function DedicatedAllocationBufferCreateInfoNV(dedicated_allocation::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDedicatedAllocationBufferCreateInfoNV(VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), dedicated_allocation)
    DedicatedAllocationBufferCreateInfoNV(vks, deps)
end

function DedicatedAllocationImageCreateInfoNV(dedicated_allocation::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDedicatedAllocationImageCreateInfoNV(VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV, unsafe_convert(Ptr{Cvoid}, next), dedicated_allocation)
    DedicatedAllocationImageCreateInfoNV(vks, deps)
end

function DebugMarkerMarkerInfoEXT(marker_name::AbstractString; next = C_NULL, color = 0)
    next = cconvert(Ptr{Cvoid}, next)
    marker_name = cconvert(Cstring, marker_name)
    deps = [next, marker_name]
    vks = VkDebugMarkerMarkerInfoEXT(VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Cstring, marker_name), color)
    DebugMarkerMarkerInfoEXT(vks, deps)
end

function DebugMarkerObjectTagInfoEXT(object_type::VkDebugReportObjectTypeEXT, object::Integer, tag_name::Integer, tag_size::Integer, tag::Ptr{Cvoid}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    tag = cconvert(Ptr{Cvoid}, tag)
    deps = [next, tag]
    vks = VkDebugMarkerObjectTagInfoEXT(VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), object_type, object, tag_name, tag_size, unsafe_convert(Ptr{Cvoid}, tag))
    DebugMarkerObjectTagInfoEXT(vks, deps)
end

function DebugMarkerObjectNameInfoEXT(object_type::VkDebugReportObjectTypeEXT, object::Integer, object_name::AbstractString; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    object_name = cconvert(Cstring, object_name)
    deps = [next, object_name]
    vks = VkDebugMarkerObjectNameInfoEXT(VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), object_type, object, unsafe_convert(Cstring, object_name))
    DebugMarkerObjectNameInfoEXT(vks, deps)
end

function PipelineRasterizationStateRasterizationOrderAMD(rasterization_order::VkRasterizationOrderAMD; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineRasterizationStateRasterizationOrderAMD(VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD, unsafe_convert(Ptr{Cvoid}, next), rasterization_order)
    PipelineRasterizationStateRasterizationOrderAMD(vks, deps)
end

function ValidationFeaturesEXT(enabled_validation_features::AbstractArray{<:VkValidationFeatureEnableEXT}, disabled_validation_features::AbstractArray{<:VkValidationFeatureDisableEXT}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    enabled_validation_features = cconvert(Ptr{VkValidationFeatureEnableEXT}, enabled_validation_features)
    disabled_validation_features = cconvert(Ptr{VkValidationFeatureDisableEXT}, disabled_validation_features)
    deps = [next, enabled_validation_features, disabled_validation_features]
    vks = VkValidationFeaturesEXT(VK_STRUCTURE_TYPE_VALIDATION_FEATURES_EXT, unsafe_convert(Ptr{Cvoid}, next), pointer_length(enabled_validation_features), unsafe_convert(Ptr{VkValidationFeatureEnableEXT}, enabled_validation_features), pointer_length(disabled_validation_features), unsafe_convert(Ptr{VkValidationFeatureDisableEXT}, disabled_validation_features))
    ValidationFeaturesEXT(vks, deps)
end

function ValidationFlagsEXT(disabled_validation_checks::AbstractArray{<:VkValidationCheckEXT}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    disabled_validation_checks = cconvert(Ptr{VkValidationCheckEXT}, disabled_validation_checks)
    deps = [next, disabled_validation_checks]
    vks = VkValidationFlagsEXT(VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT, unsafe_convert(Ptr{Cvoid}, next), pointer_length(disabled_validation_checks), unsafe_convert(Ptr{VkValidationCheckEXT}, disabled_validation_checks))
    ValidationFlagsEXT(vks, deps)
end

function DebugReportCallbackCreateInfoEXT(pfn_callback::FunctionPtr; next = C_NULL, flags = 0, user_data = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    user_data = cconvert(Ptr{Cvoid}, user_data)
    deps = [next, user_data]
    vks = VkDebugReportCallbackCreateInfoEXT(VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, pfn_callback, unsafe_convert(Ptr{Cvoid}, user_data))
    DebugReportCallbackCreateInfoEXT(vks, deps)
end

function PresentInfoKHR(wait_semaphores::AbstractArray{<:Semaphore}, swapchains::AbstractArray{<:SwapchainKHR}, image_indices::AbstractArray{<:Integer}; next = C_NULL, results = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    wait_semaphores = cconvert(Ptr{VkSemaphore}, wait_semaphores)
    swapchains = cconvert(Ptr{VkSwapchainKHR}, swapchains)
    image_indices = cconvert(Ptr{UInt32}, image_indices)
    results = cconvert(Ptr{VkResult}, results)
    deps = [next, wait_semaphores, swapchains, image_indices, results]
    vks = VkPresentInfoKHR(VK_STRUCTURE_TYPE_PRESENT_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), pointer_length(wait_semaphores), unsafe_convert(Ptr{VkSemaphore}, wait_semaphores), pointer_length(swapchains), unsafe_convert(Ptr{VkSwapchainKHR}, swapchains), unsafe_convert(Ptr{UInt32}, image_indices), unsafe_convert(Ptr{VkResult}, results))
    PresentInfoKHR(vks, deps)
end

function SwapchainCreateInfoKHR(surface::SurfaceKHR, min_image_count::Integer, image_format::VkFormat, image_color_space::VkColorSpaceKHR, image_extent::Extent2D, image_array_layers::Integer, image_usage::Integer, image_sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}, pre_transform::VkSurfaceTransformFlagBitsKHR, composite_alpha::VkCompositeAlphaFlagBitsKHR, present_mode::VkPresentModeKHR, clipped::Bool; next = C_NULL, flags = 0, old_swapchain = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    queue_family_indices = cconvert(Ptr{UInt32}, queue_family_indices)
    deps = [next, queue_family_indices]
    vks = VkSwapchainCreateInfoKHR(VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, surface, min_image_count, image_format, image_color_space, image_extent.vks, image_array_layers, image_usage, image_sharing_mode, pointer_length(queue_family_indices), unsafe_convert(Ptr{UInt32}, queue_family_indices), pre_transform, composite_alpha, present_mode, clipped, old_swapchain)
    SwapchainCreateInfoKHR(vks, deps)
end

function StreamDescriptorSurfaceCreateInfoGGP(stream_descriptor::vk.GgpStreamDescriptor; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkStreamDescriptorSurfaceCreateInfoGGP(VK_STRUCTURE_TYPE_STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP, unsafe_convert(Ptr{Cvoid}, next), flags, stream_descriptor)
    StreamDescriptorSurfaceCreateInfoGGP(vks, deps)
end

function ImagePipeSurfaceCreateInfoFUCHSIA(image_pipe_handle::vk.zx_handle_t; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImagePipeSurfaceCreateInfoFUCHSIA(VK_STRUCTURE_TYPE_IMAGEPIPE_SURFACE_CREATE_INFO_FUCHSIA, unsafe_convert(Ptr{Cvoid}, next), flags, image_pipe_handle)
    ImagePipeSurfaceCreateInfoFUCHSIA(vks, deps)
end

function DirectFBSurfaceCreateInfoEXT(dfb::vk.IDirectFB, surface::vk.IDirectFBSurface; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    dfb = cconvert(Ptr{IDirectFB}, dfb)
    surface = cconvert(Ptr{IDirectFBSurface}, surface)
    deps = [next, dfb, surface]
    vks = VkDirectFBSurfaceCreateInfoEXT(VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{IDirectFB}, dfb), unsafe_convert(Ptr{IDirectFBSurface}, surface))
    DirectFBSurfaceCreateInfoEXT(vks, deps)
end

function XcbSurfaceCreateInfoKHR(connection::vk.xcb_connection_t, window::vk.xcb_window_t; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    connection = cconvert(Ptr{xcb_connection_t}, connection)
    deps = [next, connection]
    vks = VkXcbSurfaceCreateInfoKHR(VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{xcb_connection_t}, connection), window)
    XcbSurfaceCreateInfoKHR(vks, deps)
end

function XlibSurfaceCreateInfoKHR(dpy::vk.Display, window::vk.Window; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    dpy = cconvert(Ptr{Display}, dpy)
    deps = [next, dpy]
    vks = VkXlibSurfaceCreateInfoKHR(VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{Display}, dpy), window)
    XlibSurfaceCreateInfoKHR(vks, deps)
end

function Win32SurfaceCreateInfoKHR(hinstance::vk.HINSTANCE, hwnd::vk.HWND; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkWin32SurfaceCreateInfoKHR(VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, hinstance, hwnd)
    Win32SurfaceCreateInfoKHR(vks, deps)
end

function WaylandSurfaceCreateInfoKHR(display::vk.wl_display, surface::vk.wl_surface; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    display = cconvert(Ptr{wl_display}, display)
    surface = cconvert(Ptr{wl_surface}, surface)
    deps = [next, display, surface]
    vks = VkWaylandSurfaceCreateInfoKHR(VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{wl_display}, display), unsafe_convert(Ptr{wl_surface}, surface))
    WaylandSurfaceCreateInfoKHR(vks, deps)
end

function ViSurfaceCreateInfoNN(window::Ptr{Cvoid}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    window = cconvert(Ptr{Cvoid}, window)
    deps = [next, window]
    vks = VkViSurfaceCreateInfoNN(VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{Cvoid}, window))
    ViSurfaceCreateInfoNN(vks, deps)
end

function AndroidSurfaceCreateInfoKHR(window::Cvoid; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    window = cconvert(Ptr{ANativeWindow}, window)
    deps = [next, window]
    vks = VkAndroidSurfaceCreateInfoKHR(VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{ANativeWindow}, window))
    AndroidSurfaceCreateInfoKHR(vks, deps)
end

function DisplayPresentInfoKHR(src_rect::Rect2D, dst_rect::Rect2D, persistent::Bool; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDisplayPresentInfoKHR(VK_STRUCTURE_TYPE_DISPLAY_PRESENT_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), src_rect.vks, dst_rect.vks, persistent)
    DisplayPresentInfoKHR(vks, deps)
end

function DisplaySurfaceCreateInfoKHR(display_mode::DisplayModeKHR, plane_index::Integer, plane_stack_index::Integer, transform::VkSurfaceTransformFlagBitsKHR, global_alpha::Real, alpha_mode::VkDisplayPlaneAlphaFlagBitsKHR, image_extent::Extent2D; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDisplaySurfaceCreateInfoKHR(VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, display_mode, plane_index, plane_stack_index, transform, global_alpha, alpha_mode, image_extent.vks)
    DisplaySurfaceCreateInfoKHR(vks, deps)
end

function DisplayModeCreateInfoKHR(parameters::DisplayModeParametersKHR; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkDisplayModeCreateInfoKHR(VK_STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR, unsafe_convert(Ptr{Cvoid}, next), flags, parameters.vks)
    DisplayModeCreateInfoKHR(vks, deps)
end

function DisplayModeParametersKHR(visible_region::Extent2D, refresh_rate::Integer)
    DisplayModeParametersKHR(VkDisplayModeParametersKHR(visible_region.vks, refresh_rate))
end

function SubmitInfo(wait_semaphores::AbstractArray{<:Semaphore}, wait_dst_stage_mask::AbstractArray{<:Integer}, command_buffers::AbstractArray{<:CommandBuffer}, signal_semaphores::AbstractArray{<:Semaphore}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    wait_semaphores = cconvert(Ptr{VkSemaphore}, wait_semaphores)
    wait_dst_stage_mask = cconvert(Ptr{VkPipelineStageFlags}, wait_dst_stage_mask)
    command_buffers = cconvert(Ptr{VkCommandBuffer}, command_buffers)
    signal_semaphores = cconvert(Ptr{VkSemaphore}, signal_semaphores)
    deps = [next, wait_semaphores, wait_dst_stage_mask, command_buffers, signal_semaphores]
    vks = VkSubmitInfo(VK_STRUCTURE_TYPE_SUBMIT_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(wait_semaphores), unsafe_convert(Ptr{VkSemaphore}, wait_semaphores), unsafe_convert(Ptr{VkPipelineStageFlags}, wait_dst_stage_mask), pointer_length(command_buffers), unsafe_convert(Ptr{VkCommandBuffer}, command_buffers), pointer_length(signal_semaphores), unsafe_convert(Ptr{VkSemaphore}, signal_semaphores))
    SubmitInfo(vks, deps)
end

function DispatchIndirectCommand(x::Integer, y::Integer, z::Integer)
    DispatchIndirectCommand(VkDispatchIndirectCommand(x, y, z))
end

function DrawIndexedIndirectCommand(index_count::Integer, instance_count::Integer, first_index::Integer, vertex_offset::Integer, first_instance::Integer)
    DrawIndexedIndirectCommand(VkDrawIndexedIndirectCommand(index_count, instance_count, first_index, vertex_offset, first_instance))
end

function DrawIndirectCommand(vertex_count::Integer, instance_count::Integer, first_vertex::Integer, first_instance::Integer)
    DrawIndirectCommand(VkDrawIndirectCommand(vertex_count, instance_count, first_vertex, first_instance))
end

function FramebufferCreateInfo(render_pass::RenderPass, attachments::AbstractArray{<:ImageView}, width::Integer, height::Integer, layers::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    attachments = cconvert(Ptr{VkImageView}, attachments)
    deps = [next, attachments]
    vks = VkFramebufferCreateInfo(VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, render_pass, pointer_length(attachments), unsafe_convert(Ptr{VkImageView}, attachments), width, height, layers)
    FramebufferCreateInfo(vks, deps)
end

function QueryPoolCreateInfo(query_type::VkQueryType, query_count::Integer; next = C_NULL, flags = 0, pipeline_statistics = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkQueryPoolCreateInfo(VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, query_type, query_count, pipeline_statistics)
    QueryPoolCreateInfo(vks, deps)
end

function SemaphoreCreateInfo(; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSemaphoreCreateInfo(VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags)
    SemaphoreCreateInfo(vks, deps)
end

function PhysicalDeviceFeatures(robust_buffer_access::Bool, full_draw_index_uint_32::Bool, image_cube_array::Bool, independent_blend::Bool, geometry_shader::Bool, tessellation_shader::Bool, sample_rate_shading::Bool, dual_src_blend::Bool, logic_op::Bool, multi_draw_indirect::Bool, draw_indirect_first_instance::Bool, depth_clamp::Bool, depth_bias_clamp::Bool, fill_mode_non_solid::Bool, depth_bounds::Bool, wide_lines::Bool, large_points::Bool, alpha_to_one::Bool, multi_viewport::Bool, sampler_anisotropy::Bool, texture_compression_etc_2::Bool, texture_compression_astc_ldr::Bool, texture_compression_bc::Bool, occlusion_query_precise::Bool, pipeline_statistics_query::Bool, vertex_pipeline_stores_and_atomics::Bool, fragment_stores_and_atomics::Bool, shader_tessellation_and_geometry_point_size::Bool, shader_image_gather_extended::Bool, shader_storage_image_extended_formats::Bool, shader_storage_image_multisample::Bool, shader_storage_image_read_without_format::Bool, shader_storage_image_write_without_format::Bool, shader_uniform_buffer_array_dynamic_indexing::Bool, shader_sampled_image_array_dynamic_indexing::Bool, shader_storage_buffer_array_dynamic_indexing::Bool, shader_storage_image_array_dynamic_indexing::Bool, shader_clip_distance::Bool, shader_cull_distance::Bool, shader_float_64::Bool, shader_int_64::Bool, shader_int_16::Bool, shader_resource_residency::Bool, shader_resource_min_lod::Bool, sparse_binding::Bool, sparse_residency_buffer::Bool, sparse_residency_image_2_d::Bool, sparse_residency_image_3_d::Bool, sparse_residency_2_samples::Bool, sparse_residency_4_samples::Bool, sparse_residency_8_samples::Bool, sparse_residency_16_samples::Bool, sparse_residency_aliased::Bool, variable_multisample_rate::Bool, inherited_queries::Bool)
    PhysicalDeviceFeatures(VkPhysicalDeviceFeatures(robust_buffer_access, full_draw_index_uint_32, image_cube_array, independent_blend, geometry_shader, tessellation_shader, sample_rate_shading, dual_src_blend, logic_op, multi_draw_indirect, draw_indirect_first_instance, depth_clamp, depth_bias_clamp, fill_mode_non_solid, depth_bounds, wide_lines, large_points, alpha_to_one, multi_viewport, sampler_anisotropy, texture_compression_etc_2, texture_compression_astc_ldr, texture_compression_bc, occlusion_query_precise, pipeline_statistics_query, vertex_pipeline_stores_and_atomics, fragment_stores_and_atomics, shader_tessellation_and_geometry_point_size, shader_image_gather_extended, shader_storage_image_extended_formats, shader_storage_image_multisample, shader_storage_image_read_without_format, shader_storage_image_write_without_format, shader_uniform_buffer_array_dynamic_indexing, shader_sampled_image_array_dynamic_indexing, shader_storage_buffer_array_dynamic_indexing, shader_storage_image_array_dynamic_indexing, shader_clip_distance, shader_cull_distance, shader_float_64, shader_int_64, shader_int_16, shader_resource_residency, shader_resource_min_lod, sparse_binding, sparse_residency_buffer, sparse_residency_image_2_d, sparse_residency_image_3_d, sparse_residency_2_samples, sparse_residency_4_samples, sparse_residency_8_samples, sparse_residency_16_samples, sparse_residency_aliased, variable_multisample_rate, inherited_queries))
end

function FenceCreateInfo(; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkFenceCreateInfo(VK_STRUCTURE_TYPE_FENCE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags)
    FenceCreateInfo(vks, deps)
end

function EventCreateInfo(; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkEventCreateInfo(VK_STRUCTURE_TYPE_EVENT_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags)
    EventCreateInfo(vks, deps)
end

function RenderPassCreateInfo(attachments::AbstractArray{<:AttachmentDescription}, subpasses::AbstractArray{<:SubpassDescription}, dependencies::AbstractArray{<:SubpassDependency}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    attachments = cconvert(Ptr{VkAttachmentDescription}, attachments)
    subpasses = cconvert(Ptr{VkSubpassDescription}, subpasses)
    dependencies = cconvert(Ptr{VkSubpassDependency}, dependencies)
    deps = [next, attachments, subpasses, dependencies]
    vks = VkRenderPassCreateInfo(VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(attachments), unsafe_convert(Ptr{VkAttachmentDescription}, attachments), pointer_length(subpasses), unsafe_convert(Ptr{VkSubpassDescription}, subpasses), pointer_length(dependencies), unsafe_convert(Ptr{VkSubpassDependency}, dependencies))
    RenderPassCreateInfo(vks, deps)
end

function SubpassDependency(src_subpass::Integer, dst_subpass::Integer, src_stage_mask::Integer, dst_stage_mask::Integer; src_access_mask = 0, dst_access_mask = 0, dependency_flags = 0)
    SubpassDependency(VkSubpassDependency(src_subpass, dst_subpass, src_stage_mask, dst_stage_mask, src_access_mask, dst_access_mask, dependency_flags))
end

function SubpassDescription(pipeline_bind_point::VkPipelineBindPoint, input_attachments::AbstractArray{<:AttachmentReference}, color_attachments::AbstractArray{<:AttachmentReference}, preserve_attachments::AbstractArray{<:Integer}; flags = 0, resolve_attachments = C_NULL, depth_stencil_attachment = C_NULL)
    input_attachments = cconvert(Ptr{VkAttachmentReference}, input_attachments)
    color_attachments = cconvert(Ptr{VkAttachmentReference}, color_attachments)
    resolve_attachments = cconvert(Ptr{VkAttachmentReference}, resolve_attachments)
    depth_stencil_attachment = cconvert(Ptr{VkAttachmentReference}, depth_stencil_attachment)
    preserve_attachments = cconvert(Ptr{UInt32}, preserve_attachments)
    deps = [input_attachments, color_attachments, resolve_attachments, depth_stencil_attachment, preserve_attachments]
    vks = VkSubpassDescription(flags, pipeline_bind_point, pointer_length(input_attachments), unsafe_convert(Ptr{VkAttachmentReference}, input_attachments), pointer_length(color_attachments), unsafe_convert(Ptr{VkAttachmentReference}, color_attachments), unsafe_convert(Ptr{VkAttachmentReference}, resolve_attachments), unsafe_convert(Ptr{VkAttachmentReference}, depth_stencil_attachment), pointer_length(preserve_attachments), unsafe_convert(Ptr{UInt32}, preserve_attachments))
    SubpassDescription(vks, deps)
end

function AttachmentReference(attachment::Integer, layout::VkImageLayout)
    AttachmentReference(VkAttachmentReference(attachment, layout))
end

function AttachmentDescription(format::VkFormat, samples::VkSampleCountFlagBits, load_op::VkAttachmentLoadOp, store_op::VkAttachmentStoreOp, stencil_load_op::VkAttachmentLoadOp, stencil_store_op::VkAttachmentStoreOp, initial_layout::VkImageLayout, final_layout::VkImageLayout; flags = 0)
    AttachmentDescription(VkAttachmentDescription(flags, format, samples, load_op, store_op, stencil_load_op, stencil_store_op, initial_layout, final_layout))
end

function ClearAttachment(aspect_mask::Integer, color_attachment::Integer, clear_value::ClearValue)
    ClearAttachment(VkClearAttachment(aspect_mask, color_attachment, clear_value.vks))
end

function ClearValue(color::ClearColorValue, depth_stencil::ClearDepthStencilValue)
    ClearValue(VkClearValue(color.vks, depth_stencil.vks))
end

function ClearDepthStencilValue(depth::Real, stencil::Integer)
    ClearDepthStencilValue(VkClearDepthStencilValue(depth, stencil))
end

function ClearColorValue(float32::NTuple{4, Float32}, int32::NTuple{4, Int32}, uint32::NTuple{4, UInt32})
    ClearColorValue(VkClearColorValue(float32, int32, uint32))
end

function RenderPassBeginInfo(render_pass::RenderPass, framebuffer::Framebuffer, render_area::Rect2D, clear_values::AbstractArray{<:ClearValue}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    clear_values = cconvert(Ptr{VkClearValue}, clear_values)
    deps = [next, clear_values]
    vks = VkRenderPassBeginInfo(VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO, unsafe_convert(Ptr{Cvoid}, next), render_pass, framebuffer, render_area.vks, pointer_length(clear_values), unsafe_convert(Ptr{VkClearValue}, clear_values))
    RenderPassBeginInfo(vks, deps)
end

function CommandBufferBeginInfo(; next = C_NULL, flags = 0, inheritance_info = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    inheritance_info = cconvert(Ptr{VkCommandBufferInheritanceInfo}, inheritance_info)
    deps = [next, inheritance_info]
    vks = VkCommandBufferBeginInfo(VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{VkCommandBufferInheritanceInfo}, inheritance_info))
    CommandBufferBeginInfo(vks, deps)
end

function CommandBufferInheritanceInfo(subpass::Integer, occlusion_query_enable::Bool; next = C_NULL, render_pass = C_NULL, framebuffer = C_NULL, query_flags = 0, pipeline_statistics = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCommandBufferInheritanceInfo(VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_INFO, unsafe_convert(Ptr{Cvoid}, next), render_pass, subpass, framebuffer, occlusion_query_enable, query_flags, pipeline_statistics)
    CommandBufferInheritanceInfo(vks, deps)
end

function CommandBufferAllocateInfo(command_pool::CommandPool, level::VkCommandBufferLevel, command_buffer_count::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCommandBufferAllocateInfo(VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), command_pool, level, command_buffer_count)
    CommandBufferAllocateInfo(vks, deps)
end

function CommandPoolCreateInfo(queue_family_index::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCommandPoolCreateInfo(VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, queue_family_index)
    CommandPoolCreateInfo(vks, deps)
end

function SamplerCreateInfo(mag_filter::VkFilter, min_filter::VkFilter, mipmap_mode::VkSamplerMipmapMode, address_mode_u::VkSamplerAddressMode, address_mode_v::VkSamplerAddressMode, address_mode_w::VkSamplerAddressMode, mip_lod_bias::Real, anisotropy_enable::Bool, max_anisotropy::Real, compare_enable::Bool, compare_op::VkCompareOp, min_lod::Real, max_lod::Real, border_color::VkBorderColor, unnormalized_coordinates::Bool; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkSamplerCreateInfo(VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, mag_filter, min_filter, mipmap_mode, address_mode_u, address_mode_v, address_mode_w, mip_lod_bias, anisotropy_enable, max_anisotropy, compare_enable, compare_op, min_lod, max_lod, border_color, unnormalized_coordinates)
    SamplerCreateInfo(vks, deps)
end

function PipelineLayoutCreateInfo(set_layouts::AbstractArray{<:DescriptorSetLayout}, push_constant_ranges::AbstractArray{<:PushConstantRange}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    set_layouts = cconvert(Ptr{VkDescriptorSetLayout}, set_layouts)
    push_constant_ranges = cconvert(Ptr{VkPushConstantRange}, push_constant_ranges)
    deps = [next, set_layouts, push_constant_ranges]
    vks = VkPipelineLayoutCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(set_layouts), unsafe_convert(Ptr{VkDescriptorSetLayout}, set_layouts), pointer_length(push_constant_ranges), unsafe_convert(Ptr{VkPushConstantRange}, push_constant_ranges))
    PipelineLayoutCreateInfo(vks, deps)
end

function PushConstantRange(stage_flags::Integer, offset::Integer, size::Integer)
    PushConstantRange(VkPushConstantRange(stage_flags, offset, size))
end

function PipelineCacheCreateInfo(initial_data::Ptr{Cvoid}; next = C_NULL, flags = 0, initial_data_size = 0)
    next = cconvert(Ptr{Cvoid}, next)
    initial_data = cconvert(Ptr{Cvoid}, initial_data)
    deps = [next, initial_data]
    vks = VkPipelineCacheCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, initial_data_size, unsafe_convert(Ptr{Cvoid}, initial_data))
    PipelineCacheCreateInfo(vks, deps)
end

function GraphicsPipelineCreateInfo(stages::AbstractArray{<:PipelineShaderStageCreateInfo}, rasterization_state::PipelineRasterizationStateCreateInfo, layout::PipelineLayout, render_pass::RenderPass, subpass::Integer, base_pipeline_index::Integer; next = C_NULL, flags = 0, vertex_input_state = C_NULL, input_assembly_state = C_NULL, tessellation_state = C_NULL, viewport_state = C_NULL, multisample_state = C_NULL, depth_stencil_state = C_NULL, color_blend_state = C_NULL, dynamic_state = C_NULL, base_pipeline_handle = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    stages = cconvert(Ptr{VkPipelineShaderStageCreateInfo}, stages)
    vertex_input_state = cconvert(Ptr{VkPipelineVertexInputStateCreateInfo}, vertex_input_state)
    input_assembly_state = cconvert(Ptr{VkPipelineInputAssemblyStateCreateInfo}, input_assembly_state)
    tessellation_state = cconvert(Ptr{VkPipelineTessellationStateCreateInfo}, tessellation_state)
    viewport_state = cconvert(Ptr{VkPipelineViewportStateCreateInfo}, viewport_state)
    rasterization_state = cconvert(Ptr{VkPipelineRasterizationStateCreateInfo}, rasterization_state)
    multisample_state = cconvert(Ptr{VkPipelineMultisampleStateCreateInfo}, multisample_state)
    depth_stencil_state = cconvert(Ptr{VkPipelineDepthStencilStateCreateInfo}, depth_stencil_state)
    color_blend_state = cconvert(Ptr{VkPipelineColorBlendStateCreateInfo}, color_blend_state)
    dynamic_state = cconvert(Ptr{VkPipelineDynamicStateCreateInfo}, dynamic_state)
    deps = [next, stages, vertex_input_state, input_assembly_state, tessellation_state, viewport_state, rasterization_state, multisample_state, depth_stencil_state, color_blend_state, dynamic_state]
    vks = VkGraphicsPipelineCreateInfo(VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(stages), unsafe_convert(Ptr{VkPipelineShaderStageCreateInfo}, stages), unsafe_convert(Ptr{VkPipelineVertexInputStateCreateInfo}, vertex_input_state), unsafe_convert(Ptr{VkPipelineInputAssemblyStateCreateInfo}, input_assembly_state), unsafe_convert(Ptr{VkPipelineTessellationStateCreateInfo}, tessellation_state), unsafe_convert(Ptr{VkPipelineViewportStateCreateInfo}, viewport_state), unsafe_convert(Ptr{VkPipelineRasterizationStateCreateInfo}, rasterization_state), unsafe_convert(Ptr{VkPipelineMultisampleStateCreateInfo}, multisample_state), unsafe_convert(Ptr{VkPipelineDepthStencilStateCreateInfo}, depth_stencil_state), unsafe_convert(Ptr{VkPipelineColorBlendStateCreateInfo}, color_blend_state), unsafe_convert(Ptr{VkPipelineDynamicStateCreateInfo}, dynamic_state), layout, render_pass, subpass, base_pipeline_handle, base_pipeline_index)
    GraphicsPipelineCreateInfo(vks, deps)
end

function PipelineDepthStencilStateCreateInfo(depth_test_enable::Bool, depth_write_enable::Bool, depth_compare_op::VkCompareOp, depth_bounds_test_enable::Bool, stencil_test_enable::Bool, front::StencilOpState, back::StencilOpState, min_depth_bounds::Real, max_depth_bounds::Real; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineDepthStencilStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, depth_test_enable, depth_write_enable, depth_compare_op, depth_bounds_test_enable, stencil_test_enable, front.vks, back.vks, min_depth_bounds, max_depth_bounds)
    PipelineDepthStencilStateCreateInfo(vks, deps)
end

function StencilOpState(fail_op::VkStencilOp, pass_op::VkStencilOp, depth_fail_op::VkStencilOp, compare_op::VkCompareOp, compare_mask::Integer, write_mask::Integer, reference::Integer)
    StencilOpState(VkStencilOpState(fail_op, pass_op, depth_fail_op, compare_op, compare_mask, write_mask, reference))
end

function PipelineDynamicStateCreateInfo(dynamic_states::AbstractArray{<:VkDynamicState}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    dynamic_states = cconvert(Ptr{VkDynamicState}, dynamic_states)
    deps = [next, dynamic_states]
    vks = VkPipelineDynamicStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(dynamic_states), unsafe_convert(Ptr{VkDynamicState}, dynamic_states))
    PipelineDynamicStateCreateInfo(vks, deps)
end

function PipelineColorBlendStateCreateInfo(logic_op_enable::Bool, logic_op::VkLogicOp, attachments::AbstractArray{<:PipelineColorBlendAttachmentState}, blend_constants::NTuple{4, Float32}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    attachments = cconvert(Ptr{VkPipelineColorBlendAttachmentState}, attachments)
    deps = [next, attachments]
    vks = VkPipelineColorBlendStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, logic_op_enable, logic_op, pointer_length(attachments), unsafe_convert(Ptr{VkPipelineColorBlendAttachmentState}, attachments), blend_constants)
    PipelineColorBlendStateCreateInfo(vks, deps)
end

function PipelineColorBlendAttachmentState(blend_enable::Bool, src_color_blend_factor::VkBlendFactor, dst_color_blend_factor::VkBlendFactor, color_blend_op::VkBlendOp, src_alpha_blend_factor::VkBlendFactor, dst_alpha_blend_factor::VkBlendFactor, alpha_blend_op::VkBlendOp; color_write_mask = 0)
    PipelineColorBlendAttachmentState(VkPipelineColorBlendAttachmentState(blend_enable, src_color_blend_factor, dst_color_blend_factor, color_blend_op, src_alpha_blend_factor, dst_alpha_blend_factor, alpha_blend_op, color_write_mask))
end

function PipelineMultisampleStateCreateInfo(rasterization_samples::VkSampleCountFlagBits, sample_shading_enable::Bool, min_sample_shading::Real, alpha_to_coverage_enable::Bool, alpha_to_one_enable::Bool; next = C_NULL, flags = 0, sample_mask = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    sample_mask = cconvert(Ptr{VkSampleMask}, sample_mask)
    deps = [next, sample_mask]
    vks = VkPipelineMultisampleStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, rasterization_samples, sample_shading_enable, min_sample_shading, unsafe_convert(Ptr{VkSampleMask}, sample_mask), alpha_to_coverage_enable, alpha_to_one_enable)
    PipelineMultisampleStateCreateInfo(vks, deps)
end

function PipelineRasterizationStateCreateInfo(depth_clamp_enable::Bool, rasterizer_discard_enable::Bool, polygon_mode::VkPolygonMode, front_face::VkFrontFace, depth_bias_enable::Bool, depth_bias_constant_factor::Real, depth_bias_clamp::Real, depth_bias_slope_factor::Real, line_width::Real; next = C_NULL, flags = 0, cull_mode = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineRasterizationStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, depth_clamp_enable, rasterizer_discard_enable, polygon_mode, cull_mode, front_face, depth_bias_enable, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor, line_width)
    PipelineRasterizationStateCreateInfo(vks, deps)
end

function PipelineViewportStateCreateInfo(; next = C_NULL, flags = 0, viewports = C_NULL, scissors = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    viewports = cconvert(Ptr{VkViewport}, viewports)
    scissors = cconvert(Ptr{VkRect2D}, scissors)
    deps = [next, viewports, scissors]
    vks = VkPipelineViewportStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(viewports), unsafe_convert(Ptr{VkViewport}, viewports), pointer_length(scissors), unsafe_convert(Ptr{VkRect2D}, scissors))
    PipelineViewportStateCreateInfo(vks, deps)
end

function PipelineTessellationStateCreateInfo(patch_control_points::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineTessellationStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, patch_control_points)
    PipelineTessellationStateCreateInfo(vks, deps)
end

function PipelineInputAssemblyStateCreateInfo(topology::VkPrimitiveTopology, primitive_restart_enable::Bool; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkPipelineInputAssemblyStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, topology, primitive_restart_enable)
    PipelineInputAssemblyStateCreateInfo(vks, deps)
end

function PipelineVertexInputStateCreateInfo(vertex_binding_descriptions::AbstractArray{<:VertexInputBindingDescription}, vertex_attribute_descriptions::AbstractArray{<:VertexInputAttributeDescription}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    vertex_binding_descriptions = cconvert(Ptr{VkVertexInputBindingDescription}, vertex_binding_descriptions)
    vertex_attribute_descriptions = cconvert(Ptr{VkVertexInputAttributeDescription}, vertex_attribute_descriptions)
    deps = [next, vertex_binding_descriptions, vertex_attribute_descriptions]
    vks = VkPipelineVertexInputStateCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(vertex_binding_descriptions), unsafe_convert(Ptr{VkVertexInputBindingDescription}, vertex_binding_descriptions), pointer_length(vertex_attribute_descriptions), unsafe_convert(Ptr{VkVertexInputAttributeDescription}, vertex_attribute_descriptions))
    PipelineVertexInputStateCreateInfo(vks, deps)
end

function VertexInputAttributeDescription(location::Integer, binding::Integer, format::VkFormat, offset::Integer)
    VertexInputAttributeDescription(VkVertexInputAttributeDescription(location, binding, format, offset))
end

function VertexInputBindingDescription(binding::Integer, stride::Integer, input_rate::VkVertexInputRate)
    VertexInputBindingDescription(VkVertexInputBindingDescription(binding, stride, input_rate))
end

function ComputePipelineCreateInfo(stage::PipelineShaderStageCreateInfo, layout::PipelineLayout, base_pipeline_index::Integer; next = C_NULL, flags = 0, base_pipeline_handle = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkComputePipelineCreateInfo(VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, stage.vks, layout, base_pipeline_handle, base_pipeline_index)
    ComputePipelineCreateInfo(vks, deps)
end

function PipelineShaderStageCreateInfo(stage::VkShaderStageFlagBits, _module::ShaderModule, name::AbstractString; next = C_NULL, flags = 0, specialization_info = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    name = cconvert(Cstring, name)
    specialization_info = cconvert(Ptr{VkSpecializationInfo}, specialization_info)
    deps = [next, name, specialization_info]
    vks = VkPipelineShaderStageCreateInfo(VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, stage, _module, unsafe_convert(Cstring, name), unsafe_convert(Ptr{VkSpecializationInfo}, specialization_info))
    PipelineShaderStageCreateInfo(vks, deps)
end

function SpecializationInfo(map_entries::AbstractArray{<:SpecializationMapEntry}, data::Ptr{Cvoid}; data_size = 0)
    map_entries = cconvert(Ptr{VkSpecializationMapEntry}, map_entries)
    data = cconvert(Ptr{Cvoid}, data)
    deps = [map_entries, data]
    vks = VkSpecializationInfo(pointer_length(map_entries), unsafe_convert(Ptr{VkSpecializationMapEntry}, map_entries), data_size, unsafe_convert(Ptr{Cvoid}, data))
    SpecializationInfo(vks, deps)
end

function SpecializationMapEntry(constant_id::Integer, offset::Integer, size::Integer)
    SpecializationMapEntry(VkSpecializationMapEntry(constant_id, offset, size))
end

function DescriptorSetAllocateInfo(descriptor_pool::DescriptorPool, set_layouts::AbstractArray{<:DescriptorSetLayout}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    set_layouts = cconvert(Ptr{VkDescriptorSetLayout}, set_layouts)
    deps = [next, set_layouts]
    vks = VkDescriptorSetAllocateInfo(VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), descriptor_pool, pointer_length(set_layouts), unsafe_convert(Ptr{VkDescriptorSetLayout}, set_layouts))
    DescriptorSetAllocateInfo(vks, deps)
end

function DescriptorPoolCreateInfo(max_sets::Integer, pool_sizes::AbstractArray{<:DescriptorPoolSize}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    pool_sizes = cconvert(Ptr{VkDescriptorPoolSize}, pool_sizes)
    deps = [next, pool_sizes]
    vks = VkDescriptorPoolCreateInfo(VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, max_sets, pointer_length(pool_sizes), unsafe_convert(Ptr{VkDescriptorPoolSize}, pool_sizes))
    DescriptorPoolCreateInfo(vks, deps)
end

function DescriptorPoolSize(type::VkDescriptorType, descriptor_count::Integer)
    DescriptorPoolSize(VkDescriptorPoolSize(type, descriptor_count))
end

function DescriptorSetLayoutCreateInfo(bindings::AbstractArray{<:DescriptorSetLayoutBinding}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    bindings = cconvert(Ptr{VkDescriptorSetLayoutBinding}, bindings)
    deps = [next, bindings]
    vks = VkDescriptorSetLayoutCreateInfo(VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(bindings), unsafe_convert(Ptr{VkDescriptorSetLayoutBinding}, bindings))
    DescriptorSetLayoutCreateInfo(vks, deps)
end

function DescriptorSetLayoutBinding(binding::Integer, descriptor_type::VkDescriptorType, stage_flags::Integer; immutable_samplers = C_NULL)
    immutable_samplers = cconvert(Ptr{VkSampler}, immutable_samplers)
    deps = [immutable_samplers]
    vks = VkDescriptorSetLayoutBinding(binding, descriptor_type, pointer_length(immutable_samplers), stage_flags, unsafe_convert(Ptr{VkSampler}, immutable_samplers))
    DescriptorSetLayoutBinding(vks, deps)
end

function ShaderModuleCreateInfo(code_size::Integer, code::AbstractArray{<:Integer}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    code = cconvert(Ptr{UInt32}, code)
    deps = [next, code]
    vks = VkShaderModuleCreateInfo(VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, code_size, unsafe_convert(Ptr{UInt32}, code))
    ShaderModuleCreateInfo(vks, deps)
end

function ImageResolve(src_subresource::ImageSubresourceLayers, src_offset::Offset3D, dst_subresource::ImageSubresourceLayers, dst_offset::Offset3D, extent::Extent3D)
    ImageResolve(VkImageResolve(src_subresource.vks, src_offset.vks, dst_subresource.vks, dst_offset.vks, extent.vks))
end

function BufferImageCopy(buffer_offset::Integer, buffer_row_length::Integer, buffer_image_height::Integer, image_subresource::ImageSubresourceLayers, image_offset::Offset3D, image_extent::Extent3D)
    BufferImageCopy(VkBufferImageCopy(buffer_offset, buffer_row_length, buffer_image_height, image_subresource.vks, image_offset.vks, image_extent.vks))
end

function ImageBlit(src_subresource::ImageSubresourceLayers, src_offsets::NTuple{2, VkOffset3D}, dst_subresource::ImageSubresourceLayers, dst_offsets::NTuple{2, VkOffset3D})
    ImageBlit(VkImageBlit(src_subresource.vks, src_offsets, dst_subresource.vks, dst_offsets))
end

function ImageCopy(src_subresource::ImageSubresourceLayers, src_offset::Offset3D, dst_subresource::ImageSubresourceLayers, dst_offset::Offset3D, extent::Extent3D)
    ImageCopy(VkImageCopy(src_subresource.vks, src_offset.vks, dst_subresource.vks, dst_offset.vks, extent.vks))
end

function BindSparseInfo(wait_semaphores::AbstractArray{<:Semaphore}, buffer_binds::AbstractArray{<:SparseBufferMemoryBindInfo}, image_opaque_binds::AbstractArray{<:SparseImageOpaqueMemoryBindInfo}, image_binds::AbstractArray{<:SparseImageMemoryBindInfo}, signal_semaphores::AbstractArray{<:Semaphore}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    wait_semaphores = cconvert(Ptr{VkSemaphore}, wait_semaphores)
    buffer_binds = cconvert(Ptr{VkSparseBufferMemoryBindInfo}, buffer_binds)
    image_opaque_binds = cconvert(Ptr{VkSparseImageOpaqueMemoryBindInfo}, image_opaque_binds)
    image_binds = cconvert(Ptr{VkSparseImageMemoryBindInfo}, image_binds)
    signal_semaphores = cconvert(Ptr{VkSemaphore}, signal_semaphores)
    deps = [next, wait_semaphores, buffer_binds, image_opaque_binds, image_binds, signal_semaphores]
    vks = VkBindSparseInfo(VK_STRUCTURE_TYPE_BIND_SPARSE_INFO, unsafe_convert(Ptr{Cvoid}, next), pointer_length(wait_semaphores), unsafe_convert(Ptr{VkSemaphore}, wait_semaphores), pointer_length(buffer_binds), unsafe_convert(Ptr{VkSparseBufferMemoryBindInfo}, buffer_binds), pointer_length(image_opaque_binds), unsafe_convert(Ptr{VkSparseImageOpaqueMemoryBindInfo}, image_opaque_binds), pointer_length(image_binds), unsafe_convert(Ptr{VkSparseImageMemoryBindInfo}, image_binds), pointer_length(signal_semaphores), unsafe_convert(Ptr{VkSemaphore}, signal_semaphores))
    BindSparseInfo(vks, deps)
end

function SparseImageMemoryBindInfo(image::Image, binds::AbstractArray{<:SparseImageMemoryBind})
    binds = cconvert(Ptr{VkSparseImageMemoryBind}, binds)
    deps = [binds]
    vks = VkSparseImageMemoryBindInfo(image, pointer_length(binds), unsafe_convert(Ptr{VkSparseImageMemoryBind}, binds))
    SparseImageMemoryBindInfo(vks, deps)
end

function SparseImageOpaqueMemoryBindInfo(image::Image, binds::AbstractArray{<:SparseMemoryBind})
    binds = cconvert(Ptr{VkSparseMemoryBind}, binds)
    deps = [binds]
    vks = VkSparseImageOpaqueMemoryBindInfo(image, pointer_length(binds), unsafe_convert(Ptr{VkSparseMemoryBind}, binds))
    SparseImageOpaqueMemoryBindInfo(vks, deps)
end

function SparseBufferMemoryBindInfo(buffer::Buffer, binds::AbstractArray{<:SparseMemoryBind})
    binds = cconvert(Ptr{VkSparseMemoryBind}, binds)
    deps = [binds]
    vks = VkSparseBufferMemoryBindInfo(buffer, pointer_length(binds), unsafe_convert(Ptr{VkSparseMemoryBind}, binds))
    SparseBufferMemoryBindInfo(vks, deps)
end

function SparseImageMemoryBind(subresource::ImageSubresource, offset::Offset3D, extent::Extent3D, memory_offset::Integer; memory = C_NULL, flags = 0)
    SparseImageMemoryBind(VkSparseImageMemoryBind(subresource.vks, offset.vks, extent.vks, memory, memory_offset, flags))
end

function SparseMemoryBind(resource_offset::Integer, size::Integer, memory_offset::Integer; memory = C_NULL, flags = 0)
    SparseMemoryBind(VkSparseMemoryBind(resource_offset, size, memory, memory_offset, flags))
end

function BufferCopy(src_offset::Integer, dst_offset::Integer, size::Integer)
    BufferCopy(VkBufferCopy(src_offset, dst_offset, size))
end

function ImageViewCreateInfo(image::Image, view_type::VkImageViewType, format::VkFormat, components::ComponentMapping, subresource_range::ImageSubresourceRange; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageViewCreateInfo(VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, image, view_type, format, components.vks, subresource_range.vks)
    ImageViewCreateInfo(vks, deps)
end

function ImageCreateInfo(image_type::VkImageType, format::VkFormat, extent::Extent3D, mip_levels::Integer, array_layers::Integer, samples::VkSampleCountFlagBits, tiling::VkImageTiling, usage::Integer, sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}, initial_layout::VkImageLayout; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    queue_family_indices = cconvert(Ptr{UInt32}, queue_family_indices)
    deps = [next, queue_family_indices]
    vks = VkImageCreateInfo(VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, image_type, format, extent.vks, mip_levels, array_layers, samples, tiling, usage, sharing_mode, pointer_length(queue_family_indices), unsafe_convert(Ptr{UInt32}, queue_family_indices), initial_layout)
    ImageCreateInfo(vks, deps)
end

function ImageMemoryBarrier(src_access_mask::Integer, dst_access_mask::Integer, old_layout::VkImageLayout, new_layout::VkImageLayout, src_queue_family_index::Integer, dst_queue_family_index::Integer, image::Image, subresource_range::ImageSubresourceRange; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkImageMemoryBarrier(VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER, unsafe_convert(Ptr{Cvoid}, next), src_access_mask, dst_access_mask, old_layout, new_layout, src_queue_family_index, dst_queue_family_index, image, subresource_range.vks)
    ImageMemoryBarrier(vks, deps)
end

function BufferMemoryBarrier(src_access_mask::Integer, dst_access_mask::Integer, src_queue_family_index::Integer, dst_queue_family_index::Integer, buffer::Buffer, offset::Integer, size::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBufferMemoryBarrier(VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER, unsafe_convert(Ptr{Cvoid}, next), src_access_mask, dst_access_mask, src_queue_family_index, dst_queue_family_index, buffer, offset, size)
    BufferMemoryBarrier(vks, deps)
end

function MemoryBarrier(; next = C_NULL, src_access_mask = 0, dst_access_mask = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryBarrier(VK_STRUCTURE_TYPE_MEMORY_BARRIER, unsafe_convert(Ptr{Cvoid}, next), src_access_mask, dst_access_mask)
    MemoryBarrier(vks, deps)
end

function ImageSubresourceRange(aspect_mask::Integer, base_mip_level::Integer, level_count::Integer, base_array_layer::Integer, layer_count::Integer)
    ImageSubresourceRange(VkImageSubresourceRange(aspect_mask, base_mip_level, level_count, base_array_layer, layer_count))
end

function ImageSubresourceLayers(aspect_mask::Integer, mip_level::Integer, base_array_layer::Integer, layer_count::Integer)
    ImageSubresourceLayers(VkImageSubresourceLayers(aspect_mask, mip_level, base_array_layer, layer_count))
end

function ImageSubresource(aspect_mask::Integer, mip_level::Integer, array_layer::Integer)
    ImageSubresource(VkImageSubresource(aspect_mask, mip_level, array_layer))
end

function BufferViewCreateInfo(buffer::Buffer, format::VkFormat, offset::Integer, range::Integer; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkBufferViewCreateInfo(VK_STRUCTURE_TYPE_BUFFER_VIEW_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, buffer, format, offset, range)
    BufferViewCreateInfo(vks, deps)
end

function BufferCreateInfo(size::Integer, usage::Integer, sharing_mode::VkSharingMode, queue_family_indices::AbstractArray{<:Integer}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    queue_family_indices = cconvert(Ptr{UInt32}, queue_family_indices)
    deps = [next, queue_family_indices]
    vks = VkBufferCreateInfo(VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, size, usage, sharing_mode, pointer_length(queue_family_indices), unsafe_convert(Ptr{UInt32}, queue_family_indices))
    BufferCreateInfo(vks, deps)
end

function CopyDescriptorSet(src_set::DescriptorSet, src_binding::Integer, src_array_element::Integer, dst_set::DescriptorSet, dst_binding::Integer, dst_array_element::Integer, descriptor_count::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkCopyDescriptorSet(VK_STRUCTURE_TYPE_COPY_DESCRIPTOR_SET, unsafe_convert(Ptr{Cvoid}, next), src_set, src_binding, src_array_element, dst_set, dst_binding, dst_array_element, descriptor_count)
    CopyDescriptorSet(vks, deps)
end

function WriteDescriptorSet(dst_set::DescriptorSet, dst_binding::Integer, dst_array_element::Integer, descriptor_type::VkDescriptorType, image_info::AbstractArray{<:DescriptorImageInfo}, buffer_info::AbstractArray{<:DescriptorBufferInfo}, texel_buffer_view::AbstractArray{<:BufferView}; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    image_info = cconvert(Ptr{VkDescriptorImageInfo}, image_info)
    buffer_info = cconvert(Ptr{VkDescriptorBufferInfo}, buffer_info)
    texel_buffer_view = cconvert(Ptr{VkBufferView}, texel_buffer_view)
    deps = [next, image_info, buffer_info, texel_buffer_view]
    vks = VkWriteDescriptorSet(VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET, unsafe_convert(Ptr{Cvoid}, next), dst_set, dst_binding, dst_array_element, pointer_length(image_info), descriptor_type, unsafe_convert(Ptr{VkDescriptorImageInfo}, image_info), unsafe_convert(Ptr{VkDescriptorBufferInfo}, buffer_info), unsafe_convert(Ptr{VkBufferView}, texel_buffer_view))
    WriteDescriptorSet(vks, deps)
end

function DescriptorImageInfo(sampler::Sampler, image_view::ImageView, image_layout::VkImageLayout)
    DescriptorImageInfo(VkDescriptorImageInfo(sampler, image_view, image_layout))
end

function DescriptorBufferInfo(offset::Integer, range::Integer; buffer = C_NULL)
    DescriptorBufferInfo(VkDescriptorBufferInfo(buffer, offset, range))
end

function MappedMemoryRange(memory::DeviceMemory, offset::Integer, size::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMappedMemoryRange(VK_STRUCTURE_TYPE_MAPPED_MEMORY_RANGE, unsafe_convert(Ptr{Cvoid}, next), memory, offset, size)
    MappedMemoryRange(vks, deps)
end

function MemoryAllocateInfo(allocation_size::Integer, memory_type_index::Integer; next = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    deps = [next]
    vks = VkMemoryAllocateInfo(VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO, unsafe_convert(Ptr{Cvoid}, next), allocation_size, memory_type_index)
    MemoryAllocateInfo(vks, deps)
end

function InstanceCreateInfo(enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; next = C_NULL, flags = 0, application_info = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    application_info = cconvert(Ptr{VkApplicationInfo}, application_info)
    enabled_layer_names = cconvert(Ptr{Cstring}, enabled_layer_names)
    enabled_extension_names = cconvert(Ptr{Cstring}, enabled_extension_names)
    deps = [next, application_info, enabled_layer_names, enabled_extension_names]
    vks = VkInstanceCreateInfo(VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, unsafe_convert(Ptr{VkApplicationInfo}, application_info), pointer_length(enabled_layer_names), unsafe_convert(Ptr{Cstring}, enabled_layer_names), pointer_length(enabled_extension_names), unsafe_convert(Ptr{Cstring}, enabled_extension_names))
    InstanceCreateInfo(vks, deps)
end

function DeviceCreateInfo(queue_create_infos::AbstractArray{<:DeviceQueueCreateInfo}, enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; next = C_NULL, flags = 0, enabled_features = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    queue_create_infos = cconvert(Ptr{VkDeviceQueueCreateInfo}, queue_create_infos)
    enabled_layer_names = cconvert(Ptr{Cstring}, enabled_layer_names)
    enabled_extension_names = cconvert(Ptr{Cstring}, enabled_extension_names)
    enabled_features = cconvert(Ptr{VkPhysicalDeviceFeatures}, enabled_features)
    deps = [next, queue_create_infos, enabled_layer_names, enabled_extension_names, enabled_features]
    vks = VkDeviceCreateInfo(VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, pointer_length(queue_create_infos), unsafe_convert(Ptr{VkDeviceQueueCreateInfo}, queue_create_infos), pointer_length(enabled_layer_names), unsafe_convert(Ptr{Cstring}, enabled_layer_names), pointer_length(enabled_extension_names), unsafe_convert(Ptr{Cstring}, enabled_extension_names), unsafe_convert(Ptr{VkPhysicalDeviceFeatures}, enabled_features))
    DeviceCreateInfo(vks, deps)
end

function DeviceQueueCreateInfo(queue_family_index::Integer, queue_priorities::AbstractArray{<:Real}; next = C_NULL, flags = 0)
    next = cconvert(Ptr{Cvoid}, next)
    queue_priorities = cconvert(Ptr{Float32}, queue_priorities)
    deps = [next, queue_priorities]
    vks = VkDeviceQueueCreateInfo(VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO, unsafe_convert(Ptr{Cvoid}, next), flags, queue_family_index, pointer_length(queue_priorities), unsafe_convert(Ptr{Float32}, queue_priorities))
    DeviceQueueCreateInfo(vks, deps)
end

function AllocationCallbacks(pfn_allocation::FunctionPtr, pfn_reallocation::FunctionPtr, pfn_free::FunctionPtr; user_data = C_NULL, pfn_internal_allocation = 0, pfn_internal_free = 0)
    user_data = cconvert(Ptr{Cvoid}, user_data)
    deps = [user_data]
    vks = VkAllocationCallbacks(unsafe_convert(Ptr{Cvoid}, user_data), pfn_allocation, pfn_reallocation, pfn_free, pfn_internal_allocation, pfn_internal_free)
    AllocationCallbacks(vks, deps)
end

function ApplicationInfo(application_version::VersionNumber, engine_version::VersionNumber, api_version::VersionNumber; next = C_NULL, application_name = C_NULL, engine_name = C_NULL)
    next = cconvert(Ptr{Cvoid}, next)
    application_name = cconvert(Cstring, application_name)
    engine_name = cconvert(Cstring, engine_name)
    deps = [next, application_name, engine_name]
    vks = VkApplicationInfo(VK_STRUCTURE_TYPE_APPLICATION_INFO, unsafe_convert(Ptr{Cvoid}, next), unsafe_convert(Cstring, application_name), to_vk(UInt32, application_version), unsafe_convert(Cstring, engine_name), to_vk(UInt32, engine_version), to_vk(UInt32, api_version))
    ApplicationInfo(vks, deps)
end

function ComponentMapping(r::VkComponentSwizzle, g::VkComponentSwizzle, b::VkComponentSwizzle, a::VkComponentSwizzle)
    ComponentMapping(VkComponentMapping(r, g, b, a))
end

function ClearRect(rect::Rect2D, base_array_layer::Integer, layer_count::Integer)
    ClearRect(VkClearRect(rect.vks, base_array_layer, layer_count))
end

function Rect2D(offset::Offset2D, extent::Extent2D)
    Rect2D(VkRect2D(offset.vks, extent.vks))
end

function Viewport(x::Real, y::Real, width::Real, height::Real, min_depth::Real, max_depth::Real)
    Viewport(VkViewport(x, y, width, height, min_depth, max_depth))
end

function Extent3D(width::Integer, height::Integer, depth::Integer)
    Extent3D(VkExtent3D(width, height, depth))
end

function Extent2D(width::Integer, height::Integer)
    Extent2D(VkExtent2D(width, height))
end

function Offset3D(x::Integer, y::Integer, z::Integer)
    Offset3D(VkOffset3D(x, y, z))
end

function Offset2D(x::Integer, y::Integer)
    Offset2D(VkOffset2D(x, y))
end

function BaseInStructure(; next = C_NULL)
    next = cconvert(Ptr{VkBaseInStructure}, next)
    deps = [next]
    vks = VkBaseInStructure(s_type, unsafe_convert(Ptr{VkBaseInStructure}, next))
    BaseInStructure(vks, deps)
end

function BaseOutStructure(; next = C_NULL)
    next = cconvert(Ptr{VkBaseOutStructure}, next)
    deps = [next]
    vks = VkBaseOutStructure(s_type, unsafe_convert(Ptr{VkBaseOutStructure}, next))
    BaseOutStructure(vks, deps)
end

function get_private_data_ext(device::Device, object_type::VkObjectType, object_handle::Integer, private_data_slot::PrivateDataSlotEXT)
    pData = Ref{UInt64}()
    vkGetPrivateDataEXT(device, object_type, object_handle, private_data_slot, pData)
    pData[]
end

set_private_data_ext(device::Device, object_type::VkObjectType, object_handle::Integer, private_data_slot::PrivateDataSlotEXT, data::Integer) = @check(vkSetPrivateDataEXT(device, object_type, object_handle, private_data_slot, data))

destroy_private_data_slot_ext(device::Device, private_data_slot::PrivateDataSlotEXT; allocator = C_NULL) = vkDestroyPrivateDataSlotEXT(device, private_data_slot, allocator)

function create_private_data_slot_ext(device::Device, create_info::PrivateDataSlotCreateInfoEXT; allocator = C_NULL)
    pPrivateDataSlot = Ref{VkPrivateDataSlotEXT}()
    @check vkCreatePrivateDataSlotEXT(device, create_info, allocator, pPrivateDataSlot)
    PrivateDataSlotEXT(pPrivateDataSlot[], (x->destroy_private_data_slot_ext(device, x; allocator)), device)
end

cmd_set_stencil_op_ext(command_buffer::CommandBuffer, face_mask::Integer, fail_op::VkStencilOp, pass_op::VkStencilOp, depth_fail_op::VkStencilOp, compare_op::VkCompareOp) = vkCmdSetStencilOpEXT(command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op)

cmd_set_stencil_test_enable_ext(command_buffer::CommandBuffer, stencil_test_enable::Bool) = vkCmdSetStencilTestEnableEXT(command_buffer, stencil_test_enable)

cmd_set_depth_bounds_test_enable_ext(command_buffer::CommandBuffer, depth_bounds_test_enable::Bool) = vkCmdSetDepthBoundsTestEnableEXT(command_buffer, depth_bounds_test_enable)

cmd_set_depth_compare_op_ext(command_buffer::CommandBuffer, depth_compare_op::VkCompareOp) = vkCmdSetDepthCompareOpEXT(command_buffer, depth_compare_op)

cmd_set_depth_write_enable_ext(command_buffer::CommandBuffer, depth_write_enable::Bool) = vkCmdSetDepthWriteEnableEXT(command_buffer, depth_write_enable)

cmd_set_depth_test_enable_ext(command_buffer::CommandBuffer, depth_test_enable::Bool) = vkCmdSetDepthTestEnableEXT(command_buffer, depth_test_enable)

cmd_bind_vertex_buffers_2_ext(command_buffer::CommandBuffer, buffers::AbstractArray{<:Buffer}, offsets::AbstractArray{<:Integer}; sizes = C_NULL, strides = C_NULL) = vkCmdBindVertexBuffers2EXT(command_buffer, 0, pointer_length(buffers), buffers, offsets, sizes, strides)

cmd_set_scissor_with_count_ext(command_buffer::CommandBuffer, scissors::AbstractArray{<:Rect2D}) = vkCmdSetScissorWithCountEXT(command_buffer, pointer_length(scissors), scissors)

cmd_set_viewport_with_count_ext(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}) = vkCmdSetViewportWithCountEXT(command_buffer, pointer_length(viewports), viewports)

cmd_set_primitive_topology_ext(command_buffer::CommandBuffer, primitive_topology::VkPrimitiveTopology) = vkCmdSetPrimitiveTopologyEXT(command_buffer, primitive_topology)

cmd_set_front_face_ext(command_buffer::CommandBuffer, front_face::VkFrontFace) = vkCmdSetFrontFaceEXT(command_buffer, front_face)

cmd_set_cull_mode_ext(command_buffer::CommandBuffer; cull_mode = 0) = vkCmdSetCullModeEXT(command_buffer, cull_mode)

deferred_operation_join_khr(device::Device, operation::DeferredOperationKHR) = @check(vkDeferredOperationJoinKHR(device, operation))

get_deferred_operation_result_khr(device::Device, operation::DeferredOperationKHR) = @check(vkGetDeferredOperationResultKHR(device, operation))

get_deferred_operation_max_concurrency_khr(device::Device, operation::DeferredOperationKHR) = vkGetDeferredOperationMaxConcurrencyKHR(device, operation)

destroy_deferred_operation_khr(device::Device, operation::DeferredOperationKHR; allocator = C_NULL) = vkDestroyDeferredOperationKHR(device, operation, allocator)

function create_deferred_operation_khr(device::Device; allocator = C_NULL)
    pDeferredOperation = Ref{VkDeferredOperationKHR}()
    @check vkCreateDeferredOperationKHR(device, allocator, pDeferredOperation)
    DeferredOperationKHR(pDeferredOperation[], (x->destroy_deferred_operation_khr(device, x; allocator)), device)
end

get_acceleration_structure_device_address_khr(device::Device, info::AccelerationStructureDeviceAddressInfoKHR) = vkGetAccelerationStructureDeviceAddressKHR(device, info)

build_acceleration_structure_khr(device::Device, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, offset_infos::AbstractArray{<:AccelerationStructureBuildOffsetInfoKHR}) = @check(vkBuildAccelerationStructureKHR(device, pointer_length(infos), infos, offset_infos))

cmd_build_acceleration_structure_indirect_khr(command_buffer::CommandBuffer, info::AccelerationStructureBuildGeometryInfoKHR, indirect_buffer::Buffer, indirect_offset::Integer, indirect_stride::Integer) = vkCmdBuildAccelerationStructureIndirectKHR(command_buffer, info, indirect_buffer, indirect_offset, indirect_stride)

cmd_build_acceleration_structure_khr(command_buffer::CommandBuffer, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, offset_infos::AbstractArray{<:AccelerationStructureBuildOffsetInfoKHR}) = vkCmdBuildAccelerationStructureKHR(command_buffer, pointer_length(infos), infos, offset_infos)

function create_acceleration_structure_khr(device::Device, create_info::AccelerationStructureCreateInfoKHR; allocator = C_NULL)
    pAccelerationStructure = Ref{VkAccelerationStructureKHR}()
    @check vkCreateAccelerationStructureKHR(device, create_info, allocator, pAccelerationStructure)
    AccelerationStructureKHR(pAccelerationStructure[], (x->destroy_acceleration_structure_khr(device, x; allocator)), device)
end

function get_physical_device_tool_properties_ext(physical_device::PhysicalDevice)
    pToolCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceToolPropertiesEXT(physical_device, pToolCount, C_NULL)
    pToolProperties = Vector{VkPhysicalDeviceToolPropertiesEXT}(undef, pToolCount[])
    @check vkGetPhysicalDeviceToolPropertiesEXT(physical_device, pToolCount, pToolProperties)
    from_vk.(PhysicalDeviceToolPropertiesEXT, pToolProperties)
end

cmd_set_line_stipple_ext(command_buffer::CommandBuffer, line_stipple_factor::Integer, line_stipple_pattern::Integer) = vkCmdSetLineStippleEXT(command_buffer, line_stipple_factor, line_stipple_pattern)

function get_pipeline_executable_internal_representations_khr(device::Device, executable_info::PipelineExecutableInfoKHR)
    pInternalRepresentationCount = Ref{UInt32}()
    @check vkGetPipelineExecutableInternalRepresentationsKHR(device, executable_info, pInternalRepresentationCount, C_NULL)
    pInternalRepresentations = Vector{VkPipelineExecutableInternalRepresentationKHR}(undef, pInternalRepresentationCount[])
    @check vkGetPipelineExecutableInternalRepresentationsKHR(device, executable_info, pInternalRepresentationCount, pInternalRepresentations)
    from_vk.(PipelineExecutableInternalRepresentationKHR, pInternalRepresentations)
end

function get_pipeline_executable_statistics_khr(device::Device, executable_info::PipelineExecutableInfoKHR)
    pStatisticCount = Ref{UInt32}()
    @check vkGetPipelineExecutableStatisticsKHR(device, executable_info, pStatisticCount, C_NULL)
    pStatistics = Vector{VkPipelineExecutableStatisticKHR}(undef, pStatisticCount[])
    @check vkGetPipelineExecutableStatisticsKHR(device, executable_info, pStatisticCount, pStatistics)
    from_vk.(PipelineExecutableStatisticKHR, pStatistics)
end

function get_pipeline_executable_properties_khr(device::Device, pipeline_info::PipelineInfoKHR)
    pExecutableCount = Ref{UInt32}()
    @check vkGetPipelineExecutablePropertiesKHR(device, pipeline_info, pExecutableCount, C_NULL)
    pProperties = Vector{VkPipelineExecutablePropertiesKHR}(undef, pExecutableCount[])
    @check vkGetPipelineExecutablePropertiesKHR(device, pipeline_info, pExecutableCount, pProperties)
    from_vk.(PipelineExecutablePropertiesKHR, pProperties)
end

get_device_memory_opaque_capture_address(device::Device, info::DeviceMemoryOpaqueCaptureAddressInfo) = vkGetDeviceMemoryOpaqueCaptureAddress(device, info)

function get_performance_parameter_intel(device::Device, parameter::VkPerformanceParameterTypeINTEL)
    pValue = Ref{VkPerformanceValueINTEL}()
    @check vkGetPerformanceParameterINTEL(device, parameter, pValue)
    from_vk(PerformanceValueINTEL, pValue[])
end

queue_set_performance_configuration_intel(queue::Queue, configuration::PerformanceConfigurationINTEL) = @check(vkQueueSetPerformanceConfigurationINTEL(queue, configuration))

release_performance_configuration_intel(device::Device, configuration::PerformanceConfigurationINTEL) = @check(vkReleasePerformanceConfigurationINTEL(device, configuration))

function acquire_performance_configuration_intel(device::Device, acquire_info::PerformanceConfigurationAcquireInfoINTEL)
    pConfiguration = Ref{VkPerformanceConfigurationINTEL}()
    @check vkAcquirePerformanceConfigurationINTEL(device, acquire_info, pConfiguration)
    PerformanceConfigurationINTEL(pConfiguration[], identity, device)
end

cmd_set_performance_override_intel(command_buffer::CommandBuffer, override_info::PerformanceOverrideInfoINTEL) = @check(vkCmdSetPerformanceOverrideINTEL(command_buffer, override_info))

cmd_set_performance_stream_marker_intel(command_buffer::CommandBuffer, marker_info::PerformanceStreamMarkerInfoINTEL) = @check(vkCmdSetPerformanceStreamMarkerINTEL(command_buffer, marker_info))

cmd_set_performance_marker_intel(command_buffer::CommandBuffer, marker_info::PerformanceMarkerInfoINTEL) = @check(vkCmdSetPerformanceMarkerINTEL(command_buffer, marker_info))

uninitialize_performance_api_intel(device::Device) = vkUninitializePerformanceApiINTEL(device)

initialize_performance_api_intel(device::Device, initialize_info::InitializePerformanceApiInfoINTEL) = @check(vkInitializePerformanceApiINTEL(device, initialize_info))

function get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(physical_device::PhysicalDevice)
    pCombinationCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(physical_device, pCombinationCount, C_NULL)
    pCombinations = Vector{VkFramebufferMixedSamplesCombinationNV}(undef, pCombinationCount[])
    @check vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(physical_device, pCombinationCount, pCombinations)
    from_vk.(FramebufferMixedSamplesCombinationNV, pCombinations)
end

function create_headless_surface_ext(instance::Instance, create_info::HeadlessSurfaceCreateInfoEXT; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateHeadlessSurfaceEXT(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

get_buffer_device_address(device::Device, info::BufferDeviceAddressInfo) = vkGetBufferDeviceAddress(device, info)

get_buffer_opaque_capture_address(device::Device, info::BufferDeviceAddressInfo) = vkGetBufferOpaqueCaptureAddress(device, info)

function get_image_drm_format_modifier_properties_ext(device::Device, image::Image)
    pProperties = Ref{VkImageDrmFormatModifierPropertiesEXT}()
    @check vkGetImageDrmFormatModifierPropertiesEXT(device, image, pProperties)
    from_vk(ImageDrmFormatModifierPropertiesEXT, pProperties[])
end

release_profiling_lock_khr(device::Device) = vkReleaseProfilingLockKHR(device)

acquire_profiling_lock_khr(device::Device, info::AcquireProfilingLockInfoKHR) = @check(vkAcquireProfilingLockKHR(device, info))

function get_physical_device_queue_family_performance_query_passes_khr(physical_device::PhysicalDevice, performance_query_create_info::QueryPoolPerformanceCreateInfoKHR)
    pNumPasses = Ref{UInt32}()
    vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(physical_device, performance_query_create_info, pNumPasses)
    pNumPasses[]
end

function enumerate_physical_device_queue_family_performance_query_counters_khr(physical_device::PhysicalDevice, queue_family_index::Integer)
    pCounterCount = Ref{UInt32}()
    @check vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device, queue_family_index, pCounterCount, C_NULL, C_NULL)
    pCounters = Vector{VkPerformanceCounterKHR}(undef, pCounterCount[])
    pCounterDescriptions = Vector{VkPerformanceCounterDescriptionKHR}(undef, pCounterCount[])
    @check vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device, queue_family_index, pCounterCount, pCounters, pCounterDescriptions)
    (from_vk.(PerformanceCounterKHR, pCounters), from_vk.(PerformanceCounterDescriptionKHR, pCounterDescriptions))
end

release_full_screen_exclusive_mode_ext(device::Device, swapchain::SwapchainKHR) = @check(vkReleaseFullScreenExclusiveModeEXT(device, swapchain))

acquire_full_screen_exclusive_mode_ext(device::Device, swapchain::SwapchainKHR) = @check(vkAcquireFullScreenExclusiveModeEXT(device, swapchain))

function get_device_group_surface_present_modes_2_ext(device::Device, surface_info::PhysicalDeviceSurfaceInfo2KHR, modes::Integer)
    pModes = Ref{VkDeviceGroupPresentModeFlagsKHR}()
    @check vkGetDeviceGroupSurfacePresentModes2EXT(device, surface_info, pModes)
    pModes[]
end

function get_physical_device_surface_present_modes_2_ext(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR)
    pPresentModeCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSurfacePresentModes2EXT(physical_device, surface_info, pPresentModeCount, C_NULL)
    pPresentModes = Vector{VkPresentModeKHR}(undef, pPresentModeCount[])
    @check vkGetPhysicalDeviceSurfacePresentModes2EXT(physical_device, surface_info, pPresentModeCount, pPresentModes)
    pPresentModes
end

function get_image_view_address_nvx(device::Device, image_view::ImageView)
    pProperties = Ref{VkImageViewAddressPropertiesNVX}()
    @check vkGetImageViewAddressNVX(device, image_view, pProperties)
    from_vk(ImageViewAddressPropertiesNVX, pProperties[])
end

get_image_view_handle_nvx(device::Device, info::ImageViewHandleInfoNVX) = vkGetImageViewHandleNVX(device, info)

get_device_acceleration_structure_compatibility_khr(device::Device, version::AccelerationStructureVersionKHR) = @check(vkGetDeviceAccelerationStructureCompatibilityKHR(device, version))

cmd_trace_rays_indirect_khr(command_buffer::CommandBuffer, raygen_shader_binding_table::StridedBufferRegionKHR, miss_shader_binding_table::StridedBufferRegionKHR, hit_shader_binding_table::StridedBufferRegionKHR, callable_shader_binding_table::StridedBufferRegionKHR, buffer::Buffer, offset::Integer) = vkCmdTraceRaysIndirectKHR(command_buffer, raygen_shader_binding_table, miss_shader_binding_table, hit_shader_binding_table, callable_shader_binding_table, buffer, offset)

function get_physical_device_cooperative_matrix_properties_nv(physical_device::PhysicalDevice)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(physical_device, pPropertyCount, C_NULL)
    pProperties = Vector{VkCooperativeMatrixPropertiesNV}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(physical_device, pPropertyCount, pProperties)
    from_vk.(CooperativeMatrixPropertiesNV, pProperties)
end

function create_ray_tracing_pipelines_khr(device::Device, create_infos::AbstractArray{<:RayTracingPipelineCreateInfoKHR}; pipeline_cache = C_NULL, allocator = C_NULL)
    pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
    @check vkCreateRayTracingPipelinesKHR(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines)
    Pipeline.(pPipelines, (x->destroy_pipeline(device, x; allocator)), device)
end

function create_ray_tracing_pipelines_nv(device::Device, create_infos::AbstractArray{<:RayTracingPipelineCreateInfoNV}; pipeline_cache = C_NULL, allocator = C_NULL)
    pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
    @check vkCreateRayTracingPipelinesNV(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines)
    Pipeline.(pPipelines, (x->destroy_pipeline(device, x; allocator)), device)
end

function get_acceleration_structure_handle_nv(device::Device, acceleration_structure::AccelerationStructureKHR, data_size::Integer)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetAccelerationStructureHandleNV(device, acceleration_structure, data_size, pData)
    pData[]
end

function get_ray_tracing_capture_replay_shader_group_handles_khr(device::Device, pipeline::Pipeline, first_group::Integer, group_count::Integer, data_size::Integer)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetRayTracingCaptureReplayShaderGroupHandlesKHR(device, pipeline, first_group, group_count, data_size, pData)
    pData[]
end

function get_ray_tracing_shader_group_handles_khr(device::Device, pipeline::Pipeline, first_group::Integer, group_count::Integer, data_size::Integer)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetRayTracingShaderGroupHandlesKHR(device, pipeline, first_group, group_count, data_size, pData)
    pData[]
end

cmd_trace_rays_nv(command_buffer::CommandBuffer, raygen_shader_binding_table_buffer::Buffer, raygen_shader_binding_offset::Integer, miss_shader_binding_offset::Integer, miss_shader_binding_stride::Integer, hit_shader_binding_offset::Integer, hit_shader_binding_stride::Integer, callable_shader_binding_offset::Integer, callable_shader_binding_stride::Integer, width::Integer, height::Integer, depth::Integer; miss_shader_binding_table_buffer = C_NULL, hit_shader_binding_table_buffer = C_NULL, callable_shader_binding_table_buffer = C_NULL) = vkCmdTraceRaysNV(command_buffer, raygen_shader_binding_table_buffer, raygen_shader_binding_offset, miss_shader_binding_table_buffer, miss_shader_binding_offset, miss_shader_binding_stride, hit_shader_binding_table_buffer, hit_shader_binding_offset, hit_shader_binding_stride, callable_shader_binding_table_buffer, callable_shader_binding_offset, callable_shader_binding_stride, width, height, depth)

cmd_trace_rays_khr(command_buffer::CommandBuffer, raygen_shader_binding_table::StridedBufferRegionKHR, miss_shader_binding_table::StridedBufferRegionKHR, hit_shader_binding_table::StridedBufferRegionKHR, callable_shader_binding_table::StridedBufferRegionKHR, width::Integer, height::Integer, depth::Integer) = vkCmdTraceRaysKHR(command_buffer, raygen_shader_binding_table, miss_shader_binding_table, hit_shader_binding_table, callable_shader_binding_table, width, height, depth)

function write_acceleration_structures_properties_khr(device::Device, acceleration_structures::AbstractArray{<:AccelerationStructureKHR}, query_type::VkQueryType, data_size::Integer, stride::Integer)
    pData = Ref{Ptr{Cvoid}}()
    @check vkWriteAccelerationStructuresPropertiesKHR(device, pointer_length(acceleration_structures), acceleration_structures, query_type, data_size, pData, stride)
    pData[]
end

cmd_build_acceleration_structure_nv(command_buffer::CommandBuffer, info::AccelerationStructureInfoNV, instance_offset::Integer, update::Bool, dst::AccelerationStructureKHR, scratch::Buffer, scratch_offset::Integer; instance_data = C_NULL, src = C_NULL) = vkCmdBuildAccelerationStructureNV(command_buffer, info, instance_data, instance_offset, update, dst, src, scratch, scratch_offset)

cmd_write_acceleration_structures_properties_khr(command_buffer::CommandBuffer, acceleration_structures::AbstractArray{<:AccelerationStructureKHR}, query_type::VkQueryType, query_pool::QueryPool, first_query::Integer) = vkCmdWriteAccelerationStructuresPropertiesKHR(command_buffer, pointer_length(acceleration_structures), acceleration_structures, query_type, query_pool, first_query)

copy_memory_to_acceleration_structure_khr(device::Device, info::CopyMemoryToAccelerationStructureInfoKHR) = @check(vkCopyMemoryToAccelerationStructureKHR(device, info))

cmd_copy_memory_to_acceleration_structure_khr(command_buffer::CommandBuffer, info::CopyMemoryToAccelerationStructureInfoKHR) = vkCmdCopyMemoryToAccelerationStructureKHR(command_buffer, info)

copy_acceleration_structure_to_memory_khr(device::Device, info::CopyAccelerationStructureToMemoryInfoKHR) = @check(vkCopyAccelerationStructureToMemoryKHR(device, info))

cmd_copy_acceleration_structure_to_memory_khr(command_buffer::CommandBuffer, info::CopyAccelerationStructureToMemoryInfoKHR) = vkCmdCopyAccelerationStructureToMemoryKHR(command_buffer, info)

copy_acceleration_structure_khr(device::Device, info::CopyAccelerationStructureInfoKHR) = @check(vkCopyAccelerationStructureKHR(device, info))

cmd_copy_acceleration_structure_khr(command_buffer::CommandBuffer, info::CopyAccelerationStructureInfoKHR) = vkCmdCopyAccelerationStructureKHR(command_buffer, info)

cmd_copy_acceleration_structure_nv(command_buffer::CommandBuffer, dst::AccelerationStructureKHR, src::AccelerationStructureKHR, mode::VkCopyAccelerationStructureModeKHR) = vkCmdCopyAccelerationStructureNV(command_buffer, dst, src, mode)

bind_acceleration_structure_memory_khr(device::Device, bind_infos::AbstractArray{<:BindAccelerationStructureMemoryInfoKHR}) = @check(vkBindAccelerationStructureMemoryKHR(device, pointer_length(bind_infos), bind_infos))

function get_acceleration_structure_memory_requirements_nv(device::Device, info::AccelerationStructureMemoryRequirementsInfoNV)
    pMemoryRequirements = Ref{VkMemoryRequirements2KHR}()
    vkGetAccelerationStructureMemoryRequirementsNV(device, info, pMemoryRequirements)
    from_vk(VkMemoryRequirements2KHR, pMemoryRequirements[])
end

function get_acceleration_structure_memory_requirements_khr(device::Device, info::AccelerationStructureMemoryRequirementsInfoKHR)
    pMemoryRequirements = Ref{VkMemoryRequirements2}()
    vkGetAccelerationStructureMemoryRequirementsKHR(device, info, pMemoryRequirements)
    from_vk(MemoryRequirements2, pMemoryRequirements[])
end

destroy_acceleration_structure_khr(device::Device, acceleration_structure::AccelerationStructureKHR; allocator = C_NULL) = vkDestroyAccelerationStructureKHR(device, acceleration_structure, allocator)

function create_acceleration_structure_nv(device::Device, create_info::AccelerationStructureCreateInfoNV; allocator = C_NULL)
    pAccelerationStructure = Ref{VkAccelerationStructureNV}()
    @check vkCreateAccelerationStructureNV(device, create_info, allocator, pAccelerationStructure)
    AccelerationStructureKHR(pAccelerationStructure[], (x->destroy_acceleration_structure_khr(device, x; allocator)), device)
end

compile_deferred_nv(device::Device, pipeline::Pipeline, shader::Integer) = @check(vkCompileDeferredNV(device, pipeline, shader))

cmd_draw_mesh_tasks_indirect_count_nv(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, count_buffer::Buffer, count_buffer_offset::Integer, max_draw_count::Integer, stride::Integer) = vkCmdDrawMeshTasksIndirectCountNV(command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride)

cmd_draw_mesh_tasks_indirect_nv(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, draw_count::Integer, stride::Integer) = vkCmdDrawMeshTasksIndirectNV(command_buffer, buffer, offset, draw_count, stride)

cmd_draw_mesh_tasks_nv(command_buffer::CommandBuffer, task_count::Integer, first_task::Integer) = vkCmdDrawMeshTasksNV(command_buffer, task_count, first_task)

cmd_set_coarse_sample_order_nv(command_buffer::CommandBuffer, sample_order_type::VkCoarseSampleOrderTypeNV, custom_sample_orders::AbstractArray{<:CoarseSampleOrderCustomNV}) = vkCmdSetCoarseSampleOrderNV(command_buffer, sample_order_type, pointer_length(custom_sample_orders), custom_sample_orders)

cmd_set_viewport_shading_rate_palette_nv(command_buffer::CommandBuffer, shading_rate_palettes::AbstractArray{<:ShadingRatePaletteNV}) = vkCmdSetViewportShadingRatePaletteNV(command_buffer, 0, pointer_length(shading_rate_palettes), shading_rate_palettes)

cmd_bind_shading_rate_image_nv(command_buffer::CommandBuffer, image_layout::VkImageLayout; image_view = C_NULL) = vkCmdBindShadingRateImageNV(command_buffer, image_view, image_layout)

cmd_set_exclusive_scissor_nv(command_buffer::CommandBuffer, exclusive_scissors::AbstractArray{<:Rect2D}) = vkCmdSetExclusiveScissorNV(command_buffer, 0, pointer_length(exclusive_scissors), exclusive_scissors)

cmd_draw_indirect_byte_count_ext(command_buffer::CommandBuffer, instance_count::Integer, first_instance::Integer, counter_buffer::Buffer, counter_buffer_offset::Integer, counter_offset::Integer, vertex_stride::Integer) = vkCmdDrawIndirectByteCountEXT(command_buffer, instance_count, first_instance, counter_buffer, counter_buffer_offset, counter_offset, vertex_stride)

cmd_end_query_indexed_ext(command_buffer::CommandBuffer, query_pool::QueryPool, query::Integer, index::Integer) = vkCmdEndQueryIndexedEXT(command_buffer, query_pool, query, index)

cmd_begin_query_indexed_ext(command_buffer::CommandBuffer, query_pool::QueryPool, query::Integer, index::Integer; flags = 0) = vkCmdBeginQueryIndexedEXT(command_buffer, query_pool, query, flags, index)

cmd_end_transform_feedback_ext(command_buffer::CommandBuffer, counter_buffers::AbstractArray{<:Buffer}; counter_buffer_offsets = C_NULL) = vkCmdEndTransformFeedbackEXT(command_buffer, 0, pointer_length(counter_buffers), counter_buffers, counter_buffer_offsets)

cmd_begin_transform_feedback_ext(command_buffer::CommandBuffer, counter_buffers::AbstractArray{<:Buffer}; counter_buffer_offsets = C_NULL) = vkCmdBeginTransformFeedbackEXT(command_buffer, 0, pointer_length(counter_buffers), counter_buffers, counter_buffer_offsets)

cmd_bind_transform_feedback_buffers_ext(command_buffer::CommandBuffer, buffers::AbstractArray{<:Buffer}, offsets::AbstractArray{<:Integer}; sizes = C_NULL) = vkCmdBindTransformFeedbackBuffersEXT(command_buffer, 0, pointer_length(buffers), buffers, offsets, sizes)

function get_queue_checkpoint_data_nv(queue::Queue)
    pCheckpointDataCount = Ref{UInt32}()
    vkGetQueueCheckpointDataNV(queue, pCheckpointDataCount, C_NULL)
    pCheckpointData = Vector{VkCheckpointDataNV}(undef, pCheckpointDataCount[])
    vkGetQueueCheckpointDataNV(queue, pCheckpointDataCount, pCheckpointData)
    from_vk.(CheckpointDataNV, pCheckpointData)
end

cmd_set_checkpoint_nv(command_buffer::CommandBuffer, checkpoint_marker::Ptr{Cvoid}) = vkCmdSetCheckpointNV(command_buffer, Ref(checkpoint_marker))

cmd_draw_indexed_indirect_count(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, count_buffer::Buffer, count_buffer_offset::Integer, max_draw_count::Integer, stride::Integer) = vkCmdDrawIndexedIndirectCount(command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride)

cmd_draw_indirect_count(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, count_buffer::Buffer, count_buffer_offset::Integer, max_draw_count::Integer, stride::Integer) = vkCmdDrawIndirectCount(command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride)

function get_memory_android_hardware_buffer_android(device::Device, info::MemoryGetAndroidHardwareBufferInfoANDROID)
    pBuffer = Ref{Ptr{AHardwareBuffer}}()
    @check vkGetMemoryAndroidHardwareBufferANDROID(device, info, pBuffer)
    from_vk(Cvoid, pBuffer[])
end

function get_android_hardware_buffer_properties_android(device::Device, buffer::Cvoid)
    pProperties = Ref{VkAndroidHardwareBufferPropertiesANDROID}()
    @check vkGetAndroidHardwareBufferPropertiesANDROID(device, Ref(buffer), pProperties)
    from_vk(AndroidHardwareBufferPropertiesANDROID, pProperties[])
end

signal_semaphore(device::Device, signal_info::SemaphoreSignalInfo) = @check(vkSignalSemaphore(device, signal_info))

wait_semaphores(device::Device, wait_info::SemaphoreWaitInfo, timeout::Integer) = @check(vkWaitSemaphores(device, wait_info, timeout))

function get_semaphore_counter_value(device::Device, semaphore::Semaphore)
    pValue = Ref{UInt64}()
    @check vkGetSemaphoreCounterValue(device, semaphore, pValue)
    pValue[]
end

cmd_end_render_pass_2(command_buffer::CommandBuffer, subpass_end_info::SubpassEndInfo) = vkCmdEndRenderPass2(command_buffer, subpass_end_info)

cmd_next_subpass_2(command_buffer::CommandBuffer, subpass_begin_info::SubpassBeginInfo, subpass_end_info::SubpassEndInfo) = vkCmdNextSubpass2(command_buffer, subpass_begin_info, subpass_end_info)

cmd_begin_render_pass_2(command_buffer::CommandBuffer, render_pass_begin::RenderPassBeginInfo, subpass_begin_info::SubpassBeginInfo) = vkCmdBeginRenderPass2(command_buffer, render_pass_begin, subpass_begin_info)

function create_render_pass_2(device::Device, create_info::RenderPassCreateInfo2; allocator = C_NULL)
    pRenderPass = Ref{VkRenderPass}()
    @check vkCreateRenderPass2(device, create_info, allocator, pRenderPass)
    RenderPass(pRenderPass[], (x->destroy_render_pass(device, x; allocator)), device)
end

cmd_write_buffer_marker_amd(command_buffer::CommandBuffer, pipeline_stage::VkPipelineStageFlagBits, dst_buffer::Buffer, dst_offset::Integer, marker::Integer) = vkCmdWriteBufferMarkerAMD(command_buffer, pipeline_stage, dst_buffer, dst_offset, marker)

function get_memory_host_pointer_properties_ext(device::Device, handle_type::VkExternalMemoryHandleTypeFlagBits, host_pointer::Ptr{Cvoid})
    pMemoryHostPointerProperties = Ref{VkMemoryHostPointerPropertiesEXT}()
    @check vkGetMemoryHostPointerPropertiesEXT(device, handle_type, Ref(host_pointer), pMemoryHostPointerProperties)
    from_vk(MemoryHostPointerPropertiesEXT, pMemoryHostPointerProperties[])
end

submit_debug_utils_message_ext(instance::Instance, message_severity::VkDebugUtilsMessageSeverityFlagBitsEXT, message_types::Integer, callback_data::DebugUtilsMessengerCallbackDataEXT) = vkSubmitDebugUtilsMessageEXT(instance, message_severity, message_types, callback_data)

destroy_debug_utils_messenger_ext(instance::Instance, messenger::DebugUtilsMessengerEXT; allocator = C_NULL) = vkDestroyDebugUtilsMessengerEXT(instance, messenger, allocator)

function create_debug_utils_messenger_ext(instance::Instance, create_info::DebugUtilsMessengerCreateInfoEXT; allocator = C_NULL)
    pMessenger = Ref{VkDebugUtilsMessengerEXT}()
    @check vkCreateDebugUtilsMessengerEXT(instance, create_info, allocator, pMessenger)
    DebugUtilsMessengerEXT(pMessenger[], (x->destroy_debug_utils_messenger_ext(instance, x; allocator)), instance)
end

cmd_insert_debug_utils_label_ext(command_buffer::CommandBuffer, label_info::DebugUtilsLabelEXT) = vkCmdInsertDebugUtilsLabelEXT(command_buffer, label_info)

cmd_end_debug_utils_label_ext(command_buffer::CommandBuffer) = vkCmdEndDebugUtilsLabelEXT(command_buffer)

cmd_begin_debug_utils_label_ext(command_buffer::CommandBuffer, label_info::DebugUtilsLabelEXT) = vkCmdBeginDebugUtilsLabelEXT(command_buffer, label_info)

queue_insert_debug_utils_label_ext(queue::Queue, label_info::DebugUtilsLabelEXT) = vkQueueInsertDebugUtilsLabelEXT(queue, label_info)

queue_end_debug_utils_label_ext(queue::Queue) = vkQueueEndDebugUtilsLabelEXT(queue)

queue_begin_debug_utils_label_ext(queue::Queue, label_info::DebugUtilsLabelEXT) = vkQueueBeginDebugUtilsLabelEXT(queue, label_info)

set_debug_utils_object_tag_ext(device::Device, tag_info::DebugUtilsObjectTagInfoEXT) = @check(vkSetDebugUtilsObjectTagEXT(device, tag_info))

set_debug_utils_object_name_ext(device::Device, name_info::DebugUtilsObjectNameInfoEXT) = @check(vkSetDebugUtilsObjectNameEXT(device, name_info))

function get_calibrated_timestamps_ext(device::Device, timestamp_infos::AbstractArray{<:CalibratedTimestampInfoEXT})
    pTimestamps = Vector{UInt64}(undef, pointer_length(timestamp_infos))
    pMaxDeviation = Ref{UInt64}()
    @check vkGetCalibratedTimestampsEXT(device, pointer_length(timestamp_infos), timestamp_infos, pTimestamps, pMaxDeviation)
    (pTimestamps, pMaxDeviation[])
end

function get_physical_device_calibrateable_time_domains_ext(physical_device::PhysicalDevice)
    pTimeDomainCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceCalibrateableTimeDomainsEXT(physical_device, pTimeDomainCount, C_NULL)
    pTimeDomains = Vector{VkTimeDomainEXT}(undef, pTimeDomainCount[])
    @check vkGetPhysicalDeviceCalibrateableTimeDomainsEXT(physical_device, pTimeDomainCount, pTimeDomains)
    pTimeDomains
end

set_local_dimming_amd(device::Device, swap_chain::SwapchainKHR, local_dimming_enable::Bool) = vkSetLocalDimmingAMD(device, swap_chain, local_dimming_enable)

function get_shader_info_amd(device::Device, pipeline::Pipeline, shader_stage::VkShaderStageFlagBits, info_type::VkShaderInfoTypeAMD, info_size::Integer)
    pInfoSize = Ref(info_size)
    pInfo = Ref{Ptr{Cvoid}}()
    @check vkGetShaderInfoAMD(device, pipeline, shader_stage, info_type, pInfoSize, pInfo)
    (pInfoSize[], pInfo[])
end

function get_descriptor_set_layout_support(device::Device, create_info::DescriptorSetLayoutCreateInfo)
    pSupport = Ref{VkDescriptorSetLayoutSupport}()
    vkGetDescriptorSetLayoutSupport(device, create_info, pSupport)
    from_vk(DescriptorSetLayoutSupport, pSupport[])
end

merge_validation_caches_ext(device::Device, dst_cache::ValidationCacheEXT, src_caches::AbstractArray{<:ValidationCacheEXT}) = @check(vkMergeValidationCachesEXT(device, dst_cache, pointer_length(src_caches), src_caches))

function get_validation_cache_data_ext(device::Device, validation_cache::ValidationCacheEXT, data_size::Integer)
    pDataSize = Ref(data_size)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetValidationCacheDataEXT(device, validation_cache, pDataSize, pData)
    (pDataSize[], pData[])
end

destroy_validation_cache_ext(device::Device, validation_cache::ValidationCacheEXT; allocator = C_NULL) = vkDestroyValidationCacheEXT(device, validation_cache, allocator)

function create_validation_cache_ext(device::Device, create_info::ValidationCacheCreateInfoEXT; allocator = C_NULL)
    pValidationCache = Ref{VkValidationCacheEXT}()
    @check vkCreateValidationCacheEXT(device, create_info, allocator, pValidationCache)
    ValidationCacheEXT(pValidationCache[], (x->destroy_validation_cache_ext(device, x; allocator)), device)
end

function get_device_queue_2(device::Device, queue_info::DeviceQueueInfo2)
    pQueue = Ref{VkQueue}()
    vkGetDeviceQueue2(device, queue_info, pQueue)
    Queue(pQueue[], identity, device)
end

destroy_sampler_ycbcr_conversion(device::Device, ycbcr_conversion::SamplerYcbcrConversion; allocator = C_NULL) = vkDestroySamplerYcbcrConversion(device, ycbcr_conversion, allocator)

function create_sampler_ycbcr_conversion(device::Device, create_info::SamplerYcbcrConversionCreateInfo; allocator = C_NULL)
    pYcbcrConversion = Ref{VkSamplerYcbcrConversion}()
    @check vkCreateSamplerYcbcrConversion(device, create_info, allocator, pYcbcrConversion)
    SamplerYcbcrConversion(pYcbcrConversion[], (x->destroy_sampler_ycbcr_conversion(device, x; allocator)), device)
end

function get_image_sparse_memory_requirements_2(device::Device, info::ImageSparseMemoryRequirementsInfo2)
    pSparseMemoryRequirementCount = Ref{UInt32}()
    vkGetImageSparseMemoryRequirements2(device, info, pSparseMemoryRequirementCount, C_NULL)
    pSparseMemoryRequirements = Vector{VkSparseImageMemoryRequirements2}(undef, pSparseMemoryRequirementCount[])
    vkGetImageSparseMemoryRequirements2(device, info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
    from_vk.(SparseImageMemoryRequirements2, pSparseMemoryRequirements)
end

function get_image_memory_requirements_2(device::Device, info::ImageMemoryRequirementsInfo2)
    pMemoryRequirements = Ref{VkMemoryRequirements2}()
    vkGetImageMemoryRequirements2(device, info, pMemoryRequirements)
    from_vk(MemoryRequirements2, pMemoryRequirements[])
end

function get_buffer_memory_requirements_2(device::Device, info::BufferMemoryRequirementsInfo2)
    pMemoryRequirements = Ref{VkMemoryRequirements2}()
    vkGetBufferMemoryRequirements2(device, info, pMemoryRequirements)
    from_vk(MemoryRequirements2, pMemoryRequirements[])
end

function get_display_plane_capabilities_2_khr(physical_device::PhysicalDevice, display_plane_info::DisplayPlaneInfo2KHR)
    pCapabilities = Ref{VkDisplayPlaneCapabilities2KHR}()
    @check vkGetDisplayPlaneCapabilities2KHR(physical_device, display_plane_info, pCapabilities)
    from_vk(DisplayPlaneCapabilities2KHR, pCapabilities[])
end

function get_display_mode_properties_2_khr(physical_device::PhysicalDevice, display::DisplayKHR)
    pPropertyCount = Ref{UInt32}()
    @check vkGetDisplayModeProperties2KHR(physical_device, display, pPropertyCount, C_NULL)
    pProperties = Vector{VkDisplayModeProperties2KHR}(undef, pPropertyCount[])
    @check vkGetDisplayModeProperties2KHR(physical_device, display, pPropertyCount, pProperties)
    from_vk.(DisplayModeProperties2KHR, pProperties)
end

function get_physical_device_display_plane_properties_2_khr(physical_device::PhysicalDevice)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceDisplayPlaneProperties2KHR(physical_device, pPropertyCount, C_NULL)
    pProperties = Vector{VkDisplayPlaneProperties2KHR}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceDisplayPlaneProperties2KHR(physical_device, pPropertyCount, pProperties)
    from_vk.(DisplayPlaneProperties2KHR, pProperties)
end

function get_physical_device_display_properties_2_khr(physical_device::PhysicalDevice)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceDisplayProperties2KHR(physical_device, pPropertyCount, C_NULL)
    pProperties = Vector{VkDisplayProperties2KHR}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceDisplayProperties2KHR(physical_device, pPropertyCount, pProperties)
    from_vk.(DisplayProperties2KHR, pProperties)
end

function get_physical_device_surface_formats_2_khr(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR)
    pSurfaceFormatCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSurfaceFormats2KHR(physical_device, surface_info, pSurfaceFormatCount, C_NULL)
    pSurfaceFormats = Vector{VkSurfaceFormat2KHR}(undef, pSurfaceFormatCount[])
    @check vkGetPhysicalDeviceSurfaceFormats2KHR(physical_device, surface_info, pSurfaceFormatCount, pSurfaceFormats)
    from_vk.(SurfaceFormat2KHR, pSurfaceFormats)
end

function get_physical_device_surface_capabilities_2_khr(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR)
    pSurfaceCapabilities = Ref{VkSurfaceCapabilities2KHR}()
    @check vkGetPhysicalDeviceSurfaceCapabilities2KHR(physical_device, surface_info, pSurfaceCapabilities)
    from_vk(SurfaceCapabilities2KHR, pSurfaceCapabilities[])
end

function get_physical_device_multisample_properties_ext(physical_device::PhysicalDevice, samples::VkSampleCountFlagBits)
    pMultisampleProperties = Ref{VkMultisamplePropertiesEXT}()
    vkGetPhysicalDeviceMultisamplePropertiesEXT(physical_device, samples, pMultisampleProperties)
    from_vk(MultisamplePropertiesEXT, pMultisampleProperties[])
end

cmd_set_sample_locations_ext(command_buffer::CommandBuffer, sample_locations_info::SampleLocationsInfoEXT) = vkCmdSetSampleLocationsEXT(command_buffer, sample_locations_info)

cmd_set_discard_rectangle_ext(command_buffer::CommandBuffer, discard_rectangles::AbstractArray{<:Rect2D}) = vkCmdSetDiscardRectangleEXT(command_buffer, 0, pointer_length(discard_rectangles), discard_rectangles)

cmd_set_viewport_w_scaling_nv(command_buffer::CommandBuffer, viewport_w_scalings::AbstractArray{<:ViewportWScalingNV}) = vkCmdSetViewportWScalingNV(command_buffer, 0, pointer_length(viewport_w_scalings), viewport_w_scalings)

function create_metal_surface_ext(instance::Instance, create_info::MetalSurfaceCreateInfoEXT; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateMetalSurfaceEXT(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

function create_mac_os_surface_mvk(instance::Instance, create_info::MacOSSurfaceCreateInfoMVK; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateMacOSSurfaceMVK(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

function create_ios_surface_mvk(instance::Instance, create_info::IOSSurfaceCreateInfoMVK; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateIOSSurfaceMVK(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

function get_past_presentation_timing_google(device::Device, swapchain::SwapchainKHR)
    pPresentationTimingCount = Ref{UInt32}()
    @check vkGetPastPresentationTimingGOOGLE(device, swapchain, pPresentationTimingCount, C_NULL)
    pPresentationTimings = Vector{VkPastPresentationTimingGOOGLE}(undef, pPresentationTimingCount[])
    @check vkGetPastPresentationTimingGOOGLE(device, swapchain, pPresentationTimingCount, pPresentationTimings)
    from_vk.(PastPresentationTimingGOOGLE, pPresentationTimings)
end

function get_refresh_cycle_duration_google(device::Device, swapchain::SwapchainKHR)
    pDisplayTimingProperties = Ref{VkRefreshCycleDurationGOOGLE}()
    @check vkGetRefreshCycleDurationGOOGLE(device, swapchain, pDisplayTimingProperties)
    from_vk(RefreshCycleDurationGOOGLE, pDisplayTimingProperties[])
end

get_swapchain_status_khr(device::Device, swapchain::SwapchainKHR) = @check(vkGetSwapchainStatusKHR(device, swapchain))

set_hdr_metadata_ext(device::Device, swapchains::AbstractArray{<:SwapchainKHR}, metadata::AbstractArray{<:HdrMetadataEXT}) = vkSetHdrMetadataEXT(device, pointer_length(swapchains), swapchains, metadata)

cmd_push_descriptor_set_with_template_khr(command_buffer::CommandBuffer, descriptor_update_template::DescriptorUpdateTemplate, layout::PipelineLayout, set::Integer, data::Ptr{Cvoid}) = vkCmdPushDescriptorSetWithTemplateKHR(command_buffer, descriptor_update_template, layout, set, Ref(data))

update_descriptor_set_with_template(device::Device, descriptor_set::DescriptorSet, descriptor_update_template::DescriptorUpdateTemplate, data::Ptr{Cvoid}) = vkUpdateDescriptorSetWithTemplate(device, descriptor_set, descriptor_update_template, Ref(data))

destroy_descriptor_update_template(device::Device, descriptor_update_template::DescriptorUpdateTemplate; allocator = C_NULL) = vkDestroyDescriptorUpdateTemplate(device, descriptor_update_template, allocator)

function create_descriptor_update_template(device::Device, create_info::DescriptorUpdateTemplateCreateInfo; allocator = C_NULL)
    pDescriptorUpdateTemplate = Ref{VkDescriptorUpdateTemplate}()
    @check vkCreateDescriptorUpdateTemplate(device, create_info, allocator, pDescriptorUpdateTemplate)
    DescriptorUpdateTemplate(pDescriptorUpdateTemplate[], (x->destroy_descriptor_update_template(device, x; allocator)), device)
end

function get_physical_device_present_rectangles_khr(physical_device::PhysicalDevice, surface::SurfaceKHR)
    pRectCount = Ref{UInt32}()
    @check vkGetPhysicalDevicePresentRectanglesKHR(physical_device, surface, pRectCount, C_NULL)
    pRects = Vector{VkRect2D}(undef, pRectCount[])
    @check vkGetPhysicalDevicePresentRectanglesKHR(physical_device, surface, pRectCount, pRects)
    from_vk.(Rect2D, pRects)
end

cmd_dispatch_base(command_buffer::CommandBuffer, base_group_x::Integer, base_group_y::Integer, base_group_z::Integer, group_count_x::Integer, group_count_y::Integer, group_count_z::Integer) = vkCmdDispatchBase(command_buffer, base_group_x, base_group_y, base_group_z, group_count_x, group_count_y, group_count_z)

function acquire_next_image_2_khr(device::Device, acquire_info::AcquireNextImageInfoKHR)
    pImageIndex = Ref{UInt32}()
    @check vkAcquireNextImage2KHR(device, acquire_info, pImageIndex)
    pImageIndex[]
end

function get_device_group_surface_present_modes_khr(device::Device, surface::SurfaceKHR, modes::Integer)
    pModes = Ref{VkDeviceGroupPresentModeFlagsKHR}()
    @check vkGetDeviceGroupSurfacePresentModesKHR(device, surface, pModes)
    pModes[]
end

function get_device_group_present_capabilities_khr(device::Device)
    pDeviceGroupPresentCapabilities = Ref{VkDeviceGroupPresentCapabilitiesKHR}()
    @check vkGetDeviceGroupPresentCapabilitiesKHR(device, pDeviceGroupPresentCapabilities)
    from_vk(DeviceGroupPresentCapabilitiesKHR, pDeviceGroupPresentCapabilities[])
end

cmd_set_device_mask(command_buffer::CommandBuffer, device_mask::Integer) = vkCmdSetDeviceMask(command_buffer, device_mask)

bind_image_memory_2(device::Device, bind_infos::AbstractArray{<:BindImageMemoryInfo}) = @check(vkBindImageMemory2(device, pointer_length(bind_infos), bind_infos))

bind_buffer_memory_2(device::Device, bind_infos::AbstractArray{<:BindBufferMemoryInfo}) = @check(vkBindBufferMemory2(device, pointer_length(bind_infos), bind_infos))

function get_device_group_peer_memory_features(device::Device, heap_index::Integer, local_device_index::Integer, remote_device_index::Integer)
    pPeerMemoryFeatures = Ref{VkPeerMemoryFeatureFlags}()
    vkGetDeviceGroupPeerMemoryFeatures(device, heap_index, local_device_index, remote_device_index, pPeerMemoryFeatures)
    pPeerMemoryFeatures[]
end

function enumerate_physical_device_groups(instance::Instance)
    pPhysicalDeviceGroupCount = Ref{UInt32}()
    @check vkEnumeratePhysicalDeviceGroups(instance, pPhysicalDeviceGroupCount, C_NULL)
    pPhysicalDeviceGroupProperties = Vector{VkPhysicalDeviceGroupProperties}(undef, pPhysicalDeviceGroupCount[])
    @check vkEnumeratePhysicalDeviceGroups(instance, pPhysicalDeviceGroupCount, pPhysicalDeviceGroupProperties)
    from_vk.(PhysicalDeviceGroupProperties, pPhysicalDeviceGroupProperties)
end

function get_physical_device_surface_capabilities_2_ext(physical_device::PhysicalDevice, surface::SurfaceKHR)
    pSurfaceCapabilities = Ref{VkSurfaceCapabilities2EXT}()
    @check vkGetPhysicalDeviceSurfaceCapabilities2EXT(physical_device, surface, pSurfaceCapabilities)
    from_vk(SurfaceCapabilities2EXT, pSurfaceCapabilities[])
end

function get_swapchain_counter_ext(device::Device, swapchain::SwapchainKHR, counter::VkSurfaceCounterFlagBitsEXT)
    pCounterValue = Ref{UInt64}()
    @check vkGetSwapchainCounterEXT(device, swapchain, counter, pCounterValue)
    pCounterValue[]
end

function register_display_event_ext(device::Device, display::DisplayKHR, display_event_info::DisplayEventInfoEXT; allocator = C_NULL)
    pFence = Ref{VkFence}()
    @check vkRegisterDisplayEventEXT(device, display, display_event_info, allocator, pFence)
    Fence(pFence[], (x->destroy_fence(device, x; allocator)), device)
end

function register_device_event_ext(device::Device, device_event_info::DeviceEventInfoEXT; allocator = C_NULL)
    pFence = Ref{VkFence}()
    @check vkRegisterDeviceEventEXT(device, device_event_info, allocator, pFence)
    Fence(pFence[], (x->destroy_fence(device, x; allocator)), device)
end

display_power_control_ext(device::Device, display::DisplayKHR, display_power_info::DisplayPowerInfoEXT) = @check(vkDisplayPowerControlEXT(device, display, display_power_info))

function get_rand_r_output_display_ext(physical_device::PhysicalDevice, dpy::vk.Display, rr_output::vk.RROutput)
    pDisplay = Ref{VkDisplayKHR}()
    @check vkGetRandROutputDisplayEXT(physical_device, Ref(dpy), rr_output, pDisplay)
    DisplayKHR(pDisplay[], identity, physical_device)
end

acquire_xlib_display_ext(physical_device::PhysicalDevice, dpy::vk.Display, display::DisplayKHR) = @check(vkAcquireXlibDisplayEXT(physical_device, to_vk(Ptr{Display}, dpy), display))

release_display_ext(physical_device::PhysicalDevice, display::DisplayKHR) = @check(vkReleaseDisplayEXT(physical_device, display))

import_fence_fd_khr(device::Device, import_fence_fd_info::ImportFenceFdInfoKHR) = @check(vkImportFenceFdKHR(device, import_fence_fd_info))

function get_fence_fd_khr(device::Device, get_fd_info::FenceGetFdInfoKHR)
    pFd = Ref{Int}()
    @check vkGetFenceFdKHR(device, get_fd_info, pFd)
    pFd[]
end

import_fence_win_32_handle_khr(device::Device, import_fence_win_32_handle_info::ImportFenceWin32HandleInfoKHR) = @check(vkImportFenceWin32HandleKHR(device, import_fence_win_32_handle_info))

get_fence_win_32_handle_khr(device::Device, get_win_32_handle_info::FenceGetWin32HandleInfoKHR, handle::vk.HANDLE) = @check(vkGetFenceWin32HandleKHR(device, get_win_32_handle_info, to_vk(Ptr{HANDLE}, handle)))

function get_physical_device_external_fence_properties(physical_device::PhysicalDevice, external_fence_info::PhysicalDeviceExternalFenceInfo)
    pExternalFenceProperties = Ref{VkExternalFenceProperties}()
    vkGetPhysicalDeviceExternalFenceProperties(physical_device, external_fence_info, pExternalFenceProperties)
    from_vk(ExternalFenceProperties, pExternalFenceProperties[])
end

import_semaphore_fd_khr(device::Device, import_semaphore_fd_info::ImportSemaphoreFdInfoKHR) = @check(vkImportSemaphoreFdKHR(device, import_semaphore_fd_info))

function get_semaphore_fd_khr(device::Device, get_fd_info::SemaphoreGetFdInfoKHR)
    pFd = Ref{Int}()
    @check vkGetSemaphoreFdKHR(device, get_fd_info, pFd)
    pFd[]
end

import_semaphore_win_32_handle_khr(device::Device, import_semaphore_win_32_handle_info::ImportSemaphoreWin32HandleInfoKHR) = @check(vkImportSemaphoreWin32HandleKHR(device, import_semaphore_win_32_handle_info))

get_semaphore_win_32_handle_khr(device::Device, get_win_32_handle_info::SemaphoreGetWin32HandleInfoKHR, handle::vk.HANDLE) = @check(vkGetSemaphoreWin32HandleKHR(device, get_win_32_handle_info, to_vk(Ptr{HANDLE}, handle)))

function get_physical_device_external_semaphore_properties(physical_device::PhysicalDevice, external_semaphore_info::PhysicalDeviceExternalSemaphoreInfo)
    pExternalSemaphoreProperties = Ref{VkExternalSemaphoreProperties}()
    vkGetPhysicalDeviceExternalSemaphoreProperties(physical_device, external_semaphore_info, pExternalSemaphoreProperties)
    from_vk(ExternalSemaphoreProperties, pExternalSemaphoreProperties[])
end

function get_memory_fd_properties_khr(device::Device, handle_type::VkExternalMemoryHandleTypeFlagBits, fd::Integer)
    pMemoryFdProperties = Ref{VkMemoryFdPropertiesKHR}()
    @check vkGetMemoryFdPropertiesKHR(device, handle_type, fd, pMemoryFdProperties)
    from_vk(MemoryFdPropertiesKHR, pMemoryFdProperties[])
end

function get_memory_fd_khr(device::Device, get_fd_info::MemoryGetFdInfoKHR)
    pFd = Ref{Int}()
    @check vkGetMemoryFdKHR(device, get_fd_info, pFd)
    pFd[]
end

function get_memory_win_32_handle_properties_khr(device::Device, handle_type::VkExternalMemoryHandleTypeFlagBits, handle::vk.HANDLE)
    pMemoryWin32HandleProperties = Ref{VkMemoryWin32HandlePropertiesKHR}()
    @check vkGetMemoryWin32HandlePropertiesKHR(device, handle_type, handle, pMemoryWin32HandleProperties)
    from_vk(MemoryWin32HandlePropertiesKHR, pMemoryWin32HandleProperties[])
end

get_memory_win_32_handle_khr(device::Device, get_win_32_handle_info::MemoryGetWin32HandleInfoKHR, handle::vk.HANDLE) = @check(vkGetMemoryWin32HandleKHR(device, get_win_32_handle_info, to_vk(Ptr{HANDLE}, handle)))

function get_physical_device_external_buffer_properties(physical_device::PhysicalDevice, external_buffer_info::PhysicalDeviceExternalBufferInfo)
    pExternalBufferProperties = Ref{VkExternalBufferProperties}()
    vkGetPhysicalDeviceExternalBufferProperties(physical_device, external_buffer_info, pExternalBufferProperties)
    from_vk(ExternalBufferProperties, pExternalBufferProperties[])
end

trim_command_pool(device::Device, command_pool::CommandPool; flags = 0) = vkTrimCommandPool(device, command_pool, flags)

cmd_push_descriptor_set_khr(command_buffer::CommandBuffer, pipeline_bind_point::VkPipelineBindPoint, layout::PipelineLayout, set::Integer, descriptor_writes::AbstractArray{<:WriteDescriptorSet}) = vkCmdPushDescriptorSetKHR(command_buffer, pipeline_bind_point, layout, set, pointer_length(descriptor_writes), descriptor_writes)

function get_physical_device_sparse_image_format_properties_2(physical_device::PhysicalDevice, format_info::PhysicalDeviceSparseImageFormatInfo2)
    pPropertyCount = Ref{UInt32}()
    vkGetPhysicalDeviceSparseImageFormatProperties2(physical_device, format_info, pPropertyCount, C_NULL)
    pProperties = Vector{VkSparseImageFormatProperties2}(undef, pPropertyCount[])
    vkGetPhysicalDeviceSparseImageFormatProperties2(physical_device, format_info, pPropertyCount, pProperties)
    from_vk.(SparseImageFormatProperties2, pProperties)
end

function get_physical_device_memory_properties_2(physical_device::PhysicalDevice)
    pMemoryProperties = Ref{VkPhysicalDeviceMemoryProperties2}()
    vkGetPhysicalDeviceMemoryProperties2(physical_device, pMemoryProperties)
    from_vk(PhysicalDeviceMemoryProperties2, pMemoryProperties[])
end

function get_physical_device_queue_family_properties_2(physical_device::PhysicalDevice)
    pQueueFamilyPropertyCount = Ref{UInt32}()
    vkGetPhysicalDeviceQueueFamilyProperties2(physical_device, pQueueFamilyPropertyCount, C_NULL)
    pQueueFamilyProperties = Vector{VkQueueFamilyProperties2}(undef, pQueueFamilyPropertyCount[])
    vkGetPhysicalDeviceQueueFamilyProperties2(physical_device, pQueueFamilyPropertyCount, pQueueFamilyProperties)
    from_vk.(QueueFamilyProperties2, pQueueFamilyProperties)
end

function get_physical_device_image_format_properties_2(physical_device::PhysicalDevice, image_format_info::PhysicalDeviceImageFormatInfo2)
    pImageFormatProperties = Ref{VkImageFormatProperties2}()
    @check vkGetPhysicalDeviceImageFormatProperties2(physical_device, image_format_info, pImageFormatProperties)
    from_vk(ImageFormatProperties2, pImageFormatProperties[])
end

function get_physical_device_format_properties_2(physical_device::PhysicalDevice, format::VkFormat)
    pFormatProperties = Ref{VkFormatProperties2}()
    vkGetPhysicalDeviceFormatProperties2(physical_device, format, pFormatProperties)
    from_vk(FormatProperties2, pFormatProperties[])
end

function get_physical_device_properties_2(physical_device::PhysicalDevice)
    pProperties = Ref{VkPhysicalDeviceProperties2}()
    vkGetPhysicalDeviceProperties2(physical_device, pProperties)
    from_vk(PhysicalDeviceProperties2, pProperties[])
end

function get_physical_device_features_2(physical_device::PhysicalDevice)
    pFeatures = Ref{VkPhysicalDeviceFeatures2}()
    vkGetPhysicalDeviceFeatures2(physical_device, pFeatures)
    from_vk(PhysicalDeviceFeatures2, pFeatures[])
end

destroy_indirect_commands_layout_nv(device::Device, indirect_commands_layout::IndirectCommandsLayoutNV; allocator = C_NULL) = vkDestroyIndirectCommandsLayoutNV(device, indirect_commands_layout, allocator)

function create_indirect_commands_layout_nv(device::Device, create_info::IndirectCommandsLayoutCreateInfoNV; allocator = C_NULL)
    pIndirectCommandsLayout = Ref{VkIndirectCommandsLayoutNV}()
    @check vkCreateIndirectCommandsLayoutNV(device, create_info, allocator, pIndirectCommandsLayout)
    IndirectCommandsLayoutNV(pIndirectCommandsLayout[], (x->destroy_indirect_commands_layout_nv(device, x; allocator)), device)
end

function get_generated_commands_memory_requirements_nv(device::Device, info::GeneratedCommandsMemoryRequirementsInfoNV)
    pMemoryRequirements = Ref{VkMemoryRequirements2}()
    vkGetGeneratedCommandsMemoryRequirementsNV(device, info, pMemoryRequirements)
    from_vk(MemoryRequirements2, pMemoryRequirements[])
end

cmd_bind_pipeline_shader_group_nv(command_buffer::CommandBuffer, pipeline_bind_point::VkPipelineBindPoint, pipeline::Pipeline, group_index::Integer) = vkCmdBindPipelineShaderGroupNV(command_buffer, pipeline_bind_point, pipeline, group_index)

cmd_preprocess_generated_commands_nv(command_buffer::CommandBuffer, generated_commands_info::GeneratedCommandsInfoNV) = vkCmdPreprocessGeneratedCommandsNV(command_buffer, generated_commands_info)

cmd_execute_generated_commands_nv(command_buffer::CommandBuffer, is_preprocessed::Bool, generated_commands_info::GeneratedCommandsInfoNV) = vkCmdExecuteGeneratedCommandsNV(command_buffer, is_preprocessed, generated_commands_info)

get_memory_win_32_handle_nv(device::Device, memory::DeviceMemory, handle_type::Integer, handle::vk.HANDLE) = @check(vkGetMemoryWin32HandleNV(device, memory, handle_type, to_vk(Ptr{HANDLE}, handle)))

function get_physical_device_external_image_format_properties_nv(physical_device::PhysicalDevice, format::VkFormat, type::VkImageType, tiling::VkImageTiling, usage::Integer; flags = 0, external_handle_type = 0)
    pExternalImageFormatProperties = Ref{VkExternalImageFormatPropertiesNV}()
    @check vkGetPhysicalDeviceExternalImageFormatPropertiesNV(physical_device, format, type, tiling, usage, flags, external_handle_type, pExternalImageFormatProperties)
    from_vk(ExternalImageFormatPropertiesNV, pExternalImageFormatProperties[])
end

cmd_debug_marker_insert_ext(command_buffer::CommandBuffer, marker_info::DebugMarkerMarkerInfoEXT) = vkCmdDebugMarkerInsertEXT(command_buffer, marker_info)

cmd_debug_marker_end_ext(command_buffer::CommandBuffer) = vkCmdDebugMarkerEndEXT(command_buffer)

cmd_debug_marker_begin_ext(command_buffer::CommandBuffer, marker_info::DebugMarkerMarkerInfoEXT) = vkCmdDebugMarkerBeginEXT(command_buffer, marker_info)

debug_marker_set_object_tag_ext(device::Device, tag_info::DebugMarkerObjectTagInfoEXT) = @check(vkDebugMarkerSetObjectTagEXT(device, tag_info))

debug_marker_set_object_name_ext(device::Device, name_info::DebugMarkerObjectNameInfoEXT) = @check(vkDebugMarkerSetObjectNameEXT(device, name_info))

debug_report_message_ext(instance::Instance, flags::Integer, object_type::VkDebugReportObjectTypeEXT, object::Integer, location::Integer, message_code::Integer, layer_prefix::AbstractString, message::AbstractString) = vkDebugReportMessageEXT(instance, flags, object_type, object, location, message_code, layer_prefix, message)

destroy_debug_report_callback_ext(instance::Instance, callback::DebugReportCallbackEXT; allocator = C_NULL) = vkDestroyDebugReportCallbackEXT(instance, callback, allocator)

function create_debug_report_callback_ext(instance::Instance, create_info::DebugReportCallbackCreateInfoEXT; allocator = C_NULL)
    pCallback = Ref{VkDebugReportCallbackEXT}()
    @check vkCreateDebugReportCallbackEXT(instance, create_info, allocator, pCallback)
    DebugReportCallbackEXT(pCallback[], (x->destroy_debug_report_callback_ext(instance, x; allocator)), instance)
end

function create_stream_descriptor_surface_ggp(instance::Instance, create_info::StreamDescriptorSurfaceCreateInfoGGP; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateStreamDescriptorSurfaceGGP(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

function create_image_pipe_surface_fuchsia(instance::Instance, create_info::ImagePipeSurfaceCreateInfoFUCHSIA; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateImagePipeSurfaceFUCHSIA(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

get_physical_device_direct_fb_presentation_support_ext(physical_device::PhysicalDevice, queue_family_index::Integer, dfb::vk.IDirectFB) = from_vk(Bool, vkGetPhysicalDeviceDirectFBPresentationSupportEXT(physical_device, queue_family_index, to_vk(Ptr{IDirectFB}, dfb)))

function create_direct_fb_surface_ext(instance::Instance, create_info::DirectFBSurfaceCreateInfoEXT; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateDirectFBSurfaceEXT(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

get_physical_device_xcb_presentation_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, connection::vk.xcb_connection_t, visual_id::vk.xcb_visualid_t) = from_vk(Bool, vkGetPhysicalDeviceXcbPresentationSupportKHR(physical_device, queue_family_index, Ref(connection), visual_id))

function create_xcb_surface_khr(instance::Instance, create_info::XcbSurfaceCreateInfoKHR; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateXcbSurfaceKHR(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

get_physical_device_xlib_presentation_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, dpy::vk.Display, visual_id::vk.VisualID) = from_vk(Bool, vkGetPhysicalDeviceXlibPresentationSupportKHR(physical_device, queue_family_index, Ref(dpy), visual_id))

function create_xlib_surface_khr(instance::Instance, create_info::XlibSurfaceCreateInfoKHR; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateXlibSurfaceKHR(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

get_physical_device_win_32_presentation_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer) = from_vk(Bool, vkGetPhysicalDeviceWin32PresentationSupportKHR(physical_device, queue_family_index))

function create_win_32_surface_khr(instance::Instance, create_info::Win32SurfaceCreateInfoKHR; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateWin32SurfaceKHR(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

get_physical_device_wayland_presentation_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, display::vk.wl_display) = from_vk(Bool, vkGetPhysicalDeviceWaylandPresentationSupportKHR(physical_device, queue_family_index, to_vk(Ptr{wl_display}, display)))

function create_wayland_surface_khr(instance::Instance, create_info::WaylandSurfaceCreateInfoKHR; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateWaylandSurfaceKHR(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

function create_vi_surface_nn(instance::Instance, create_info::ViSurfaceCreateInfoNN; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateViSurfaceNN(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

queue_present_khr(queue::Queue, present_info::PresentInfoKHR) = @check(vkQueuePresentKHR(queue, present_info))

function acquire_next_image_khr(device::Device, swapchain::SwapchainKHR, timeout::Integer; semaphore = C_NULL, fence = C_NULL)
    pImageIndex = Ref{UInt32}()
    @check vkAcquireNextImageKHR(device, swapchain, timeout, semaphore, fence, pImageIndex)
    pImageIndex[]
end

function get_swapchain_images_khr(device::Device, swapchain::SwapchainKHR)
    pSwapchainImageCount = Ref{UInt32}()
    @check vkGetSwapchainImagesKHR(device, swapchain, pSwapchainImageCount, C_NULL)
    pSwapchainImages = Vector{VkImage}(undef, pSwapchainImageCount[])
    @check vkGetSwapchainImagesKHR(device, swapchain, pSwapchainImageCount, pSwapchainImages)
    Image.(pSwapchainImages, (x->destroy_image(device, x; allocator)), device)
end

destroy_swapchain_khr(device::Device, swapchain::SwapchainKHR; allocator = C_NULL) = vkDestroySwapchainKHR(device, swapchain, allocator)

function create_swapchain_khr(device::Device, create_info::SwapchainCreateInfoKHR; allocator = C_NULL)
    pSwapchain = Ref{VkSwapchainKHR}()
    @check vkCreateSwapchainKHR(device, create_info, allocator, pSwapchain)
    parent = getproperty(create_info, :surface)
    SwapchainKHR(pSwapchain[], (x->destroy_swapchain_khr(device, x; allocator)), getproperty(create_info, :surface))
end

function get_physical_device_surface_present_modes_khr(physical_device::PhysicalDevice, surface::SurfaceKHR)
    pPresentModeCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, C_NULL)
    pPresentModes = Vector{VkPresentModeKHR}(undef, pPresentModeCount[])
    @check vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, pPresentModeCount, pPresentModes)
    pPresentModes
end

function get_physical_device_surface_formats_khr(physical_device::PhysicalDevice, surface::SurfaceKHR)
    pSurfaceFormatCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, pSurfaceFormatCount, C_NULL)
    pSurfaceFormats = Vector{VkSurfaceFormatKHR}(undef, pSurfaceFormatCount[])
    @check vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, pSurfaceFormatCount, pSurfaceFormats)
    from_vk.(SurfaceFormatKHR, pSurfaceFormats)
end

function get_physical_device_surface_capabilities_khr(physical_device::PhysicalDevice, surface::SurfaceKHR)
    pSurfaceCapabilities = Ref{VkSurfaceCapabilitiesKHR}()
    @check vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physical_device, surface, pSurfaceCapabilities)
    from_vk(SurfaceCapabilitiesKHR, pSurfaceCapabilities[])
end

function get_physical_device_surface_support_khr(physical_device::PhysicalDevice, queue_family_index::Integer, surface::SurfaceKHR)
    pSupported = Ref{VkBool32}()
    @check vkGetPhysicalDeviceSurfaceSupportKHR(physical_device, queue_family_index, surface, pSupported)
    from_vk(Bool, pSupported[])
end

destroy_surface_khr(instance::Instance, surface::SurfaceKHR; allocator = C_NULL) = vkDestroySurfaceKHR(instance, surface, allocator)

function create_shared_swapchains_khr(device::Device, create_infos::AbstractArray{<:SwapchainCreateInfoKHR}; allocator = C_NULL)
    pSwapchains = Vector{VkSwapchainKHR}(undef, pointer_length(create_infos))
    @check vkCreateSharedSwapchainsKHR(device, pointer_length(create_infos), create_infos, allocator, pSwapchains)
    parent = getproperty(create_infos, :surface)
    SwapchainKHR.(pSwapchains, (x->destroy_swapchain_khr(device, x; allocator)), getproperty(create_infos, :surface))
end

function create_display_plane_surface_khr(instance::Instance, create_info::DisplaySurfaceCreateInfoKHR; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateDisplayPlaneSurfaceKHR(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

function get_display_plane_capabilities_khr(physical_device::PhysicalDevice, mode::DisplayModeKHR, plane_index::Integer)
    pCapabilities = Ref{VkDisplayPlaneCapabilitiesKHR}()
    @check vkGetDisplayPlaneCapabilitiesKHR(physical_device, mode, plane_index, pCapabilities)
    from_vk(DisplayPlaneCapabilitiesKHR, pCapabilities[])
end

function create_display_mode_khr(physical_device::PhysicalDevice, display::DisplayKHR, create_info::DisplayModeCreateInfoKHR; allocator = C_NULL)
    pMode = Ref{VkDisplayModeKHR}()
    @check vkCreateDisplayModeKHR(physical_device, display, create_info, allocator, pMode)
    DisplayModeKHR(pMode[], identity, display)
end

function get_display_mode_properties_khr(physical_device::PhysicalDevice, display::DisplayKHR)
    pPropertyCount = Ref{UInt32}()
    @check vkGetDisplayModePropertiesKHR(physical_device, display, pPropertyCount, C_NULL)
    pProperties = Vector{VkDisplayModePropertiesKHR}(undef, pPropertyCount[])
    @check vkGetDisplayModePropertiesKHR(physical_device, display, pPropertyCount, pProperties)
    from_vk.(DisplayModePropertiesKHR, pProperties)
end

function get_display_plane_supported_displays_khr(physical_device::PhysicalDevice, plane_index::Integer)
    pDisplayCount = Ref{UInt32}()
    @check vkGetDisplayPlaneSupportedDisplaysKHR(physical_device, plane_index, pDisplayCount, C_NULL)
    pDisplays = Vector{VkDisplayKHR}(undef, pDisplayCount[])
    @check vkGetDisplayPlaneSupportedDisplaysKHR(physical_device, plane_index, pDisplayCount, pDisplays)
    DisplayKHR.(pDisplays, identity, physical_device)
end

function get_physical_device_display_plane_properties_khr(physical_device::PhysicalDevice)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceDisplayPlanePropertiesKHR(physical_device, pPropertyCount, C_NULL)
    pProperties = Vector{VkDisplayPlanePropertiesKHR}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceDisplayPlanePropertiesKHR(physical_device, pPropertyCount, pProperties)
    from_vk.(DisplayPlanePropertiesKHR, pProperties)
end

function get_physical_device_display_properties_khr(physical_device::PhysicalDevice)
    pPropertyCount = Ref{UInt32}()
    @check vkGetPhysicalDeviceDisplayPropertiesKHR(physical_device, pPropertyCount, C_NULL)
    pProperties = Vector{VkDisplayPropertiesKHR}(undef, pPropertyCount[])
    @check vkGetPhysicalDeviceDisplayPropertiesKHR(physical_device, pPropertyCount, pProperties)
    from_vk.(DisplayPropertiesKHR, pProperties)
end

function create_android_surface_khr(instance::Instance, create_info::AndroidSurfaceCreateInfoKHR; allocator = C_NULL)
    pSurface = Ref{VkSurfaceKHR}()
    @check vkCreateAndroidSurfaceKHR(instance, create_info, allocator, pSurface)
    SurfaceKHR(pSurface[], (x->destroy_surface_khr(instance, x; allocator)), instance)
end

cmd_execute_commands(command_buffer::CommandBuffer, command_buffers::AbstractArray{<:CommandBuffer}) = vkCmdExecuteCommands(command_buffer, pointer_length(command_buffers), command_buffers)

cmd_end_render_pass(command_buffer::CommandBuffer) = vkCmdEndRenderPass(command_buffer)

cmd_next_subpass(command_buffer::CommandBuffer, contents::VkSubpassContents) = vkCmdNextSubpass(command_buffer, contents)

cmd_begin_render_pass(command_buffer::CommandBuffer, render_pass_begin::RenderPassBeginInfo, contents::VkSubpassContents) = vkCmdBeginRenderPass(command_buffer, render_pass_begin, contents)

cmd_push_constants(command_buffer::CommandBuffer, layout::PipelineLayout, stage_flags::Integer, offset::Integer, values::Ptr{Cvoid}) = vkCmdPushConstants(command_buffer, layout, stage_flags, offset, pointer_length(values), Ref(values))

cmd_copy_query_pool_results(command_buffer::CommandBuffer, query_pool::QueryPool, first_query::Integer, query_count::Integer, dst_buffer::Buffer, dst_offset::Integer, stride::Integer; flags = 0) = vkCmdCopyQueryPoolResults(command_buffer, query_pool, first_query, query_count, dst_buffer, dst_offset, stride, flags)

cmd_write_timestamp(command_buffer::CommandBuffer, pipeline_stage::VkPipelineStageFlagBits, query_pool::QueryPool, query::Integer) = vkCmdWriteTimestamp(command_buffer, pipeline_stage, query_pool, query)

cmd_reset_query_pool(command_buffer::CommandBuffer, query_pool::QueryPool, first_query::Integer, query_count::Integer) = vkCmdResetQueryPool(command_buffer, query_pool, first_query, query_count)

cmd_end_conditional_rendering_ext(command_buffer::CommandBuffer) = vkCmdEndConditionalRenderingEXT(command_buffer)

cmd_begin_conditional_rendering_ext(command_buffer::CommandBuffer, conditional_rendering_begin::ConditionalRenderingBeginInfoEXT) = vkCmdBeginConditionalRenderingEXT(command_buffer, conditional_rendering_begin)

cmd_end_query(command_buffer::CommandBuffer, query_pool::QueryPool, query::Integer) = vkCmdEndQuery(command_buffer, query_pool, query)

cmd_begin_query(command_buffer::CommandBuffer, query_pool::QueryPool, query::Integer; flags = 0) = vkCmdBeginQuery(command_buffer, query_pool, query, flags)

cmd_pipeline_barrier(command_buffer::CommandBuffer, src_stage_mask::Integer, dst_stage_mask::Integer, memory_barriers::AbstractArray{<:MemoryBarrier}, buffer_memory_barriers::AbstractArray{<:BufferMemoryBarrier}, image_memory_barriers::AbstractArray{<:ImageMemoryBarrier}; dependency_flags = 0) = vkCmdPipelineBarrier(command_buffer, src_stage_mask, dst_stage_mask, dependency_flags, pointer_length(memory_barriers), memory_barriers, pointer_length(buffer_memory_barriers), buffer_memory_barriers, pointer_length(image_memory_barriers), image_memory_barriers)

cmd_wait_events(command_buffer::CommandBuffer, events::AbstractArray{<:Event}, src_stage_mask::Integer, dst_stage_mask::Integer, memory_barriers::AbstractArray{<:MemoryBarrier}, buffer_memory_barriers::AbstractArray{<:BufferMemoryBarrier}, image_memory_barriers::AbstractArray{<:ImageMemoryBarrier}) = vkCmdWaitEvents(command_buffer, pointer_length(events), events, src_stage_mask, dst_stage_mask, pointer_length(memory_barriers), memory_barriers, pointer_length(buffer_memory_barriers), buffer_memory_barriers, pointer_length(image_memory_barriers), image_memory_barriers)

cmd_reset_event(command_buffer::CommandBuffer, event::Event, stage_mask::Integer) = vkCmdResetEvent(command_buffer, event, stage_mask)

cmd_set_event(command_buffer::CommandBuffer, event::Event, stage_mask::Integer) = vkCmdSetEvent(command_buffer, event, stage_mask)

cmd_resolve_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::VkImageLayout, dst_image::Image, dst_image_layout::VkImageLayout, regions::AbstractArray{<:ImageResolve}) = vkCmdResolveImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, pointer_length(regions), regions)

cmd_clear_attachments(command_buffer::CommandBuffer, attachments::AbstractArray{<:ClearAttachment}, rects::AbstractArray{<:ClearRect}) = vkCmdClearAttachments(command_buffer, pointer_length(attachments), attachments, pointer_length(rects), rects)

cmd_clear_depth_stencil_image(command_buffer::CommandBuffer, image::Image, image_layout::VkImageLayout, depth_stencil::ClearDepthStencilValue, ranges::AbstractArray{<:ImageSubresourceRange}) = vkCmdClearDepthStencilImage(command_buffer, image, image_layout, depth_stencil, pointer_length(ranges), ranges)

cmd_clear_color_image(command_buffer::CommandBuffer, image::Image, image_layout::VkImageLayout, color::ClearColorValue, ranges::AbstractArray{<:ImageSubresourceRange}) = vkCmdClearColorImage(command_buffer, image, image_layout, color, pointer_length(ranges), ranges)

cmd_fill_buffer(command_buffer::CommandBuffer, dst_buffer::Buffer, dst_offset::Integer, size::Integer, data::Integer) = vkCmdFillBuffer(command_buffer, dst_buffer, dst_offset, size, data)

cmd_update_buffer(command_buffer::CommandBuffer, dst_buffer::Buffer, dst_offset::Integer, data_size::Integer, data::Ptr{Cvoid}) = vkCmdUpdateBuffer(command_buffer, dst_buffer, dst_offset, data_size, Ref(data))

cmd_copy_image_to_buffer(command_buffer::CommandBuffer, src_image::Image, src_image_layout::VkImageLayout, dst_buffer::Buffer, regions::AbstractArray{<:BufferImageCopy}) = vkCmdCopyImageToBuffer(command_buffer, src_image, src_image_layout, dst_buffer, pointer_length(regions), regions)

cmd_copy_buffer_to_image(command_buffer::CommandBuffer, src_buffer::Buffer, dst_image::Image, dst_image_layout::VkImageLayout, regions::AbstractArray{<:BufferImageCopy}) = vkCmdCopyBufferToImage(command_buffer, src_buffer, dst_image, dst_image_layout, pointer_length(regions), regions)

cmd_blit_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::VkImageLayout, dst_image::Image, dst_image_layout::VkImageLayout, regions::AbstractArray{<:ImageBlit}, filter::VkFilter) = vkCmdBlitImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, pointer_length(regions), regions, filter)

cmd_copy_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::VkImageLayout, dst_image::Image, dst_image_layout::VkImageLayout, regions::AbstractArray{<:ImageCopy}) = vkCmdCopyImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, pointer_length(regions), regions)

cmd_copy_buffer(command_buffer::CommandBuffer, src_buffer::Buffer, dst_buffer::Buffer, regions::AbstractArray{<:BufferCopy}) = vkCmdCopyBuffer(command_buffer, src_buffer, dst_buffer, pointer_length(regions), regions)

cmd_dispatch_indirect(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer) = vkCmdDispatchIndirect(command_buffer, buffer, offset)

cmd_dispatch(command_buffer::CommandBuffer, group_count_x::Integer, group_count_y::Integer, group_count_z::Integer) = vkCmdDispatch(command_buffer, group_count_x, group_count_y, group_count_z)

cmd_draw_indexed_indirect(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, draw_count::Integer, stride::Integer) = vkCmdDrawIndexedIndirect(command_buffer, buffer, offset, draw_count, stride)

cmd_draw_indirect(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, draw_count::Integer, stride::Integer) = vkCmdDrawIndirect(command_buffer, buffer, offset, draw_count, stride)

cmd_draw_indexed(command_buffer::CommandBuffer, index_count::Integer, instance_count::Integer, first_index::Integer, vertex_offset::Integer, first_instance::Integer) = vkCmdDrawIndexed(command_buffer, index_count, instance_count, first_index, vertex_offset, first_instance)

cmd_draw(command_buffer::CommandBuffer, vertex_count::Integer, instance_count::Integer, first_vertex::Integer, first_instance::Integer) = vkCmdDraw(command_buffer, vertex_count, instance_count, first_vertex, first_instance)

cmd_bind_vertex_buffers(command_buffer::CommandBuffer, buffers::AbstractArray{<:Buffer}, offsets::AbstractArray{<:Integer}) = vkCmdBindVertexBuffers(command_buffer, 0, pointer_length(buffers), buffers, offsets)

cmd_bind_index_buffer(command_buffer::CommandBuffer, buffer::Buffer, offset::Integer, index_type::VkIndexType) = vkCmdBindIndexBuffer(command_buffer, buffer, offset, index_type)

cmd_bind_descriptor_sets(command_buffer::CommandBuffer, pipeline_bind_point::VkPipelineBindPoint, layout::PipelineLayout, first_set::Integer, descriptor_sets::AbstractArray{<:DescriptorSet}, dynamic_offsets::AbstractArray{<:Integer}) = vkCmdBindDescriptorSets(command_buffer, pipeline_bind_point, layout, first_set, pointer_length(descriptor_sets), descriptor_sets, pointer_length(dynamic_offsets), dynamic_offsets)

cmd_set_stencil_reference(command_buffer::CommandBuffer, face_mask::Integer, reference::Integer) = vkCmdSetStencilReference(command_buffer, face_mask, reference)

cmd_set_stencil_write_mask(command_buffer::CommandBuffer, face_mask::Integer, write_mask::Integer) = vkCmdSetStencilWriteMask(command_buffer, face_mask, write_mask)

cmd_set_stencil_compare_mask(command_buffer::CommandBuffer, face_mask::Integer, compare_mask::Integer) = vkCmdSetStencilCompareMask(command_buffer, face_mask, compare_mask)

cmd_set_depth_bounds(command_buffer::CommandBuffer, min_depth_bounds::Real, max_depth_bounds::Real) = vkCmdSetDepthBounds(command_buffer, min_depth_bounds, max_depth_bounds)

cmd_set_blend_constants(command_buffer::CommandBuffer, blend_constants::NTuple{4, Float32}) = vkCmdSetBlendConstants(command_buffer, blend_constants)

cmd_set_depth_bias(command_buffer::CommandBuffer, depth_bias_constant_factor::Real, depth_bias_clamp::Real, depth_bias_slope_factor::Real) = vkCmdSetDepthBias(command_buffer, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor)

cmd_set_line_width(command_buffer::CommandBuffer, line_width::Real) = vkCmdSetLineWidth(command_buffer, line_width)

cmd_set_scissor(command_buffer::CommandBuffer, scissors::AbstractArray{<:Rect2D}) = vkCmdSetScissor(command_buffer, 0, pointer_length(scissors), scissors)

cmd_set_viewport(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}) = vkCmdSetViewport(command_buffer, 0, pointer_length(viewports), viewports)

cmd_bind_pipeline(command_buffer::CommandBuffer, pipeline_bind_point::VkPipelineBindPoint, pipeline::Pipeline) = vkCmdBindPipeline(command_buffer, pipeline_bind_point, pipeline)

reset_command_buffer(command_buffer::CommandBuffer; flags = 0) = @check(vkResetCommandBuffer(command_buffer, flags))

end_command_buffer(command_buffer::CommandBuffer) = @check(vkEndCommandBuffer(command_buffer))

begin_command_buffer(command_buffer::CommandBuffer, begin_info::CommandBufferBeginInfo) = @check(vkBeginCommandBuffer(command_buffer, begin_info))

free_command_buffers(device::Device, command_pool::CommandPool, command_buffers::AbstractArray{<:CommandBuffer}) = vkFreeCommandBuffers(device, command_pool, pointer_length(command_buffers), command_buffers)

function allocate_command_buffers(device::Device, allocate_info::CommandBufferAllocateInfo)
    pCommandBuffers = Vector{VkCommandBuffer}(undef, allocate_info.vks.commandBufferCount)
    @check vkAllocateCommandBuffers(device, allocate_info, pCommandBuffers)
    parent = getproperty(allocate_info, :command_pool)
    CommandBuffer.(pCommandBuffers, identity, getproperty(allocate_info, :command_pool))
end

reset_command_pool(device::Device, command_pool::CommandPool; flags = 0) = @check(vkResetCommandPool(device, command_pool, flags))

destroy_command_pool(device::Device, command_pool::CommandPool; allocator = C_NULL) = vkDestroyCommandPool(device, command_pool, allocator)

function create_command_pool(device::Device, create_info::CommandPoolCreateInfo; allocator = C_NULL)
    pCommandPool = Ref{VkCommandPool}()
    @check vkCreateCommandPool(device, create_info, allocator, pCommandPool)
    CommandPool(pCommandPool[], (x->destroy_command_pool(device, x; allocator)), device)
end

function get_render_area_granularity(device::Device, render_pass::RenderPass)
    pGranularity = Ref{VkExtent2D}()
    vkGetRenderAreaGranularity(device, render_pass, pGranularity)
    from_vk(Extent2D, pGranularity[])
end

destroy_render_pass(device::Device, render_pass::RenderPass; allocator = C_NULL) = vkDestroyRenderPass(device, render_pass, allocator)

function create_render_pass(device::Device, create_info::RenderPassCreateInfo; allocator = C_NULL)
    pRenderPass = Ref{VkRenderPass}()
    @check vkCreateRenderPass(device, create_info, allocator, pRenderPass)
    RenderPass(pRenderPass[], (x->destroy_render_pass(device, x; allocator)), device)
end

destroy_framebuffer(device::Device, framebuffer::Framebuffer; allocator = C_NULL) = vkDestroyFramebuffer(device, framebuffer, allocator)

function create_framebuffer(device::Device, create_info::FramebufferCreateInfo; allocator = C_NULL)
    pFramebuffer = Ref{VkFramebuffer}()
    @check vkCreateFramebuffer(device, create_info, allocator, pFramebuffer)
    Framebuffer(pFramebuffer[], (x->destroy_framebuffer(device, x; allocator)), device)
end

update_descriptor_sets(device::Device, descriptor_writes::AbstractArray{<:WriteDescriptorSet}, descriptor_copies::AbstractArray{<:CopyDescriptorSet}) = vkUpdateDescriptorSets(device, pointer_length(descriptor_writes), descriptor_writes, pointer_length(descriptor_copies), descriptor_copies)

free_descriptor_sets(device::Device, descriptor_pool::DescriptorPool, descriptor_sets::AbstractArray{<:DescriptorSet}) = @check(vkFreeDescriptorSets(device, descriptor_pool, pointer_length(descriptor_sets), descriptor_sets))

function allocate_descriptor_sets(device::Device, allocate_info::DescriptorSetAllocateInfo)
    pDescriptorSets = Vector{VkDescriptorSet}(undef, allocate_info.vks.descriptorSetCount)
    @check vkAllocateDescriptorSets(device, allocate_info, pDescriptorSets)
    parent = getproperty(allocate_info, :descriptor_pool)
    DescriptorSet.(pDescriptorSets, identity, getproperty(allocate_info, :descriptor_pool))
end

reset_descriptor_pool(device::Device, descriptor_pool::DescriptorPool; flags = 0) = @check(vkResetDescriptorPool(device, descriptor_pool, flags))

destroy_descriptor_pool(device::Device, descriptor_pool::DescriptorPool; allocator = C_NULL) = vkDestroyDescriptorPool(device, descriptor_pool, allocator)

function create_descriptor_pool(device::Device, create_info::DescriptorPoolCreateInfo; allocator = C_NULL)
    pDescriptorPool = Ref{VkDescriptorPool}()
    @check vkCreateDescriptorPool(device, create_info, allocator, pDescriptorPool)
    DescriptorPool(pDescriptorPool[], (x->destroy_descriptor_pool(device, x; allocator)), device)
end

destroy_descriptor_set_layout(device::Device, descriptor_set_layout::DescriptorSetLayout; allocator = C_NULL) = vkDestroyDescriptorSetLayout(device, descriptor_set_layout, allocator)

function create_descriptor_set_layout(device::Device, create_info::DescriptorSetLayoutCreateInfo; allocator = C_NULL)
    pSetLayout = Ref{VkDescriptorSetLayout}()
    @check vkCreateDescriptorSetLayout(device, create_info, allocator, pSetLayout)
    DescriptorSetLayout(pSetLayout[], (x->destroy_descriptor_set_layout(device, x; allocator)), device)
end

destroy_sampler(device::Device, sampler::Sampler; allocator = C_NULL) = vkDestroySampler(device, sampler, allocator)

function create_sampler(device::Device, create_info::SamplerCreateInfo; allocator = C_NULL)
    pSampler = Ref{VkSampler}()
    @check vkCreateSampler(device, create_info, allocator, pSampler)
    Sampler(pSampler[], (x->destroy_sampler(device, x; allocator)), device)
end

destroy_pipeline_layout(device::Device, pipeline_layout::PipelineLayout; allocator = C_NULL) = vkDestroyPipelineLayout(device, pipeline_layout, allocator)

function create_pipeline_layout(device::Device, create_info::PipelineLayoutCreateInfo; allocator = C_NULL)
    pPipelineLayout = Ref{VkPipelineLayout}()
    @check vkCreatePipelineLayout(device, create_info, allocator, pPipelineLayout)
    PipelineLayout(pPipelineLayout[], (x->destroy_pipeline_layout(device, x; allocator)), device)
end

destroy_pipeline(device::Device, pipeline::Pipeline; allocator = C_NULL) = vkDestroyPipeline(device, pipeline, allocator)

function create_compute_pipelines(device::Device, create_infos::AbstractArray{<:ComputePipelineCreateInfo}; pipeline_cache = C_NULL, allocator = C_NULL)
    pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
    @check vkCreateComputePipelines(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines)
    Pipeline.(pPipelines, (x->destroy_pipeline(device, x; allocator)), device)
end

function create_graphics_pipelines(device::Device, create_infos::AbstractArray{<:GraphicsPipelineCreateInfo}; pipeline_cache = C_NULL, allocator = C_NULL)
    pPipelines = Vector{VkPipeline}(undef, pointer_length(create_infos))
    @check vkCreateGraphicsPipelines(device, pipeline_cache, pointer_length(create_infos), create_infos, allocator, pPipelines)
    Pipeline.(pPipelines, (x->destroy_pipeline(device, x; allocator)), device)
end

merge_pipeline_caches(device::Device, dst_cache::PipelineCache, src_caches::AbstractArray{<:PipelineCache}) = @check(vkMergePipelineCaches(device, dst_cache, pointer_length(src_caches), src_caches))

function get_pipeline_cache_data(device::Device, pipeline_cache::PipelineCache, data_size::Integer)
    pDataSize = Ref(data_size)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetPipelineCacheData(device, pipeline_cache, pDataSize, pData)
    (pDataSize[], pData[])
end

destroy_pipeline_cache(device::Device, pipeline_cache::PipelineCache; allocator = C_NULL) = vkDestroyPipelineCache(device, pipeline_cache, allocator)

function create_pipeline_cache(device::Device, create_info::PipelineCacheCreateInfo; allocator = C_NULL)
    pPipelineCache = Ref{VkPipelineCache}()
    @check vkCreatePipelineCache(device, create_info, allocator, pPipelineCache)
    PipelineCache(pPipelineCache[], (x->destroy_pipeline_cache(device, x; allocator)), device)
end

destroy_shader_module(device::Device, shader_module::ShaderModule; allocator = C_NULL) = vkDestroyShaderModule(device, shader_module, allocator)

function create_shader_module(device::Device, create_info::ShaderModuleCreateInfo; allocator = C_NULL)
    pShaderModule = Ref{VkShaderModule}()
    @check vkCreateShaderModule(device, create_info, allocator, pShaderModule)
    ShaderModule(pShaderModule[], (x->destroy_shader_module(device, x; allocator)), device)
end

destroy_image_view(device::Device, image_view::ImageView; allocator = C_NULL) = vkDestroyImageView(device, image_view, allocator)

function create_image_view(device::Device, create_info::ImageViewCreateInfo; allocator = C_NULL)
    pView = Ref{VkImageView}()
    @check vkCreateImageView(device, create_info, allocator, pView)
    ImageView(pView[], (x->destroy_image_view(device, x; allocator)), device)
end

function get_image_subresource_layout(device::Device, image::Image, subresource::ImageSubresource)
    pLayout = Ref{VkSubresourceLayout}()
    vkGetImageSubresourceLayout(device, image, subresource, pLayout)
    from_vk(SubresourceLayout, pLayout[])
end

destroy_image(device::Device, image::Image; allocator = C_NULL) = vkDestroyImage(device, image, allocator)

function create_image(device::Device, create_info::ImageCreateInfo; allocator = C_NULL)
    pImage = Ref{VkImage}()
    @check vkCreateImage(device, create_info, allocator, pImage)
    Image(pImage[], (x->destroy_image(device, x; allocator)), device)
end

destroy_buffer_view(device::Device, buffer_view::BufferView; allocator = C_NULL) = vkDestroyBufferView(device, buffer_view, allocator)

function create_buffer_view(device::Device, create_info::BufferViewCreateInfo; allocator = C_NULL)
    pView = Ref{VkBufferView}()
    @check vkCreateBufferView(device, create_info, allocator, pView)
    BufferView(pView[], (x->destroy_buffer_view(device, x; allocator)), device)
end

destroy_buffer(device::Device, buffer::Buffer; allocator = C_NULL) = vkDestroyBuffer(device, buffer, allocator)

function create_buffer(device::Device, create_info::BufferCreateInfo; allocator = C_NULL)
    pBuffer = Ref{VkBuffer}()
    @check vkCreateBuffer(device, create_info, allocator, pBuffer)
    Buffer(pBuffer[], (x->destroy_buffer(device, x; allocator)), device)
end

reset_query_pool(device::Device, query_pool::QueryPool, first_query::Integer, query_count::Integer) = vkResetQueryPool(device, query_pool, first_query, query_count)

function get_query_pool_results(device::Device, query_pool::QueryPool, first_query::Integer, query_count::Integer, data_size::Integer, stride::Integer; flags = 0)
    pData = Ref{Ptr{Cvoid}}()
    @check vkGetQueryPoolResults(device, query_pool, first_query, query_count, data_size, pData, stride, flags)
    pData[]
end

destroy_query_pool(device::Device, query_pool::QueryPool; allocator = C_NULL) = vkDestroyQueryPool(device, query_pool, allocator)

function create_query_pool(device::Device, create_info::QueryPoolCreateInfo; allocator = C_NULL)
    pQueryPool = Ref{VkQueryPool}()
    @check vkCreateQueryPool(device, create_info, allocator, pQueryPool)
    QueryPool(pQueryPool[], (x->destroy_query_pool(device, x; allocator)), device)
end

reset_event(device::Device, event::Event) = @check(vkResetEvent(device, event))

set_event(device::Device, event::Event) = @check(vkSetEvent(device, event))

get_event_status(device::Device, event::Event) = @check(vkGetEventStatus(device, event))

destroy_event(device::Device, event::Event; allocator = C_NULL) = vkDestroyEvent(device, event, allocator)

function create_event(device::Device, create_info::EventCreateInfo; allocator = C_NULL)
    pEvent = Ref{VkEvent}()
    @check vkCreateEvent(device, create_info, allocator, pEvent)
    Event(pEvent[], (x->destroy_event(device, x; allocator)), device)
end

destroy_semaphore(device::Device, semaphore::Semaphore; allocator = C_NULL) = vkDestroySemaphore(device, semaphore, allocator)

function create_semaphore(device::Device, create_info::SemaphoreCreateInfo; allocator = C_NULL)
    pSemaphore = Ref{VkSemaphore}()
    @check vkCreateSemaphore(device, create_info, allocator, pSemaphore)
    Semaphore(pSemaphore[], (x->destroy_semaphore(device, x; allocator)), device)
end

wait_for_fences(device::Device, fences::AbstractArray{<:Fence}, wait_all::Bool, timeout::Integer) = @check(vkWaitForFences(device, pointer_length(fences), fences, wait_all, timeout))

get_fence_status(device::Device, fence::Fence) = @check(vkGetFenceStatus(device, fence))

reset_fences(device::Device, fences::AbstractArray{<:Fence}) = @check(vkResetFences(device, pointer_length(fences), fences))

destroy_fence(device::Device, fence::Fence; allocator = C_NULL) = vkDestroyFence(device, fence, allocator)

function create_fence(device::Device, create_info::FenceCreateInfo; allocator = C_NULL)
    pFence = Ref{VkFence}()
    @check vkCreateFence(device, create_info, allocator, pFence)
    Fence(pFence[], (x->destroy_fence(device, x; allocator)), device)
end

queue_bind_sparse(queue::Queue, bind_info::AbstractArray{<:BindSparseInfo}; fence = C_NULL) = @check(vkQueueBindSparse(queue, pointer_length(bind_info), bind_info, fence))

function get_physical_device_sparse_image_format_properties(physical_device::PhysicalDevice, format::VkFormat, type::VkImageType, samples::VkSampleCountFlagBits, usage::Integer, tiling::VkImageTiling)
    pPropertyCount = Ref{UInt32}()
    vkGetPhysicalDeviceSparseImageFormatProperties(physical_device, format, type, samples, usage, tiling, pPropertyCount, C_NULL)
    pProperties = Vector{VkSparseImageFormatProperties}(undef, pPropertyCount[])
    vkGetPhysicalDeviceSparseImageFormatProperties(physical_device, format, type, samples, usage, tiling, pPropertyCount, pProperties)
    from_vk.(SparseImageFormatProperties, pProperties)
end

function get_image_sparse_memory_requirements(device::Device, image::Image)
    pSparseMemoryRequirementCount = Ref{UInt32}()
    vkGetImageSparseMemoryRequirements(device, image, pSparseMemoryRequirementCount, C_NULL)
    pSparseMemoryRequirements = Vector{VkSparseImageMemoryRequirements}(undef, pSparseMemoryRequirementCount[])
    vkGetImageSparseMemoryRequirements(device, image, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
    from_vk.(SparseImageMemoryRequirements, pSparseMemoryRequirements)
end

bind_image_memory(device::Device, image::Image, memory::DeviceMemory, memory_offset::Integer) = @check(vkBindImageMemory(device, image, memory, memory_offset))

function get_image_memory_requirements(device::Device, image::Image)
    pMemoryRequirements = Ref{VkMemoryRequirements}()
    vkGetImageMemoryRequirements(device, image, pMemoryRequirements)
    from_vk(MemoryRequirements, pMemoryRequirements[])
end

bind_buffer_memory(device::Device, buffer::Buffer, memory::DeviceMemory, memory_offset::Integer) = @check(vkBindBufferMemory(device, buffer, memory, memory_offset))

function get_buffer_memory_requirements(device::Device, buffer::Buffer)
    pMemoryRequirements = Ref{VkMemoryRequirements}()
    vkGetBufferMemoryRequirements(device, buffer, pMemoryRequirements)
    from_vk(MemoryRequirements, pMemoryRequirements[])
end

function get_device_memory_commitment(device::Device, memory::DeviceMemory)
    pCommittedMemoryInBytes = Ref{VkDeviceSize}()
    vkGetDeviceMemoryCommitment(device, memory, pCommittedMemoryInBytes)
    pCommittedMemoryInBytes[]
end

invalidate_mapped_memory_ranges(device::Device, memory_ranges::AbstractArray{<:MappedMemoryRange}) = @check(vkInvalidateMappedMemoryRanges(device, pointer_length(memory_ranges), memory_ranges))

flush_mapped_memory_ranges(device::Device, memory_ranges::AbstractArray{<:MappedMemoryRange}) = @check(vkFlushMappedMemoryRanges(device, pointer_length(memory_ranges), memory_ranges))

unmap_memory(device::Device, memory::DeviceMemory) = vkUnmapMemory(device, memory)

function map_memory(device::Device, memory::DeviceMemory, offset::Integer, size::Integer; flags = 0)
    ppData = Ref{Ptr{Cvoid}}()
    @check vkMapMemory(device, memory, offset, size, flags, ppData)
    ppData[]
end

free_memory(device::Device, memory::DeviceMemory; allocator = C_NULL) = vkFreeMemory(device, memory, allocator)

function allocate_memory(device::Device, allocate_info::MemoryAllocateInfo; allocator = C_NULL)
    pMemory = Ref{VkDeviceMemory}()
    @check vkAllocateMemory(device, allocate_info, allocator, pMemory)
    DeviceMemory(pMemory[], (x->free_memory(device, x; allocator)), device)
end

device_wait_idle(device::Device) = @check(vkDeviceWaitIdle(device))

queue_wait_idle(queue::Queue) = @check(vkQueueWaitIdle(queue))

queue_submit(queue::Queue, submits::AbstractArray{<:SubmitInfo}; fence = C_NULL) = @check(vkQueueSubmit(queue, pointer_length(submits), submits, fence))

function get_device_queue(device::Device, queue_family_index::Integer, queue_index::Integer)
    pQueue = Ref{VkQueue}()
    vkGetDeviceQueue(device, queue_family_index, queue_index, pQueue)
    Queue(pQueue[], identity, device)
end

function enumerate_device_extension_properties(physical_device::PhysicalDevice; layer_name = C_NULL)
    pPropertyCount = Ref{UInt32}()
    @check vkEnumerateDeviceExtensionProperties(physical_device, layer_name, pPropertyCount, C_NULL)
    pProperties = Vector{VkExtensionProperties}(undef, pPropertyCount[])
    @check vkEnumerateDeviceExtensionProperties(physical_device, layer_name, pPropertyCount, pProperties)
    from_vk.(ExtensionProperties, pProperties)
end

function enumerate_device_layer_properties(physical_device::PhysicalDevice)
    pPropertyCount = Ref{UInt32}()
    @check vkEnumerateDeviceLayerProperties(physical_device, pPropertyCount, C_NULL)
    pProperties = Vector{VkLayerProperties}(undef, pPropertyCount[])
    @check vkEnumerateDeviceLayerProperties(physical_device, pPropertyCount, pProperties)
    from_vk.(LayerProperties, pProperties)
end

function enumerate_instance_extension_properties(; layer_name = C_NULL)
    pPropertyCount = Ref{UInt32}()
    @check vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, C_NULL)
    pProperties = Vector{VkExtensionProperties}(undef, pPropertyCount[])
    @check vkEnumerateInstanceExtensionProperties(layer_name, pPropertyCount, pProperties)
    from_vk.(ExtensionProperties, pProperties)
end

function enumerate_instance_layer_properties()
    pPropertyCount = Ref{UInt32}()
    @check vkEnumerateInstanceLayerProperties(pPropertyCount, C_NULL)
    pProperties = Vector{VkLayerProperties}(undef, pPropertyCount[])
    @check vkEnumerateInstanceLayerProperties(pPropertyCount, pProperties)
    from_vk.(LayerProperties, pProperties)
end

function enumerate_instance_version()
    pApiVersion = Ref{UInt32}()
    @check vkEnumerateInstanceVersion(pApiVersion)
    from_vk(VersionNumber, pApiVersion[])
end

destroy_device(device::Device; allocator = C_NULL) = vkDestroyDevice(device, allocator)

function create_device(physical_device::PhysicalDevice, create_info::DeviceCreateInfo; allocator = C_NULL)
    pDevice = Ref{VkDevice}()
    @check vkCreateDevice(physical_device, create_info, allocator, pDevice)
    Device(pDevice[], (x->destroy_device(x; allocator)), physical_device)
end

function get_physical_device_image_format_properties(physical_device::PhysicalDevice, format::VkFormat, type::VkImageType, tiling::VkImageTiling, usage::Integer; flags = 0)
    pImageFormatProperties = Ref{VkImageFormatProperties}()
    @check vkGetPhysicalDeviceImageFormatProperties(physical_device, format, type, tiling, usage, flags, pImageFormatProperties)
    from_vk(ImageFormatProperties, pImageFormatProperties[])
end

function get_physical_device_format_properties(physical_device::PhysicalDevice, format::VkFormat)
    pFormatProperties = Ref{VkFormatProperties}()
    vkGetPhysicalDeviceFormatProperties(physical_device, format, pFormatProperties)
    from_vk(FormatProperties, pFormatProperties[])
end

function get_physical_device_features(physical_device::PhysicalDevice)
    pFeatures = Ref{VkPhysicalDeviceFeatures}()
    vkGetPhysicalDeviceFeatures(physical_device, pFeatures)
    from_vk(PhysicalDeviceFeatures, pFeatures[])
end

function get_physical_device_memory_properties(physical_device::PhysicalDevice)
    pMemoryProperties = Ref{VkPhysicalDeviceMemoryProperties}()
    vkGetPhysicalDeviceMemoryProperties(physical_device, pMemoryProperties)
    from_vk(PhysicalDeviceMemoryProperties, pMemoryProperties[])
end

function get_physical_device_queue_family_properties(physical_device::PhysicalDevice)
    pQueueFamilyPropertyCount = Ref{UInt32}()
    vkGetPhysicalDeviceQueueFamilyProperties(physical_device, pQueueFamilyPropertyCount, C_NULL)
    pQueueFamilyProperties = Vector{VkQueueFamilyProperties}(undef, pQueueFamilyPropertyCount[])
    vkGetPhysicalDeviceQueueFamilyProperties(physical_device, pQueueFamilyPropertyCount, pQueueFamilyProperties)
    from_vk.(QueueFamilyProperties, pQueueFamilyProperties)
end

function get_physical_device_properties(physical_device::PhysicalDevice)
    pProperties = Ref{VkPhysicalDeviceProperties}()
    vkGetPhysicalDeviceProperties(physical_device, pProperties)
    from_vk(PhysicalDeviceProperties, pProperties[])
end

get_instance_proc_addr(name::AbstractString; instance = C_NULL) = vkGetInstanceProcAddr(instance, name)

get_device_proc_addr(device::Device, name::AbstractString) = vkGetDeviceProcAddr(device, name)

function enumerate_physical_devices(instance::Instance)
    pPhysicalDeviceCount = Ref{UInt32}()
    @check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL)
    pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])
    @check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices)
    PhysicalDevice.(pPhysicalDevices, identity, instance)
end

destroy_instance(instance::Instance; allocator = C_NULL) = vkDestroyInstance(instance, allocator)

function create_instance(create_info::InstanceCreateInfo; allocator = C_NULL)
    pInstance = Ref{VkInstance}()
    @check vkCreateInstance(create_info, allocator, pInstance)
    Instance(pInstance[], (x->destroy_instance(x; allocator)))
end




export AabbPositionsKHR, AccelerationStructureBuildGeometryInfoKHR, AccelerationStructureBuildOffsetInfoKHR, AccelerationStructureCreateGeometryTypeInfoKHR, AccelerationStructureCreateInfoKHR, AccelerationStructureCreateInfoNV, AccelerationStructureDeviceAddressInfoKHR, AccelerationStructureGeometryAabbsDataKHR, AccelerationStructureGeometryDataKHR, AccelerationStructureGeometryInstancesDataKHR, AccelerationStructureGeometryKHR, AccelerationStructureGeometryTrianglesDataKHR, AccelerationStructureInfoNV, AccelerationStructureInstanceKHR, AccelerationStructureKHR, AccelerationStructureMemoryRequirementsInfoKHR, AccelerationStructureMemoryRequirementsInfoNV, AccelerationStructureVersionKHR, AcquireNextImageInfoKHR, AcquireProfilingLockInfoKHR, AllocationCallbacks, AndroidHardwareBufferFormatPropertiesANDROID, AndroidHardwareBufferPropertiesANDROID, AndroidHardwareBufferUsageANDROID, AndroidSurfaceCreateInfoKHR, ApplicationInfo, AttachmentDescription, AttachmentDescription2, AttachmentDescriptionStencilLayout, AttachmentReference, AttachmentReference2, AttachmentReferenceStencilLayout, AttachmentSampleLocationsEXT, BaseInStructure, BaseOutStructure, BindAccelerationStructureMemoryInfoKHR, BindBufferMemoryDeviceGroupInfo, BindBufferMemoryInfo, BindImageMemoryDeviceGroupInfo, BindImageMemoryInfo, BindImageMemorySwapchainInfoKHR, BindImagePlaneMemoryInfo, BindIndexBufferIndirectCommandNV, BindShaderGroupIndirectCommandNV, BindSparseInfo, BindVertexBufferIndirectCommandNV, Buffer, BufferCopy, BufferCreateInfo, BufferDeviceAddressCreateInfoEXT, BufferDeviceAddressInfo, BufferImageCopy, BufferMemoryBarrier, BufferMemoryRequirementsInfo2, BufferOpaqueCaptureAddressCreateInfo, BufferView, BufferViewCreateInfo, CalibratedTimestampInfoEXT, CheckpointDataNV, ClearAttachment, ClearColorValue, ClearDepthStencilValue, ClearRect, ClearValue, CoarseSampleLocationNV, CoarseSampleOrderCustomNV, CommandBuffer, CommandBufferAllocateInfo, CommandBufferBeginInfo, CommandBufferInheritanceConditionalRenderingInfoEXT, CommandBufferInheritanceInfo, CommandBufferInheritanceRenderPassTransformInfoQCOM, CommandPool, CommandPoolCreateInfo, ComponentMapping, ComputePipelineCreateInfo, ConditionalRenderingBeginInfoEXT, ConformanceVersion, CooperativeMatrixPropertiesNV, CopyAccelerationStructureInfoKHR, CopyAccelerationStructureToMemoryInfoKHR, CopyDescriptorSet, CopyMemoryToAccelerationStructureInfoKHR, D3D12FenceSubmitInfoKHR, DebugMarkerMarkerInfoEXT, DebugMarkerObjectNameInfoEXT, DebugMarkerObjectTagInfoEXT, DebugReportCallbackCreateInfoEXT, DebugReportCallbackEXT, DebugUtilsLabelEXT, DebugUtilsMessengerCallbackDataEXT, DebugUtilsMessengerCreateInfoEXT, DebugUtilsMessengerEXT, DebugUtilsObjectNameInfoEXT, DebugUtilsObjectTagInfoEXT, DedicatedAllocationBufferCreateInfoNV, DedicatedAllocationImageCreateInfoNV, DedicatedAllocationMemoryAllocateInfoNV, DeferredOperationInfoKHR, DeferredOperationKHR, DescriptorBufferInfo, DescriptorImageInfo, DescriptorPool, DescriptorPoolCreateInfo, DescriptorPoolInlineUniformBlockCreateInfoEXT, DescriptorPoolSize, DescriptorSet, DescriptorSetAllocateInfo, DescriptorSetLayout, DescriptorSetLayoutBinding, DescriptorSetLayoutBindingFlagsCreateInfo, DescriptorSetLayoutCreateInfo, DescriptorSetLayoutSupport, DescriptorSetVariableDescriptorCountAllocateInfo, DescriptorSetVariableDescriptorCountLayoutSupport, DescriptorUpdateTemplate, DescriptorUpdateTemplateCreateInfo, DescriptorUpdateTemplateEntry, Device, DeviceCreateInfo, DeviceDiagnosticsConfigCreateInfoNV, DeviceEventInfoEXT, DeviceGroupBindSparseInfo, DeviceGroupCommandBufferBeginInfo, DeviceGroupDeviceCreateInfo, DeviceGroupPresentCapabilitiesKHR, DeviceGroupPresentInfoKHR, DeviceGroupRenderPassBeginInfo, DeviceGroupSubmitInfo, DeviceGroupSwapchainCreateInfoKHR, DeviceMemory, DeviceMemoryOpaqueCaptureAddressInfo, DeviceMemoryOverallocationCreateInfoAMD, DeviceOrHostAddressConstKHR, DeviceOrHostAddressKHR, DevicePrivateDataCreateInfoEXT, DeviceQueueCreateInfo, DeviceQueueGlobalPriorityCreateInfoEXT, DeviceQueueInfo2, DirectFBSurfaceCreateInfoEXT, DispatchIndirectCommand, DisplayEventInfoEXT, DisplayKHR, DisplayModeCreateInfoKHR, DisplayModeKHR, DisplayModeParametersKHR, DisplayModeProperties2KHR, DisplayModePropertiesKHR, DisplayNativeHdrSurfaceCapabilitiesAMD, DisplayPlaneCapabilities2KHR, DisplayPlaneCapabilitiesKHR, DisplayPlaneInfo2KHR, DisplayPlaneProperties2KHR, DisplayPlanePropertiesKHR, DisplayPowerInfoEXT, DisplayPresentInfoKHR, DisplayProperties2KHR, DisplayPropertiesKHR, DisplaySurfaceCreateInfoKHR, DrawIndexedIndirectCommand, DrawIndirectCommand, DrawMeshTasksIndirectCommandNV, DrmFormatModifierPropertiesEXT, DrmFormatModifierPropertiesListEXT, Event, EventCreateInfo, ExportFenceCreateInfo, ExportFenceWin32HandleInfoKHR, ExportMemoryAllocateInfo, ExportMemoryAllocateInfoNV, ExportMemoryWin32HandleInfoKHR, ExportMemoryWin32HandleInfoNV, ExportSemaphoreCreateInfo, ExportSemaphoreWin32HandleInfoKHR, ExtensionProperties, Extent2D, Extent3D, ExternalBufferProperties, ExternalFenceProperties, ExternalFormatANDROID, ExternalImageFormatProperties, ExternalImageFormatPropertiesNV, ExternalMemoryBufferCreateInfo, ExternalMemoryImageCreateInfo, ExternalMemoryImageCreateInfoNV, ExternalMemoryProperties, ExternalSemaphoreProperties, Fence, FenceCreateInfo, FenceGetFdInfoKHR, FenceGetWin32HandleInfoKHR, FilterCubicImageViewImageFormatPropertiesEXT, FormatProperties, FormatProperties2, Framebuffer, FramebufferAttachmentImageInfo, FramebufferAttachmentsCreateInfo, FramebufferCreateInfo, FramebufferMixedSamplesCombinationNV, GeneratedCommandsInfoNV, GeneratedCommandsMemoryRequirementsInfoNV, GeometryAABBNV, GeometryDataNV, GeometryNV, GeometryTrianglesNV, GraphicsPipelineCreateInfo, GraphicsPipelineShaderGroupsCreateInfoNV, GraphicsShaderGroupCreateInfoNV, HdrMetadataEXT, HeadlessSurfaceCreateInfoEXT, IOSSurfaceCreateInfoMVK, Image, ImageBlit, ImageCopy, ImageCreateInfo, ImageDrmFormatModifierExplicitCreateInfoEXT, ImageDrmFormatModifierListCreateInfoEXT, ImageDrmFormatModifierPropertiesEXT, ImageFormatListCreateInfo, ImageFormatProperties, ImageFormatProperties2, ImageMemoryBarrier, ImageMemoryRequirementsInfo2, ImagePipeSurfaceCreateInfoFUCHSIA, ImagePlaneMemoryRequirementsInfo, ImageResolve, ImageSparseMemoryRequirementsInfo2, ImageStencilUsageCreateInfo, ImageSubresource, ImageSubresourceLayers, ImageSubresourceRange, ImageSwapchainCreateInfoKHR, ImageView, ImageViewASTCDecodeModeEXT, ImageViewAddressPropertiesNVX, ImageViewCreateInfo, ImageViewHandleInfoNVX, ImageViewUsageCreateInfo, ImportAndroidHardwareBufferInfoANDROID, ImportFenceFdInfoKHR, ImportFenceWin32HandleInfoKHR, ImportMemoryFdInfoKHR, ImportMemoryHostPointerInfoEXT, ImportMemoryWin32HandleInfoKHR, ImportMemoryWin32HandleInfoNV, ImportSemaphoreFdInfoKHR, ImportSemaphoreWin32HandleInfoKHR, IndirectCommandsLayoutCreateInfoNV, IndirectCommandsLayoutNV, IndirectCommandsLayoutTokenNV, IndirectCommandsStreamNV, InitializePerformanceApiInfoINTEL, InputAttachmentAspectReference, Instance, InstanceCreateInfo, LayerProperties, MacOSSurfaceCreateInfoMVK, MappedMemoryRange, MemoryAllocateFlagsInfo, MemoryAllocateInfo, MemoryBarrier, MemoryDedicatedAllocateInfo, MemoryDedicatedRequirements, MemoryFdPropertiesKHR, MemoryGetAndroidHardwareBufferInfoANDROID, MemoryGetFdInfoKHR, MemoryGetWin32HandleInfoKHR, MemoryHeap, MemoryHostPointerPropertiesEXT, MemoryOpaqueCaptureAddressAllocateInfo, MemoryPriorityAllocateInfoEXT, MemoryRequirements, MemoryRequirements2, MemoryType, MemoryWin32HandlePropertiesKHR, MetalSurfaceCreateInfoEXT, MultisamplePropertiesEXT, Offset2D, Offset3D, PastPresentationTimingGOOGLE, PerformanceConfigurationAcquireInfoINTEL, PerformanceConfigurationINTEL, PerformanceCounterDescriptionKHR, PerformanceCounterKHR, PerformanceCounterResultKHR, PerformanceMarkerInfoINTEL, PerformanceOverrideInfoINTEL, PerformanceQuerySubmitInfoKHR, PerformanceStreamMarkerInfoINTEL, PerformanceValueDataINTEL, PerformanceValueINTEL, PhysicalDevice, PhysicalDevice16BitStorageFeatures, PhysicalDevice4444FormatsFeaturesEXT, PhysicalDevice8BitStorageFeatures, PhysicalDeviceASTCDecodeFeaturesEXT, PhysicalDeviceBlendOperationAdvancedFeaturesEXT, PhysicalDeviceBlendOperationAdvancedPropertiesEXT, PhysicalDeviceBufferDeviceAddressFeatures, PhysicalDeviceBufferDeviceAddressFeaturesEXT, PhysicalDeviceCoherentMemoryFeaturesAMD, PhysicalDeviceComputeShaderDerivativesFeaturesNV, PhysicalDeviceConditionalRenderingFeaturesEXT, PhysicalDeviceConservativeRasterizationPropertiesEXT, PhysicalDeviceCooperativeMatrixFeaturesNV, PhysicalDeviceCooperativeMatrixPropertiesNV, PhysicalDeviceCornerSampledImageFeaturesNV, PhysicalDeviceCoverageReductionModeFeaturesNV, PhysicalDeviceCustomBorderColorFeaturesEXT, PhysicalDeviceCustomBorderColorPropertiesEXT, PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV, PhysicalDeviceDepthClipEnableFeaturesEXT, PhysicalDeviceDepthStencilResolveProperties, PhysicalDeviceDescriptorIndexingFeatures, PhysicalDeviceDescriptorIndexingProperties, PhysicalDeviceDeviceGeneratedCommandsFeaturesNV, PhysicalDeviceDeviceGeneratedCommandsPropertiesNV, PhysicalDeviceDiagnosticsConfigFeaturesNV, PhysicalDeviceDiscardRectanglePropertiesEXT, PhysicalDeviceDriverProperties, PhysicalDeviceExclusiveScissorFeaturesNV, PhysicalDeviceExtendedDynamicStateFeaturesEXT, PhysicalDeviceExternalBufferInfo, PhysicalDeviceExternalFenceInfo, PhysicalDeviceExternalImageFormatInfo, PhysicalDeviceExternalMemoryHostPropertiesEXT, PhysicalDeviceExternalSemaphoreInfo, PhysicalDeviceFeatures, PhysicalDeviceFeatures2, PhysicalDeviceFloatControlsProperties, PhysicalDeviceFragmentDensityMap2FeaturesEXT, PhysicalDeviceFragmentDensityMap2PropertiesEXT, PhysicalDeviceFragmentDensityMapFeaturesEXT, PhysicalDeviceFragmentDensityMapPropertiesEXT, PhysicalDeviceFragmentShaderBarycentricFeaturesNV, PhysicalDeviceFragmentShaderInterlockFeaturesEXT, PhysicalDeviceGroupProperties, PhysicalDeviceHostQueryResetFeatures, PhysicalDeviceIDProperties, PhysicalDeviceImageDrmFormatModifierInfoEXT, PhysicalDeviceImageFormatInfo2, PhysicalDeviceImageRobustnessFeaturesEXT, PhysicalDeviceImageViewImageFormatInfoEXT, PhysicalDeviceImagelessFramebufferFeatures, PhysicalDeviceIndexTypeUint8FeaturesEXT, PhysicalDeviceInlineUniformBlockFeaturesEXT, PhysicalDeviceInlineUniformBlockPropertiesEXT, PhysicalDeviceLimits, PhysicalDeviceLineRasterizationFeaturesEXT, PhysicalDeviceLineRasterizationPropertiesEXT, PhysicalDeviceMaintenance3Properties, PhysicalDeviceMemoryBudgetPropertiesEXT, PhysicalDeviceMemoryPriorityFeaturesEXT, PhysicalDeviceMemoryProperties, PhysicalDeviceMemoryProperties2, PhysicalDeviceMeshShaderFeaturesNV, PhysicalDeviceMeshShaderPropertiesNV, PhysicalDeviceMultiviewFeatures, PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX, PhysicalDeviceMultiviewProperties, PhysicalDevicePCIBusInfoPropertiesEXT, PhysicalDevicePerformanceQueryFeaturesKHR, PhysicalDevicePerformanceQueryPropertiesKHR, PhysicalDevicePipelineCreationCacheControlFeaturesEXT, PhysicalDevicePipelineExecutablePropertiesFeaturesKHR, PhysicalDevicePointClippingProperties, PhysicalDevicePrivateDataFeaturesEXT, PhysicalDeviceProperties, PhysicalDeviceProperties2, PhysicalDeviceProtectedMemoryFeatures, PhysicalDeviceProtectedMemoryProperties, PhysicalDevicePushDescriptorPropertiesKHR, PhysicalDeviceRayTracingFeaturesKHR, PhysicalDeviceRayTracingPropertiesKHR, PhysicalDeviceRayTracingPropertiesNV, PhysicalDeviceRepresentativeFragmentTestFeaturesNV, PhysicalDeviceRobustness2FeaturesEXT, PhysicalDeviceRobustness2PropertiesEXT, PhysicalDeviceSampleLocationsPropertiesEXT, PhysicalDeviceSamplerFilterMinmaxProperties, PhysicalDeviceSamplerYcbcrConversionFeatures, PhysicalDeviceScalarBlockLayoutFeatures, PhysicalDeviceSeparateDepthStencilLayoutsFeatures, PhysicalDeviceShaderAtomicFloatFeaturesEXT, PhysicalDeviceShaderAtomicInt64Features, PhysicalDeviceShaderClockFeaturesKHR, PhysicalDeviceShaderCoreProperties2AMD, PhysicalDeviceShaderCorePropertiesAMD, PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT, PhysicalDeviceShaderDrawParametersFeatures, PhysicalDeviceShaderFloat16Int8Features, PhysicalDeviceShaderImageFootprintFeaturesNV, PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL, PhysicalDeviceShaderSMBuiltinsFeaturesNV, PhysicalDeviceShaderSMBuiltinsPropertiesNV, PhysicalDeviceShaderSubgroupExtendedTypesFeatures, PhysicalDeviceShadingRateImageFeaturesNV, PhysicalDeviceShadingRateImagePropertiesNV, PhysicalDeviceSparseImageFormatInfo2, PhysicalDeviceSparseProperties, PhysicalDeviceSubgroupProperties, PhysicalDeviceSubgroupSizeControlFeaturesEXT, PhysicalDeviceSubgroupSizeControlPropertiesEXT, PhysicalDeviceSurfaceInfo2KHR, PhysicalDeviceTexelBufferAlignmentFeaturesEXT, PhysicalDeviceTexelBufferAlignmentPropertiesEXT, PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT, PhysicalDeviceTimelineSemaphoreFeatures, PhysicalDeviceTimelineSemaphoreProperties, PhysicalDeviceToolPropertiesEXT, PhysicalDeviceTransformFeedbackFeaturesEXT, PhysicalDeviceTransformFeedbackPropertiesEXT, PhysicalDeviceUniformBufferStandardLayoutFeatures, PhysicalDeviceVariablePointersFeatures, PhysicalDeviceVertexAttributeDivisorFeaturesEXT, PhysicalDeviceVertexAttributeDivisorPropertiesEXT, PhysicalDeviceVulkan11Features, PhysicalDeviceVulkan11Properties, PhysicalDeviceVulkan12Features, PhysicalDeviceVulkan12Properties, PhysicalDeviceVulkanMemoryModelFeatures, PhysicalDeviceYcbcrImageArraysFeaturesEXT, Pipeline, PipelineCache, PipelineCacheCreateInfo, PipelineColorBlendAdvancedStateCreateInfoEXT, PipelineColorBlendAttachmentState, PipelineColorBlendStateCreateInfo, PipelineCompilerControlCreateInfoAMD, PipelineCoverageModulationStateCreateInfoNV, PipelineCoverageReductionStateCreateInfoNV, PipelineCoverageToColorStateCreateInfoNV, PipelineCreationFeedbackCreateInfoEXT, PipelineCreationFeedbackEXT, PipelineDepthStencilStateCreateInfo, PipelineDiscardRectangleStateCreateInfoEXT, PipelineDynamicStateCreateInfo, PipelineExecutableInfoKHR, PipelineExecutableInternalRepresentationKHR, PipelineExecutablePropertiesKHR, PipelineExecutableStatisticKHR, PipelineExecutableStatisticValueKHR, PipelineInfoKHR, PipelineInputAssemblyStateCreateInfo, PipelineLayout, PipelineLayoutCreateInfo, PipelineLibraryCreateInfoKHR, PipelineMultisampleStateCreateInfo, PipelineRasterizationConservativeStateCreateInfoEXT, PipelineRasterizationDepthClipStateCreateInfoEXT, PipelineRasterizationLineStateCreateInfoEXT, PipelineRasterizationStateCreateInfo, PipelineRasterizationStateRasterizationOrderAMD, PipelineRasterizationStateStreamCreateInfoEXT, PipelineRepresentativeFragmentTestStateCreateInfoNV, PipelineSampleLocationsStateCreateInfoEXT, PipelineShaderStageCreateInfo, PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT, PipelineTessellationDomainOriginStateCreateInfo, PipelineTessellationStateCreateInfo, PipelineVertexInputDivisorStateCreateInfoEXT, PipelineVertexInputStateCreateInfo, PipelineViewportCoarseSampleOrderStateCreateInfoNV, PipelineViewportExclusiveScissorStateCreateInfoNV, PipelineViewportShadingRateImageStateCreateInfoNV, PipelineViewportStateCreateInfo, PipelineViewportSwizzleStateCreateInfoNV, PipelineViewportWScalingStateCreateInfoNV, PresentFrameTokenGGP, PresentInfoKHR, PresentRegionKHR, PresentRegionsKHR, PresentTimeGOOGLE, PresentTimesInfoGOOGLE, PrivateDataSlotCreateInfoEXT, PrivateDataSlotEXT, ProtectedSubmitInfo, PushConstantRange, QueryPool, QueryPoolCreateInfo, QueryPoolPerformanceCreateInfoKHR, QueryPoolPerformanceQueryCreateInfoINTEL, Queue, QueueFamilyCheckpointPropertiesNV, QueueFamilyProperties, QueueFamilyProperties2, RayTracingPipelineCreateInfoKHR, RayTracingPipelineCreateInfoNV, RayTracingPipelineInterfaceCreateInfoKHR, RayTracingShaderGroupCreateInfoKHR, RayTracingShaderGroupCreateInfoNV, Rect2D, RectLayerKHR, RefreshCycleDurationGOOGLE, RenderPass, RenderPassAttachmentBeginInfo, RenderPassBeginInfo, RenderPassCreateInfo, RenderPassCreateInfo2, RenderPassFragmentDensityMapCreateInfoEXT, RenderPassInputAttachmentAspectCreateInfo, RenderPassMultiviewCreateInfo, RenderPassSampleLocationsBeginInfoEXT, RenderPassTransformBeginInfoQCOM, SampleLocationEXT, SampleLocationsInfoEXT, Sampler, SamplerCreateInfo, SamplerCustomBorderColorCreateInfoEXT, SamplerReductionModeCreateInfo, SamplerYcbcrConversion, SamplerYcbcrConversionCreateInfo, SamplerYcbcrConversionImageFormatProperties, SamplerYcbcrConversionInfo, Semaphore, SemaphoreCreateInfo, SemaphoreGetFdInfoKHR, SemaphoreGetWin32HandleInfoKHR, SemaphoreSignalInfo, SemaphoreTypeCreateInfo, SemaphoreWaitInfo, SetStateFlagsIndirectCommandNV, ShaderModule, ShaderModuleCreateInfo, ShaderModuleValidationCacheCreateInfoEXT, ShaderResourceUsageAMD, ShaderStatisticsInfoAMD, ShadingRatePaletteNV, SharedPresentSurfaceCapabilitiesKHR, SparseBufferMemoryBindInfo, SparseImageFormatProperties, SparseImageFormatProperties2, SparseImageMemoryBind, SparseImageMemoryBindInfo, SparseImageMemoryRequirements, SparseImageMemoryRequirements2, SparseImageOpaqueMemoryBindInfo, SparseMemoryBind, SpecializationInfo, SpecializationMapEntry, StencilOpState, StreamDescriptorSurfaceCreateInfoGGP, StridedBufferRegionKHR, SubmitInfo, SubpassBeginInfo, SubpassDependency, SubpassDependency2, SubpassDescription, SubpassDescription2, SubpassDescriptionDepthStencilResolve, SubpassEndInfo, SubpassSampleLocationsEXT, SubresourceLayout, SurfaceCapabilities2EXT, SurfaceCapabilities2KHR, SurfaceCapabilitiesFullScreenExclusiveEXT, SurfaceCapabilitiesKHR, SurfaceFormat2KHR, SurfaceFormatKHR, SurfaceFullScreenExclusiveInfoEXT, SurfaceFullScreenExclusiveWin32InfoEXT, SurfaceKHR, SurfaceProtectedCapabilitiesKHR, SwapchainCounterCreateInfoEXT, SwapchainCreateInfoKHR, SwapchainDisplayNativeHdrCreateInfoAMD, SwapchainKHR, TextureLODGatherFormatPropertiesAMD, TimelineSemaphoreSubmitInfo, TraceRaysIndirectCommandKHR, TransformMatrixKHR, ValidationCacheCreateInfoEXT, ValidationCacheEXT, ValidationFeaturesEXT, ValidationFlagsEXT, VertexInputAttributeDescription, VertexInputBindingDescription, VertexInputBindingDivisorDescriptionEXT, ViSurfaceCreateInfoNN, Viewport, ViewportSwizzleNV, ViewportWScalingNV, WaylandSurfaceCreateInfoKHR, Win32KeyedMutexAcquireReleaseInfoKHR, Win32KeyedMutexAcquireReleaseInfoNV, Win32SurfaceCreateInfoKHR, WriteDescriptorSet, WriteDescriptorSetAccelerationStructureKHR, WriteDescriptorSetInlineUniformBlockEXT, XYColorEXT, XcbSurfaceCreateInfoKHR, XlibSurfaceCreateInfoKHR, acquire_full_screen_exclusive_mode_ext, acquire_next_image_2_khr, acquire_next_image_khr, acquire_performance_configuration_intel, acquire_profiling_lock_khr, acquire_xlib_display_ext, allocate_command_buffers, allocate_descriptor_sets, allocate_memory, begin_command_buffer, bind_acceleration_structure_memory_khr, bind_buffer_memory, bind_buffer_memory_2, bind_image_memory, bind_image_memory_2, build_acceleration_structure_khr, cmd_begin_conditional_rendering_ext, cmd_begin_debug_utils_label_ext, cmd_begin_query, cmd_begin_query_indexed_ext, cmd_begin_render_pass, cmd_begin_render_pass_2, cmd_begin_transform_feedback_ext, cmd_bind_descriptor_sets, cmd_bind_index_buffer, cmd_bind_pipeline, cmd_bind_pipeline_shader_group_nv, cmd_bind_shading_rate_image_nv, cmd_bind_transform_feedback_buffers_ext, cmd_bind_vertex_buffers, cmd_bind_vertex_buffers_2_ext, cmd_blit_image, cmd_build_acceleration_structure_indirect_khr, cmd_build_acceleration_structure_khr, cmd_build_acceleration_structure_nv, cmd_clear_attachments, cmd_clear_color_image, cmd_clear_depth_stencil_image, cmd_copy_acceleration_structure_khr, cmd_copy_acceleration_structure_nv, cmd_copy_acceleration_structure_to_memory_khr, cmd_copy_buffer, cmd_copy_buffer_to_image, cmd_copy_image, cmd_copy_image_to_buffer, cmd_copy_memory_to_acceleration_structure_khr, cmd_copy_query_pool_results, cmd_debug_marker_begin_ext, cmd_debug_marker_end_ext, cmd_debug_marker_insert_ext, cmd_dispatch, cmd_dispatch_base, cmd_dispatch_indirect, cmd_draw, cmd_draw_indexed, cmd_draw_indexed_indirect, cmd_draw_indexed_indirect_count, cmd_draw_indirect, cmd_draw_indirect_byte_count_ext, cmd_draw_indirect_count, cmd_draw_mesh_tasks_indirect_count_nv, cmd_draw_mesh_tasks_indirect_nv, cmd_draw_mesh_tasks_nv, cmd_end_conditional_rendering_ext, cmd_end_debug_utils_label_ext, cmd_end_query, cmd_end_query_indexed_ext, cmd_end_render_pass, cmd_end_render_pass_2, cmd_end_transform_feedback_ext, cmd_execute_commands, cmd_execute_generated_commands_nv, cmd_fill_buffer, cmd_insert_debug_utils_label_ext, cmd_next_subpass, cmd_next_subpass_2, cmd_pipeline_barrier, cmd_preprocess_generated_commands_nv, cmd_push_constants, cmd_push_descriptor_set_khr, cmd_push_descriptor_set_with_template_khr, cmd_reset_event, cmd_reset_query_pool, cmd_resolve_image, cmd_set_blend_constants, cmd_set_checkpoint_nv, cmd_set_coarse_sample_order_nv, cmd_set_cull_mode_ext, cmd_set_depth_bias, cmd_set_depth_bounds, cmd_set_depth_bounds_test_enable_ext, cmd_set_depth_compare_op_ext, cmd_set_depth_test_enable_ext, cmd_set_depth_write_enable_ext, cmd_set_device_mask, cmd_set_discard_rectangle_ext, cmd_set_event, cmd_set_exclusive_scissor_nv, cmd_set_front_face_ext, cmd_set_line_stipple_ext, cmd_set_line_width, cmd_set_performance_marker_intel, cmd_set_performance_override_intel, cmd_set_performance_stream_marker_intel, cmd_set_primitive_topology_ext, cmd_set_sample_locations_ext, cmd_set_scissor, cmd_set_scissor_with_count_ext, cmd_set_stencil_compare_mask, cmd_set_stencil_op_ext, cmd_set_stencil_reference, cmd_set_stencil_test_enable_ext, cmd_set_stencil_write_mask, cmd_set_viewport, cmd_set_viewport_shading_rate_palette_nv, cmd_set_viewport_w_scaling_nv, cmd_set_viewport_with_count_ext, cmd_trace_rays_indirect_khr, cmd_trace_rays_khr, cmd_trace_rays_nv, cmd_update_buffer, cmd_wait_events, cmd_write_acceleration_structures_properties_khr, cmd_write_buffer_marker_amd, cmd_write_timestamp, compile_deferred_nv, copy_acceleration_structure_khr, copy_acceleration_structure_to_memory_khr, copy_memory_to_acceleration_structure_khr, create_acceleration_structure_khr, create_acceleration_structure_nv, create_android_surface_khr, create_buffer, create_buffer_view, create_command_pool, create_compute_pipelines, create_debug_report_callback_ext, create_debug_utils_messenger_ext, create_deferred_operation_khr, create_descriptor_pool, create_descriptor_set_layout, create_descriptor_update_template, create_device, create_direct_fb_surface_ext, create_display_mode_khr, create_display_plane_surface_khr, create_event, create_fence, create_framebuffer, create_graphics_pipelines, create_headless_surface_ext, create_image, create_image_pipe_surface_fuchsia, create_image_view, create_indirect_commands_layout_nv, create_instance, create_ios_surface_mvk, create_mac_os_surface_mvk, create_metal_surface_ext, create_pipeline_cache, create_pipeline_layout, create_private_data_slot_ext, create_query_pool, create_ray_tracing_pipelines_khr, create_ray_tracing_pipelines_nv, create_render_pass, create_render_pass_2, create_sampler, create_sampler_ycbcr_conversion, create_semaphore, create_shader_module, create_shared_swapchains_khr, create_stream_descriptor_surface_ggp, create_swapchain_khr, create_validation_cache_ext, create_vi_surface_nn, create_wayland_surface_khr, create_win_32_surface_khr, create_xcb_surface_khr, create_xlib_surface_khr, debug_marker_set_object_name_ext, debug_marker_set_object_tag_ext, debug_report_message_ext, deferred_operation_join_khr, destroy_acceleration_structure_khr, destroy_buffer, destroy_buffer_view, destroy_command_pool, destroy_debug_report_callback_ext, destroy_debug_utils_messenger_ext, destroy_deferred_operation_khr, destroy_descriptor_pool, destroy_descriptor_set_layout, destroy_descriptor_update_template, destroy_device, destroy_event, destroy_fence, destroy_framebuffer, destroy_image, destroy_image_view, destroy_indirect_commands_layout_nv, destroy_instance, destroy_pipeline, destroy_pipeline_cache, destroy_pipeline_layout, destroy_private_data_slot_ext, destroy_query_pool, destroy_render_pass, destroy_sampler, destroy_sampler_ycbcr_conversion, destroy_semaphore, destroy_shader_module, destroy_surface_khr, destroy_swapchain_khr, destroy_validation_cache_ext, device_wait_idle, display_power_control_ext, end_command_buffer, enumerate_device_extension_properties, enumerate_device_layer_properties, enumerate_instance_extension_properties, enumerate_instance_layer_properties, enumerate_instance_version, enumerate_physical_device_groups, enumerate_physical_device_queue_family_performance_query_counters_khr, enumerate_physical_devices, flush_mapped_memory_ranges, free_command_buffers, free_descriptor_sets, free_memory, from_vk, get_acceleration_structure_device_address_khr, get_acceleration_structure_handle_nv, get_acceleration_structure_memory_requirements_khr, get_acceleration_structure_memory_requirements_nv, get_android_hardware_buffer_properties_android, get_buffer_device_address, get_buffer_memory_requirements, get_buffer_memory_requirements_2, get_buffer_opaque_capture_address, get_calibrated_timestamps_ext, get_deferred_operation_max_concurrency_khr, get_deferred_operation_result_khr, get_descriptor_set_layout_support, get_device_acceleration_structure_compatibility_khr, get_device_group_peer_memory_features, get_device_group_present_capabilities_khr, get_device_group_surface_present_modes_2_ext, get_device_group_surface_present_modes_khr, get_device_memory_commitment, get_device_memory_opaque_capture_address, get_device_proc_addr, get_device_queue, get_device_queue_2, get_display_mode_properties_2_khr, get_display_mode_properties_khr, get_display_plane_capabilities_2_khr, get_display_plane_capabilities_khr, get_display_plane_supported_displays_khr, get_event_status, get_fence_fd_khr, get_fence_status, get_fence_win_32_handle_khr, get_generated_commands_memory_requirements_nv, get_image_drm_format_modifier_properties_ext, get_image_memory_requirements, get_image_memory_requirements_2, get_image_sparse_memory_requirements, get_image_sparse_memory_requirements_2, get_image_subresource_layout, get_image_view_address_nvx, get_image_view_handle_nvx, get_instance_proc_addr, get_memory_android_hardware_buffer_android, get_memory_fd_khr, get_memory_fd_properties_khr, get_memory_host_pointer_properties_ext, get_memory_win_32_handle_khr, get_memory_win_32_handle_nv, get_memory_win_32_handle_properties_khr, get_past_presentation_timing_google, get_performance_parameter_intel, get_physical_device_calibrateable_time_domains_ext, get_physical_device_cooperative_matrix_properties_nv, get_physical_device_direct_fb_presentation_support_ext, get_physical_device_display_plane_properties_2_khr, get_physical_device_display_plane_properties_khr, get_physical_device_display_properties_2_khr, get_physical_device_display_properties_khr, get_physical_device_external_buffer_properties, get_physical_device_external_fence_properties, get_physical_device_external_image_format_properties_nv, get_physical_device_external_semaphore_properties, get_physical_device_features, get_physical_device_features_2, get_physical_device_format_properties, get_physical_device_format_properties_2, get_physical_device_image_format_properties, get_physical_device_image_format_properties_2, get_physical_device_memory_properties, get_physical_device_memory_properties_2, get_physical_device_multisample_properties_ext, get_physical_device_present_rectangles_khr, get_physical_device_properties, get_physical_device_properties_2, get_physical_device_queue_family_performance_query_passes_khr, get_physical_device_queue_family_properties, get_physical_device_queue_family_properties_2, get_physical_device_sparse_image_format_properties, get_physical_device_sparse_image_format_properties_2, get_physical_device_supported_framebuffer_mixed_samples_combinations_nv, get_physical_device_surface_capabilities_2_ext, get_physical_device_surface_capabilities_2_khr, get_physical_device_surface_capabilities_khr, get_physical_device_surface_formats_2_khr, get_physical_device_surface_formats_khr, get_physical_device_surface_present_modes_2_ext, get_physical_device_surface_present_modes_khr, get_physical_device_surface_support_khr, get_physical_device_tool_properties_ext, get_physical_device_wayland_presentation_support_khr, get_physical_device_win_32_presentation_support_khr, get_physical_device_xcb_presentation_support_khr, get_physical_device_xlib_presentation_support_khr, get_pipeline_cache_data, get_pipeline_executable_internal_representations_khr, get_pipeline_executable_properties_khr, get_pipeline_executable_statistics_khr, get_private_data_ext, get_query_pool_results, get_queue_checkpoint_data_nv, get_rand_r_output_display_ext, get_ray_tracing_capture_replay_shader_group_handles_khr, get_ray_tracing_shader_group_handles_khr, get_refresh_cycle_duration_google, get_render_area_granularity, get_semaphore_counter_value, get_semaphore_fd_khr, get_semaphore_win_32_handle_khr, get_shader_info_amd, get_swapchain_counter_ext, get_swapchain_images_khr, get_swapchain_status_khr, get_validation_cache_data_ext, import_fence_fd_khr, import_fence_win_32_handle_khr, import_semaphore_fd_khr, import_semaphore_win_32_handle_khr, initialize_performance_api_intel, invalidate_mapped_memory_ranges, map_memory, merge_pipeline_caches, merge_validation_caches_ext, queue_begin_debug_utils_label_ext, queue_bind_sparse, queue_end_debug_utils_label_ext, queue_insert_debug_utils_label_ext, queue_present_khr, queue_set_performance_configuration_intel, queue_submit, queue_wait_idle, register_device_event_ext, register_display_event_ext, release_display_ext, release_full_screen_exclusive_mode_ext, release_performance_configuration_intel, release_profiling_lock_khr, reset_command_buffer, reset_command_pool, reset_descriptor_pool, reset_event, reset_fences, reset_query_pool, set_debug_utils_object_name_ext, set_debug_utils_object_tag_ext, set_event, set_hdr_metadata_ext, set_local_dimming_amd, set_private_data_ext, signal_semaphore, submit_debug_utils_message_ext, trim_command_pool, uninitialize_performance_api_intel, unmap_memory, update_descriptor_set_with_template, update_descriptor_sets, wait_for_fences, wait_semaphores, write_acceleration_structures_properties_khr, VkImageLayout, VkAttachmentLoadOp, VkAttachmentStoreOp, VkImageType, VkImageTiling, VkImageViewType, VkCommandBufferLevel, VkComponentSwizzle, VkDescriptorType, VkQueryType, VkBorderColor, VkPipelineBindPoint, VkPipelineCacheHeaderVersion, VkPrimitiveTopology, VkSharingMode, VkIndexType, VkFilter, VkSamplerMipmapMode, VkSamplerAddressMode, VkCompareOp, VkPolygonMode, VkFrontFace, VkBlendFactor, VkBlendOp, VkStencilOp, VkLogicOp, VkInternalAllocationType, VkSystemAllocationScope, VkPhysicalDeviceType, VkVertexInputRate, VkFormat, VkStructureType, VkSubpassContents, VkResult, VkDynamicState, VkDescriptorUpdateTemplateType, VkObjectType, VkSemaphoreType, VkPresentModeKHR, VkColorSpaceKHR, VkTimeDomainEXT, VkDebugReportObjectTypeEXT, VkRasterizationOrderAMD, VkValidationCheckEXT, VkValidationFeatureEnableEXT, VkValidationFeatureDisableEXT, VkIndirectCommandsTokenTypeNV, VkDisplayPowerStateEXT, VkDeviceEventTypeEXT, VkDisplayEventTypeEXT, VkViewportCoordinateSwizzleNV, VkDiscardRectangleModeEXT, VkPointClippingBehavior, VkSamplerReductionMode, VkTessellationDomainOrigin, VkSamplerYcbcrModelConversion, VkSamplerYcbcrRange, VkChromaLocation, VkBlendOverlapEXT, VkCoverageModulationModeNV, VkCoverageReductionModeNV, VkValidationCacheHeaderVersionEXT, VkShaderInfoTypeAMD, VkQueueGlobalPriorityEXT, VkConservativeRasterizationModeEXT, VkVendorId, VkDriverId, VkShadingRatePaletteEntryNV, VkCoarseSampleOrderTypeNV, VkCopyAccelerationStructureModeKHR, VkAccelerationStructureTypeKHR, VkGeometryTypeKHR, VkAccelerationStructureMemoryRequirementsTypeKHR, VkAccelerationStructureBuildTypeKHR, VkRayTracingShaderGroupTypeKHR, VkMemoryOverallocationBehaviorAMD, VkScopeNV, VkComponentTypeNV, VkFullScreenExclusiveEXT, VkPerformanceCounterScopeKHR, VkPerformanceCounterUnitKHR, VkPerformanceCounterStorageKHR, VkPerformanceConfigurationTypeINTEL, VkQueryPoolSamplingModeINTEL, VkPerformanceOverrideTypeINTEL, VkPerformanceParameterTypeINTEL, VkPerformanceValueTypeINTEL, VkShaderFloatControlsIndependence, VkPipelineExecutableStatisticFormatKHR, VkLineRasterizationModeEXT, VkPipelineCacheCreateFlagBits, VkCullModeFlagBits, VkQueueFlagBits, VkRenderPassCreateFlagBits, VkDeviceQueueCreateFlagBits, VkMemoryPropertyFlagBits, VkMemoryHeapFlagBits, VkAccessFlagBits, VkBufferUsageFlagBits, VkBufferCreateFlagBits, VkShaderStageFlagBits, VkImageUsageFlagBits, VkImageCreateFlagBits, VkImageViewCreateFlagBits, VkSamplerCreateFlagBits, VkPipelineCreateFlagBits, VkPipelineShaderStageCreateFlagBits, VkColorComponentFlagBits, VkFenceCreateFlagBits, VkSemaphoreCreateFlagBits, VkFormatFeatureFlagBits, VkQueryControlFlagBits, VkQueryResultFlagBits, VkCommandBufferUsageFlagBits, VkQueryPipelineStatisticFlagBits, VkImageAspectFlagBits, VkSparseImageFormatFlagBits, VkSparseMemoryBindFlagBits, VkPipelineStageFlagBits, VkCommandPoolCreateFlagBits, VkCommandPoolResetFlagBits, VkCommandBufferResetFlagBits, VkSampleCountFlagBits, VkAttachmentDescriptionFlagBits, VkStencilFaceFlagBits, VkDescriptorPoolCreateFlagBits, VkDependencyFlagBits, VkSemaphoreWaitFlagBits, VkDisplayPlaneAlphaFlagBitsKHR, VkCompositeAlphaFlagBitsKHR, VkSurfaceTransformFlagBitsKHR, VkDebugReportFlagBitsEXT, VkExternalMemoryHandleTypeFlagBitsNV, VkExternalMemoryFeatureFlagBitsNV, VkSubgroupFeatureFlagBits, VkIndirectCommandsLayoutUsageFlagBitsNV, VkIndirectStateFlagBitsNV, VkPrivateDataSlotCreateFlagBitsEXT, VkDescriptorSetLayoutCreateFlagBits, VkExternalMemoryHandleTypeFlagBits, VkExternalMemoryFeatureFlagBits, VkExternalSemaphoreHandleTypeFlagBits, VkExternalSemaphoreFeatureFlagBits, VkSemaphoreImportFlagBits, VkExternalFenceHandleTypeFlagBits, VkExternalFenceFeatureFlagBits, VkFenceImportFlagBits, VkSurfaceCounterFlagBitsEXT, VkPeerMemoryFeatureFlagBits, VkMemoryAllocateFlagBits, VkDeviceGroupPresentModeFlagBitsKHR, VkSwapchainCreateFlagBitsKHR, VkSubpassDescriptionFlagBits, VkDebugUtilsMessageSeverityFlagBitsEXT, VkDebugUtilsMessageTypeFlagBitsEXT, VkDescriptorBindingFlagBits, VkConditionalRenderingFlagBitsEXT, VkResolveModeFlagBits, VkGeometryInstanceFlagBitsKHR, VkGeometryFlagBitsKHR, VkBuildAccelerationStructureFlagBitsKHR, VkFramebufferCreateFlagBits, VkDeviceDiagnosticsConfigFlagBitsNV, VkPipelineCreationFeedbackFlagBitsEXT, VkPerformanceCounterDescriptionFlagBitsKHR, VkAcquireProfilingLockFlagBitsKHR, VkShaderCorePropertiesFlagBitsAMD, VkShaderModuleCreateFlagBits, VkPipelineCompilerControlFlagBitsAMD, VkToolPurposeFlagBitsEXT
