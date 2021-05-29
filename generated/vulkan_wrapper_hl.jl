struct PhysicalDeviceProvokingVertexFeaturesEXT <: HighLevelStruct
    next::Any
    provoking_vertex_last::Bool
    transform_feedback_preserves_provoking_vertex::Bool
end

struct PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT <: HighLevelStruct
    next::Any
    ycbcr_444_formats::Bool
end

struct PhysicalDeviceInheritedViewportScissorFeaturesNV <: HighLevelStruct
    next::Any
    inherited_viewport_scissor_2_d::Bool
end

struct VideoEncodeH264ProfileEXT <: HighLevelStruct
    next::Any
    std_profile_idc::StdVideoH264ProfileIdc
end

struct VideoEncodeH264EmitPictureParametersEXT <: HighLevelStruct
    next::Any
    sps_id::UInt8
    emit_sps_enable::Bool
    pps_id_entries::Vector{UInt8}
end

struct VideoEncodeH264DpbSlotInfoEXT <: HighLevelStruct
    next::Any
    slot_index::Int8
    std_picture_info::StdVideoEncodeH264PictureInfo
end

struct VideoEncodeH264NaluSliceEXT <: HighLevelStruct
    next::Any
    slice_header_std::StdVideoEncodeH264SliceHeader
    mb_count::UInt32
    ref_final_list_0_entries::Vector{VideoEncodeH264DpbSlotInfoEXT}
    ref_final_list_1_entries::Vector{VideoEncodeH264DpbSlotInfoEXT}
    preceding_nalu_bytes::UInt32
    min_qp::UInt8
    max_qp::UInt8
end

struct VideoEncodeH264VclFrameInfoEXT <: HighLevelStruct
    next::Any
    ref_default_final_list_0_entries::Vector{VideoEncodeH264DpbSlotInfoEXT}
    ref_default_final_list_1_entries::Vector{VideoEncodeH264DpbSlotInfoEXT}
    nalu_slice_entries::Vector{VideoEncodeH264NaluSliceEXT}
    current_picture_info::VideoEncodeH264DpbSlotInfoEXT
end

struct VideoEncodeH264SessionParametersAddInfoEXT <: HighLevelStruct
    next::Any
    sps_std::OptionalPtr{Vector{StdVideoH264SequenceParameterSet}}
    pps_std::OptionalPtr{Vector{StdVideoH264PictureParameterSet}}
end

struct VideoEncodeH264SessionParametersCreateInfoEXT <: HighLevelStruct
    next::Any
    max_sps_std_count::UInt32
    max_pps_std_count::UInt32
    parameters_add_info::OptionalPtr{VideoEncodeH264SessionParametersAddInfoEXT}
end

struct VideoEndCodingInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
end

struct VideoSessionParametersUpdateInfoKHR <: HighLevelStruct
    next::Any
    update_sequence_count::UInt32
end

struct VideoDecodeH265DpbSlotInfoEXT <: HighLevelStruct
    next::Any
    std_reference_info::StdVideoDecodeH265ReferenceInfo
end

struct VideoDecodeH265PictureInfoEXT <: HighLevelStruct
    next::Any
    std_picture_info::StdVideoDecodeH265PictureInfo
    slices_data_offsets::Vector{UInt32}
end

struct VideoDecodeH265SessionParametersAddInfoEXT <: HighLevelStruct
    next::Any
    sps_std::OptionalPtr{Vector{StdVideoH265SequenceParameterSet}}
    pps_std::OptionalPtr{Vector{StdVideoH265PictureParameterSet}}
end

struct VideoDecodeH265SessionParametersCreateInfoEXT <: HighLevelStruct
    next::Any
    max_sps_std_count::UInt32
    max_pps_std_count::UInt32
    parameters_add_info::OptionalPtr{VideoDecodeH265SessionParametersAddInfoEXT}
end

struct VideoDecodeH265ProfileEXT <: HighLevelStruct
    next::Any
    std_profile_idc::StdVideoH265ProfileIdc
end

struct VideoDecodeH264MvcEXT <: HighLevelStruct
    next::Any
    std_mvc::StdVideoDecodeH264Mvc
end

struct VideoDecodeH264DpbSlotInfoEXT <: HighLevelStruct
    next::Any
    std_reference_info::StdVideoDecodeH264ReferenceInfo
end

struct VideoDecodeH264PictureInfoEXT <: HighLevelStruct
    next::Any
    std_picture_info::StdVideoDecodeH264PictureInfo
    slices_data_offsets::Vector{UInt32}
end

struct VideoDecodeH264SessionParametersAddInfoEXT <: HighLevelStruct
    next::Any
    sps_std::OptionalPtr{Vector{StdVideoH264SequenceParameterSet}}
    pps_std::OptionalPtr{Vector{StdVideoH264PictureParameterSet}}
end

struct VideoDecodeH264SessionParametersCreateInfoEXT <: HighLevelStruct
    next::Any
    max_sps_std_count::UInt32
    max_pps_std_count::UInt32
    parameters_add_info::OptionalPtr{VideoDecodeH264SessionParametersAddInfoEXT}
end

struct PhysicalDeviceSynchronization2FeaturesKHR <: HighLevelStruct
    next::Any
    synchronization2::Bool
end

struct MemoryBarrier2KHR <: HighLevelStruct
    next::Any
    src_stage_mask::UInt64
    src_access_mask::UInt64
    dst_stage_mask::UInt64
    dst_access_mask::UInt64
end

struct PipelineColorWriteCreateInfoEXT <: HighLevelStruct
    next::Any
    color_write_enables::Vector{Bool}
end

struct PhysicalDeviceColorWriteEnableFeaturesEXT <: HighLevelStruct
    next::Any
    color_write_enable::Bool
end

struct PhysicalDeviceVertexInputDynamicStateFeaturesEXT <: HighLevelStruct
    next::Any
    vertex_input_dynamic_state::Bool
end

struct PhysicalDeviceMutableDescriptorTypeFeaturesVALVE <: HighLevelStruct
    next::Any
    mutable_descriptor_type::Bool
end

struct AccelerationStructureBuildSizesInfoKHR <: HighLevelStruct
    next::Any
    acceleration_structure_size::UInt64
    update_scratch_size::UInt64
    build_scratch_size::UInt64
end

struct PhysicalDeviceFragmentShadingRateEnumsFeaturesNV <: HighLevelStruct
    next::Any
    fragment_shading_rate_enums::Bool
    supersample_fragment_shading_rates::Bool
    no_invocation_fragment_shading_rates::Bool
end

struct PhysicalDeviceShaderTerminateInvocationFeaturesKHR <: HighLevelStruct
    next::Any
    shader_terminate_invocation::Bool
end

struct PhysicalDeviceFragmentShadingRateFeaturesKHR <: HighLevelStruct
    next::Any
    pipeline_fragment_shading_rate::Bool
    primitive_fragment_shading_rate::Bool
    attachment_fragment_shading_rate::Bool
end

struct PhysicalDeviceShaderImageAtomicInt64FeaturesEXT <: HighLevelStruct
    next::Any
    shader_image_int_64_atomics::Bool
    sparse_image_int_64_atomics::Bool
end

struct BufferCopy2KHR <: HighLevelStruct
    next::Any
    src_offset::UInt64
    dst_offset::UInt64
    size::UInt64
end

struct PhysicalDevice4444FormatsFeaturesEXT <: HighLevelStruct
    next::Any
    format_a4r4g4b4::Bool
    format_a4b4g4r4::Bool
end

struct PhysicalDevicePortabilitySubsetPropertiesKHR <: HighLevelStruct
    next::Any
    min_vertex_input_binding_stride_alignment::UInt32
end

struct PhysicalDevicePortabilitySubsetFeaturesKHR <: HighLevelStruct
    next::Any
    constant_alpha_color_blend_factors::Bool
    events::Bool
    image_view_format_reinterpretation::Bool
    image_view_format_swizzle::Bool
    image_view_2_d_on_3_d_image::Bool
    multisample_array_image::Bool
    mutable_comparison_samplers::Bool
    point_polygons::Bool
    sampler_mip_lod_bias::Bool
    separate_stencil_mask_ref::Bool
    shader_sample_rate_interpolation_functions::Bool
    tessellation_isolines::Bool
    tessellation_point_mode::Bool
    triangle_fans::Bool
    vertex_attribute_access_beyond_stride::Bool
end

struct PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR <: HighLevelStruct
    next::Any
    workgroup_memory_explicit_layout::Bool
    workgroup_memory_explicit_layout_scalar_block_layout::Bool
    workgroup_memory_explicit_layout_8_bit_access::Bool
    workgroup_memory_explicit_layout_16_bit_access::Bool
end

struct PhysicalDeviceImageRobustnessFeaturesEXT <: HighLevelStruct
    next::Any
    robust_image_access::Bool
end

struct PhysicalDeviceRobustness2FeaturesEXT <: HighLevelStruct
    next::Any
    robust_buffer_access_2::Bool
    robust_image_access_2::Bool
    null_descriptor::Bool
end

struct PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR <: HighLevelStruct
    next::Any
    shader_zero_initialize_workgroup_memory::Bool
end

struct PhysicalDeviceDiagnosticsConfigFeaturesNV <: HighLevelStruct
    next::Any
    diagnostics_config::Bool
end

struct PhysicalDeviceExtendedDynamicState2FeaturesEXT <: HighLevelStruct
    next::Any
    extended_dynamic_state_2::Bool
    extended_dynamic_state_2_logic_op::Bool
    extended_dynamic_state_2_patch_control_points::Bool
end

struct PhysicalDeviceExtendedDynamicStateFeaturesEXT <: HighLevelStruct
    next::Any
    extended_dynamic_state::Bool
end

struct RayTracingPipelineInterfaceCreateInfoKHR <: HighLevelStruct
    next::Any
    max_pipeline_ray_payload_size::UInt32
    max_pipeline_ray_hit_attribute_size::UInt32
end

struct AccelerationStructureVersionInfoKHR <: HighLevelStruct
    next::Any
    version_data::Vector{UInt8}
end

struct TransformMatrixKHR <: HighLevelStruct
    matrix::NTuple{3, NTuple{4, Float32}}
end

struct AabbPositionsKHR <: HighLevelStruct
    min_x::Float32
    min_y::Float32
    min_z::Float32
    max_x::Float32
    max_y::Float32
    max_z::Float32
end

struct AccelerationStructureBuildRangeInfoKHR <: HighLevelStruct
    primitive_count::UInt32
    primitive_offset::UInt32
    first_vertex::UInt32
    transform_offset::UInt32
end

struct AccelerationStructureGeometryInstancesDataKHR <: HighLevelStruct
    next::Any
    array_of_pointers::Bool
    data::VkDeviceOrHostAddressConstKHR
end

struct AccelerationStructureGeometryAabbsDataKHR <: HighLevelStruct
    next::Any
    data::VkDeviceOrHostAddressConstKHR
    stride::UInt64
end

struct PhysicalDeviceCustomBorderColorFeaturesEXT <: HighLevelStruct
    next::Any
    custom_border_colors::Bool
    custom_border_color_without_format::Bool
end

struct PhysicalDeviceCoherentMemoryFeaturesAMD <: HighLevelStruct
    next::Any
    device_coherent_memory::Bool
end

struct PhysicalDeviceVulkan12Features <: HighLevelStruct
    next::Any
    sampler_mirror_clamp_to_edge::Bool
    draw_indirect_count::Bool
    storage_buffer_8_bit_access::Bool
    uniform_and_storage_buffer_8_bit_access::Bool
    storage_push_constant_8::Bool
    shader_buffer_int_64_atomics::Bool
    shader_shared_int_64_atomics::Bool
    shader_float_16::Bool
    shader_int_8::Bool
    descriptor_indexing::Bool
    shader_input_attachment_array_dynamic_indexing::Bool
    shader_uniform_texel_buffer_array_dynamic_indexing::Bool
    shader_storage_texel_buffer_array_dynamic_indexing::Bool
    shader_uniform_buffer_array_non_uniform_indexing::Bool
    shader_sampled_image_array_non_uniform_indexing::Bool
    shader_storage_buffer_array_non_uniform_indexing::Bool
    shader_storage_image_array_non_uniform_indexing::Bool
    shader_input_attachment_array_non_uniform_indexing::Bool
    shader_uniform_texel_buffer_array_non_uniform_indexing::Bool
    shader_storage_texel_buffer_array_non_uniform_indexing::Bool
    descriptor_binding_uniform_buffer_update_after_bind::Bool
    descriptor_binding_sampled_image_update_after_bind::Bool
    descriptor_binding_storage_image_update_after_bind::Bool
    descriptor_binding_storage_buffer_update_after_bind::Bool
    descriptor_binding_uniform_texel_buffer_update_after_bind::Bool
    descriptor_binding_storage_texel_buffer_update_after_bind::Bool
    descriptor_binding_update_unused_while_pending::Bool
    descriptor_binding_partially_bound::Bool
    descriptor_binding_variable_descriptor_count::Bool
    runtime_descriptor_array::Bool
    sampler_filter_minmax::Bool
    scalar_block_layout::Bool
    imageless_framebuffer::Bool
    uniform_buffer_standard_layout::Bool
    shader_subgroup_extended_types::Bool
    separate_depth_stencil_layouts::Bool
    host_query_reset::Bool
    timeline_semaphore::Bool
    buffer_device_address::Bool
    buffer_device_address_capture_replay::Bool
    buffer_device_address_multi_device::Bool
    vulkan_memory_model::Bool
    vulkan_memory_model_device_scope::Bool
    vulkan_memory_model_availability_visibility_chains::Bool
    shader_output_viewport_index::Bool
    shader_output_layer::Bool
    subgroup_broadcast_dynamic_id::Bool
end

struct PhysicalDeviceVulkan11Features <: HighLevelStruct
    next::Any
    storage_buffer_16_bit_access::Bool
    uniform_and_storage_buffer_16_bit_access::Bool
    storage_push_constant_16::Bool
    storage_input_output_16::Bool
    multiview::Bool
    multiview_geometry_shader::Bool
    multiview_tessellation_shader::Bool
    variable_pointers_storage_buffer::Bool
    variable_pointers::Bool
    protected_memory::Bool
    sampler_ycbcr_conversion::Bool
    shader_draw_parameters::Bool
end

struct PhysicalDevicePipelineCreationCacheControlFeaturesEXT <: HighLevelStruct
    next::Any
    pipeline_creation_cache_control::Bool
end

struct PhysicalDeviceLineRasterizationFeaturesEXT <: HighLevelStruct
    next::Any
    rectangular_lines::Bool
    bresenham_lines::Bool
    smooth_lines::Bool
    stippled_rectangular_lines::Bool
    stippled_bresenham_lines::Bool
    stippled_smooth_lines::Bool
end

struct MemoryOpaqueCaptureAddressAllocateInfo <: HighLevelStruct
    next::Any
    opaque_capture_address::UInt64
end

struct PhysicalDeviceSubgroupSizeControlFeaturesEXT <: HighLevelStruct
    next::Any
    subgroup_size_control::Bool
    compute_full_subgroups::Bool
end

struct PhysicalDeviceTexelBufferAlignmentFeaturesEXT <: HighLevelStruct
    next::Any
    texel_buffer_alignment::Bool
end

struct PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT <: HighLevelStruct
    next::Any
    shader_demote_to_helper_invocation::Bool
end

struct PhysicalDevicePipelineExecutablePropertiesFeaturesKHR <: HighLevelStruct
    next::Any
    pipeline_executable_info::Bool
end

struct PhysicalDeviceSeparateDepthStencilLayoutsFeatures <: HighLevelStruct
    next::Any
    separate_depth_stencil_layouts::Bool
end

struct PhysicalDeviceFragmentShaderInterlockFeaturesEXT <: HighLevelStruct
    next::Any
    fragment_shader_sample_interlock::Bool
    fragment_shader_pixel_interlock::Bool
    fragment_shader_shading_rate_interlock::Bool
end

struct PhysicalDeviceShaderSMBuiltinsFeaturesNV <: HighLevelStruct
    next::Any
    shader_sm_builtins::Bool
end

struct PhysicalDeviceIndexTypeUint8FeaturesEXT <: HighLevelStruct
    next::Any
    index_type_uint_8::Bool
end

struct PhysicalDeviceShaderClockFeaturesKHR <: HighLevelStruct
    next::Any
    shader_subgroup_clock::Bool
    shader_device_clock::Bool
end

struct PerformanceStreamMarkerInfoINTEL <: HighLevelStruct
    next::Any
    marker::UInt32
end

struct PerformanceMarkerInfoINTEL <: HighLevelStruct
    next::Any
    marker::UInt64
end

struct InitializePerformanceApiInfoINTEL <: HighLevelStruct
    next::Any
    user_data::OptionalPtr{Cvoid}
end

struct PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL <: HighLevelStruct
    next::Any
    shader_integer_functions_2::Bool
end

struct PhysicalDeviceCoverageReductionModeFeaturesNV <: HighLevelStruct
    next::Any
    coverage_reduction_mode::Bool
end

struct HeadlessSurfaceCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
end

struct PerformanceQuerySubmitInfoKHR <: HighLevelStruct
    next::Any
    counter_pass_index::UInt32
end

struct QueryPoolPerformanceCreateInfoKHR <: HighLevelStruct
    next::Any
    queue_family_index::UInt32
    counter_indices::Vector{UInt32}
end

struct PhysicalDevicePerformanceQueryFeaturesKHR <: HighLevelStruct
    next::Any
    performance_counter_query_pools::Bool
    performance_counter_multiple_query_pools::Bool
end

struct SurfaceCapabilitiesFullScreenExclusiveEXT <: HighLevelStruct
    next::Any
    full_screen_exclusive_supported::Bool
end

struct SurfaceFullScreenExclusiveWin32InfoEXT <: HighLevelStruct
    next::Any
    hmonitor::vk.HMONITOR
end

struct PresentFrameTokenGGP <: HighLevelStruct
    next::Any
    frame_token::vk.GgpFrameToken
end

struct PhysicalDeviceYcbcrImageArraysFeaturesEXT <: HighLevelStruct
    next::Any
    ycbcr_image_arrays::Bool
end

struct PhysicalDeviceCooperativeMatrixFeaturesNV <: HighLevelStruct
    next::Any
    cooperative_matrix::Bool
    cooperative_matrix_robust_buffer_access::Bool
end

struct PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT <: HighLevelStruct
    next::Any
    texture_compression_astc_hdr::Bool
end

struct PhysicalDeviceImagelessFramebufferFeatures <: HighLevelStruct
    next::Any
    imageless_framebuffer::Bool
end

struct BufferDeviceAddressCreateInfoEXT <: HighLevelStruct
    next::Any
    device_address::UInt64
end

struct BufferOpaqueCaptureAddressCreateInfo <: HighLevelStruct
    next::Any
    opaque_capture_address::UInt64
end

struct PhysicalDeviceBufferDeviceAddressFeaturesEXT <: HighLevelStruct
    next::Any
    buffer_device_address::Bool
    buffer_device_address_capture_replay::Bool
    buffer_device_address_multi_device::Bool
end

struct PhysicalDeviceBufferDeviceAddressFeatures <: HighLevelStruct
    next::Any
    buffer_device_address::Bool
    buffer_device_address_capture_replay::Bool
    buffer_device_address_multi_device::Bool
end

struct MemoryPriorityAllocateInfoEXT <: HighLevelStruct
    next::Any
    priority::Float32
end

struct PhysicalDeviceMemoryPriorityFeaturesEXT <: HighLevelStruct
    next::Any
    memory_priority::Bool
end

struct PipelineRasterizationDepthClipStateCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    depth_clip_enable::Bool
end

struct PhysicalDeviceDepthClipEnableFeaturesEXT <: HighLevelStruct
    next::Any
    depth_clip_enable::Bool
end

struct PhysicalDeviceUniformBufferStandardLayoutFeatures <: HighLevelStruct
    next::Any
    uniform_buffer_standard_layout::Bool
end

struct SurfaceProtectedCapabilitiesKHR <: HighLevelStruct
    next::Any
    supports_protected::Bool
end

struct PhysicalDeviceScalarBlockLayoutFeatures <: HighLevelStruct
    next::Any
    scalar_block_layout::Bool
end

struct PhysicalDeviceFragmentDensityMap2FeaturesEXT <: HighLevelStruct
    next::Any
    fragment_density_map_deferred::Bool
end

struct PhysicalDeviceFragmentDensityMapFeaturesEXT <: HighLevelStruct
    next::Any
    fragment_density_map::Bool
    fragment_density_map_dynamic::Bool
    fragment_density_map_non_subsampled_images::Bool
end

struct ImageDrmFormatModifierListCreateInfoEXT <: HighLevelStruct
    next::Any
    drm_format_modifiers::Vector{UInt64}
end

struct TraceRaysIndirectCommandKHR <: HighLevelStruct
    width::UInt32
    height::UInt32
    depth::UInt32
end

struct StridedDeviceAddressRegionKHR <: HighLevelStruct
    device_address::UInt64
    stride::UInt64
    size::UInt64
end

struct PhysicalDeviceRayQueryFeaturesKHR <: HighLevelStruct
    next::Any
    ray_query::Bool
end

struct PhysicalDeviceRayTracingPipelineFeaturesKHR <: HighLevelStruct
    next::Any
    ray_tracing_pipeline::Bool
    ray_tracing_pipeline_shader_group_handle_capture_replay::Bool
    ray_tracing_pipeline_shader_group_handle_capture_replay_mixed::Bool
    ray_tracing_pipeline_trace_rays_indirect::Bool
    ray_traversal_primitive_culling::Bool
end

struct PhysicalDeviceAccelerationStructureFeaturesKHR <: HighLevelStruct
    next::Any
    acceleration_structure::Bool
    acceleration_structure_capture_replay::Bool
    acceleration_structure_indirect_build::Bool
    acceleration_structure_host_commands::Bool
    descriptor_binding_acceleration_structure_update_after_bind::Bool
end

struct DrawMeshTasksIndirectCommandNV <: HighLevelStruct
    task_count::UInt32
    first_task::UInt32
end

struct PhysicalDeviceMeshShaderFeaturesNV <: HighLevelStruct
    next::Any
    task_shader::Bool
    mesh_shader::Bool
end

struct CoarseSampleLocationNV <: HighLevelStruct
    pixel_x::UInt32
    pixel_y::UInt32
    sample::UInt32
end

struct PhysicalDeviceShadingRateImageFeaturesNV <: HighLevelStruct
    next::Any
    shading_rate_image::Bool
    shading_rate_coarse_sample_order::Bool
end

struct PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV <: HighLevelStruct
    next::Any
    dedicated_allocation_image_aliasing::Bool
end

struct PhysicalDeviceShaderImageFootprintFeaturesNV <: HighLevelStruct
    next::Any
    image_footprint::Bool
end

struct PhysicalDeviceFragmentShaderBarycentricFeaturesNV <: HighLevelStruct
    next::Any
    fragment_shader_barycentric::Bool
end

struct PhysicalDeviceComputeShaderDerivativesFeaturesNV <: HighLevelStruct
    next::Any
    compute_derivative_group_quads::Bool
    compute_derivative_group_linear::Bool
end

struct PhysicalDeviceCornerSampledImageFeaturesNV <: HighLevelStruct
    next::Any
    corner_sampled_image::Bool
end

struct PhysicalDeviceExclusiveScissorFeaturesNV <: HighLevelStruct
    next::Any
    exclusive_scissor::Bool
end

struct PipelineRepresentativeFragmentTestStateCreateInfoNV <: HighLevelStruct
    next::Any
    representative_fragment_test_enable::Bool
end

struct PhysicalDeviceRepresentativeFragmentTestFeaturesNV <: HighLevelStruct
    next::Any
    representative_fragment_test::Bool
end

struct PipelineRasterizationStateStreamCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    rasterization_stream::UInt32
end

struct PhysicalDeviceTransformFeedbackFeaturesEXT <: HighLevelStruct
    next::Any
    transform_feedback::Bool
    geometry_streams::Bool
end

struct PhysicalDeviceASTCDecodeFeaturesEXT <: HighLevelStruct
    next::Any
    decode_mode_shared_exponent::Bool
end

struct PhysicalDeviceVertexAttributeDivisorFeaturesEXT <: HighLevelStruct
    next::Any
    vertex_attribute_instance_rate_divisor::Bool
    vertex_attribute_instance_rate_zero_divisor::Bool
end

struct PhysicalDeviceShaderAtomicFloatFeaturesEXT <: HighLevelStruct
    next::Any
    shader_buffer_float_32_atomics::Bool
    shader_buffer_float_32_atomic_add::Bool
    shader_buffer_float_64_atomics::Bool
    shader_buffer_float_64_atomic_add::Bool
    shader_shared_float_32_atomics::Bool
    shader_shared_float_32_atomic_add::Bool
    shader_shared_float_64_atomics::Bool
    shader_shared_float_64_atomic_add::Bool
    shader_image_float_32_atomics::Bool
    shader_image_float_32_atomic_add::Bool
    sparse_image_float_32_atomics::Bool
    sparse_image_float_32_atomic_add::Bool
end

struct PhysicalDeviceShaderAtomicInt64Features <: HighLevelStruct
    next::Any
    shader_buffer_int_64_atomics::Bool
    shader_shared_int_64_atomics::Bool
end

struct PhysicalDeviceVulkanMemoryModelFeatures <: HighLevelStruct
    next::Any
    vulkan_memory_model::Bool
    vulkan_memory_model_device_scope::Bool
    vulkan_memory_model_availability_visibility_chains::Bool
end

struct PhysicalDeviceConditionalRenderingFeaturesEXT <: HighLevelStruct
    next::Any
    conditional_rendering::Bool
    inherited_conditional_rendering::Bool
end

struct PhysicalDevice8BitStorageFeatures <: HighLevelStruct
    next::Any
    storage_buffer_8_bit_access::Bool
    uniform_and_storage_buffer_8_bit_access::Bool
    storage_push_constant_8::Bool
end

struct ExternalFormatANDROID <: HighLevelStruct
    next::Any
    external_format::UInt64
end

struct CommandBufferInheritanceConditionalRenderingInfoEXT <: HighLevelStruct
    next::Any
    conditional_rendering_enable::Bool
end

struct ImportAndroidHardwareBufferInfoANDROID <: HighLevelStruct
    next::Any
    buffer::vk.AHardwareBuffer
end

struct VertexInputBindingDivisorDescriptionEXT <: HighLevelStruct
    binding::UInt32
    divisor::UInt32
end

struct PipelineVertexInputDivisorStateCreateInfoEXT <: HighLevelStruct
    next::Any
    vertex_binding_divisors::Vector{VertexInputBindingDivisorDescriptionEXT}
end

struct TimelineSemaphoreSubmitInfo <: HighLevelStruct
    next::Any
    wait_semaphore_values::OptionalPtr{Vector{UInt64}}
    signal_semaphore_values::OptionalPtr{Vector{UInt64}}
end

struct PhysicalDeviceTimelineSemaphoreFeatures <: HighLevelStruct
    next::Any
    timeline_semaphore::Bool
end

struct SubpassEndInfo <: HighLevelStruct
    next::Any
end

struct DescriptorSetVariableDescriptorCountAllocateInfo <: HighLevelStruct
    next::Any
    descriptor_counts::Vector{UInt32}
end

struct PhysicalDeviceDescriptorIndexingFeatures <: HighLevelStruct
    next::Any
    shader_input_attachment_array_dynamic_indexing::Bool
    shader_uniform_texel_buffer_array_dynamic_indexing::Bool
    shader_storage_texel_buffer_array_dynamic_indexing::Bool
    shader_uniform_buffer_array_non_uniform_indexing::Bool
    shader_sampled_image_array_non_uniform_indexing::Bool
    shader_storage_buffer_array_non_uniform_indexing::Bool
    shader_storage_image_array_non_uniform_indexing::Bool
    shader_input_attachment_array_non_uniform_indexing::Bool
    shader_uniform_texel_buffer_array_non_uniform_indexing::Bool
    shader_storage_texel_buffer_array_non_uniform_indexing::Bool
    descriptor_binding_uniform_buffer_update_after_bind::Bool
    descriptor_binding_sampled_image_update_after_bind::Bool
    descriptor_binding_storage_image_update_after_bind::Bool
    descriptor_binding_storage_buffer_update_after_bind::Bool
    descriptor_binding_uniform_texel_buffer_update_after_bind::Bool
    descriptor_binding_storage_texel_buffer_update_after_bind::Bool
    descriptor_binding_update_unused_while_pending::Bool
    descriptor_binding_partially_bound::Bool
    descriptor_binding_variable_descriptor_count::Bool
    runtime_descriptor_array::Bool
end

struct DeviceDeviceMemoryReportCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    pfn_user_callback::FunctionPtr
    user_data::Cvoid
end

struct PhysicalDeviceDeviceMemoryReportFeaturesEXT <: HighLevelStruct
    next::Any
    device_memory_report::Bool
end

struct DebugUtilsLabelEXT <: HighLevelStruct
    next::Any
    label_name::String
    color::NTuple{4, Float32}
end

struct PhysicalDeviceHostQueryResetFeatures <: HighLevelStruct
    next::Any
    host_query_reset::Bool
end

struct PhysicalDeviceShaderFloat16Int8Features <: HighLevelStruct
    next::Any
    shader_float_16::Bool
    shader_int_8::Bool
end

struct PhysicalDeviceShaderDrawParametersFeatures <: HighLevelStruct
    next::Any
    shader_draw_parameters::Bool
end

struct ValidationCacheCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    initial_data_size::OptionalPtr{UInt}
    initial_data::Cvoid
end

struct DescriptorPoolInlineUniformBlockCreateInfoEXT <: HighLevelStruct
    next::Any
    max_inline_uniform_block_bindings::UInt32
end

struct WriteDescriptorSetInlineUniformBlockEXT <: HighLevelStruct
    next::Any
    data_size::UInt32
    data::Cvoid
end

struct PhysicalDeviceInlineUniformBlockFeaturesEXT <: HighLevelStruct
    next::Any
    inline_uniform_block::Bool
    descriptor_binding_inline_uniform_block_update_after_bind::Bool
end

struct PhysicalDeviceBlendOperationAdvancedFeaturesEXT <: HighLevelStruct
    next::Any
    advanced_blend_coherent_operations::Bool
end

struct SampleLocationEXT <: HighLevelStruct
    x::Float32
    y::Float32
end

struct PipelineCoverageToColorStateCreateInfoNV <: HighLevelStruct
    next::Any
    flags::UInt32
    coverage_to_color_enable::Bool
    coverage_to_color_location::UInt32
end

struct PhysicalDeviceProtectedMemoryFeatures <: HighLevelStruct
    next::Any
    protected_memory::Bool
end

struct ProtectedSubmitInfo <: HighLevelStruct
    next::Any
    protected_submit::Bool
end

struct PhysicalDeviceSamplerYcbcrConversionFeatures <: HighLevelStruct
    next::Any
    sampler_ycbcr_conversion::Bool
end

struct PhysicalDeviceShaderSubgroupExtendedTypesFeatures <: HighLevelStruct
    next::Any
    shader_subgroup_extended_types::Bool
end

struct PhysicalDevice16BitStorageFeatures <: HighLevelStruct
    next::Any
    storage_buffer_16_bit_access::Bool
    uniform_and_storage_buffer_16_bit_access::Bool
    storage_push_constant_16::Bool
    storage_input_output_16::Bool
end

struct ViewportWScalingNV <: HighLevelStruct
    xcoeff::Float32
    ycoeff::Float32
end

struct PipelineViewportWScalingStateCreateInfoNV <: HighLevelStruct
    next::Any
    viewport_w_scaling_enable::Bool
    viewport_w_scalings::OptionalPtr{Vector{ViewportWScalingNV}}
end

struct MetalSurfaceCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    layer::vk.CAMetalLayer
end

struct MacOSSurfaceCreateInfoMVK <: HighLevelStruct
    next::Any
    flags::UInt32
    view::Cvoid
end

struct IOSSurfaceCreateInfoMVK <: HighLevelStruct
    next::Any
    flags::UInt32
    view::Cvoid
end

struct PresentTimeGOOGLE <: HighLevelStruct
    present_id::UInt32
    desired_present_time::UInt64
end

struct PresentTimesInfoGOOGLE <: HighLevelStruct
    next::Any
    times::OptionalPtr{Vector{PresentTimeGOOGLE}}
end

struct SwapchainDisplayNativeHdrCreateInfoAMD <: HighLevelStruct
    next::Any
    local_dimming_enable::Bool
end

struct XYColorEXT <: HighLevelStruct
    x::Float32
    y::Float32
end

struct HdrMetadataEXT <: HighLevelStruct
    next::Any
    display_primary_red::XYColorEXT
    display_primary_green::XYColorEXT
    display_primary_blue::XYColorEXT
    white_point::XYColorEXT
    max_luminance::Float32
    min_luminance::Float32
    max_content_light_level::Float32
    max_frame_average_light_level::Float32
end

struct DeviceGroupBindSparseInfo <: HighLevelStruct
    next::Any
    resource_device_index::UInt32
    memory_device_index::UInt32
end

struct DeviceGroupSubmitInfo <: HighLevelStruct
    next::Any
    wait_semaphore_device_indices::Vector{UInt32}
    command_buffer_device_masks::Vector{UInt32}
    signal_semaphore_device_indices::Vector{UInt32}
end

struct DeviceGroupCommandBufferBeginInfo <: HighLevelStruct
    next::Any
    device_mask::UInt32
end

struct BindBufferMemoryDeviceGroupInfo <: HighLevelStruct
    next::Any
    device_indices::Vector{UInt32}
end

struct RenderPassMultiviewCreateInfo <: HighLevelStruct
    next::Any
    view_masks::Vector{UInt32}
    view_offsets::Vector{Int32}
    correlation_masks::Vector{UInt32}
end

struct PhysicalDeviceMultiviewFeatures <: HighLevelStruct
    next::Any
    multiview::Bool
    multiview_geometry_shader::Bool
    multiview_tessellation_shader::Bool
end

struct ExportFenceWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    attributes::OptionalPtr{vk.SECURITY_ATTRIBUTES}
    dw_access::vk.DWORD
    name::vk.LPCWSTR
end

struct D3D12FenceSubmitInfoKHR <: HighLevelStruct
    next::Any
    wait_semaphore_values::OptionalPtr{Vector{UInt64}}
    signal_semaphore_values::OptionalPtr{Vector{UInt64}}
end

struct ExportSemaphoreWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    attributes::OptionalPtr{vk.SECURITY_ATTRIBUTES}
    dw_access::vk.DWORD
    name::vk.LPCWSTR
end

struct ExportMemoryWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    attributes::OptionalPtr{vk.SECURITY_ATTRIBUTES}
    dw_access::vk.DWORD
    name::vk.LPCWSTR
end

struct PhysicalDeviceVariablePointersFeatures <: HighLevelStruct
    next::Any
    variable_pointers_storage_buffer::Bool
    variable_pointers::Bool
end

struct ConformanceVersion <: HighLevelStruct
    major::UInt8
    minor::UInt8
    subminor::UInt8
    patch::UInt8
end

struct SetStateFlagsIndirectCommandNV <: HighLevelStruct
    data::UInt32
end

struct BindVertexBufferIndirectCommandNV <: HighLevelStruct
    buffer_address::UInt64
    size::UInt32
    stride::UInt32
end

struct BindShaderGroupIndirectCommandNV <: HighLevelStruct
    group_index::UInt32
end

struct PhysicalDevicePrivateDataFeaturesEXT <: HighLevelStruct
    next::Any
    private_data::Bool
end

struct DevicePrivateDataCreateInfoEXT <: HighLevelStruct
    next::Any
    private_data_slot_request_count::UInt32
end

struct PhysicalDeviceDeviceGeneratedCommandsFeaturesNV <: HighLevelStruct
    next::Any
    device_generated_commands::Bool
end

struct ExportMemoryWin32HandleInfoNV <: HighLevelStruct
    next::Any
    attributes::OptionalPtr{vk.SECURITY_ATTRIBUTES}
    dw_access::OptionalPtr{vk.DWORD}
end

struct DedicatedAllocationBufferCreateInfoNV <: HighLevelStruct
    next::Any
    dedicated_allocation::Bool
end

struct DedicatedAllocationImageCreateInfoNV <: HighLevelStruct
    next::Any
    dedicated_allocation::Bool
end

struct DebugMarkerMarkerInfoEXT <: HighLevelStruct
    next::Any
    marker_name::String
    color::NTuple{4, Float32}
end

struct ScreenSurfaceCreateInfoQNX <: HighLevelStruct
    next::Any
    flags::UInt32
    context::vk._screen_context
    window::vk._screen_window
end

struct StreamDescriptorSurfaceCreateInfoGGP <: HighLevelStruct
    next::Any
    flags::UInt32
    stream_descriptor::vk.GgpStreamDescriptor
end

struct ImagePipeSurfaceCreateInfoFUCHSIA <: HighLevelStruct
    next::Any
    flags::UInt32
    image_pipe_handle::vk.zx_handle_t
end

struct DirectFBSurfaceCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    dfb::vk.IDirectFB
    surface::vk.IDirectFBSurface
end

struct XcbSurfaceCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
    connection::vk.xcb_connection_t
    window::vk.xcb_window_t
end

struct XlibSurfaceCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
    dpy::vk.Display
    window::vk.Window
end

struct Win32SurfaceCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
    hinstance::vk.HINSTANCE
    hwnd::vk.HWND
end

struct WaylandSurfaceCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
    display::vk.wl_display
    surface::vk.wl_surface
end

struct ViSurfaceCreateInfoNN <: HighLevelStruct
    next::Any
    flags::UInt32
    window::Cvoid
end

struct AndroidSurfaceCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
    window::vk.ANativeWindow
end

struct DispatchIndirectCommand <: HighLevelStruct
    x::UInt32
    y::UInt32
    z::UInt32
end

struct DrawIndexedIndirectCommand <: HighLevelStruct
    index_count::UInt32
    instance_count::UInt32
    first_index::UInt32
    vertex_offset::Int32
    first_instance::UInt32
end

struct DrawIndirectCommand <: HighLevelStruct
    vertex_count::UInt32
    instance_count::UInt32
    first_vertex::UInt32
    first_instance::UInt32
end

struct SemaphoreCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
end

struct PhysicalDeviceFeatures <: HighLevelStruct
    robust_buffer_access::Bool
    full_draw_index_uint_32::Bool
    image_cube_array::Bool
    independent_blend::Bool
    geometry_shader::Bool
    tessellation_shader::Bool
    sample_rate_shading::Bool
    dual_src_blend::Bool
    logic_op::Bool
    multi_draw_indirect::Bool
    draw_indirect_first_instance::Bool
    depth_clamp::Bool
    depth_bias_clamp::Bool
    fill_mode_non_solid::Bool
    depth_bounds::Bool
    wide_lines::Bool
    large_points::Bool
    alpha_to_one::Bool
    multi_viewport::Bool
    sampler_anisotropy::Bool
    texture_compression_etc_2::Bool
    texture_compression_astc_ldr::Bool
    texture_compression_bc::Bool
    occlusion_query_precise::Bool
    pipeline_statistics_query::Bool
    vertex_pipeline_stores_and_atomics::Bool
    fragment_stores_and_atomics::Bool
    shader_tessellation_and_geometry_point_size::Bool
    shader_image_gather_extended::Bool
    shader_storage_image_extended_formats::Bool
    shader_storage_image_multisample::Bool
    shader_storage_image_read_without_format::Bool
    shader_storage_image_write_without_format::Bool
    shader_uniform_buffer_array_dynamic_indexing::Bool
    shader_sampled_image_array_dynamic_indexing::Bool
    shader_storage_buffer_array_dynamic_indexing::Bool
    shader_storage_image_array_dynamic_indexing::Bool
    shader_clip_distance::Bool
    shader_cull_distance::Bool
    shader_float_64::Bool
    shader_int_64::Bool
    shader_int_16::Bool
    shader_resource_residency::Bool
    shader_resource_min_lod::Bool
    sparse_binding::Bool
    sparse_residency_buffer::Bool
    sparse_residency_image_2_d::Bool
    sparse_residency_image_3_d::Bool
    sparse_residency_2_samples::Bool
    sparse_residency_4_samples::Bool
    sparse_residency_8_samples::Bool
    sparse_residency_16_samples::Bool
    sparse_residency_aliased::Bool
    variable_multisample_rate::Bool
    inherited_queries::Bool
end

struct PhysicalDeviceFeatures2 <: HighLevelStruct
    next::Any
    features::PhysicalDeviceFeatures
end

struct ClearDepthStencilValue <: HighLevelStruct
    depth::Float32
    stencil::UInt32
end

struct PipelineTessellationStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    patch_control_points::UInt32
end

struct SpecializationMapEntry <: HighLevelStruct
    constant_id::UInt32
    offset::UInt32
    size::UInt
end

struct SpecializationInfo <: HighLevelStruct
    map_entries::Vector{SpecializationMapEntry}
    data_size::OptionalPtr{UInt}
    data::Cvoid
end

struct BufferCopy <: HighLevelStruct
    src_offset::UInt64
    dst_offset::UInt64
    size::UInt64
end

struct MemoryAllocateInfo <: HighLevelStruct
    next::Any
    allocation_size::UInt64
    memory_type_index::UInt32
end

struct AllocationCallbacks <: HighLevelStruct
    user_data::OptionalPtr{Cvoid}
    pfn_allocation::FunctionPtr
    pfn_reallocation::FunctionPtr
    pfn_free::FunctionPtr
    pfn_internal_allocation::OptionalPtr{FunctionPtr}
    pfn_internal_free::OptionalPtr{FunctionPtr}
end

struct ApplicationInfo <: HighLevelStruct
    next::Any
    application_name::String
    application_version::VersionNumber
    engine_name::String
    engine_version::VersionNumber
    api_version::VersionNumber
end

struct InstanceCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    application_info::OptionalPtr{ApplicationInfo}
    enabled_layer_names::Vector{String}
    enabled_extension_names::Vector{String}
end

struct Viewport <: HighLevelStruct
    x::Float32
    y::Float32
    width::Float32
    height::Float32
    min_depth::Float32
    max_depth::Float32
end

struct CommandBufferInheritanceViewportScissorInfoNV <: HighLevelStruct
    next::Any
    viewport_scissor_2_d::Bool
    viewport_depth_count::UInt32
    viewport_depths::Viewport
end

struct Extent3D <: HighLevelStruct
    width::UInt32
    height::UInt32
    depth::UInt32
end

struct Extent2D <: HighLevelStruct
    width::UInt32
    height::UInt32
end

struct DisplayModeParametersKHR <: HighLevelStruct
    visible_region::Extent2D
    refresh_rate::UInt32
end

struct DisplayModeCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
    parameters::DisplayModeParametersKHR
end

struct Offset3D <: HighLevelStruct
    x::Int32
    y::Int32
    z::Int32
end

struct Offset2D <: HighLevelStruct
    x::Int32
    y::Int32
end

struct RectLayerKHR <: HighLevelStruct
    offset::Offset2D
    extent::Extent2D
    layer::UInt32
end

struct PresentRegionKHR <: HighLevelStruct
    rectangles::OptionalPtr{Vector{RectLayerKHR}}
end

struct PresentRegionsKHR <: HighLevelStruct
    next::Any
    regions::OptionalPtr{Vector{PresentRegionKHR}}
end

struct Rect2D <: HighLevelStruct
    offset::Offset2D
    extent::Extent2D
end

struct PipelineViewportExclusiveScissorStateCreateInfoNV <: HighLevelStruct
    next::Any
    exclusive_scissors::Vector{Rect2D}
end

struct DeviceGroupRenderPassBeginInfo <: HighLevelStruct
    next::Any
    device_mask::UInt32
    device_render_areas::Vector{Rect2D}
end

struct BindImageMemoryDeviceGroupInfo <: HighLevelStruct
    next::Any
    device_indices::Vector{UInt32}
    split_instance_bind_regions::Vector{Rect2D}
end

struct DisplayPresentInfoKHR <: HighLevelStruct
    next::Any
    src_rect::Rect2D
    dst_rect::Rect2D
    persistent::Bool
end

struct PipelineViewportStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    viewports::OptionalPtr{Vector{Viewport}}
    scissors::OptionalPtr{Vector{Rect2D}}
end

struct ClearRect <: HighLevelStruct
    rect::Rect2D
    base_array_layer::UInt32
    layer_count::UInt32
end

struct BaseInStructure <: HighLevelStruct
    next::Any
end

struct BaseOutStructure <: HighLevelStruct
    next::Any
end

struct VideoEncodeRateControlInfoKHR <: HighLevelStruct
    next::Any
    flags::VideoEncodeRateControlFlagKHR
    rate_control_mode::VideoEncodeRateControlModeFlagKHR
    average_bitrate::UInt32
    peak_to_average_bitrate_ratio::UInt16
    frame_rate_numerator::UInt16
    frame_rate_denominator::UInt16
    virtual_buffer_size_in_ms::UInt32
end

struct VideoCodingControlInfoKHR <: HighLevelStruct
    next::Any
    flags::VideoCodingControlFlagKHR
end

struct VideoDecodeH264ProfileEXT <: HighLevelStruct
    next::Any
    std_profile_idc::StdVideoH264ProfileIdc
    field_layout::VideoDecodeH264FieldLayoutFlagEXT
end

struct VideoProfileKHR <: HighLevelStruct
    next::Any
    video_codec_operation::VideoCodecOperationFlagKHR
    chroma_subsampling::VideoChromaSubsamplingFlagKHR
    luma_bit_depth::VideoComponentBitDepthFlagKHR
    chroma_bit_depth::VideoComponentBitDepthFlagKHR
end

struct VideoProfilesKHR <: HighLevelStruct
    next::Any
    profile_count::UInt32
    profiles::VideoProfileKHR
end

struct VideoQueueFamilyProperties2KHR <: HighLevelStruct
    next::Any
    video_codec_operations::VideoCodecOperationFlagKHR
end

struct EventCreateInfo <: HighLevelStruct
    next::Any
    flags::EventCreateFlag
end

struct PipelineCompilerControlCreateInfoAMD <: HighLevelStruct
    next::Any
    compiler_control_flags::PipelineCompilerControlFlagAMD
end

struct ShaderModuleCreateInfo <: HighLevelStruct
    next::Any
    flags::ShaderModuleCreateFlag
    code_size::UInt
    code::Vector{UInt32}
end

struct AcquireProfilingLockInfoKHR <: HighLevelStruct
    next::Any
    flags::AcquireProfilingLockFlagKHR
    timeout::UInt64
end

struct DeviceDiagnosticsConfigCreateInfoNV <: HighLevelStruct
    next::Any
    flags::DeviceDiagnosticsConfigFlagNV
end

struct AccelerationStructureInstanceKHR <: HighLevelStruct
    transform::TransformMatrixKHR
    instance_custom_index::UInt32
    mask::UInt32
    instance_shader_binding_table_record_offset::UInt32
    flags::GeometryInstanceFlagKHR
    acceleration_structure_reference::UInt64
end

struct DescriptorSetLayoutBindingFlagsCreateInfo <: HighLevelStruct
    next::Any
    binding_flags::Vector{DescriptorBindingFlag}
end

struct DebugUtilsMessengerCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    message_severity::DebugUtilsMessageSeverityFlagEXT
    message_type::DebugUtilsMessageTypeFlagEXT
    pfn_user_callback::FunctionPtr
    user_data::OptionalPtr{Cvoid}
end

struct DeviceGroupSwapchainCreateInfoKHR <: HighLevelStruct
    next::Any
    modes::DeviceGroupPresentModeFlagKHR
end

struct DeviceGroupPresentInfoKHR <: HighLevelStruct
    next::Any
    device_masks::Vector{UInt32}
    mode::DeviceGroupPresentModeFlagKHR
end

struct MemoryAllocateFlagsInfo <: HighLevelStruct
    next::Any
    flags::MemoryAllocateFlag
    device_mask::UInt32
end

struct SwapchainCounterCreateInfoEXT <: HighLevelStruct
    next::Any
    surface_counters::SurfaceCounterFlagEXT
end

struct ExportFenceCreateInfo <: HighLevelStruct
    next::Any
    handle_types::ExternalFenceHandleTypeFlag
end

struct PhysicalDeviceExternalFenceInfo <: HighLevelStruct
    next::Any
    handle_type::ExternalFenceHandleTypeFlag
end

struct ExportSemaphoreCreateInfo <: HighLevelStruct
    next::Any
    handle_types::ExternalSemaphoreHandleTypeFlag
end

struct PhysicalDeviceExternalSemaphoreInfo <: HighLevelStruct
    next::Any
    handle_type::ExternalSemaphoreHandleTypeFlag
end

struct ImportMemoryHostPointerInfoEXT <: HighLevelStruct
    next::Any
    handle_type::ExternalMemoryHandleTypeFlag
    host_pointer::Cvoid
end

struct ImportMemoryFdInfoKHR <: HighLevelStruct
    next::Any
    handle_type::ExternalMemoryHandleTypeFlag
    fd::Int
end

struct ImportMemoryZirconHandleInfoFUCHSIA <: HighLevelStruct
    next::Any
    handle_type::ExternalMemoryHandleTypeFlag
    handle::OptionalPtr{vk.zx_handle_t}
end

struct ImportMemoryWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    handle_type::ExternalMemoryHandleTypeFlag
    handle::OptionalPtr{vk.HANDLE}
    name::OptionalPtr{vk.LPCWSTR}
end

struct ExportMemoryAllocateInfo <: HighLevelStruct
    next::Any
    handle_types::ExternalMemoryHandleTypeFlag
end

struct ExternalMemoryBufferCreateInfo <: HighLevelStruct
    next::Any
    handle_types::ExternalMemoryHandleTypeFlag
end

struct ExternalMemoryImageCreateInfo <: HighLevelStruct
    next::Any
    handle_types::ExternalMemoryHandleTypeFlag
end

struct PhysicalDeviceExternalImageFormatInfo <: HighLevelStruct
    next::Any
    handle_type::ExternalMemoryHandleTypeFlag
end

struct PrivateDataSlotCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::PrivateDataSlotCreateFlagEXT
end

struct ImportMemoryWin32HandleInfoNV <: HighLevelStruct
    next::Any
    handle_type::ExternalMemoryHandleTypeFlagNV
    handle::OptionalPtr{vk.HANDLE}
end

struct ExportMemoryAllocateInfoNV <: HighLevelStruct
    next::Any
    handle_types::ExternalMemoryHandleTypeFlagNV
end

struct ExternalMemoryImageCreateInfoNV <: HighLevelStruct
    next::Any
    handle_types::ExternalMemoryHandleTypeFlagNV
end

struct DebugReportCallbackCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::DebugReportFlagEXT
    pfn_callback::FunctionPtr
    user_data::OptionalPtr{Cvoid}
end

struct CommandBufferInheritanceRenderPassTransformInfoQCOM <: HighLevelStruct
    next::Any
    transform::SurfaceTransformFlagKHR
    render_area::Rect2D
end

struct CopyCommandTransformInfoQCOM <: HighLevelStruct
    next::Any
    transform::SurfaceTransformFlagKHR
end

struct RenderPassTransformBeginInfoQCOM <: HighLevelStruct
    next::Any
    transform::SurfaceTransformFlagKHR
end

struct PhysicalDeviceFragmentShadingRateEnumsPropertiesNV <: HighLevelStruct
    next::Any
    max_fragment_shading_rate_invocation_count::SampleCountFlag
end

struct SampleLocationsInfoEXT <: HighLevelStruct
    next::Any
    sample_locations_per_pixel::SampleCountFlag
    sample_location_grid_size::Extent2D
    sample_locations::Vector{SampleLocationEXT}
end

struct PipelineSampleLocationsStateCreateInfoEXT <: HighLevelStruct
    next::Any
    sample_locations_enable::Bool
    sample_locations_info::SampleLocationsInfoEXT
end

struct SubpassSampleLocationsEXT <: HighLevelStruct
    subpass_index::UInt32
    sample_locations_info::SampleLocationsInfoEXT
end

struct AttachmentSampleLocationsEXT <: HighLevelStruct
    attachment_index::UInt32
    sample_locations_info::SampleLocationsInfoEXT
end

struct RenderPassSampleLocationsBeginInfoEXT <: HighLevelStruct
    next::Any
    attachment_initial_sample_locations::Vector{AttachmentSampleLocationsEXT}
    post_subpass_sample_locations::Vector{SubpassSampleLocationsEXT}
end

struct PipelineMultisampleStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    rasterization_samples::SampleCountFlag
    sample_shading_enable::Bool
    min_sample_shading::Float32
    sample_mask::OptionalPtr{Vector{UInt32}}
    alpha_to_coverage_enable::Bool
    alpha_to_one_enable::Bool
end

struct CommandPoolCreateInfo <: HighLevelStruct
    next::Any
    flags::CommandPoolCreateFlag
    queue_family_index::UInt32
end

struct ImagePlaneMemoryRequirementsInfo <: HighLevelStruct
    next::Any
    plane_aspect::ImageAspectFlag
end

struct BindImagePlaneMemoryInfo <: HighLevelStruct
    next::Any
    plane_aspect::ImageAspectFlag
end

struct InputAttachmentAspectReference <: HighLevelStruct
    subpass::UInt32
    input_attachment_index::UInt32
    aspect_mask::ImageAspectFlag
end

struct RenderPassInputAttachmentAspectCreateInfo <: HighLevelStruct
    next::Any
    aspect_references::Vector{InputAttachmentAspectReference}
end

struct ClearAttachment <: HighLevelStruct
    aspect_mask::ImageAspectFlag
    color_attachment::UInt32
    clear_value::VkClearValue
end

struct ImageSubresourceRange <: HighLevelStruct
    aspect_mask::ImageAspectFlag
    base_mip_level::UInt32
    level_count::UInt32
    base_array_layer::UInt32
    layer_count::UInt32
end

struct ImageSubresourceLayers <: HighLevelStruct
    aspect_mask::ImageAspectFlag
    mip_level::UInt32
    base_array_layer::UInt32
    layer_count::UInt32
end

struct ImageResolve2KHR <: HighLevelStruct
    next::Any
    src_subresource::ImageSubresourceLayers
    src_offset::Offset3D
    dst_subresource::ImageSubresourceLayers
    dst_offset::Offset3D
    extent::Extent3D
end

struct BufferImageCopy2KHR <: HighLevelStruct
    next::Any
    buffer_offset::UInt64
    buffer_row_length::UInt32
    buffer_image_height::UInt32
    image_subresource::ImageSubresourceLayers
    image_offset::Offset3D
    image_extent::Extent3D
end

struct ImageBlit2KHR <: HighLevelStruct
    next::Any
    src_subresource::ImageSubresourceLayers
    src_offsets::NTuple{2, Offset3D}
    dst_subresource::ImageSubresourceLayers
    dst_offsets::NTuple{2, Offset3D}
end

struct ImageCopy2KHR <: HighLevelStruct
    next::Any
    src_subresource::ImageSubresourceLayers
    src_offset::Offset3D
    dst_subresource::ImageSubresourceLayers
    dst_offset::Offset3D
    extent::Extent3D
end

struct ImageResolve <: HighLevelStruct
    src_subresource::ImageSubresourceLayers
    src_offset::Offset3D
    dst_subresource::ImageSubresourceLayers
    dst_offset::Offset3D
    extent::Extent3D
end

struct BufferImageCopy <: HighLevelStruct
    buffer_offset::UInt64
    buffer_row_length::UInt32
    buffer_image_height::UInt32
    image_subresource::ImageSubresourceLayers
    image_offset::Offset3D
    image_extent::Extent3D
end

struct ImageBlit <: HighLevelStruct
    src_subresource::ImageSubresourceLayers
    src_offsets::NTuple{2, Offset3D}
    dst_subresource::ImageSubresourceLayers
    dst_offsets::NTuple{2, Offset3D}
end

struct ImageCopy <: HighLevelStruct
    src_subresource::ImageSubresourceLayers
    src_offset::Offset3D
    dst_subresource::ImageSubresourceLayers
    dst_offset::Offset3D
    extent::Extent3D
end

struct ImageSubresource <: HighLevelStruct
    aspect_mask::ImageAspectFlag
    mip_level::UInt32
    array_layer::UInt32
end

struct FenceCreateInfo <: HighLevelStruct
    next::Any
    flags::FenceCreateFlag
end

struct ImageStencilUsageCreateInfo <: HighLevelStruct
    next::Any
    stencil_usage::ImageUsageFlag
end

struct ImageViewUsageCreateInfo <: HighLevelStruct
    next::Any
    usage::ImageUsageFlag
end

struct PushConstantRange <: HighLevelStruct
    stage_flags::ShaderStageFlag
    offset::UInt32
    size::UInt32
end

struct PhysicalDeviceExternalBufferInfo <: HighLevelStruct
    next::Any
    flags::BufferCreateFlag
    usage::BufferUsageFlag
    handle_type::ExternalMemoryHandleTypeFlag
end

struct SubpassDependency2 <: HighLevelStruct
    next::Any
    src_subpass::UInt32
    dst_subpass::UInt32
    src_stage_mask::PipelineStageFlag
    dst_stage_mask::PipelineStageFlag
    src_access_mask::AccessFlag
    dst_access_mask::AccessFlag
    dependency_flags::DependencyFlag
    view_offset::Int32
end

struct SubpassDependency <: HighLevelStruct
    src_subpass::UInt32
    dst_subpass::UInt32
    src_stage_mask::PipelineStageFlag
    dst_stage_mask::PipelineStageFlag
    src_access_mask::AccessFlag
    dst_access_mask::AccessFlag
    dependency_flags::DependencyFlag
end

struct MemoryBarrier <: HighLevelStruct
    next::Any
    src_access_mask::AccessFlag
    dst_access_mask::AccessFlag
end

struct DeviceQueueInfo2 <: HighLevelStruct
    next::Any
    flags::DeviceQueueCreateFlag
    queue_family_index::UInt32
    queue_index::UInt32
end

struct DeviceQueueCreateInfo <: HighLevelStruct
    next::Any
    flags::DeviceQueueCreateFlag
    queue_family_index::UInt32
    queue_priorities::Vector{Float32}
end

struct DeviceCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    queue_create_infos::Vector{DeviceQueueCreateInfo}
    enabled_layer_names::Vector{String}
    enabled_extension_names::Vector{String}
    enabled_features::OptionalPtr{PhysicalDeviceFeatures}
end

struct PipelineCacheCreateInfo <: HighLevelStruct
    next::Any
    flags::PipelineCacheCreateFlag
    initial_data_size::OptionalPtr{UInt}
    initial_data::Cvoid
end

struct PipelineRasterizationProvokingVertexStateCreateInfoEXT <: HighLevelStruct
    next::Any
    provoking_vertex_mode::ProvokingVertexModeEXT
end

struct PipelineFragmentShadingRateEnumStateCreateInfoNV <: HighLevelStruct
    next::Any
    shading_rate_type::FragmentShadingRateTypeNV
    shading_rate::FragmentShadingRateNV
    combiner_ops::NTuple{2, FragmentShadingRateCombinerOpKHR}
end

struct PipelineFragmentShadingRateStateCreateInfoKHR <: HighLevelStruct
    next::Any
    fragment_size::Extent2D
    combiner_ops::NTuple{2, FragmentShadingRateCombinerOpKHR}
end

struct PipelineRasterizationLineStateCreateInfoEXT <: HighLevelStruct
    next::Any
    line_rasterization_mode::LineRasterizationModeEXT
    stippled_line_enable::Bool
    line_stipple_factor::UInt32
    line_stipple_pattern::UInt16
end

struct PerformanceValueINTEL <: HighLevelStruct
    type::PerformanceValueTypeINTEL
    data::VkPerformanceValueDataINTEL
end

struct PerformanceOverrideInfoINTEL <: HighLevelStruct
    next::Any
    type::PerformanceOverrideTypeINTEL
    enable::Bool
    parameter::UInt64
end

struct QueryPoolPerformanceQueryCreateInfoINTEL <: HighLevelStruct
    next::Any
    performance_counters_sampling::QueryPoolSamplingModeINTEL
end

struct PerformanceConfigurationAcquireInfoINTEL <: HighLevelStruct
    next::Any
    type::PerformanceConfigurationTypeINTEL
end

struct SurfaceFullScreenExclusiveInfoEXT <: HighLevelStruct
    next::Any
    full_screen_exclusive::FullScreenExclusiveEXT
end

struct CooperativeMatrixPropertiesNV <: HighLevelStruct
    next::Any
    m_size::UInt32
    n_size::UInt32
    k_size::UInt32
    a_type::ComponentTypeNV
    b_type::ComponentTypeNV
    c_type::ComponentTypeNV
    d_type::ComponentTypeNV
    scope::ScopeNV
end

struct DeviceMemoryOverallocationCreateInfoAMD <: HighLevelStruct
    next::Any
    overallocation_behavior::MemoryOverallocationBehaviorAMD
end

struct RayTracingShaderGroupCreateInfoKHR <: HighLevelStruct
    next::Any
    type::RayTracingShaderGroupTypeKHR
    general_shader::UInt32
    closest_hit_shader::UInt32
    any_hit_shader::UInt32
    intersection_shader::UInt32
    shader_group_capture_replay_handle::OptionalPtr{Cvoid}
end

struct RayTracingShaderGroupCreateInfoNV <: HighLevelStruct
    next::Any
    type::RayTracingShaderGroupTypeKHR
    general_shader::UInt32
    closest_hit_shader::UInt32
    any_hit_shader::UInt32
    intersection_shader::UInt32
end

struct AccelerationStructureGeometryKHR <: HighLevelStruct
    next::Any
    geometry_type::GeometryTypeKHR
    geometry::VkAccelerationStructureGeometryDataKHR
    flags::GeometryFlagKHR
end

struct CoarseSampleOrderCustomNV <: HighLevelStruct
    shading_rate::ShadingRatePaletteEntryNV
    sample_count::UInt32
    sample_locations::Vector{CoarseSampleLocationNV}
end

struct PipelineViewportCoarseSampleOrderStateCreateInfoNV <: HighLevelStruct
    next::Any
    sample_order_type::CoarseSampleOrderTypeNV
    custom_sample_orders::Vector{CoarseSampleOrderCustomNV}
end

struct ShadingRatePaletteNV <: HighLevelStruct
    shading_rate_palette_entries::Vector{ShadingRatePaletteEntryNV}
end

struct PipelineViewportShadingRateImageStateCreateInfoNV <: HighLevelStruct
    next::Any
    shading_rate_image_enable::Bool
    shading_rate_palettes::Vector{ShadingRatePaletteNV}
end

struct PipelineRasterizationConservativeStateCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    conservative_rasterization_mode::ConservativeRasterizationModeEXT
    extra_primitive_overestimation_size::Float32
end

struct DeviceQueueGlobalPriorityCreateInfoEXT <: HighLevelStruct
    next::Any
    global_priority::QueueGlobalPriorityEXT
end

struct PipelineCoverageReductionStateCreateInfoNV <: HighLevelStruct
    next::Any
    flags::UInt32
    coverage_reduction_mode::CoverageReductionModeNV
end

struct PipelineCoverageModulationStateCreateInfoNV <: HighLevelStruct
    next::Any
    flags::UInt32
    coverage_modulation_mode::CoverageModulationModeNV
    coverage_modulation_table_enable::Bool
    coverage_modulation_table::OptionalPtr{Vector{Float32}}
end

struct PipelineColorBlendAdvancedStateCreateInfoEXT <: HighLevelStruct
    next::Any
    src_premultiplied::Bool
    dst_premultiplied::Bool
    blend_overlap::BlendOverlapEXT
end

struct PipelineTessellationDomainOriginStateCreateInfo <: HighLevelStruct
    next::Any
    domain_origin::TessellationDomainOrigin
end

struct SamplerReductionModeCreateInfo <: HighLevelStruct
    next::Any
    reduction_mode::SamplerReductionMode
end

struct PipelineDiscardRectangleStateCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    discard_rectangle_mode::DiscardRectangleModeEXT
    discard_rectangles::Vector{Rect2D}
end

struct ViewportSwizzleNV <: HighLevelStruct
    x::ViewportCoordinateSwizzleNV
    y::ViewportCoordinateSwizzleNV
    z::ViewportCoordinateSwizzleNV
    w::ViewportCoordinateSwizzleNV
end

struct PipelineViewportSwizzleStateCreateInfoNV <: HighLevelStruct
    next::Any
    flags::UInt32
    viewport_swizzles::Vector{ViewportSwizzleNV}
end

struct DisplayEventInfoEXT <: HighLevelStruct
    next::Any
    display_event::DisplayEventTypeEXT
end

struct DeviceEventInfoEXT <: HighLevelStruct
    next::Any
    device_event::DeviceEventTypeEXT
end

struct DisplayPowerInfoEXT <: HighLevelStruct
    next::Any
    power_state::DisplayPowerStateEXT
end

struct ValidationFeaturesEXT <: HighLevelStruct
    next::Any
    enabled_validation_features::Vector{ValidationFeatureEnableEXT}
    disabled_validation_features::Vector{ValidationFeatureDisableEXT}
end

struct ValidationFlagsEXT <: HighLevelStruct
    next::Any
    disabled_validation_checks::Vector{ValidationCheckEXT}
end

struct PipelineRasterizationStateRasterizationOrderAMD <: HighLevelStruct
    next::Any
    rasterization_order::RasterizationOrderAMD
end

struct DebugMarkerObjectTagInfoEXT <: HighLevelStruct
    next::Any
    object_type::DebugReportObjectTypeEXT
    object::UInt64
    tag_name::UInt64
    tag_size::UInt
    tag::Cvoid
end

struct DebugMarkerObjectNameInfoEXT <: HighLevelStruct
    next::Any
    object_type::DebugReportObjectTypeEXT
    object::UInt64
    object_name::String
end

struct CalibratedTimestampInfoEXT <: HighLevelStruct
    next::Any
    time_domain::TimeDomainEXT
end

struct SemaphoreTypeCreateInfo <: HighLevelStruct
    next::Any
    semaphore_type::SemaphoreType
    initial_value::UInt64
end

struct DebugUtilsObjectTagInfoEXT <: HighLevelStruct
    next::Any
    object_type::ObjectType
    object_handle::UInt64
    tag_name::UInt64
    tag_size::UInt
    tag::Cvoid
end

struct DebugUtilsObjectNameInfoEXT <: HighLevelStruct
    next::Any
    object_type::ObjectType
    object_handle::UInt64
    object_name::String
end

struct DebugUtilsMessengerCallbackDataEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    message_id_name::String
    message_id_number::Int32
    message::String
    queue_labels::Vector{DebugUtilsLabelEXT}
    cmd_buf_labels::Vector{DebugUtilsLabelEXT}
    objects::Vector{DebugUtilsObjectNameInfoEXT}
end

struct PipelineDynamicStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    dynamic_states::Vector{DynamicState}
end

struct SubpassBeginInfo <: HighLevelStruct
    next::Any
    contents::SubpassContents
end

struct VideoSessionCreateInfoKHR <: HighLevelStruct
    next::Any
    queue_family_index::UInt32
    flags::VideoSessionCreateFlagKHR
    video_profile::VideoProfileKHR
    picture_format::Format
    max_coded_extent::Extent2D
    reference_pictures_format::Format
    max_reference_pictures_slots_count::UInt32
    max_reference_pictures_active_count::UInt32
end

struct VertexInputAttributeDescription2EXT <: HighLevelStruct
    next::Any
    location::UInt32
    binding::UInt32
    format::Format
    offset::UInt32
end

struct SamplerCustomBorderColorCreateInfoEXT <: HighLevelStruct
    next::Any
    custom_border_color::VkClearColorValue
    format::Format
end

struct FramebufferAttachmentImageInfo <: HighLevelStruct
    next::Any
    flags::ImageCreateFlag
    usage::ImageUsageFlag
    width::UInt32
    height::UInt32
    layer_count::UInt32
    view_formats::Vector{Format}
end

struct FramebufferAttachmentsCreateInfo <: HighLevelStruct
    next::Any
    attachment_image_infos::Vector{FramebufferAttachmentImageInfo}
end

struct ImageViewASTCDecodeModeEXT <: HighLevelStruct
    next::Any
    decode_mode::Format
end

struct ImageFormatListCreateInfo <: HighLevelStruct
    next::Any
    view_formats::Vector{Format}
end

struct VertexInputAttributeDescription <: HighLevelStruct
    location::UInt32
    binding::UInt32
    format::Format
    offset::UInt32
end

struct VertexInputBindingDescription2EXT <: HighLevelStruct
    next::Any
    binding::UInt32
    stride::UInt32
    input_rate::VertexInputRate
    divisor::UInt32
end

struct VertexInputBindingDescription <: HighLevelStruct
    binding::UInt32
    stride::UInt32
    input_rate::VertexInputRate
end

struct PipelineVertexInputStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    vertex_binding_descriptions::Vector{VertexInputBindingDescription}
    vertex_attribute_descriptions::Vector{VertexInputAttributeDescription}
end

struct PipelineColorBlendAttachmentState <: HighLevelStruct
    blend_enable::Bool
    src_color_blend_factor::BlendFactor
    dst_color_blend_factor::BlendFactor
    color_blend_op::BlendOp
    src_alpha_blend_factor::BlendFactor
    dst_alpha_blend_factor::BlendFactor
    alpha_blend_op::BlendOp
    color_write_mask::ColorComponentFlag
end

struct PipelineColorBlendStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    logic_op_enable::Bool
    logic_op::LogicOp
    attachments::Vector{PipelineColorBlendAttachmentState}
    blend_constants::NTuple{4, Float32}
end

struct PipelineRasterizationStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    depth_clamp_enable::Bool
    rasterizer_discard_enable::Bool
    polygon_mode::PolygonMode
    cull_mode::CullModeFlag
    front_face::FrontFace
    depth_bias_enable::Bool
    depth_bias_constant_factor::Float32
    depth_bias_clamp::Float32
    depth_bias_slope_factor::Float32
    line_width::Float32
end

struct StencilOpState <: HighLevelStruct
    fail_op::StencilOp
    pass_op::StencilOp
    depth_fail_op::StencilOp
    compare_op::CompareOp
    compare_mask::UInt32
    write_mask::UInt32
    reference::UInt32
end

struct PipelineDepthStencilStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    depth_test_enable::Bool
    depth_write_enable::Bool
    depth_compare_op::CompareOp
    depth_bounds_test_enable::Bool
    stencil_test_enable::Bool
    front::StencilOpState
    back::StencilOpState
    min_depth_bounds::Float32
    max_depth_bounds::Float32
end

struct AccelerationStructureGeometryTrianglesDataKHR <: HighLevelStruct
    next::Any
    vertex_format::Format
    vertex_data::VkDeviceOrHostAddressConstKHR
    vertex_stride::UInt64
    max_vertex::UInt32
    index_type::IndexType
    index_data::VkDeviceOrHostAddressConstKHR
    transform_data::VkDeviceOrHostAddressConstKHR
end

struct BindIndexBufferIndirectCommandNV <: HighLevelStruct
    buffer_address::UInt64
    size::UInt32
    index_type::IndexType
end

struct PhysicalDeviceImageDrmFormatModifierInfoEXT <: HighLevelStruct
    next::Any
    drm_format_modifier::UInt64
    sharing_mode::SharingMode
    queue_family_indices::Vector{UInt32}
end

struct BufferCreateInfo <: HighLevelStruct
    next::Any
    flags::BufferCreateFlag
    size::UInt64
    usage::BufferUsageFlag
    sharing_mode::SharingMode
    queue_family_indices::Vector{UInt32}
end

struct PipelineInputAssemblyStateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    topology::PrimitiveTopology
    primitive_restart_enable::Bool
end

struct SamplerCreateInfo <: HighLevelStruct
    next::Any
    flags::SamplerCreateFlag
    mag_filter::Filter
    min_filter::Filter
    mipmap_mode::SamplerMipmapMode
    address_mode_u::SamplerAddressMode
    address_mode_v::SamplerAddressMode
    address_mode_w::SamplerAddressMode
    mip_lod_bias::Float32
    anisotropy_enable::Bool
    max_anisotropy::Float32
    compare_enable::Bool
    compare_op::CompareOp
    min_lod::Float32
    max_lod::Float32
    border_color::BorderColor
    unnormalized_coordinates::Bool
end

struct QueryPoolCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    query_type::QueryType
    query_count::UInt32
    pipeline_statistics::QueryPipelineStatisticFlag
end

struct MutableDescriptorTypeListVALVE <: HighLevelStruct
    descriptor_types::Vector{DescriptorType}
end

struct MutableDescriptorTypeCreateInfoVALVE <: HighLevelStruct
    next::Any
    mutable_descriptor_type_lists::Vector{MutableDescriptorTypeListVALVE}
end

struct DescriptorUpdateTemplateEntry <: HighLevelStruct
    dst_binding::UInt32
    dst_array_element::UInt32
    descriptor_count::UInt32
    descriptor_type::DescriptorType
    offset::UInt
    stride::UInt
end

struct DescriptorPoolSize <: HighLevelStruct
    type::DescriptorType
    descriptor_count::UInt32
end

struct DescriptorPoolCreateInfo <: HighLevelStruct
    next::Any
    flags::DescriptorPoolCreateFlag
    max_sets::UInt32
    pool_sizes::Vector{DescriptorPoolSize}
end

struct ComponentMapping <: HighLevelStruct
    r::ComponentSwizzle
    g::ComponentSwizzle
    b::ComponentSwizzle
    a::ComponentSwizzle
end

struct SamplerYcbcrConversionCreateInfo <: HighLevelStruct
    next::Any
    format::Format
    ycbcr_model::SamplerYcbcrModelConversion
    ycbcr_range::SamplerYcbcrRange
    components::ComponentMapping
    x_chroma_offset::ChromaLocation
    y_chroma_offset::ChromaLocation
    chroma_filter::Filter
    force_explicit_reconstruction::Bool
end

struct PhysicalDeviceImageViewImageFormatInfoEXT <: HighLevelStruct
    next::Any
    image_view_type::ImageViewType
end

struct PhysicalDeviceSparseImageFormatInfo2 <: HighLevelStruct
    next::Any
    format::Format
    type::ImageType
    samples::SampleCountFlag
    usage::ImageUsageFlag
    tiling::ImageTiling
end

struct PhysicalDeviceImageFormatInfo2 <: HighLevelStruct
    next::Any
    format::Format
    type::ImageType
    tiling::ImageTiling
    usage::ImageUsageFlag
    flags::ImageCreateFlag
end

struct AttachmentDescriptionStencilLayout <: HighLevelStruct
    next::Any
    stencil_initial_layout::ImageLayout
    stencil_final_layout::ImageLayout
end

struct AttachmentReferenceStencilLayout <: HighLevelStruct
    next::Any
    stencil_layout::ImageLayout
end

struct AttachmentReference2 <: HighLevelStruct
    next::Any
    attachment::UInt32
    layout::ImageLayout
    aspect_mask::ImageAspectFlag
end

struct FragmentShadingRateAttachmentInfoKHR <: HighLevelStruct
    next::Any
    fragment_shading_rate_attachment::AttachmentReference2
    shading_rate_attachment_texel_size::Extent2D
end

struct SubpassDescriptionDepthStencilResolve <: HighLevelStruct
    next::Any
    depth_resolve_mode::ResolveModeFlag
    stencil_resolve_mode::ResolveModeFlag
    depth_stencil_resolve_attachment::OptionalPtr{AttachmentReference2}
end

struct SubpassDescription2 <: HighLevelStruct
    next::Any
    flags::SubpassDescriptionFlag
    pipeline_bind_point::PipelineBindPoint
    view_mask::UInt32
    input_attachments::Vector{AttachmentReference2}
    color_attachments::Vector{AttachmentReference2}
    resolve_attachments::OptionalPtr{Vector{AttachmentReference2}}
    depth_stencil_attachment::OptionalPtr{AttachmentReference2}
    preserve_attachments::Vector{UInt32}
end

struct AttachmentDescription2 <: HighLevelStruct
    next::Any
    flags::AttachmentDescriptionFlag
    format::Format
    samples::SampleCountFlag
    load_op::AttachmentLoadOp
    store_op::AttachmentStoreOp
    stencil_load_op::AttachmentLoadOp
    stencil_store_op::AttachmentStoreOp
    initial_layout::ImageLayout
    final_layout::ImageLayout
end

struct RenderPassCreateInfo2 <: HighLevelStruct
    next::Any
    flags::RenderPassCreateFlag
    attachments::Vector{AttachmentDescription2}
    subpasses::Vector{SubpassDescription2}
    dependencies::Vector{SubpassDependency2}
    correlated_view_masks::Vector{UInt32}
end

struct AttachmentReference <: HighLevelStruct
    attachment::UInt32
    layout::ImageLayout
end

struct RenderPassFragmentDensityMapCreateInfoEXT <: HighLevelStruct
    next::Any
    fragment_density_map_attachment::AttachmentReference
end

struct SubpassDescription <: HighLevelStruct
    flags::SubpassDescriptionFlag
    pipeline_bind_point::PipelineBindPoint
    input_attachments::Vector{AttachmentReference}
    color_attachments::Vector{AttachmentReference}
    resolve_attachments::OptionalPtr{Vector{AttachmentReference}}
    depth_stencil_attachment::OptionalPtr{AttachmentReference}
    preserve_attachments::Vector{UInt32}
end

struct AttachmentDescription <: HighLevelStruct
    flags::AttachmentDescriptionFlag
    format::Format
    samples::SampleCountFlag
    load_op::AttachmentLoadOp
    store_op::AttachmentStoreOp
    stencil_load_op::AttachmentLoadOp
    stencil_store_op::AttachmentStoreOp
    initial_layout::ImageLayout
    final_layout::ImageLayout
end

struct RenderPassCreateInfo <: HighLevelStruct
    next::Any
    flags::RenderPassCreateFlag
    attachments::Vector{AttachmentDescription}
    subpasses::Vector{SubpassDescription}
    dependencies::Vector{SubpassDependency}
end

struct ImageCreateInfo <: HighLevelStruct
    next::Any
    flags::ImageCreateFlag
    image_type::ImageType
    format::Format
    extent::Extent3D
    mip_levels::UInt32
    array_layers::UInt32
    samples::SampleCountFlag
    tiling::ImageTiling
    usage::ImageUsageFlag
    sharing_mode::SharingMode
    queue_family_indices::Vector{UInt32}
    initial_layout::ImageLayout
end

struct PhysicalDeviceSurfaceInfo2KHR <: HighLevelStruct
    next::Any
    surface::SurfaceKHR
end

struct BindImageMemorySwapchainInfoKHR <: HighLevelStruct
    next::Any
    swapchain::SwapchainKHR
    image_index::UInt32
end

struct ImageSwapchainCreateInfoKHR <: HighLevelStruct
    next::Any
    swapchain::OptionalPtr{SwapchainKHR}
end

struct SwapchainCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::SwapchainCreateFlagKHR
    surface::SurfaceKHR
    min_image_count::UInt32
    image_format::Format
    image_color_space::ColorSpaceKHR
    image_extent::Extent2D
    image_array_layers::UInt32
    image_usage::ImageUsageFlag
    image_sharing_mode::SharingMode
    queue_family_indices::Vector{UInt32}
    pre_transform::SurfaceTransformFlagKHR
    composite_alpha::CompositeAlphaFlagKHR
    present_mode::PresentModeKHR
    clipped::Bool
    old_swapchain::OptionalPtr{SwapchainKHR}
end

struct DeviceGroupDeviceCreateInfo <: HighLevelStruct
    next::Any
    physical_devices::Vector{PhysicalDevice}
end

struct DisplayPlaneInfo2KHR <: HighLevelStruct
    next::Any
    mode::DisplayModeKHR
    plane_index::UInt32
end

struct DisplaySurfaceCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
    display_mode::DisplayModeKHR
    plane_index::UInt32
    plane_stack_index::UInt32
    transform::SurfaceTransformFlagKHR
    global_alpha::Float32
    alpha_mode::DisplayPlaneAlphaFlagKHR
    image_extent::Extent2D
end

struct VideoSessionParametersCreateInfoKHR <: HighLevelStruct
    next::Any
    video_session_parameters_template::VideoSessionParametersKHR
    video_session::VideoSessionKHR
end

struct AccelerationStructureMemoryRequirementsInfoNV <: HighLevelStruct
    next::Any
    type::AccelerationStructureMemoryRequirementsTypeNV
    acceleration_structure::AccelerationStructureNV
end

struct WriteDescriptorSetAccelerationStructureNV <: HighLevelStruct
    next::Any
    acceleration_structures::Vector{AccelerationStructureNV}
end

struct CopyMemoryToAccelerationStructureInfoKHR <: HighLevelStruct
    next::Any
    src::VkDeviceOrHostAddressConstKHR
    dst::AccelerationStructureKHR
    mode::CopyAccelerationStructureModeKHR
end

struct CopyAccelerationStructureToMemoryInfoKHR <: HighLevelStruct
    next::Any
    src::AccelerationStructureKHR
    dst::VkDeviceOrHostAddressKHR
    mode::CopyAccelerationStructureModeKHR
end

struct CopyAccelerationStructureInfoKHR <: HighLevelStruct
    next::Any
    src::AccelerationStructureKHR
    dst::AccelerationStructureKHR
    mode::CopyAccelerationStructureModeKHR
end

struct AccelerationStructureDeviceAddressInfoKHR <: HighLevelStruct
    next::Any
    acceleration_structure::AccelerationStructureKHR
end

struct AccelerationStructureBuildGeometryInfoKHR <: HighLevelStruct
    next::Any
    type::AccelerationStructureTypeKHR
    flags::BuildAccelerationStructureFlagKHR
    mode::BuildAccelerationStructureModeKHR
    src_acceleration_structure::OptionalPtr{AccelerationStructureKHR}
    dst_acceleration_structure::OptionalPtr{AccelerationStructureKHR}
    geometries::OptionalPtr{Vector{AccelerationStructureGeometryKHR}}
    geometries_2::OptionalPtr{Vector{AccelerationStructureGeometryKHR}}
    scratch_data::VkDeviceOrHostAddressKHR
end

struct WriteDescriptorSetAccelerationStructureKHR <: HighLevelStruct
    next::Any
    acceleration_structures::Vector{AccelerationStructureKHR}
end

struct ShaderModuleValidationCacheCreateInfoEXT <: HighLevelStruct
    next::Any
    validation_cache::ValidationCacheEXT
end

struct SamplerYcbcrConversionInfo <: HighLevelStruct
    next::Any
    conversion::SamplerYcbcrConversion
end

struct RenderPassBeginInfo <: HighLevelStruct
    next::Any
    render_pass::RenderPass
    framebuffer::Framebuffer
    render_area::Rect2D
    clear_values::Vector{VkClearValue}
end

struct CommandBufferInheritanceInfo <: HighLevelStruct
    next::Any
    render_pass::OptionalPtr{RenderPass}
    subpass::UInt32
    framebuffer::OptionalPtr{Framebuffer}
    occlusion_query_enable::Bool
    query_flags::QueryControlFlag
    pipeline_statistics::QueryPipelineStatisticFlag
end

struct CommandBufferBeginInfo <: HighLevelStruct
    next::Any
    flags::CommandBufferUsageFlag
    inheritance_info::OptionalPtr{CommandBufferInheritanceInfo}
end

struct SemaphoreSubmitInfoKHR <: HighLevelStruct
    next::Any
    semaphore::Semaphore
    value::UInt64
    stage_mask::UInt64
    device_index::UInt32
end

struct SemaphoreSignalInfo <: HighLevelStruct
    next::Any
    semaphore::Semaphore
    value::UInt64
end

struct SemaphoreWaitInfo <: HighLevelStruct
    next::Any
    flags::SemaphoreWaitFlag
    semaphores::Vector{Semaphore}
    values::Vector{UInt64}
end

struct SemaphoreGetZirconHandleInfoFUCHSIA <: HighLevelStruct
    next::Any
    semaphore::Semaphore
    handle_type::ExternalSemaphoreHandleTypeFlag
end

struct ImportSemaphoreZirconHandleInfoFUCHSIA <: HighLevelStruct
    next::Any
    semaphore::Semaphore
    flags::SemaphoreImportFlag
    handle_type::ExternalSemaphoreHandleTypeFlag
    zircon_handle::vk.zx_handle_t
end

struct SemaphoreGetFdInfoKHR <: HighLevelStruct
    next::Any
    semaphore::Semaphore
    handle_type::ExternalSemaphoreHandleTypeFlag
end

struct ImportSemaphoreFdInfoKHR <: HighLevelStruct
    next::Any
    semaphore::Semaphore
    flags::SemaphoreImportFlag
    handle_type::ExternalSemaphoreHandleTypeFlag
    fd::Int
end

struct SemaphoreGetWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    semaphore::Semaphore
    handle_type::ExternalSemaphoreHandleTypeFlag
end

struct ImportSemaphoreWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    semaphore::Semaphore
    flags::SemaphoreImportFlag
    handle_type::ExternalSemaphoreHandleTypeFlag
    handle::OptionalPtr{vk.HANDLE}
    name::OptionalPtr{vk.LPCWSTR}
end

struct PresentInfoKHR <: HighLevelStruct
    next::Any
    wait_semaphores::Vector{Semaphore}
    swapchains::Vector{SwapchainKHR}
    image_indices::Vector{UInt32}
    results::OptionalPtr{Vector{Result}}
end

struct AcquireNextImageInfoKHR <: HighLevelStruct
    next::Any
    swapchain::SwapchainKHR
    timeout::UInt64
    semaphore::OptionalPtr{Semaphore}
    fence::OptionalPtr{Fence}
    device_mask::UInt32
end

struct FenceGetFdInfoKHR <: HighLevelStruct
    next::Any
    fence::Fence
    handle_type::ExternalFenceHandleTypeFlag
end

struct ImportFenceFdInfoKHR <: HighLevelStruct
    next::Any
    fence::Fence
    flags::FenceImportFlag
    handle_type::ExternalFenceHandleTypeFlag
    fd::Int
end

struct FenceGetWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    fence::Fence
    handle_type::ExternalFenceHandleTypeFlag
end

struct ImportFenceWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    fence::Fence
    flags::FenceImportFlag
    handle_type::ExternalFenceHandleTypeFlag
    handle::OptionalPtr{vk.HANDLE}
    name::OptionalPtr{vk.LPCWSTR}
end

struct CopyDescriptorSet <: HighLevelStruct
    next::Any
    src_set::DescriptorSet
    src_binding::UInt32
    src_array_element::UInt32
    dst_set::DescriptorSet
    dst_binding::UInt32
    dst_array_element::UInt32
    descriptor_count::UInt32
end

struct PipelineLayoutCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    set_layouts::Vector{DescriptorSetLayout}
    push_constant_ranges::Vector{PushConstantRange}
end

struct DescriptorSetAllocateInfo <: HighLevelStruct
    next::Any
    descriptor_pool::DescriptorPool
    set_layouts::Vector{DescriptorSetLayout}
end

struct DescriptorSetLayoutBinding <: HighLevelStruct
    binding::UInt32
    descriptor_type::DescriptorType
    descriptor_count::UInt32
    stage_flags::ShaderStageFlag
    immutable_samplers::OptionalPtr{Vector{Sampler}}
end

struct DescriptorSetLayoutCreateInfo <: HighLevelStruct
    next::Any
    flags::DescriptorSetLayoutCreateFlag
    bindings::Vector{DescriptorSetLayoutBinding}
end

struct DescriptorUpdateTemplateCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    descriptor_update_entries::Vector{DescriptorUpdateTemplateEntry}
    template_type::DescriptorUpdateTemplateType
    descriptor_set_layout::DescriptorSetLayout
    pipeline_bind_point::PipelineBindPoint
    pipeline_layout::PipelineLayout
    set::UInt32
end

struct IndirectCommandsLayoutTokenNV <: HighLevelStruct
    next::Any
    token_type::IndirectCommandsTokenTypeNV
    stream::UInt32
    offset::UInt32
    vertex_binding_unit::UInt32
    vertex_dynamic_stride::Bool
    pushconstant_pipeline_layout::OptionalPtr{PipelineLayout}
    pushconstant_shader_stage_flags::ShaderStageFlag
    pushconstant_offset::UInt32
    pushconstant_size::UInt32
    indirect_state_flags::IndirectStateFlagNV
    index_types::Vector{IndexType}
    index_type_values::Vector{UInt32}
end

struct IndirectCommandsLayoutCreateInfoNV <: HighLevelStruct
    next::Any
    flags::IndirectCommandsLayoutUsageFlagNV
    pipeline_bind_point::PipelineBindPoint
    tokens::Vector{IndirectCommandsLayoutTokenNV}
    stream_strides::Vector{UInt32}
end

struct PipelineLibraryCreateInfoKHR <: HighLevelStruct
    next::Any
    libraries::Vector{Pipeline}
end

struct PipelineExecutableInfoKHR <: HighLevelStruct
    next::Any
    pipeline::Pipeline
    executable_index::UInt32
end

struct PipelineInfoKHR <: HighLevelStruct
    next::Any
    pipeline::Pipeline
end

struct GeneratedCommandsMemoryRequirementsInfoNV <: HighLevelStruct
    next::Any
    pipeline_bind_point::PipelineBindPoint
    pipeline::Pipeline
    indirect_commands_layout::IndirectCommandsLayoutNV
    max_sequences_count::UInt32
end

struct PipelineShaderStageCreateInfo <: HighLevelStruct
    next::Any
    flags::PipelineShaderStageCreateFlag
    stage::ShaderStageFlag
    _module::ShaderModule
    name::String
    specialization_info::OptionalPtr{SpecializationInfo}
end

struct RayTracingPipelineCreateInfoKHR <: HighLevelStruct
    next::Any
    flags::PipelineCreateFlag
    stages::Vector{PipelineShaderStageCreateInfo}
    groups::Vector{RayTracingShaderGroupCreateInfoKHR}
    max_pipeline_ray_recursion_depth::UInt32
    library_info::OptionalPtr{PipelineLibraryCreateInfoKHR}
    library_interface::OptionalPtr{RayTracingPipelineInterfaceCreateInfoKHR}
    dynamic_state::OptionalPtr{PipelineDynamicStateCreateInfo}
    layout::PipelineLayout
    base_pipeline_handle::OptionalPtr{Pipeline}
    base_pipeline_index::Int32
end

struct RayTracingPipelineCreateInfoNV <: HighLevelStruct
    next::Any
    flags::PipelineCreateFlag
    stages::Vector{PipelineShaderStageCreateInfo}
    groups::Vector{RayTracingShaderGroupCreateInfoNV}
    max_recursion_depth::UInt32
    layout::PipelineLayout
    base_pipeline_handle::OptionalPtr{Pipeline}
    base_pipeline_index::Int32
end

struct GraphicsShaderGroupCreateInfoNV <: HighLevelStruct
    next::Any
    stages::Vector{PipelineShaderStageCreateInfo}
    vertex_input_state::OptionalPtr{PipelineVertexInputStateCreateInfo}
    tessellation_state::OptionalPtr{PipelineTessellationStateCreateInfo}
end

struct GraphicsPipelineShaderGroupsCreateInfoNV <: HighLevelStruct
    next::Any
    groups::Vector{GraphicsShaderGroupCreateInfoNV}
    pipelines::Vector{Pipeline}
end

struct GraphicsPipelineCreateInfo <: HighLevelStruct
    next::Any
    flags::PipelineCreateFlag
    stages::Vector{PipelineShaderStageCreateInfo}
    vertex_input_state::OptionalPtr{PipelineVertexInputStateCreateInfo}
    input_assembly_state::OptionalPtr{PipelineInputAssemblyStateCreateInfo}
    tessellation_state::OptionalPtr{PipelineTessellationStateCreateInfo}
    viewport_state::OptionalPtr{PipelineViewportStateCreateInfo}
    rasterization_state::PipelineRasterizationStateCreateInfo
    multisample_state::OptionalPtr{PipelineMultisampleStateCreateInfo}
    depth_stencil_state::OptionalPtr{PipelineDepthStencilStateCreateInfo}
    color_blend_state::OptionalPtr{PipelineColorBlendStateCreateInfo}
    dynamic_state::OptionalPtr{PipelineDynamicStateCreateInfo}
    layout::PipelineLayout
    render_pass::RenderPass
    subpass::UInt32
    base_pipeline_handle::OptionalPtr{Pipeline}
    base_pipeline_index::Int32
end

struct ComputePipelineCreateInfo <: HighLevelStruct
    next::Any
    flags::PipelineCreateFlag
    stage::PipelineShaderStageCreateInfo
    layout::PipelineLayout
    base_pipeline_handle::OptionalPtr{Pipeline}
    base_pipeline_index::Int32
end

struct VideoPictureResourceKHR <: HighLevelStruct
    next::Any
    coded_offset::Offset2D
    coded_extent::Extent2D
    base_array_layer::UInt32
    image_view_binding::ImageView
end

struct VideoReferenceSlotKHR <: HighLevelStruct
    next::Any
    slot_index::Int8
    picture_resource::VideoPictureResourceKHR
end

struct VideoBeginCodingInfoKHR <: HighLevelStruct
    next::Any
    flags::UInt32
    codec_quality_preset::VideoCodingQualityPresetFlagKHR
    video_session::VideoSessionKHR
    video_session_parameters::OptionalPtr{VideoSessionParametersKHR}
    reference_slots::Vector{VideoReferenceSlotKHR}
end

struct ImageViewHandleInfoNVX <: HighLevelStruct
    next::Any
    image_view::ImageView
    descriptor_type::DescriptorType
    sampler::OptionalPtr{Sampler}
end

struct RenderPassAttachmentBeginInfo <: HighLevelStruct
    next::Any
    attachments::Vector{ImageView}
end

struct FramebufferCreateInfo <: HighLevelStruct
    next::Any
    flags::FramebufferCreateFlag
    render_pass::RenderPass
    attachments::Vector{ImageView}
    width::UInt32
    height::UInt32
    layers::UInt32
end

struct DescriptorImageInfo <: HighLevelStruct
    sampler::Sampler
    image_view::ImageView
    image_layout::ImageLayout
end

struct ImageMemoryBarrier2KHR <: HighLevelStruct
    next::Any
    src_stage_mask::UInt64
    src_access_mask::UInt64
    dst_stage_mask::UInt64
    dst_access_mask::UInt64
    old_layout::ImageLayout
    new_layout::ImageLayout
    src_queue_family_index::UInt32
    dst_queue_family_index::UInt32
    image::Image
    subresource_range::ImageSubresourceRange
end

struct ResolveImageInfo2KHR <: HighLevelStruct
    next::Any
    src_image::Image
    src_image_layout::ImageLayout
    dst_image::Image
    dst_image_layout::ImageLayout
    regions::Vector{ImageResolve2KHR}
end

struct BlitImageInfo2KHR <: HighLevelStruct
    next::Any
    src_image::Image
    src_image_layout::ImageLayout
    dst_image::Image
    dst_image_layout::ImageLayout
    regions::Vector{ImageBlit2KHR}
    filter::Filter
end

struct CopyImageInfo2KHR <: HighLevelStruct
    next::Any
    src_image::Image
    src_image_layout::ImageLayout
    dst_image::Image
    dst_image_layout::ImageLayout
    regions::Vector{ImageCopy2KHR}
end

struct ImageSparseMemoryRequirementsInfo2 <: HighLevelStruct
    next::Any
    image::Image
end

struct ImageMemoryRequirementsInfo2 <: HighLevelStruct
    next::Any
    image::Image
end

struct ImageViewCreateInfo <: HighLevelStruct
    next::Any
    flags::ImageViewCreateFlag
    image::Image
    view_type::ImageViewType
    format::Format
    components::ComponentMapping
    subresource_range::ImageSubresourceRange
end

struct ImageMemoryBarrier <: HighLevelStruct
    next::Any
    src_access_mask::AccessFlag
    dst_access_mask::AccessFlag
    old_layout::ImageLayout
    new_layout::ImageLayout
    src_queue_family_index::UInt32
    dst_queue_family_index::UInt32
    image::Image
    subresource_range::ImageSubresourceRange
end

struct VideoEncodeInfoKHR <: HighLevelStruct
    next::Any
    flags::VideoEncodeFlagKHR
    quality_level::UInt32
    coded_extent::Extent2D
    dst_bitstream_buffer::Buffer
    dst_bitstream_buffer_offset::UInt64
    dst_bitstream_buffer_max_range::UInt64
    src_picture_resource::VideoPictureResourceKHR
    setup_reference_slot::VideoReferenceSlotKHR
    reference_slots::Vector{VideoReferenceSlotKHR}
end

struct VideoDecodeInfoKHR <: HighLevelStruct
    next::Any
    flags::VideoDecodeFlagKHR
    coded_offset::Offset2D
    coded_extent::Extent2D
    src_buffer::Buffer
    src_buffer_offset::UInt64
    src_buffer_range::UInt64
    dst_picture_resource::VideoPictureResourceKHR
    setup_reference_slot::VideoReferenceSlotKHR
    reference_slots::Vector{VideoReferenceSlotKHR}
end

struct BufferMemoryBarrier2KHR <: HighLevelStruct
    next::Any
    src_stage_mask::UInt64
    src_access_mask::UInt64
    dst_stage_mask::UInt64
    dst_access_mask::UInt64
    src_queue_family_index::UInt32
    dst_queue_family_index::UInt32
    buffer::Buffer
    offset::UInt64
    size::UInt64
end

struct DependencyInfoKHR <: HighLevelStruct
    next::Any
    dependency_flags::DependencyFlag
    memory_barriers::Vector{MemoryBarrier2KHR}
    buffer_memory_barriers::Vector{BufferMemoryBarrier2KHR}
    image_memory_barriers::Vector{ImageMemoryBarrier2KHR}
end

struct CopyImageToBufferInfo2KHR <: HighLevelStruct
    next::Any
    src_image::Image
    src_image_layout::ImageLayout
    dst_buffer::Buffer
    regions::Vector{BufferImageCopy2KHR}
end

struct CopyBufferToImageInfo2KHR <: HighLevelStruct
    next::Any
    src_buffer::Buffer
    dst_image::Image
    dst_image_layout::ImageLayout
    regions::Vector{BufferImageCopy2KHR}
end

struct CopyBufferInfo2KHR <: HighLevelStruct
    next::Any
    src_buffer::Buffer
    dst_buffer::Buffer
    regions::Vector{BufferCopy2KHR}
end

struct AccelerationStructureCreateInfoKHR <: HighLevelStruct
    next::Any
    create_flags::AccelerationStructureCreateFlagKHR
    buffer::Buffer
    offset::UInt64
    size::UInt64
    type::AccelerationStructureTypeKHR
    device_address::UInt64
end

struct BufferDeviceAddressInfo <: HighLevelStruct
    next::Any
    buffer::Buffer
end

struct GeometryAABBNV <: HighLevelStruct
    next::Any
    aabb_data::OptionalPtr{Buffer}
    num_aab_bs::UInt32
    stride::UInt32
    offset::UInt64
end

struct GeometryTrianglesNV <: HighLevelStruct
    next::Any
    vertex_data::OptionalPtr{Buffer}
    vertex_offset::UInt64
    vertex_count::UInt32
    vertex_stride::UInt64
    vertex_format::Format
    index_data::OptionalPtr{Buffer}
    index_offset::UInt64
    index_count::UInt32
    index_type::IndexType
    transform_data::OptionalPtr{Buffer}
    transform_offset::UInt64
end

struct GeometryDataNV <: HighLevelStruct
    triangles::GeometryTrianglesNV
    aabbs::GeometryAABBNV
end

struct GeometryNV <: HighLevelStruct
    next::Any
    geometry_type::GeometryTypeKHR
    geometry::GeometryDataNV
    flags::GeometryFlagKHR
end

struct AccelerationStructureInfoNV <: HighLevelStruct
    next::Any
    type::VkAccelerationStructureTypeNV
    flags::OptionalPtr{VkBuildAccelerationStructureFlagsNV}
    instance_count::UInt32
    geometries::Vector{GeometryNV}
end

struct AccelerationStructureCreateInfoNV <: HighLevelStruct
    next::Any
    compacted_size::UInt64
    info::AccelerationStructureInfoNV
end

struct ConditionalRenderingBeginInfoEXT <: HighLevelStruct
    next::Any
    buffer::Buffer
    offset::UInt64
    flags::ConditionalRenderingFlagEXT
end

struct MemoryDedicatedAllocateInfo <: HighLevelStruct
    next::Any
    image::OptionalPtr{Image}
    buffer::OptionalPtr{Buffer}
end

struct BufferMemoryRequirementsInfo2 <: HighLevelStruct
    next::Any
    buffer::Buffer
end

struct IndirectCommandsStreamNV <: HighLevelStruct
    buffer::Buffer
    offset::UInt64
end

struct GeneratedCommandsInfoNV <: HighLevelStruct
    next::Any
    pipeline_bind_point::PipelineBindPoint
    pipeline::Pipeline
    indirect_commands_layout::IndirectCommandsLayoutNV
    streams::Vector{IndirectCommandsStreamNV}
    sequences_count::UInt32
    preprocess_buffer::Buffer
    preprocess_offset::UInt64
    preprocess_size::UInt64
    sequences_count_buffer::OptionalPtr{Buffer}
    sequences_count_offset::UInt64
    sequences_index_buffer::OptionalPtr{Buffer}
    sequences_index_offset::UInt64
end

struct DedicatedAllocationMemoryAllocateInfoNV <: HighLevelStruct
    next::Any
    image::OptionalPtr{Image}
    buffer::OptionalPtr{Buffer}
end

struct BufferMemoryBarrier <: HighLevelStruct
    next::Any
    src_access_mask::AccessFlag
    dst_access_mask::AccessFlag
    src_queue_family_index::UInt32
    dst_queue_family_index::UInt32
    buffer::Buffer
    offset::UInt64
    size::UInt64
end

struct BufferViewCreateInfo <: HighLevelStruct
    next::Any
    flags::UInt32
    buffer::Buffer
    format::Format
    offset::UInt64
    range::UInt64
end

struct DescriptorBufferInfo <: HighLevelStruct
    buffer::OptionalPtr{Buffer}
    offset::UInt64
    range::UInt64
end

struct WriteDescriptorSet <: HighLevelStruct
    next::Any
    dst_set::DescriptorSet
    dst_binding::UInt32
    dst_array_element::UInt32
    descriptor_count::UInt32
    descriptor_type::DescriptorType
    image_info::Vector{DescriptorImageInfo}
    buffer_info::Vector{DescriptorBufferInfo}
    texel_buffer_view::Vector{BufferView}
end

struct CommandBufferAllocateInfo <: HighLevelStruct
    next::Any
    command_pool::CommandPool
    level::CommandBufferLevel
    command_buffer_count::UInt32
end

struct CommandBufferSubmitInfoKHR <: HighLevelStruct
    next::Any
    command_buffer::CommandBuffer
    device_mask::UInt32
end

struct SubmitInfo2KHR <: HighLevelStruct
    next::Any
    flags::SubmitFlagKHR
    wait_semaphore_infos::Vector{SemaphoreSubmitInfoKHR}
    command_buffer_infos::Vector{CommandBufferSubmitInfoKHR}
    signal_semaphore_infos::Vector{SemaphoreSubmitInfoKHR}
end

struct SubmitInfo <: HighLevelStruct
    next::Any
    wait_semaphores::Vector{Semaphore}
    wait_dst_stage_mask::Vector{PipelineStageFlag}
    command_buffers::Vector{CommandBuffer}
    signal_semaphores::Vector{Semaphore}
end

struct VideoBindMemoryKHR <: HighLevelStruct
    next::Any
    memory_bind_index::UInt32
    memory::DeviceMemory
    memory_offset::UInt64
    memory_size::UInt64
end

struct DeviceMemoryOpaqueCaptureAddressInfo <: HighLevelStruct
    next::Any
    memory::DeviceMemory
end

struct BindAccelerationStructureMemoryInfoNV <: HighLevelStruct
    next::Any
    acceleration_structure::AccelerationStructureNV
    memory::DeviceMemory
    memory_offset::UInt64
    device_indices::Vector{UInt32}
end

struct MemoryGetAndroidHardwareBufferInfoANDROID <: HighLevelStruct
    next::Any
    memory::DeviceMemory
end

struct BindImageMemoryInfo <: HighLevelStruct
    next::Any
    image::Image
    memory::DeviceMemory
    memory_offset::UInt64
end

struct BindBufferMemoryInfo <: HighLevelStruct
    next::Any
    buffer::Buffer
    memory::DeviceMemory
    memory_offset::UInt64
end

struct Win32KeyedMutexAcquireReleaseInfoKHR <: HighLevelStruct
    next::Any
    acquire_syncs::Vector{DeviceMemory}
    acquire_keys::Vector{UInt64}
    acquire_timeouts::Vector{UInt32}
    release_syncs::Vector{DeviceMemory}
    release_keys::Vector{UInt64}
end

struct MemoryGetFdInfoKHR <: HighLevelStruct
    next::Any
    memory::DeviceMemory
    handle_type::ExternalMemoryHandleTypeFlag
end

struct MemoryGetWin32HandleInfoKHR <: HighLevelStruct
    next::Any
    memory::DeviceMemory
    handle_type::ExternalMemoryHandleTypeFlag
end

struct MemoryGetZirconHandleInfoFUCHSIA <: HighLevelStruct
    next::Any
    memory::DeviceMemory
    handle_type::ExternalMemoryHandleTypeFlag
end

struct Win32KeyedMutexAcquireReleaseInfoNV <: HighLevelStruct
    next::Any
    acquire_syncs::Vector{DeviceMemory}
    acquire_keys::Vector{UInt64}
    acquire_timeout_milliseconds::Vector{UInt32}
    release_syncs::Vector{DeviceMemory}
    release_keys::Vector{UInt64}
end

struct SparseImageMemoryBind <: HighLevelStruct
    subresource::ImageSubresource
    offset::Offset3D
    extent::Extent3D
    memory::OptionalPtr{DeviceMemory}
    memory_offset::UInt64
    flags::SparseMemoryBindFlag
end

struct SparseImageMemoryBindInfo <: HighLevelStruct
    image::Image
    binds::Vector{SparseImageMemoryBind}
end

struct SparseMemoryBind <: HighLevelStruct
    resource_offset::UInt64
    size::UInt64
    memory::OptionalPtr{DeviceMemory}
    memory_offset::UInt64
    flags::SparseMemoryBindFlag
end

struct SparseImageOpaqueMemoryBindInfo <: HighLevelStruct
    image::Image
    binds::Vector{SparseMemoryBind}
end

struct SparseBufferMemoryBindInfo <: HighLevelStruct
    buffer::Buffer
    binds::Vector{SparseMemoryBind}
end

struct BindSparseInfo <: HighLevelStruct
    next::Any
    wait_semaphores::Vector{Semaphore}
    buffer_binds::Vector{SparseBufferMemoryBindInfo}
    image_opaque_binds::Vector{SparseImageOpaqueMemoryBindInfo}
    image_binds::Vector{SparseImageMemoryBindInfo}
    signal_semaphores::Vector{Semaphore}
end

struct MappedMemoryRange <: HighLevelStruct
    next::Any
    memory::DeviceMemory
    offset::UInt64
    size::UInt64
end

struct PipelineCreationFeedbackCreateInfoEXT <: HighLevelStruct
    next::Any
    pipeline_creation_feedback::PipelineCreationFeedbackEXT
    pipeline_stage_creation_feedbacks::Vector{PipelineCreationFeedbackEXT}
end

struct ImageDrmFormatModifierExplicitCreateInfoEXT <: HighLevelStruct
    next::Any
    drm_format_modifier::UInt64
    plane_layouts::Vector{SubresourceLayout}
end

struct VideoGetMemoryPropertiesKHR <: HighLevelStruct
    next::Any
    memory_bind_index::UInt32
    memory_requirements::MemoryRequirements2
end

struct VideoEncodeH264SessionCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::VideoEncodeH264CreateFlagEXT
    max_picture_size_in_mbs::Extent2D
    std_extension_version::ExtensionProperties
end

struct VideoEncodeH264CapabilitiesEXT <: HighLevelStruct
    next::Any
    flags::VideoEncodeH264CapabilitiesFlagEXT
    input_mode_flags::VideoEncodeH264InputModeFlagEXT
    output_mode_flags::VideoEncodeH264OutputModeFlagEXT
    min_picture_size_in_mbs::Extent2D
    max_picture_size_in_mbs::Extent2D
    input_image_data_alignment::Extent2D
    max_num_l_0_reference_for_p::UInt8
    max_num_l_0_reference_for_b::UInt8
    max_num_l_1_reference::UInt8
    quality_level_count::UInt8
    std_extension_version::ExtensionProperties
end

struct VideoDecodeH265SessionCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    std_extension_version::ExtensionProperties
end

struct VideoDecodeH264SessionCreateInfoEXT <: HighLevelStruct
    next::Any
    flags::UInt32
    std_extension_version::ExtensionProperties
end


BaseOutStructure(; next = C_NULL) = BaseOutStructure(next)

BaseInStructure(; next = C_NULL) = BaseInStructure(next)

ApplicationInfo(application_version::VersionNumber, engine_version::VersionNumber, api_version::VersionNumber; next = C_NULL, application_name = "", engine_name = "") = ApplicationInfo(next, application_name, application_version, engine_name, engine_version, api_version)

AllocationCallbacks(pfn_allocation::FunctionPtr, pfn_reallocation::FunctionPtr, pfn_free::FunctionPtr; user_data = C_NULL, pfn_internal_allocation = C_NULL, pfn_internal_free = C_NULL) = AllocationCallbacks(user_data, pfn_allocation, pfn_reallocation, pfn_free, pfn_internal_allocation, pfn_internal_free)

DeviceQueueCreateInfo(queue_family_index::Integer, queue_priorities::AbstractArray; next = C_NULL, flags = 0) = DeviceQueueCreateInfo(next, flags, queue_family_index, queue_priorities)

DeviceCreateInfo(queue_create_infos::AbstractArray, enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; next = C_NULL, flags = 0, enabled_features = C_NULL) = DeviceCreateInfo(next, flags, queue_create_infos, enabled_layer_names, enabled_extension_names, enabled_features)

InstanceCreateInfo(enabled_layer_names::AbstractArray, enabled_extension_names::AbstractArray; next = C_NULL, flags = 0, application_info = C_NULL) = InstanceCreateInfo(next, flags, application_info, enabled_layer_names, enabled_extension_names)

MemoryAllocateInfo(allocation_size::Integer, memory_type_index::Integer; next = C_NULL) = MemoryAllocateInfo(next, allocation_size, memory_type_index)

MappedMemoryRange(memory::DeviceMemory, offset::Integer, size::Integer; next = C_NULL) = MappedMemoryRange(next, memory, offset, size)

DescriptorBufferInfo(offset::Integer, range::Integer; buffer = C_NULL) = DescriptorBufferInfo(buffer, offset, range)

WriteDescriptorSet(dst_set::DescriptorSet, dst_binding::Integer, dst_array_element::Integer, descriptor_type::DescriptorType, image_info::AbstractArray, buffer_info::AbstractArray, texel_buffer_view::AbstractArray; next = C_NULL, descriptor_count = max(pointer_length(image_info), pointer_length(buffer_info), pointer_length(texel_buffer_view))) = WriteDescriptorSet(next, dst_set, dst_binding, dst_array_element, descriptor_count, descriptor_type, image_info, buffer_info, texel_buffer_view)

CopyDescriptorSet(src_set::DescriptorSet, src_binding::Integer, src_array_element::Integer, dst_set::DescriptorSet, dst_binding::Integer, dst_array_element::Integer, descriptor_count::Integer; next = C_NULL) = CopyDescriptorSet(next, src_set, src_binding, src_array_element, dst_set, dst_binding, dst_array_element, descriptor_count)

BufferCreateInfo(size::Integer, usage::BufferUsageFlag, sharing_mode::SharingMode, queue_family_indices::AbstractArray; next = C_NULL, flags = 0) = BufferCreateInfo(next, flags, size, usage, sharing_mode, queue_family_indices)

BufferViewCreateInfo(buffer::Buffer, format::Format, offset::Integer, range::Integer; next = C_NULL, flags = 0) = BufferViewCreateInfo(next, flags, buffer, format, offset, range)

MemoryBarrier(; next = C_NULL, src_access_mask = 0, dst_access_mask = 0) = MemoryBarrier(next, src_access_mask, dst_access_mask)

BufferMemoryBarrier(src_access_mask::AccessFlag, dst_access_mask::AccessFlag, src_queue_family_index::Integer, dst_queue_family_index::Integer, buffer::Buffer, offset::Integer, size::Integer; next = C_NULL) = BufferMemoryBarrier(next, src_access_mask, dst_access_mask, src_queue_family_index, dst_queue_family_index, buffer, offset, size)

ImageMemoryBarrier(src_access_mask::AccessFlag, dst_access_mask::AccessFlag, old_layout::ImageLayout, new_layout::ImageLayout, src_queue_family_index::Integer, dst_queue_family_index::Integer, image::Image, subresource_range::ImageSubresourceRange; next = C_NULL) = ImageMemoryBarrier(next, src_access_mask, dst_access_mask, old_layout, new_layout, src_queue_family_index, dst_queue_family_index, image, subresource_range)

ImageCreateInfo(image_type::ImageType, format::Format, extent::Extent3D, mip_levels::Integer, array_layers::Integer, samples::SampleCountFlag, tiling::ImageTiling, usage::ImageUsageFlag, sharing_mode::SharingMode, queue_family_indices::AbstractArray, initial_layout::ImageLayout; next = C_NULL, flags = 0) = ImageCreateInfo(next, flags, image_type, format, extent, mip_levels, array_layers, samples, tiling, usage, sharing_mode, queue_family_indices, initial_layout)

ImageViewCreateInfo(image::Image, view_type::ImageViewType, format::Format, components::ComponentMapping, subresource_range::ImageSubresourceRange; next = C_NULL, flags = 0) = ImageViewCreateInfo(next, flags, image, view_type, format, components, subresource_range)

SparseMemoryBind(resource_offset::Integer, size::Integer, memory_offset::Integer; memory = C_NULL, flags = 0) = SparseMemoryBind(resource_offset, size, memory, memory_offset, flags)

SparseImageMemoryBind(subresource::ImageSubresource, offset::Offset3D, extent::Extent3D, memory_offset::Integer; memory = C_NULL, flags = 0) = SparseImageMemoryBind(subresource, offset, extent, memory, memory_offset, flags)

BindSparseInfo(wait_semaphores::AbstractArray, buffer_binds::AbstractArray, image_opaque_binds::AbstractArray, image_binds::AbstractArray, signal_semaphores::AbstractArray; next = C_NULL) = BindSparseInfo(next, wait_semaphores, buffer_binds, image_opaque_binds, image_binds, signal_semaphores)

ShaderModuleCreateInfo(code_size::Integer, code::AbstractArray; next = C_NULL, flags = 0) = ShaderModuleCreateInfo(next, flags, code_size, code)

DescriptorSetLayoutBinding(binding::Integer, descriptor_type::DescriptorType, stage_flags::ShaderStageFlag; descriptor_count = 0, immutable_samplers = C_NULL) = DescriptorSetLayoutBinding(binding, descriptor_type, descriptor_count, stage_flags, immutable_samplers)

DescriptorSetLayoutCreateInfo(bindings::AbstractArray; next = C_NULL, flags = 0) = DescriptorSetLayoutCreateInfo(next, flags, bindings)

DescriptorPoolCreateInfo(max_sets::Integer, pool_sizes::AbstractArray; next = C_NULL, flags = 0) = DescriptorPoolCreateInfo(next, flags, max_sets, pool_sizes)

DescriptorSetAllocateInfo(descriptor_pool::DescriptorPool, set_layouts::AbstractArray; next = C_NULL) = DescriptorSetAllocateInfo(next, descriptor_pool, set_layouts)

SpecializationInfo(map_entries::AbstractArray, data::Cvoid; data_size = C_NULL) = SpecializationInfo(map_entries, data_size, data)

PipelineShaderStageCreateInfo(stage::ShaderStageFlag, _module::ShaderModule, name::AbstractString; next = C_NULL, flags = 0, specialization_info = C_NULL) = PipelineShaderStageCreateInfo(next, flags, stage, _module, name, specialization_info)

ComputePipelineCreateInfo(stage::PipelineShaderStageCreateInfo, layout::PipelineLayout, base_pipeline_index::Integer; next = C_NULL, flags = 0, base_pipeline_handle = C_NULL) = ComputePipelineCreateInfo(next, flags, stage, layout, base_pipeline_handle, base_pipeline_index)

PipelineVertexInputStateCreateInfo(vertex_binding_descriptions::AbstractArray, vertex_attribute_descriptions::AbstractArray; next = C_NULL, flags = 0) = PipelineVertexInputStateCreateInfo(next, flags, vertex_binding_descriptions, vertex_attribute_descriptions)

PipelineInputAssemblyStateCreateInfo(topology::PrimitiveTopology, primitive_restart_enable::Bool; next = C_NULL, flags = 0) = PipelineInputAssemblyStateCreateInfo(next, flags, topology, primitive_restart_enable)

PipelineTessellationStateCreateInfo(patch_control_points::Integer; next = C_NULL, flags = 0) = PipelineTessellationStateCreateInfo(next, flags, patch_control_points)

PipelineViewportStateCreateInfo(; next = C_NULL, flags = 0, viewports = C_NULL, scissors = C_NULL) = PipelineViewportStateCreateInfo(next, flags, viewports, scissors)

PipelineRasterizationStateCreateInfo(depth_clamp_enable::Bool, rasterizer_discard_enable::Bool, polygon_mode::PolygonMode, front_face::FrontFace, depth_bias_enable::Bool, depth_bias_constant_factor::Real, depth_bias_clamp::Real, depth_bias_slope_factor::Real, line_width::Real; next = C_NULL, flags = 0, cull_mode = 0) = PipelineRasterizationStateCreateInfo(next, flags, depth_clamp_enable, rasterizer_discard_enable, polygon_mode, cull_mode, front_face, depth_bias_enable, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor, line_width)

PipelineMultisampleStateCreateInfo(rasterization_samples::SampleCountFlag, sample_shading_enable::Bool, min_sample_shading::Real, alpha_to_coverage_enable::Bool, alpha_to_one_enable::Bool; next = C_NULL, flags = 0, sample_mask = C_NULL) = PipelineMultisampleStateCreateInfo(next, flags, rasterization_samples, sample_shading_enable, min_sample_shading, sample_mask, alpha_to_coverage_enable, alpha_to_one_enable)

PipelineColorBlendAttachmentState(blend_enable::Bool, src_color_blend_factor::BlendFactor, dst_color_blend_factor::BlendFactor, color_blend_op::BlendOp, src_alpha_blend_factor::BlendFactor, dst_alpha_blend_factor::BlendFactor, alpha_blend_op::BlendOp; color_write_mask = 0) = PipelineColorBlendAttachmentState(blend_enable, src_color_blend_factor, dst_color_blend_factor, color_blend_op, src_alpha_blend_factor, dst_alpha_blend_factor, alpha_blend_op, color_write_mask)

PipelineColorBlendStateCreateInfo(logic_op_enable::Bool, logic_op::LogicOp, attachments::AbstractArray, blend_constants::NTuple{4, Float32}; next = C_NULL, flags = 0) = PipelineColorBlendStateCreateInfo(next, flags, logic_op_enable, logic_op, attachments, blend_constants)

PipelineDynamicStateCreateInfo(dynamic_states::AbstractArray; next = C_NULL, flags = 0) = PipelineDynamicStateCreateInfo(next, flags, dynamic_states)

PipelineDepthStencilStateCreateInfo(depth_test_enable::Bool, depth_write_enable::Bool, depth_compare_op::CompareOp, depth_bounds_test_enable::Bool, stencil_test_enable::Bool, front::StencilOpState, back::StencilOpState, min_depth_bounds::Real, max_depth_bounds::Real; next = C_NULL, flags = 0) = PipelineDepthStencilStateCreateInfo(next, flags, depth_test_enable, depth_write_enable, depth_compare_op, depth_bounds_test_enable, stencil_test_enable, front, back, min_depth_bounds, max_depth_bounds)

GraphicsPipelineCreateInfo(stages::AbstractArray, rasterization_state::PipelineRasterizationStateCreateInfo, layout::PipelineLayout, render_pass::RenderPass, subpass::Integer, base_pipeline_index::Integer; next = C_NULL, flags = 0, vertex_input_state = C_NULL, input_assembly_state = C_NULL, tessellation_state = C_NULL, viewport_state = C_NULL, multisample_state = C_NULL, depth_stencil_state = C_NULL, color_blend_state = C_NULL, dynamic_state = C_NULL, base_pipeline_handle = C_NULL) = GraphicsPipelineCreateInfo(next, flags, stages, vertex_input_state, input_assembly_state, tessellation_state, viewport_state, rasterization_state, multisample_state, depth_stencil_state, color_blend_state, dynamic_state, layout, render_pass, subpass, base_pipeline_handle, base_pipeline_index)

PipelineCacheCreateInfo(initial_data::Cvoid; next = C_NULL, flags = 0, initial_data_size = C_NULL) = PipelineCacheCreateInfo(next, flags, initial_data_size, initial_data)

PipelineLayoutCreateInfo(set_layouts::AbstractArray, push_constant_ranges::AbstractArray; next = C_NULL, flags = 0) = PipelineLayoutCreateInfo(next, flags, set_layouts, push_constant_ranges)

SamplerCreateInfo(mag_filter::Filter, min_filter::Filter, mipmap_mode::SamplerMipmapMode, address_mode_u::SamplerAddressMode, address_mode_v::SamplerAddressMode, address_mode_w::SamplerAddressMode, mip_lod_bias::Real, anisotropy_enable::Bool, max_anisotropy::Real, compare_enable::Bool, compare_op::CompareOp, min_lod::Real, max_lod::Real, border_color::BorderColor, unnormalized_coordinates::Bool; next = C_NULL, flags = 0) = SamplerCreateInfo(next, flags, mag_filter, min_filter, mipmap_mode, address_mode_u, address_mode_v, address_mode_w, mip_lod_bias, anisotropy_enable, max_anisotropy, compare_enable, compare_op, min_lod, max_lod, border_color, unnormalized_coordinates)

CommandPoolCreateInfo(queue_family_index::Integer; next = C_NULL, flags = 0) = CommandPoolCreateInfo(next, flags, queue_family_index)

CommandBufferAllocateInfo(command_pool::CommandPool, level::CommandBufferLevel, command_buffer_count::Integer; next = C_NULL) = CommandBufferAllocateInfo(next, command_pool, level, command_buffer_count)

CommandBufferInheritanceInfo(subpass::Integer, occlusion_query_enable::Bool; next = C_NULL, render_pass = C_NULL, framebuffer = C_NULL, query_flags = 0, pipeline_statistics = 0) = CommandBufferInheritanceInfo(next, render_pass, subpass, framebuffer, occlusion_query_enable, query_flags, pipeline_statistics)

CommandBufferBeginInfo(; next = C_NULL, flags = 0, inheritance_info = C_NULL) = CommandBufferBeginInfo(next, flags, inheritance_info)

RenderPassBeginInfo(render_pass::RenderPass, framebuffer::Framebuffer, render_area::Rect2D, clear_values::AbstractArray; next = C_NULL) = RenderPassBeginInfo(next, render_pass, framebuffer, render_area, clear_values)

AttachmentDescription(format::Format, samples::SampleCountFlag, load_op::AttachmentLoadOp, store_op::AttachmentStoreOp, stencil_load_op::AttachmentLoadOp, stencil_store_op::AttachmentStoreOp, initial_layout::ImageLayout, final_layout::ImageLayout; flags = 0) = AttachmentDescription(flags, format, samples, load_op, store_op, stencil_load_op, stencil_store_op, initial_layout, final_layout)

SubpassDescription(pipeline_bind_point::PipelineBindPoint, input_attachments::AbstractArray, color_attachments::AbstractArray, preserve_attachments::AbstractArray; flags = 0, resolve_attachments = C_NULL, depth_stencil_attachment = C_NULL) = SubpassDescription(flags, pipeline_bind_point, input_attachments, color_attachments, resolve_attachments, depth_stencil_attachment, preserve_attachments)

SubpassDependency(src_subpass::Integer, dst_subpass::Integer; src_stage_mask = 0, dst_stage_mask = 0, src_access_mask = 0, dst_access_mask = 0, dependency_flags = 0) = SubpassDependency(src_subpass, dst_subpass, src_stage_mask, dst_stage_mask, src_access_mask, dst_access_mask, dependency_flags)

RenderPassCreateInfo(attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray; next = C_NULL, flags = 0) = RenderPassCreateInfo(next, flags, attachments, subpasses, dependencies)

EventCreateInfo(; next = C_NULL, flags = 0) = EventCreateInfo(next, flags)

FenceCreateInfo(; next = C_NULL, flags = 0) = FenceCreateInfo(next, flags)

SemaphoreCreateInfo(; next = C_NULL, flags = 0) = SemaphoreCreateInfo(next, flags)

QueryPoolCreateInfo(query_type::QueryType, query_count::Integer; next = C_NULL, flags = 0, pipeline_statistics = 0) = QueryPoolCreateInfo(next, flags, query_type, query_count, pipeline_statistics)

FramebufferCreateInfo(render_pass::RenderPass, attachments::AbstractArray, width::Integer, height::Integer, layers::Integer; next = C_NULL, flags = 0) = FramebufferCreateInfo(next, flags, render_pass, attachments, width, height, layers)

SubmitInfo(wait_semaphores::AbstractArray, wait_dst_stage_mask::AbstractArray, command_buffers::AbstractArray, signal_semaphores::AbstractArray; next = C_NULL) = SubmitInfo(next, wait_semaphores, wait_dst_stage_mask, command_buffers, signal_semaphores)

DisplayModeCreateInfoKHR(parameters::DisplayModeParametersKHR; next = C_NULL, flags = 0) = DisplayModeCreateInfoKHR(next, flags, parameters)

DisplaySurfaceCreateInfoKHR(display_mode::DisplayModeKHR, plane_index::Integer, plane_stack_index::Integer, transform::SurfaceTransformFlagKHR, global_alpha::Real, alpha_mode::DisplayPlaneAlphaFlagKHR, image_extent::Extent2D; next = C_NULL, flags = 0) = DisplaySurfaceCreateInfoKHR(next, flags, display_mode, plane_index, plane_stack_index, transform, global_alpha, alpha_mode, image_extent)

DisplayPresentInfoKHR(src_rect::Rect2D, dst_rect::Rect2D, persistent::Bool; next = C_NULL) = DisplayPresentInfoKHR(next, src_rect, dst_rect, persistent)

AndroidSurfaceCreateInfoKHR(window::vk.ANativeWindow; next = C_NULL, flags = 0) = AndroidSurfaceCreateInfoKHR(next, flags, window)

ViSurfaceCreateInfoNN(window::Cvoid; next = C_NULL, flags = 0) = ViSurfaceCreateInfoNN(next, flags, window)

WaylandSurfaceCreateInfoKHR(display::vk.wl_display, surface::vk.wl_surface; next = C_NULL, flags = 0) = WaylandSurfaceCreateInfoKHR(next, flags, display, surface)

Win32SurfaceCreateInfoKHR(hinstance::vk.HINSTANCE, hwnd::vk.HWND; next = C_NULL, flags = 0) = Win32SurfaceCreateInfoKHR(next, flags, hinstance, hwnd)

XlibSurfaceCreateInfoKHR(dpy::vk.Display, window::vk.Window; next = C_NULL, flags = 0) = XlibSurfaceCreateInfoKHR(next, flags, dpy, window)

XcbSurfaceCreateInfoKHR(connection::vk.xcb_connection_t, window::vk.xcb_window_t; next = C_NULL, flags = 0) = XcbSurfaceCreateInfoKHR(next, flags, connection, window)

DirectFBSurfaceCreateInfoEXT(dfb::vk.IDirectFB, surface::vk.IDirectFBSurface; next = C_NULL, flags = 0) = DirectFBSurfaceCreateInfoEXT(next, flags, dfb, surface)

ImagePipeSurfaceCreateInfoFUCHSIA(image_pipe_handle::vk.zx_handle_t; next = C_NULL, flags = 0) = ImagePipeSurfaceCreateInfoFUCHSIA(next, flags, image_pipe_handle)

StreamDescriptorSurfaceCreateInfoGGP(stream_descriptor::vk.GgpStreamDescriptor; next = C_NULL, flags = 0) = StreamDescriptorSurfaceCreateInfoGGP(next, flags, stream_descriptor)

ScreenSurfaceCreateInfoQNX(context::vk._screen_context, window::vk._screen_window; next = C_NULL, flags = 0) = ScreenSurfaceCreateInfoQNX(next, flags, context, window)

SwapchainCreateInfoKHR(surface::SurfaceKHR, min_image_count::Integer, image_format::Format, image_color_space::ColorSpaceKHR, image_extent::Extent2D, image_array_layers::Integer, image_usage::ImageUsageFlag, image_sharing_mode::SharingMode, queue_family_indices::AbstractArray, pre_transform::SurfaceTransformFlagKHR, composite_alpha::CompositeAlphaFlagKHR, present_mode::PresentModeKHR, clipped::Bool; next = C_NULL, flags = 0, old_swapchain = C_NULL) = SwapchainCreateInfoKHR(next, flags, surface, min_image_count, image_format, image_color_space, image_extent, image_array_layers, image_usage, image_sharing_mode, queue_family_indices, pre_transform, composite_alpha, present_mode, clipped, old_swapchain)

PresentInfoKHR(wait_semaphores::AbstractArray, swapchains::AbstractArray, image_indices::AbstractArray; next = C_NULL, results = C_NULL) = PresentInfoKHR(next, wait_semaphores, swapchains, image_indices, results)

DebugReportCallbackCreateInfoEXT(pfn_callback::FunctionPtr; next = C_NULL, flags = 0, user_data = C_NULL) = DebugReportCallbackCreateInfoEXT(next, flags, pfn_callback, user_data)

ValidationFlagsEXT(disabled_validation_checks::AbstractArray; next = C_NULL) = ValidationFlagsEXT(next, disabled_validation_checks)

ValidationFeaturesEXT(enabled_validation_features::AbstractArray, disabled_validation_features::AbstractArray; next = C_NULL) = ValidationFeaturesEXT(next, enabled_validation_features, disabled_validation_features)

PipelineRasterizationStateRasterizationOrderAMD(rasterization_order::RasterizationOrderAMD; next = C_NULL) = PipelineRasterizationStateRasterizationOrderAMD(next, rasterization_order)

DebugMarkerObjectNameInfoEXT(object_type::DebugReportObjectTypeEXT, object::Integer, object_name::AbstractString; next = C_NULL) = DebugMarkerObjectNameInfoEXT(next, object_type, object, object_name)

DebugMarkerObjectTagInfoEXT(object_type::DebugReportObjectTypeEXT, object::Integer, tag_name::Integer, tag_size::Integer, tag::Cvoid; next = C_NULL) = DebugMarkerObjectTagInfoEXT(next, object_type, object, tag_name, tag_size, tag)

DebugMarkerMarkerInfoEXT(marker_name::AbstractString, color::NTuple{4, Float32}; next = C_NULL) = DebugMarkerMarkerInfoEXT(next, marker_name, color)

DedicatedAllocationImageCreateInfoNV(dedicated_allocation::Bool; next = C_NULL) = DedicatedAllocationImageCreateInfoNV(next, dedicated_allocation)

DedicatedAllocationBufferCreateInfoNV(dedicated_allocation::Bool; next = C_NULL) = DedicatedAllocationBufferCreateInfoNV(next, dedicated_allocation)

DedicatedAllocationMemoryAllocateInfoNV(; next = C_NULL, image = C_NULL, buffer = C_NULL) = DedicatedAllocationMemoryAllocateInfoNV(next, image, buffer)

ExternalMemoryImageCreateInfoNV(; next = C_NULL, handle_types = 0) = ExternalMemoryImageCreateInfoNV(next, handle_types)

ExportMemoryAllocateInfoNV(; next = C_NULL, handle_types = 0) = ExportMemoryAllocateInfoNV(next, handle_types)

ImportMemoryWin32HandleInfoNV(; next = C_NULL, handle_type = 0, handle = C_NULL) = ImportMemoryWin32HandleInfoNV(next, handle_type, handle)

ExportMemoryWin32HandleInfoNV(; next = C_NULL, attributes = C_NULL, dw_access = C_NULL) = ExportMemoryWin32HandleInfoNV(next, attributes, dw_access)

Win32KeyedMutexAcquireReleaseInfoNV(acquire_syncs::AbstractArray, acquire_keys::AbstractArray, acquire_timeout_milliseconds::AbstractArray, release_syncs::AbstractArray, release_keys::AbstractArray; next = C_NULL) = Win32KeyedMutexAcquireReleaseInfoNV(next, acquire_syncs, acquire_keys, acquire_timeout_milliseconds, release_syncs, release_keys)

PhysicalDeviceDeviceGeneratedCommandsFeaturesNV(device_generated_commands::Bool; next = C_NULL) = PhysicalDeviceDeviceGeneratedCommandsFeaturesNV(next, device_generated_commands)

DevicePrivateDataCreateInfoEXT(private_data_slot_request_count::Integer; next = C_NULL) = DevicePrivateDataCreateInfoEXT(next, private_data_slot_request_count)

PrivateDataSlotCreateInfoEXT(flags::PrivateDataSlotCreateFlagEXT; next = C_NULL) = PrivateDataSlotCreateInfoEXT(next, flags)

PhysicalDevicePrivateDataFeaturesEXT(private_data::Bool; next = C_NULL) = PhysicalDevicePrivateDataFeaturesEXT(next, private_data)

GraphicsShaderGroupCreateInfoNV(stages::AbstractArray; next = C_NULL, vertex_input_state = C_NULL, tessellation_state = C_NULL) = GraphicsShaderGroupCreateInfoNV(next, stages, vertex_input_state, tessellation_state)

GraphicsPipelineShaderGroupsCreateInfoNV(groups::AbstractArray, pipelines::AbstractArray; next = C_NULL) = GraphicsPipelineShaderGroupsCreateInfoNV(next, groups, pipelines)

IndirectCommandsLayoutTokenNV(token_type::IndirectCommandsTokenTypeNV, stream::Integer, offset::Integer, vertex_binding_unit::Integer, vertex_dynamic_stride::Bool, pushconstant_offset::Integer, pushconstant_size::Integer, index_types::AbstractArray, index_type_values::AbstractArray; next = C_NULL, pushconstant_pipeline_layout = C_NULL, pushconstant_shader_stage_flags = 0, indirect_state_flags = 0) = IndirectCommandsLayoutTokenNV(next, token_type, stream, offset, vertex_binding_unit, vertex_dynamic_stride, pushconstant_pipeline_layout, pushconstant_shader_stage_flags, pushconstant_offset, pushconstant_size, indirect_state_flags, index_types, index_type_values)

IndirectCommandsLayoutCreateInfoNV(pipeline_bind_point::PipelineBindPoint, tokens::AbstractArray, stream_strides::AbstractArray; next = C_NULL, flags = 0) = IndirectCommandsLayoutCreateInfoNV(next, flags, pipeline_bind_point, tokens, stream_strides)

GeneratedCommandsInfoNV(pipeline_bind_point::PipelineBindPoint, pipeline::Pipeline, indirect_commands_layout::IndirectCommandsLayoutNV, streams::AbstractArray, sequences_count::Integer, preprocess_buffer::Buffer, preprocess_offset::Integer, preprocess_size::Integer, sequences_count_offset::Integer, sequences_index_offset::Integer; next = C_NULL, sequences_count_buffer = C_NULL, sequences_index_buffer = C_NULL) = GeneratedCommandsInfoNV(next, pipeline_bind_point, pipeline, indirect_commands_layout, streams, sequences_count, preprocess_buffer, preprocess_offset, preprocess_size, sequences_count_buffer, sequences_count_offset, sequences_index_buffer, sequences_index_offset)

GeneratedCommandsMemoryRequirementsInfoNV(pipeline_bind_point::PipelineBindPoint, pipeline::Pipeline, indirect_commands_layout::IndirectCommandsLayoutNV, max_sequences_count::Integer; next = C_NULL) = GeneratedCommandsMemoryRequirementsInfoNV(next, pipeline_bind_point, pipeline, indirect_commands_layout, max_sequences_count)

PhysicalDeviceFeatures2(features::PhysicalDeviceFeatures; next = C_NULL) = PhysicalDeviceFeatures2(next, features)

PhysicalDeviceImageFormatInfo2(format::Format, type::ImageType, tiling::ImageTiling, usage::ImageUsageFlag; next = C_NULL, flags = 0) = PhysicalDeviceImageFormatInfo2(next, format, type, tiling, usage, flags)

PhysicalDeviceSparseImageFormatInfo2(format::Format, type::ImageType, samples::SampleCountFlag, usage::ImageUsageFlag, tiling::ImageTiling; next = C_NULL) = PhysicalDeviceSparseImageFormatInfo2(next, format, type, samples, usage, tiling)

PresentRegionsKHR(; next = C_NULL, regions = C_NULL) = PresentRegionsKHR(next, regions)

PresentRegionKHR(; rectangles = C_NULL) = PresentRegionKHR(rectangles)

PhysicalDeviceVariablePointersFeatures(variable_pointers_storage_buffer::Bool, variable_pointers::Bool; next = C_NULL) = PhysicalDeviceVariablePointersFeatures(next, variable_pointers_storage_buffer, variable_pointers)

PhysicalDeviceExternalImageFormatInfo(; next = C_NULL, handle_type = 0) = PhysicalDeviceExternalImageFormatInfo(next, handle_type)

PhysicalDeviceExternalBufferInfo(usage::BufferUsageFlag, handle_type::ExternalMemoryHandleTypeFlag; next = C_NULL, flags = 0) = PhysicalDeviceExternalBufferInfo(next, flags, usage, handle_type)

ExternalMemoryImageCreateInfo(; next = C_NULL, handle_types = 0) = ExternalMemoryImageCreateInfo(next, handle_types)

ExternalMemoryBufferCreateInfo(; next = C_NULL, handle_types = 0) = ExternalMemoryBufferCreateInfo(next, handle_types)

ExportMemoryAllocateInfo(; next = C_NULL, handle_types = 0) = ExportMemoryAllocateInfo(next, handle_types)

ImportMemoryWin32HandleInfoKHR(; next = C_NULL, handle_type = 0, handle = C_NULL, name = C_NULL) = ImportMemoryWin32HandleInfoKHR(next, handle_type, handle, name)

ExportMemoryWin32HandleInfoKHR(dw_access::vk.DWORD, name::vk.LPCWSTR; next = C_NULL, attributes = C_NULL) = ExportMemoryWin32HandleInfoKHR(next, attributes, dw_access, name)

ImportMemoryZirconHandleInfoFUCHSIA(; next = C_NULL, handle_type = 0, handle = C_NULL) = ImportMemoryZirconHandleInfoFUCHSIA(next, handle_type, handle)

MemoryGetZirconHandleInfoFUCHSIA(memory::DeviceMemory, handle_type::ExternalMemoryHandleTypeFlag; next = C_NULL) = MemoryGetZirconHandleInfoFUCHSIA(next, memory, handle_type)

MemoryGetWin32HandleInfoKHR(memory::DeviceMemory, handle_type::ExternalMemoryHandleTypeFlag; next = C_NULL) = MemoryGetWin32HandleInfoKHR(next, memory, handle_type)

ImportMemoryFdInfoKHR(fd::Integer; next = C_NULL, handle_type = 0) = ImportMemoryFdInfoKHR(next, handle_type, fd)

MemoryGetFdInfoKHR(memory::DeviceMemory, handle_type::ExternalMemoryHandleTypeFlag; next = C_NULL) = MemoryGetFdInfoKHR(next, memory, handle_type)

Win32KeyedMutexAcquireReleaseInfoKHR(acquire_syncs::AbstractArray, acquire_keys::AbstractArray, acquire_timeouts::AbstractArray, release_syncs::AbstractArray, release_keys::AbstractArray; next = C_NULL) = Win32KeyedMutexAcquireReleaseInfoKHR(next, acquire_syncs, acquire_keys, acquire_timeouts, release_syncs, release_keys)

PhysicalDeviceExternalSemaphoreInfo(handle_type::ExternalSemaphoreHandleTypeFlag; next = C_NULL) = PhysicalDeviceExternalSemaphoreInfo(next, handle_type)

ExportSemaphoreCreateInfo(; next = C_NULL, handle_types = 0) = ExportSemaphoreCreateInfo(next, handle_types)

ImportSemaphoreWin32HandleInfoKHR(semaphore::Semaphore, handle_type::ExternalSemaphoreHandleTypeFlag; next = C_NULL, flags = 0, handle = C_NULL, name = C_NULL) = ImportSemaphoreWin32HandleInfoKHR(next, semaphore, flags, handle_type, handle, name)

ExportSemaphoreWin32HandleInfoKHR(dw_access::vk.DWORD, name::vk.LPCWSTR; next = C_NULL, attributes = C_NULL) = ExportSemaphoreWin32HandleInfoKHR(next, attributes, dw_access, name)

D3D12FenceSubmitInfoKHR(; next = C_NULL, wait_semaphore_values = C_NULL, signal_semaphore_values = C_NULL) = D3D12FenceSubmitInfoKHR(next, wait_semaphore_values, signal_semaphore_values)

SemaphoreGetWin32HandleInfoKHR(semaphore::Semaphore, handle_type::ExternalSemaphoreHandleTypeFlag; next = C_NULL) = SemaphoreGetWin32HandleInfoKHR(next, semaphore, handle_type)

ImportSemaphoreFdInfoKHR(semaphore::Semaphore, handle_type::ExternalSemaphoreHandleTypeFlag, fd::Integer; next = C_NULL, flags = 0) = ImportSemaphoreFdInfoKHR(next, semaphore, flags, handle_type, fd)

SemaphoreGetFdInfoKHR(semaphore::Semaphore, handle_type::ExternalSemaphoreHandleTypeFlag; next = C_NULL) = SemaphoreGetFdInfoKHR(next, semaphore, handle_type)

ImportSemaphoreZirconHandleInfoFUCHSIA(semaphore::Semaphore, handle_type::ExternalSemaphoreHandleTypeFlag, zircon_handle::vk.zx_handle_t; next = C_NULL, flags = 0) = ImportSemaphoreZirconHandleInfoFUCHSIA(next, semaphore, flags, handle_type, zircon_handle)

SemaphoreGetZirconHandleInfoFUCHSIA(semaphore::Semaphore, handle_type::ExternalSemaphoreHandleTypeFlag; next = C_NULL) = SemaphoreGetZirconHandleInfoFUCHSIA(next, semaphore, handle_type)

PhysicalDeviceExternalFenceInfo(handle_type::ExternalFenceHandleTypeFlag; next = C_NULL) = PhysicalDeviceExternalFenceInfo(next, handle_type)

ExportFenceCreateInfo(; next = C_NULL, handle_types = 0) = ExportFenceCreateInfo(next, handle_types)

ImportFenceWin32HandleInfoKHR(fence::Fence, handle_type::ExternalFenceHandleTypeFlag; next = C_NULL, flags = 0, handle = C_NULL, name = C_NULL) = ImportFenceWin32HandleInfoKHR(next, fence, flags, handle_type, handle, name)

ExportFenceWin32HandleInfoKHR(dw_access::vk.DWORD, name::vk.LPCWSTR; next = C_NULL, attributes = C_NULL) = ExportFenceWin32HandleInfoKHR(next, attributes, dw_access, name)

FenceGetWin32HandleInfoKHR(fence::Fence, handle_type::ExternalFenceHandleTypeFlag; next = C_NULL) = FenceGetWin32HandleInfoKHR(next, fence, handle_type)

ImportFenceFdInfoKHR(fence::Fence, handle_type::ExternalFenceHandleTypeFlag, fd::Integer; next = C_NULL, flags = 0) = ImportFenceFdInfoKHR(next, fence, flags, handle_type, fd)

FenceGetFdInfoKHR(fence::Fence, handle_type::ExternalFenceHandleTypeFlag; next = C_NULL) = FenceGetFdInfoKHR(next, fence, handle_type)

PhysicalDeviceMultiviewFeatures(multiview::Bool, multiview_geometry_shader::Bool, multiview_tessellation_shader::Bool; next = C_NULL) = PhysicalDeviceMultiviewFeatures(next, multiview, multiview_geometry_shader, multiview_tessellation_shader)

RenderPassMultiviewCreateInfo(view_masks::AbstractArray, view_offsets::AbstractArray, correlation_masks::AbstractArray; next = C_NULL) = RenderPassMultiviewCreateInfo(next, view_masks, view_offsets, correlation_masks)

DisplayPowerInfoEXT(power_state::DisplayPowerStateEXT; next = C_NULL) = DisplayPowerInfoEXT(next, power_state)

DeviceEventInfoEXT(device_event::DeviceEventTypeEXT; next = C_NULL) = DeviceEventInfoEXT(next, device_event)

DisplayEventInfoEXT(display_event::DisplayEventTypeEXT; next = C_NULL) = DisplayEventInfoEXT(next, display_event)

SwapchainCounterCreateInfoEXT(; next = C_NULL, surface_counters = 0) = SwapchainCounterCreateInfoEXT(next, surface_counters)

MemoryAllocateFlagsInfo(device_mask::Integer; next = C_NULL, flags = 0) = MemoryAllocateFlagsInfo(next, flags, device_mask)

BindBufferMemoryInfo(buffer::Buffer, memory::DeviceMemory, memory_offset::Integer; next = C_NULL) = BindBufferMemoryInfo(next, buffer, memory, memory_offset)

BindBufferMemoryDeviceGroupInfo(device_indices::AbstractArray; next = C_NULL) = BindBufferMemoryDeviceGroupInfo(next, device_indices)

BindImageMemoryInfo(image::Image, memory::DeviceMemory, memory_offset::Integer; next = C_NULL) = BindImageMemoryInfo(next, image, memory, memory_offset)

BindImageMemoryDeviceGroupInfo(device_indices::AbstractArray, split_instance_bind_regions::AbstractArray; next = C_NULL) = BindImageMemoryDeviceGroupInfo(next, device_indices, split_instance_bind_regions)

DeviceGroupRenderPassBeginInfo(device_mask::Integer, device_render_areas::AbstractArray; next = C_NULL) = DeviceGroupRenderPassBeginInfo(next, device_mask, device_render_areas)

DeviceGroupCommandBufferBeginInfo(device_mask::Integer; next = C_NULL) = DeviceGroupCommandBufferBeginInfo(next, device_mask)

DeviceGroupSubmitInfo(wait_semaphore_device_indices::AbstractArray, command_buffer_device_masks::AbstractArray, signal_semaphore_device_indices::AbstractArray; next = C_NULL) = DeviceGroupSubmitInfo(next, wait_semaphore_device_indices, command_buffer_device_masks, signal_semaphore_device_indices)

DeviceGroupBindSparseInfo(resource_device_index::Integer, memory_device_index::Integer; next = C_NULL) = DeviceGroupBindSparseInfo(next, resource_device_index, memory_device_index)

ImageSwapchainCreateInfoKHR(; next = C_NULL, swapchain = C_NULL) = ImageSwapchainCreateInfoKHR(next, swapchain)

BindImageMemorySwapchainInfoKHR(swapchain::SwapchainKHR, image_index::Integer; next = C_NULL) = BindImageMemorySwapchainInfoKHR(next, swapchain, image_index)

AcquireNextImageInfoKHR(swapchain::SwapchainKHR, timeout::Integer, device_mask::Integer; next = C_NULL, semaphore = C_NULL, fence = C_NULL) = AcquireNextImageInfoKHR(next, swapchain, timeout, semaphore, fence, device_mask)

DeviceGroupPresentInfoKHR(device_masks::AbstractArray, mode::DeviceGroupPresentModeFlagKHR; next = C_NULL) = DeviceGroupPresentInfoKHR(next, device_masks, mode)

DeviceGroupDeviceCreateInfo(physical_devices::AbstractArray; next = C_NULL) = DeviceGroupDeviceCreateInfo(next, physical_devices)

DeviceGroupSwapchainCreateInfoKHR(modes::DeviceGroupPresentModeFlagKHR; next = C_NULL) = DeviceGroupSwapchainCreateInfoKHR(next, modes)

DescriptorUpdateTemplateCreateInfo(descriptor_update_entries::AbstractArray, template_type::DescriptorUpdateTemplateType, descriptor_set_layout::DescriptorSetLayout, pipeline_bind_point::PipelineBindPoint, pipeline_layout::PipelineLayout, set::Integer; next = C_NULL, flags = 0) = DescriptorUpdateTemplateCreateInfo(next, flags, descriptor_update_entries, template_type, descriptor_set_layout, pipeline_bind_point, pipeline_layout, set)

HdrMetadataEXT(display_primary_red::XYColorEXT, display_primary_green::XYColorEXT, display_primary_blue::XYColorEXT, white_point::XYColorEXT, max_luminance::Real, min_luminance::Real, max_content_light_level::Real, max_frame_average_light_level::Real; next = C_NULL) = HdrMetadataEXT(next, display_primary_red, display_primary_green, display_primary_blue, white_point, max_luminance, min_luminance, max_content_light_level, max_frame_average_light_level)

SwapchainDisplayNativeHdrCreateInfoAMD(local_dimming_enable::Bool; next = C_NULL) = SwapchainDisplayNativeHdrCreateInfoAMD(next, local_dimming_enable)

PresentTimesInfoGOOGLE(; next = C_NULL, times = C_NULL) = PresentTimesInfoGOOGLE(next, times)

IOSSurfaceCreateInfoMVK(view::Cvoid; next = C_NULL, flags = 0) = IOSSurfaceCreateInfoMVK(next, flags, view)

MacOSSurfaceCreateInfoMVK(view::Cvoid; next = C_NULL, flags = 0) = MacOSSurfaceCreateInfoMVK(next, flags, view)

MetalSurfaceCreateInfoEXT(layer::vk.CAMetalLayer; next = C_NULL, flags = 0) = MetalSurfaceCreateInfoEXT(next, flags, layer)

PipelineViewportWScalingStateCreateInfoNV(viewport_w_scaling_enable::Bool; next = C_NULL, viewport_w_scalings = C_NULL) = PipelineViewportWScalingStateCreateInfoNV(next, viewport_w_scaling_enable, viewport_w_scalings)

PipelineViewportSwizzleStateCreateInfoNV(viewport_swizzles::AbstractArray; next = C_NULL, flags = 0) = PipelineViewportSwizzleStateCreateInfoNV(next, flags, viewport_swizzles)

PipelineDiscardRectangleStateCreateInfoEXT(discard_rectangle_mode::DiscardRectangleModeEXT, discard_rectangles::AbstractArray; next = C_NULL, flags = 0) = PipelineDiscardRectangleStateCreateInfoEXT(next, flags, discard_rectangle_mode, discard_rectangles)

RenderPassInputAttachmentAspectCreateInfo(aspect_references::AbstractArray; next = C_NULL) = RenderPassInputAttachmentAspectCreateInfo(next, aspect_references)

PhysicalDeviceSurfaceInfo2KHR(surface::SurfaceKHR; next = C_NULL) = PhysicalDeviceSurfaceInfo2KHR(next, surface)

DisplayPlaneInfo2KHR(mode::DisplayModeKHR, plane_index::Integer; next = C_NULL) = DisplayPlaneInfo2KHR(next, mode, plane_index)

PhysicalDevice16BitStorageFeatures(storage_buffer_16_bit_access::Bool, uniform_and_storage_buffer_16_bit_access::Bool, storage_push_constant_16::Bool, storage_input_output_16::Bool; next = C_NULL) = PhysicalDevice16BitStorageFeatures(next, storage_buffer_16_bit_access, uniform_and_storage_buffer_16_bit_access, storage_push_constant_16, storage_input_output_16)

PhysicalDeviceShaderSubgroupExtendedTypesFeatures(shader_subgroup_extended_types::Bool; next = C_NULL) = PhysicalDeviceShaderSubgroupExtendedTypesFeatures(next, shader_subgroup_extended_types)

BufferMemoryRequirementsInfo2(buffer::Buffer; next = C_NULL) = BufferMemoryRequirementsInfo2(next, buffer)

ImageMemoryRequirementsInfo2(image::Image; next = C_NULL) = ImageMemoryRequirementsInfo2(next, image)

ImageSparseMemoryRequirementsInfo2(image::Image; next = C_NULL) = ImageSparseMemoryRequirementsInfo2(next, image)

MemoryDedicatedAllocateInfo(; next = C_NULL, image = C_NULL, buffer = C_NULL) = MemoryDedicatedAllocateInfo(next, image, buffer)

ImageViewUsageCreateInfo(usage::ImageUsageFlag; next = C_NULL) = ImageViewUsageCreateInfo(next, usage)

PipelineTessellationDomainOriginStateCreateInfo(domain_origin::TessellationDomainOrigin; next = C_NULL) = PipelineTessellationDomainOriginStateCreateInfo(next, domain_origin)

SamplerYcbcrConversionInfo(conversion::SamplerYcbcrConversion; next = C_NULL) = SamplerYcbcrConversionInfo(next, conversion)

SamplerYcbcrConversionCreateInfo(format::Format, ycbcr_model::SamplerYcbcrModelConversion, ycbcr_range::SamplerYcbcrRange, components::ComponentMapping, x_chroma_offset::ChromaLocation, y_chroma_offset::ChromaLocation, chroma_filter::Filter, force_explicit_reconstruction::Bool; next = C_NULL) = SamplerYcbcrConversionCreateInfo(next, format, ycbcr_model, ycbcr_range, components, x_chroma_offset, y_chroma_offset, chroma_filter, force_explicit_reconstruction)

BindImagePlaneMemoryInfo(plane_aspect::ImageAspectFlag; next = C_NULL) = BindImagePlaneMemoryInfo(next, plane_aspect)

ImagePlaneMemoryRequirementsInfo(plane_aspect::ImageAspectFlag; next = C_NULL) = ImagePlaneMemoryRequirementsInfo(next, plane_aspect)

PhysicalDeviceSamplerYcbcrConversionFeatures(sampler_ycbcr_conversion::Bool; next = C_NULL) = PhysicalDeviceSamplerYcbcrConversionFeatures(next, sampler_ycbcr_conversion)

ConditionalRenderingBeginInfoEXT(buffer::Buffer, offset::Integer; next = C_NULL, flags = 0) = ConditionalRenderingBeginInfoEXT(next, buffer, offset, flags)

ProtectedSubmitInfo(protected_submit::Bool; next = C_NULL) = ProtectedSubmitInfo(next, protected_submit)

PhysicalDeviceProtectedMemoryFeatures(protected_memory::Bool; next = C_NULL) = PhysicalDeviceProtectedMemoryFeatures(next, protected_memory)

DeviceQueueInfo2(queue_family_index::Integer, queue_index::Integer; next = C_NULL, flags = 0) = DeviceQueueInfo2(next, flags, queue_family_index, queue_index)

PipelineCoverageToColorStateCreateInfoNV(coverage_to_color_enable::Bool; next = C_NULL, flags = 0, coverage_to_color_location = 0) = PipelineCoverageToColorStateCreateInfoNV(next, flags, coverage_to_color_enable, coverage_to_color_location)

SampleLocationsInfoEXT(sample_locations_per_pixel::SampleCountFlag, sample_location_grid_size::Extent2D, sample_locations::AbstractArray; next = C_NULL) = SampleLocationsInfoEXT(next, sample_locations_per_pixel, sample_location_grid_size, sample_locations)

RenderPassSampleLocationsBeginInfoEXT(attachment_initial_sample_locations::AbstractArray, post_subpass_sample_locations::AbstractArray; next = C_NULL) = RenderPassSampleLocationsBeginInfoEXT(next, attachment_initial_sample_locations, post_subpass_sample_locations)

PipelineSampleLocationsStateCreateInfoEXT(sample_locations_enable::Bool, sample_locations_info::SampleLocationsInfoEXT; next = C_NULL) = PipelineSampleLocationsStateCreateInfoEXT(next, sample_locations_enable, sample_locations_info)

SamplerReductionModeCreateInfo(reduction_mode::SamplerReductionMode; next = C_NULL) = SamplerReductionModeCreateInfo(next, reduction_mode)

PhysicalDeviceBlendOperationAdvancedFeaturesEXT(advanced_blend_coherent_operations::Bool; next = C_NULL) = PhysicalDeviceBlendOperationAdvancedFeaturesEXT(next, advanced_blend_coherent_operations)

PipelineColorBlendAdvancedStateCreateInfoEXT(src_premultiplied::Bool, dst_premultiplied::Bool, blend_overlap::BlendOverlapEXT; next = C_NULL) = PipelineColorBlendAdvancedStateCreateInfoEXT(next, src_premultiplied, dst_premultiplied, blend_overlap)

PhysicalDeviceInlineUniformBlockFeaturesEXT(inline_uniform_block::Bool, descriptor_binding_inline_uniform_block_update_after_bind::Bool; next = C_NULL) = PhysicalDeviceInlineUniformBlockFeaturesEXT(next, inline_uniform_block, descriptor_binding_inline_uniform_block_update_after_bind)

WriteDescriptorSetInlineUniformBlockEXT(data_size::Integer, data::Cvoid; next = C_NULL) = WriteDescriptorSetInlineUniformBlockEXT(next, data_size, data)

DescriptorPoolInlineUniformBlockCreateInfoEXT(max_inline_uniform_block_bindings::Integer; next = C_NULL) = DescriptorPoolInlineUniformBlockCreateInfoEXT(next, max_inline_uniform_block_bindings)

PipelineCoverageModulationStateCreateInfoNV(coverage_modulation_mode::CoverageModulationModeNV, coverage_modulation_table_enable::Bool; next = C_NULL, flags = 0, coverage_modulation_table = C_NULL) = PipelineCoverageModulationStateCreateInfoNV(next, flags, coverage_modulation_mode, coverage_modulation_table_enable, coverage_modulation_table)

ImageFormatListCreateInfo(view_formats::AbstractArray; next = C_NULL) = ImageFormatListCreateInfo(next, view_formats)

ValidationCacheCreateInfoEXT(initial_data::Cvoid; next = C_NULL, flags = 0, initial_data_size = C_NULL) = ValidationCacheCreateInfoEXT(next, flags, initial_data_size, initial_data)

ShaderModuleValidationCacheCreateInfoEXT(validation_cache::ValidationCacheEXT; next = C_NULL) = ShaderModuleValidationCacheCreateInfoEXT(next, validation_cache)

PhysicalDeviceShaderDrawParametersFeatures(shader_draw_parameters::Bool; next = C_NULL) = PhysicalDeviceShaderDrawParametersFeatures(next, shader_draw_parameters)

PhysicalDeviceShaderFloat16Int8Features(shader_float_16::Bool, shader_int_8::Bool; next = C_NULL) = PhysicalDeviceShaderFloat16Int8Features(next, shader_float_16, shader_int_8)

PhysicalDeviceHostQueryResetFeatures(host_query_reset::Bool; next = C_NULL) = PhysicalDeviceHostQueryResetFeatures(next, host_query_reset)

DeviceQueueGlobalPriorityCreateInfoEXT(global_priority::QueueGlobalPriorityEXT; next = C_NULL) = DeviceQueueGlobalPriorityCreateInfoEXT(next, global_priority)

DebugUtilsObjectNameInfoEXT(object_type::ObjectType, object_handle::Integer; next = C_NULL, object_name = "") = DebugUtilsObjectNameInfoEXT(next, object_type, object_handle, object_name)

DebugUtilsObjectTagInfoEXT(object_type::ObjectType, object_handle::Integer, tag_name::Integer, tag_size::Integer, tag::Cvoid; next = C_NULL) = DebugUtilsObjectTagInfoEXT(next, object_type, object_handle, tag_name, tag_size, tag)

DebugUtilsLabelEXT(label_name::AbstractString, color::NTuple{4, Float32}; next = C_NULL) = DebugUtilsLabelEXT(next, label_name, color)

DebugUtilsMessengerCreateInfoEXT(message_severity::DebugUtilsMessageSeverityFlagEXT, message_type::DebugUtilsMessageTypeFlagEXT, pfn_user_callback::FunctionPtr; next = C_NULL, flags = 0, user_data = C_NULL) = DebugUtilsMessengerCreateInfoEXT(next, flags, message_severity, message_type, pfn_user_callback, user_data)

DebugUtilsMessengerCallbackDataEXT(message_id_number::Integer, message::AbstractString, queue_labels::AbstractArray, cmd_buf_labels::AbstractArray, objects::AbstractArray; next = C_NULL, flags = 0, message_id_name = "") = DebugUtilsMessengerCallbackDataEXT(next, flags, message_id_name, message_id_number, message, queue_labels, cmd_buf_labels, objects)

PhysicalDeviceDeviceMemoryReportFeaturesEXT(device_memory_report::Bool; next = C_NULL) = PhysicalDeviceDeviceMemoryReportFeaturesEXT(next, device_memory_report)

DeviceDeviceMemoryReportCreateInfoEXT(flags::Integer, pfn_user_callback::FunctionPtr, user_data::Cvoid; next = C_NULL) = DeviceDeviceMemoryReportCreateInfoEXT(next, flags, pfn_user_callback, user_data)

ImportMemoryHostPointerInfoEXT(handle_type::ExternalMemoryHandleTypeFlag, host_pointer::Cvoid; next = C_NULL) = ImportMemoryHostPointerInfoEXT(next, handle_type, host_pointer)

CalibratedTimestampInfoEXT(time_domain::TimeDomainEXT; next = C_NULL) = CalibratedTimestampInfoEXT(next, time_domain)

PipelineRasterizationConservativeStateCreateInfoEXT(conservative_rasterization_mode::ConservativeRasterizationModeEXT, extra_primitive_overestimation_size::Real; next = C_NULL, flags = 0) = PipelineRasterizationConservativeStateCreateInfoEXT(next, flags, conservative_rasterization_mode, extra_primitive_overestimation_size)

PhysicalDeviceDescriptorIndexingFeatures(shader_input_attachment_array_dynamic_indexing::Bool, shader_uniform_texel_buffer_array_dynamic_indexing::Bool, shader_storage_texel_buffer_array_dynamic_indexing::Bool, shader_uniform_buffer_array_non_uniform_indexing::Bool, shader_sampled_image_array_non_uniform_indexing::Bool, shader_storage_buffer_array_non_uniform_indexing::Bool, shader_storage_image_array_non_uniform_indexing::Bool, shader_input_attachment_array_non_uniform_indexing::Bool, shader_uniform_texel_buffer_array_non_uniform_indexing::Bool, shader_storage_texel_buffer_array_non_uniform_indexing::Bool, descriptor_binding_uniform_buffer_update_after_bind::Bool, descriptor_binding_sampled_image_update_after_bind::Bool, descriptor_binding_storage_image_update_after_bind::Bool, descriptor_binding_storage_buffer_update_after_bind::Bool, descriptor_binding_uniform_texel_buffer_update_after_bind::Bool, descriptor_binding_storage_texel_buffer_update_after_bind::Bool, descriptor_binding_update_unused_while_pending::Bool, descriptor_binding_partially_bound::Bool, descriptor_binding_variable_descriptor_count::Bool, runtime_descriptor_array::Bool; next = C_NULL) = PhysicalDeviceDescriptorIndexingFeatures(next, shader_input_attachment_array_dynamic_indexing, shader_uniform_texel_buffer_array_dynamic_indexing, shader_storage_texel_buffer_array_dynamic_indexing, shader_uniform_buffer_array_non_uniform_indexing, shader_sampled_image_array_non_uniform_indexing, shader_storage_buffer_array_non_uniform_indexing, shader_storage_image_array_non_uniform_indexing, shader_input_attachment_array_non_uniform_indexing, shader_uniform_texel_buffer_array_non_uniform_indexing, shader_storage_texel_buffer_array_non_uniform_indexing, descriptor_binding_uniform_buffer_update_after_bind, descriptor_binding_sampled_image_update_after_bind, descriptor_binding_storage_image_update_after_bind, descriptor_binding_storage_buffer_update_after_bind, descriptor_binding_uniform_texel_buffer_update_after_bind, descriptor_binding_storage_texel_buffer_update_after_bind, descriptor_binding_update_unused_while_pending, descriptor_binding_partially_bound, descriptor_binding_variable_descriptor_count, runtime_descriptor_array)

DescriptorSetLayoutBindingFlagsCreateInfo(binding_flags::AbstractArray; next = C_NULL) = DescriptorSetLayoutBindingFlagsCreateInfo(next, binding_flags)

DescriptorSetVariableDescriptorCountAllocateInfo(descriptor_counts::AbstractArray; next = C_NULL) = DescriptorSetVariableDescriptorCountAllocateInfo(next, descriptor_counts)

AttachmentDescription2(format::Format, samples::SampleCountFlag, load_op::AttachmentLoadOp, store_op::AttachmentStoreOp, stencil_load_op::AttachmentLoadOp, stencil_store_op::AttachmentStoreOp, initial_layout::ImageLayout, final_layout::ImageLayout; next = C_NULL, flags = 0) = AttachmentDescription2(next, flags, format, samples, load_op, store_op, stencil_load_op, stencil_store_op, initial_layout, final_layout)

AttachmentReference2(attachment::Integer, layout::ImageLayout, aspect_mask::ImageAspectFlag; next = C_NULL) = AttachmentReference2(next, attachment, layout, aspect_mask)

SubpassDescription2(pipeline_bind_point::PipelineBindPoint, view_mask::Integer, input_attachments::AbstractArray, color_attachments::AbstractArray, preserve_attachments::AbstractArray; next = C_NULL, flags = 0, resolve_attachments = C_NULL, depth_stencil_attachment = C_NULL) = SubpassDescription2(next, flags, pipeline_bind_point, view_mask, input_attachments, color_attachments, resolve_attachments, depth_stencil_attachment, preserve_attachments)

SubpassDependency2(src_subpass::Integer, dst_subpass::Integer, view_offset::Integer; next = C_NULL, src_stage_mask = 0, dst_stage_mask = 0, src_access_mask = 0, dst_access_mask = 0, dependency_flags = 0) = SubpassDependency2(next, src_subpass, dst_subpass, src_stage_mask, dst_stage_mask, src_access_mask, dst_access_mask, dependency_flags, view_offset)

RenderPassCreateInfo2(attachments::AbstractArray, subpasses::AbstractArray, dependencies::AbstractArray, correlated_view_masks::AbstractArray; next = C_NULL, flags = 0) = RenderPassCreateInfo2(next, flags, attachments, subpasses, dependencies, correlated_view_masks)

SubpassBeginInfo(contents::SubpassContents; next = C_NULL) = SubpassBeginInfo(next, contents)

SubpassEndInfo(; next = C_NULL) = SubpassEndInfo(next)

PhysicalDeviceTimelineSemaphoreFeatures(timeline_semaphore::Bool; next = C_NULL) = PhysicalDeviceTimelineSemaphoreFeatures(next, timeline_semaphore)

SemaphoreTypeCreateInfo(semaphore_type::SemaphoreType, initial_value::Integer; next = C_NULL) = SemaphoreTypeCreateInfo(next, semaphore_type, initial_value)

TimelineSemaphoreSubmitInfo(; next = C_NULL, wait_semaphore_values = C_NULL, signal_semaphore_values = C_NULL) = TimelineSemaphoreSubmitInfo(next, wait_semaphore_values, signal_semaphore_values)

SemaphoreWaitInfo(semaphores::AbstractArray, values::AbstractArray; next = C_NULL, flags = 0) = SemaphoreWaitInfo(next, flags, semaphores, values)

SemaphoreSignalInfo(semaphore::Semaphore, value::Integer; next = C_NULL) = SemaphoreSignalInfo(next, semaphore, value)

PipelineVertexInputDivisorStateCreateInfoEXT(vertex_binding_divisors::AbstractArray; next = C_NULL) = PipelineVertexInputDivisorStateCreateInfoEXT(next, vertex_binding_divisors)

ImportAndroidHardwareBufferInfoANDROID(buffer::vk.AHardwareBuffer; next = C_NULL) = ImportAndroidHardwareBufferInfoANDROID(next, buffer)

MemoryGetAndroidHardwareBufferInfoANDROID(memory::DeviceMemory; next = C_NULL) = MemoryGetAndroidHardwareBufferInfoANDROID(next, memory)

CommandBufferInheritanceConditionalRenderingInfoEXT(conditional_rendering_enable::Bool; next = C_NULL) = CommandBufferInheritanceConditionalRenderingInfoEXT(next, conditional_rendering_enable)

ExternalFormatANDROID(external_format::Integer; next = C_NULL) = ExternalFormatANDROID(next, external_format)

PhysicalDevice8BitStorageFeatures(storage_buffer_8_bit_access::Bool, uniform_and_storage_buffer_8_bit_access::Bool, storage_push_constant_8::Bool; next = C_NULL) = PhysicalDevice8BitStorageFeatures(next, storage_buffer_8_bit_access, uniform_and_storage_buffer_8_bit_access, storage_push_constant_8)

PhysicalDeviceConditionalRenderingFeaturesEXT(conditional_rendering::Bool, inherited_conditional_rendering::Bool; next = C_NULL) = PhysicalDeviceConditionalRenderingFeaturesEXT(next, conditional_rendering, inherited_conditional_rendering)

PhysicalDeviceVulkanMemoryModelFeatures(vulkan_memory_model::Bool, vulkan_memory_model_device_scope::Bool, vulkan_memory_model_availability_visibility_chains::Bool; next = C_NULL) = PhysicalDeviceVulkanMemoryModelFeatures(next, vulkan_memory_model, vulkan_memory_model_device_scope, vulkan_memory_model_availability_visibility_chains)

PhysicalDeviceShaderAtomicInt64Features(shader_buffer_int_64_atomics::Bool, shader_shared_int_64_atomics::Bool; next = C_NULL) = PhysicalDeviceShaderAtomicInt64Features(next, shader_buffer_int_64_atomics, shader_shared_int_64_atomics)

PhysicalDeviceShaderAtomicFloatFeaturesEXT(shader_buffer_float_32_atomics::Bool, shader_buffer_float_32_atomic_add::Bool, shader_buffer_float_64_atomics::Bool, shader_buffer_float_64_atomic_add::Bool, shader_shared_float_32_atomics::Bool, shader_shared_float_32_atomic_add::Bool, shader_shared_float_64_atomics::Bool, shader_shared_float_64_atomic_add::Bool, shader_image_float_32_atomics::Bool, shader_image_float_32_atomic_add::Bool, sparse_image_float_32_atomics::Bool, sparse_image_float_32_atomic_add::Bool; next = C_NULL) = PhysicalDeviceShaderAtomicFloatFeaturesEXT(next, shader_buffer_float_32_atomics, shader_buffer_float_32_atomic_add, shader_buffer_float_64_atomics, shader_buffer_float_64_atomic_add, shader_shared_float_32_atomics, shader_shared_float_32_atomic_add, shader_shared_float_64_atomics, shader_shared_float_64_atomic_add, shader_image_float_32_atomics, shader_image_float_32_atomic_add, sparse_image_float_32_atomics, sparse_image_float_32_atomic_add)

PhysicalDeviceVertexAttributeDivisorFeaturesEXT(vertex_attribute_instance_rate_divisor::Bool, vertex_attribute_instance_rate_zero_divisor::Bool; next = C_NULL) = PhysicalDeviceVertexAttributeDivisorFeaturesEXT(next, vertex_attribute_instance_rate_divisor, vertex_attribute_instance_rate_zero_divisor)

SubpassDescriptionDepthStencilResolve(depth_resolve_mode::ResolveModeFlag, stencil_resolve_mode::ResolveModeFlag; next = C_NULL, depth_stencil_resolve_attachment = C_NULL) = SubpassDescriptionDepthStencilResolve(next, depth_resolve_mode, stencil_resolve_mode, depth_stencil_resolve_attachment)

ImageViewASTCDecodeModeEXT(decode_mode::Format; next = C_NULL) = ImageViewASTCDecodeModeEXT(next, decode_mode)

PhysicalDeviceASTCDecodeFeaturesEXT(decode_mode_shared_exponent::Bool; next = C_NULL) = PhysicalDeviceASTCDecodeFeaturesEXT(next, decode_mode_shared_exponent)

PhysicalDeviceTransformFeedbackFeaturesEXT(transform_feedback::Bool, geometry_streams::Bool; next = C_NULL) = PhysicalDeviceTransformFeedbackFeaturesEXT(next, transform_feedback, geometry_streams)

PipelineRasterizationStateStreamCreateInfoEXT(rasterization_stream::Integer; next = C_NULL, flags = 0) = PipelineRasterizationStateStreamCreateInfoEXT(next, flags, rasterization_stream)

PhysicalDeviceRepresentativeFragmentTestFeaturesNV(representative_fragment_test::Bool; next = C_NULL) = PhysicalDeviceRepresentativeFragmentTestFeaturesNV(next, representative_fragment_test)

PipelineRepresentativeFragmentTestStateCreateInfoNV(representative_fragment_test_enable::Bool; next = C_NULL) = PipelineRepresentativeFragmentTestStateCreateInfoNV(next, representative_fragment_test_enable)

PhysicalDeviceExclusiveScissorFeaturesNV(exclusive_scissor::Bool; next = C_NULL) = PhysicalDeviceExclusiveScissorFeaturesNV(next, exclusive_scissor)

PipelineViewportExclusiveScissorStateCreateInfoNV(exclusive_scissors::AbstractArray; next = C_NULL) = PipelineViewportExclusiveScissorStateCreateInfoNV(next, exclusive_scissors)

PhysicalDeviceCornerSampledImageFeaturesNV(corner_sampled_image::Bool; next = C_NULL) = PhysicalDeviceCornerSampledImageFeaturesNV(next, corner_sampled_image)

PhysicalDeviceComputeShaderDerivativesFeaturesNV(compute_derivative_group_quads::Bool, compute_derivative_group_linear::Bool; next = C_NULL) = PhysicalDeviceComputeShaderDerivativesFeaturesNV(next, compute_derivative_group_quads, compute_derivative_group_linear)

PhysicalDeviceFragmentShaderBarycentricFeaturesNV(fragment_shader_barycentric::Bool; next = C_NULL) = PhysicalDeviceFragmentShaderBarycentricFeaturesNV(next, fragment_shader_barycentric)

PhysicalDeviceShaderImageFootprintFeaturesNV(image_footprint::Bool; next = C_NULL) = PhysicalDeviceShaderImageFootprintFeaturesNV(next, image_footprint)

PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV(dedicated_allocation_image_aliasing::Bool; next = C_NULL) = PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV(next, dedicated_allocation_image_aliasing)

PipelineViewportShadingRateImageStateCreateInfoNV(shading_rate_image_enable::Bool, shading_rate_palettes::AbstractArray; next = C_NULL) = PipelineViewportShadingRateImageStateCreateInfoNV(next, shading_rate_image_enable, shading_rate_palettes)

PhysicalDeviceShadingRateImageFeaturesNV(shading_rate_image::Bool, shading_rate_coarse_sample_order::Bool; next = C_NULL) = PhysicalDeviceShadingRateImageFeaturesNV(next, shading_rate_image, shading_rate_coarse_sample_order)

PipelineViewportCoarseSampleOrderStateCreateInfoNV(sample_order_type::CoarseSampleOrderTypeNV, custom_sample_orders::AbstractArray; next = C_NULL) = PipelineViewportCoarseSampleOrderStateCreateInfoNV(next, sample_order_type, custom_sample_orders)

PhysicalDeviceMeshShaderFeaturesNV(task_shader::Bool, mesh_shader::Bool; next = C_NULL) = PhysicalDeviceMeshShaderFeaturesNV(next, task_shader, mesh_shader)

RayTracingShaderGroupCreateInfoNV(type::RayTracingShaderGroupTypeKHR, general_shader::Integer, closest_hit_shader::Integer, any_hit_shader::Integer, intersection_shader::Integer; next = C_NULL) = RayTracingShaderGroupCreateInfoNV(next, type, general_shader, closest_hit_shader, any_hit_shader, intersection_shader)

RayTracingShaderGroupCreateInfoKHR(type::RayTracingShaderGroupTypeKHR, general_shader::Integer, closest_hit_shader::Integer, any_hit_shader::Integer, intersection_shader::Integer; next = C_NULL, shader_group_capture_replay_handle = C_NULL) = RayTracingShaderGroupCreateInfoKHR(next, type, general_shader, closest_hit_shader, any_hit_shader, intersection_shader, shader_group_capture_replay_handle)

RayTracingPipelineCreateInfoNV(stages::AbstractArray, groups::AbstractArray, max_recursion_depth::Integer, layout::PipelineLayout, base_pipeline_index::Integer; next = C_NULL, flags = 0, base_pipeline_handle = C_NULL) = RayTracingPipelineCreateInfoNV(next, flags, stages, groups, max_recursion_depth, layout, base_pipeline_handle, base_pipeline_index)

RayTracingPipelineCreateInfoKHR(stages::AbstractArray, groups::AbstractArray, max_pipeline_ray_recursion_depth::Integer, layout::PipelineLayout, base_pipeline_index::Integer; next = C_NULL, flags = 0, library_info = C_NULL, library_interface = C_NULL, dynamic_state = C_NULL, base_pipeline_handle = C_NULL) = RayTracingPipelineCreateInfoKHR(next, flags, stages, groups, max_pipeline_ray_recursion_depth, library_info, library_interface, dynamic_state, layout, base_pipeline_handle, base_pipeline_index)

GeometryTrianglesNV(vertex_offset::Integer, vertex_count::Integer, vertex_stride::Integer, vertex_format::Format, index_offset::Integer, index_count::Integer, index_type::IndexType, transform_offset::Integer; next = C_NULL, vertex_data = C_NULL, index_data = C_NULL, transform_data = C_NULL) = GeometryTrianglesNV(next, vertex_data, vertex_offset, vertex_count, vertex_stride, vertex_format, index_data, index_offset, index_count, index_type, transform_data, transform_offset)

GeometryAABBNV(num_aab_bs::Integer, stride::Integer, offset::Integer; next = C_NULL, aabb_data = C_NULL) = GeometryAABBNV(next, aabb_data, num_aab_bs, stride, offset)

GeometryNV(geometry_type::GeometryTypeKHR, geometry::GeometryDataNV; next = C_NULL, flags = 0) = GeometryNV(next, geometry_type, geometry, flags)

AccelerationStructureInfoNV(type::VkAccelerationStructureTypeNV, geometries::AbstractArray; next = C_NULL, flags = C_NULL, instance_count = 0) = AccelerationStructureInfoNV(next, type, flags, instance_count, geometries)

AccelerationStructureCreateInfoNV(compacted_size::Integer, info::AccelerationStructureInfoNV; next = C_NULL) = AccelerationStructureCreateInfoNV(next, compacted_size, info)

BindAccelerationStructureMemoryInfoNV(acceleration_structure::AccelerationStructureNV, memory::DeviceMemory, memory_offset::Integer, device_indices::AbstractArray; next = C_NULL) = BindAccelerationStructureMemoryInfoNV(next, acceleration_structure, memory, memory_offset, device_indices)

WriteDescriptorSetAccelerationStructureKHR(acceleration_structures::AbstractArray; next = C_NULL) = WriteDescriptorSetAccelerationStructureKHR(next, acceleration_structures)

WriteDescriptorSetAccelerationStructureNV(acceleration_structures::AbstractArray; next = C_NULL) = WriteDescriptorSetAccelerationStructureNV(next, acceleration_structures)

AccelerationStructureMemoryRequirementsInfoNV(type::AccelerationStructureMemoryRequirementsTypeNV, acceleration_structure::AccelerationStructureNV; next = C_NULL) = AccelerationStructureMemoryRequirementsInfoNV(next, type, acceleration_structure)

PhysicalDeviceAccelerationStructureFeaturesKHR(acceleration_structure::Bool, acceleration_structure_capture_replay::Bool, acceleration_structure_indirect_build::Bool, acceleration_structure_host_commands::Bool, descriptor_binding_acceleration_structure_update_after_bind::Bool; next = C_NULL) = PhysicalDeviceAccelerationStructureFeaturesKHR(next, acceleration_structure, acceleration_structure_capture_replay, acceleration_structure_indirect_build, acceleration_structure_host_commands, descriptor_binding_acceleration_structure_update_after_bind)

PhysicalDeviceRayTracingPipelineFeaturesKHR(ray_tracing_pipeline::Bool, ray_tracing_pipeline_shader_group_handle_capture_replay::Bool, ray_tracing_pipeline_shader_group_handle_capture_replay_mixed::Bool, ray_tracing_pipeline_trace_rays_indirect::Bool, ray_traversal_primitive_culling::Bool; next = C_NULL) = PhysicalDeviceRayTracingPipelineFeaturesKHR(next, ray_tracing_pipeline, ray_tracing_pipeline_shader_group_handle_capture_replay, ray_tracing_pipeline_shader_group_handle_capture_replay_mixed, ray_tracing_pipeline_trace_rays_indirect, ray_traversal_primitive_culling)

PhysicalDeviceRayQueryFeaturesKHR(ray_query::Bool; next = C_NULL) = PhysicalDeviceRayQueryFeaturesKHR(next, ray_query)

StridedDeviceAddressRegionKHR(stride::Integer, size::Integer; device_address = 0) = StridedDeviceAddressRegionKHR(device_address, stride, size)

PhysicalDeviceImageDrmFormatModifierInfoEXT(drm_format_modifier::Integer, sharing_mode::SharingMode, queue_family_indices::AbstractArray; next = C_NULL) = PhysicalDeviceImageDrmFormatModifierInfoEXT(next, drm_format_modifier, sharing_mode, queue_family_indices)

ImageDrmFormatModifierListCreateInfoEXT(drm_format_modifiers::AbstractArray; next = C_NULL) = ImageDrmFormatModifierListCreateInfoEXT(next, drm_format_modifiers)

ImageDrmFormatModifierExplicitCreateInfoEXT(drm_format_modifier::Integer, plane_layouts::AbstractArray; next = C_NULL) = ImageDrmFormatModifierExplicitCreateInfoEXT(next, drm_format_modifier, plane_layouts)

ImageStencilUsageCreateInfo(stencil_usage::ImageUsageFlag; next = C_NULL) = ImageStencilUsageCreateInfo(next, stencil_usage)

DeviceMemoryOverallocationCreateInfoAMD(overallocation_behavior::MemoryOverallocationBehaviorAMD; next = C_NULL) = DeviceMemoryOverallocationCreateInfoAMD(next, overallocation_behavior)

PhysicalDeviceFragmentDensityMapFeaturesEXT(fragment_density_map::Bool, fragment_density_map_dynamic::Bool, fragment_density_map_non_subsampled_images::Bool; next = C_NULL) = PhysicalDeviceFragmentDensityMapFeaturesEXT(next, fragment_density_map, fragment_density_map_dynamic, fragment_density_map_non_subsampled_images)

PhysicalDeviceFragmentDensityMap2FeaturesEXT(fragment_density_map_deferred::Bool; next = C_NULL) = PhysicalDeviceFragmentDensityMap2FeaturesEXT(next, fragment_density_map_deferred)

RenderPassFragmentDensityMapCreateInfoEXT(fragment_density_map_attachment::AttachmentReference; next = C_NULL) = RenderPassFragmentDensityMapCreateInfoEXT(next, fragment_density_map_attachment)

PhysicalDeviceScalarBlockLayoutFeatures(scalar_block_layout::Bool; next = C_NULL) = PhysicalDeviceScalarBlockLayoutFeatures(next, scalar_block_layout)

SurfaceProtectedCapabilitiesKHR(supports_protected::Bool; next = C_NULL) = SurfaceProtectedCapabilitiesKHR(next, supports_protected)

PhysicalDeviceUniformBufferStandardLayoutFeatures(uniform_buffer_standard_layout::Bool; next = C_NULL) = PhysicalDeviceUniformBufferStandardLayoutFeatures(next, uniform_buffer_standard_layout)

PhysicalDeviceDepthClipEnableFeaturesEXT(depth_clip_enable::Bool; next = C_NULL) = PhysicalDeviceDepthClipEnableFeaturesEXT(next, depth_clip_enable)

PipelineRasterizationDepthClipStateCreateInfoEXT(depth_clip_enable::Bool; next = C_NULL, flags = 0) = PipelineRasterizationDepthClipStateCreateInfoEXT(next, flags, depth_clip_enable)

PhysicalDeviceMemoryPriorityFeaturesEXT(memory_priority::Bool; next = C_NULL) = PhysicalDeviceMemoryPriorityFeaturesEXT(next, memory_priority)

MemoryPriorityAllocateInfoEXT(priority::Real; next = C_NULL) = MemoryPriorityAllocateInfoEXT(next, priority)

PhysicalDeviceBufferDeviceAddressFeatures(buffer_device_address::Bool, buffer_device_address_capture_replay::Bool, buffer_device_address_multi_device::Bool; next = C_NULL) = PhysicalDeviceBufferDeviceAddressFeatures(next, buffer_device_address, buffer_device_address_capture_replay, buffer_device_address_multi_device)

PhysicalDeviceBufferDeviceAddressFeaturesEXT(buffer_device_address::Bool, buffer_device_address_capture_replay::Bool, buffer_device_address_multi_device::Bool; next = C_NULL) = PhysicalDeviceBufferDeviceAddressFeaturesEXT(next, buffer_device_address, buffer_device_address_capture_replay, buffer_device_address_multi_device)

BufferDeviceAddressInfo(buffer::Buffer; next = C_NULL) = BufferDeviceAddressInfo(next, buffer)

BufferOpaqueCaptureAddressCreateInfo(opaque_capture_address::Integer; next = C_NULL) = BufferOpaqueCaptureAddressCreateInfo(next, opaque_capture_address)

BufferDeviceAddressCreateInfoEXT(device_address::Integer; next = C_NULL) = BufferDeviceAddressCreateInfoEXT(next, device_address)

PhysicalDeviceImageViewImageFormatInfoEXT(image_view_type::ImageViewType; next = C_NULL) = PhysicalDeviceImageViewImageFormatInfoEXT(next, image_view_type)

PhysicalDeviceImagelessFramebufferFeatures(imageless_framebuffer::Bool; next = C_NULL) = PhysicalDeviceImagelessFramebufferFeatures(next, imageless_framebuffer)

FramebufferAttachmentsCreateInfo(attachment_image_infos::AbstractArray; next = C_NULL) = FramebufferAttachmentsCreateInfo(next, attachment_image_infos)

FramebufferAttachmentImageInfo(usage::ImageUsageFlag, width::Integer, height::Integer, layer_count::Integer, view_formats::AbstractArray; next = C_NULL, flags = 0) = FramebufferAttachmentImageInfo(next, flags, usage, width, height, layer_count, view_formats)

RenderPassAttachmentBeginInfo(attachments::AbstractArray; next = C_NULL) = RenderPassAttachmentBeginInfo(next, attachments)

PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT(texture_compression_astc_hdr::Bool; next = C_NULL) = PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT(next, texture_compression_astc_hdr)

PhysicalDeviceCooperativeMatrixFeaturesNV(cooperative_matrix::Bool, cooperative_matrix_robust_buffer_access::Bool; next = C_NULL) = PhysicalDeviceCooperativeMatrixFeaturesNV(next, cooperative_matrix, cooperative_matrix_robust_buffer_access)

CooperativeMatrixPropertiesNV(m_size::Integer, n_size::Integer, k_size::Integer, a_type::ComponentTypeNV, b_type::ComponentTypeNV, c_type::ComponentTypeNV, d_type::ComponentTypeNV, scope::ScopeNV; next = C_NULL) = CooperativeMatrixPropertiesNV(next, m_size, n_size, k_size, a_type, b_type, c_type, d_type, scope)

PhysicalDeviceYcbcrImageArraysFeaturesEXT(ycbcr_image_arrays::Bool; next = C_NULL) = PhysicalDeviceYcbcrImageArraysFeaturesEXT(next, ycbcr_image_arrays)

ImageViewHandleInfoNVX(image_view::ImageView, descriptor_type::DescriptorType; next = C_NULL, sampler = C_NULL) = ImageViewHandleInfoNVX(next, image_view, descriptor_type, sampler)

PresentFrameTokenGGP(frame_token::vk.GgpFrameToken; next = C_NULL) = PresentFrameTokenGGP(next, frame_token)

PipelineCreationFeedbackCreateInfoEXT(pipeline_creation_feedback::PipelineCreationFeedbackEXT, pipeline_stage_creation_feedbacks::AbstractArray; next = C_NULL) = PipelineCreationFeedbackCreateInfoEXT(next, pipeline_creation_feedback, pipeline_stage_creation_feedbacks)

SurfaceFullScreenExclusiveInfoEXT(full_screen_exclusive::FullScreenExclusiveEXT; next = C_NULL) = SurfaceFullScreenExclusiveInfoEXT(next, full_screen_exclusive)

SurfaceFullScreenExclusiveWin32InfoEXT(hmonitor::vk.HMONITOR; next = C_NULL) = SurfaceFullScreenExclusiveWin32InfoEXT(next, hmonitor)

SurfaceCapabilitiesFullScreenExclusiveEXT(full_screen_exclusive_supported::Bool; next = C_NULL) = SurfaceCapabilitiesFullScreenExclusiveEXT(next, full_screen_exclusive_supported)

PhysicalDevicePerformanceQueryFeaturesKHR(performance_counter_query_pools::Bool, performance_counter_multiple_query_pools::Bool; next = C_NULL) = PhysicalDevicePerformanceQueryFeaturesKHR(next, performance_counter_query_pools, performance_counter_multiple_query_pools)

QueryPoolPerformanceCreateInfoKHR(queue_family_index::Integer, counter_indices::AbstractArray; next = C_NULL) = QueryPoolPerformanceCreateInfoKHR(next, queue_family_index, counter_indices)

AcquireProfilingLockInfoKHR(timeout::Integer; next = C_NULL, flags = 0) = AcquireProfilingLockInfoKHR(next, flags, timeout)

PerformanceQuerySubmitInfoKHR(counter_pass_index::Integer; next = C_NULL) = PerformanceQuerySubmitInfoKHR(next, counter_pass_index)

HeadlessSurfaceCreateInfoEXT(; next = C_NULL, flags = 0) = HeadlessSurfaceCreateInfoEXT(next, flags)

PhysicalDeviceCoverageReductionModeFeaturesNV(coverage_reduction_mode::Bool; next = C_NULL) = PhysicalDeviceCoverageReductionModeFeaturesNV(next, coverage_reduction_mode)

PipelineCoverageReductionStateCreateInfoNV(coverage_reduction_mode::CoverageReductionModeNV; next = C_NULL, flags = 0) = PipelineCoverageReductionStateCreateInfoNV(next, flags, coverage_reduction_mode)

PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL(shader_integer_functions_2::Bool; next = C_NULL) = PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL(next, shader_integer_functions_2)

InitializePerformanceApiInfoINTEL(; next = C_NULL, user_data = C_NULL) = InitializePerformanceApiInfoINTEL(next, user_data)

QueryPoolPerformanceQueryCreateInfoINTEL(performance_counters_sampling::QueryPoolSamplingModeINTEL; next = C_NULL) = QueryPoolPerformanceQueryCreateInfoINTEL(next, performance_counters_sampling)

PerformanceMarkerInfoINTEL(marker::Integer; next = C_NULL) = PerformanceMarkerInfoINTEL(next, marker)

PerformanceStreamMarkerInfoINTEL(marker::Integer; next = C_NULL) = PerformanceStreamMarkerInfoINTEL(next, marker)

PerformanceOverrideInfoINTEL(type::PerformanceOverrideTypeINTEL, enable::Bool, parameter::Integer; next = C_NULL) = PerformanceOverrideInfoINTEL(next, type, enable, parameter)

PerformanceConfigurationAcquireInfoINTEL(type::PerformanceConfigurationTypeINTEL; next = C_NULL) = PerformanceConfigurationAcquireInfoINTEL(next, type)

PhysicalDeviceShaderClockFeaturesKHR(shader_subgroup_clock::Bool, shader_device_clock::Bool; next = C_NULL) = PhysicalDeviceShaderClockFeaturesKHR(next, shader_subgroup_clock, shader_device_clock)

PhysicalDeviceIndexTypeUint8FeaturesEXT(index_type_uint_8::Bool; next = C_NULL) = PhysicalDeviceIndexTypeUint8FeaturesEXT(next, index_type_uint_8)

PhysicalDeviceShaderSMBuiltinsFeaturesNV(shader_sm_builtins::Bool; next = C_NULL) = PhysicalDeviceShaderSMBuiltinsFeaturesNV(next, shader_sm_builtins)

PhysicalDeviceFragmentShaderInterlockFeaturesEXT(fragment_shader_sample_interlock::Bool, fragment_shader_pixel_interlock::Bool, fragment_shader_shading_rate_interlock::Bool; next = C_NULL) = PhysicalDeviceFragmentShaderInterlockFeaturesEXT(next, fragment_shader_sample_interlock, fragment_shader_pixel_interlock, fragment_shader_shading_rate_interlock)

PhysicalDeviceSeparateDepthStencilLayoutsFeatures(separate_depth_stencil_layouts::Bool; next = C_NULL) = PhysicalDeviceSeparateDepthStencilLayoutsFeatures(next, separate_depth_stencil_layouts)

AttachmentReferenceStencilLayout(stencil_layout::ImageLayout; next = C_NULL) = AttachmentReferenceStencilLayout(next, stencil_layout)

AttachmentDescriptionStencilLayout(stencil_initial_layout::ImageLayout, stencil_final_layout::ImageLayout; next = C_NULL) = AttachmentDescriptionStencilLayout(next, stencil_initial_layout, stencil_final_layout)

PhysicalDevicePipelineExecutablePropertiesFeaturesKHR(pipeline_executable_info::Bool; next = C_NULL) = PhysicalDevicePipelineExecutablePropertiesFeaturesKHR(next, pipeline_executable_info)

PipelineInfoKHR(pipeline::Pipeline; next = C_NULL) = PipelineInfoKHR(next, pipeline)

PipelineExecutableInfoKHR(pipeline::Pipeline, executable_index::Integer; next = C_NULL) = PipelineExecutableInfoKHR(next, pipeline, executable_index)

PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT(shader_demote_to_helper_invocation::Bool; next = C_NULL) = PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT(next, shader_demote_to_helper_invocation)

PhysicalDeviceTexelBufferAlignmentFeaturesEXT(texel_buffer_alignment::Bool; next = C_NULL) = PhysicalDeviceTexelBufferAlignmentFeaturesEXT(next, texel_buffer_alignment)

PhysicalDeviceSubgroupSizeControlFeaturesEXT(subgroup_size_control::Bool, compute_full_subgroups::Bool; next = C_NULL) = PhysicalDeviceSubgroupSizeControlFeaturesEXT(next, subgroup_size_control, compute_full_subgroups)

MemoryOpaqueCaptureAddressAllocateInfo(opaque_capture_address::Integer; next = C_NULL) = MemoryOpaqueCaptureAddressAllocateInfo(next, opaque_capture_address)

DeviceMemoryOpaqueCaptureAddressInfo(memory::DeviceMemory; next = C_NULL) = DeviceMemoryOpaqueCaptureAddressInfo(next, memory)

PhysicalDeviceLineRasterizationFeaturesEXT(rectangular_lines::Bool, bresenham_lines::Bool, smooth_lines::Bool, stippled_rectangular_lines::Bool, stippled_bresenham_lines::Bool, stippled_smooth_lines::Bool; next = C_NULL) = PhysicalDeviceLineRasterizationFeaturesEXT(next, rectangular_lines, bresenham_lines, smooth_lines, stippled_rectangular_lines, stippled_bresenham_lines, stippled_smooth_lines)

PipelineRasterizationLineStateCreateInfoEXT(line_rasterization_mode::LineRasterizationModeEXT, stippled_line_enable::Bool, line_stipple_factor::Integer, line_stipple_pattern::Integer; next = C_NULL) = PipelineRasterizationLineStateCreateInfoEXT(next, line_rasterization_mode, stippled_line_enable, line_stipple_factor, line_stipple_pattern)

PhysicalDevicePipelineCreationCacheControlFeaturesEXT(pipeline_creation_cache_control::Bool; next = C_NULL) = PhysicalDevicePipelineCreationCacheControlFeaturesEXT(next, pipeline_creation_cache_control)

PhysicalDeviceVulkan11Features(storage_buffer_16_bit_access::Bool, uniform_and_storage_buffer_16_bit_access::Bool, storage_push_constant_16::Bool, storage_input_output_16::Bool, multiview::Bool, multiview_geometry_shader::Bool, multiview_tessellation_shader::Bool, variable_pointers_storage_buffer::Bool, variable_pointers::Bool, protected_memory::Bool, sampler_ycbcr_conversion::Bool, shader_draw_parameters::Bool; next = C_NULL) = PhysicalDeviceVulkan11Features(next, storage_buffer_16_bit_access, uniform_and_storage_buffer_16_bit_access, storage_push_constant_16, storage_input_output_16, multiview, multiview_geometry_shader, multiview_tessellation_shader, variable_pointers_storage_buffer, variable_pointers, protected_memory, sampler_ycbcr_conversion, shader_draw_parameters)

PhysicalDeviceVulkan12Features(sampler_mirror_clamp_to_edge::Bool, draw_indirect_count::Bool, storage_buffer_8_bit_access::Bool, uniform_and_storage_buffer_8_bit_access::Bool, storage_push_constant_8::Bool, shader_buffer_int_64_atomics::Bool, shader_shared_int_64_atomics::Bool, shader_float_16::Bool, shader_int_8::Bool, descriptor_indexing::Bool, shader_input_attachment_array_dynamic_indexing::Bool, shader_uniform_texel_buffer_array_dynamic_indexing::Bool, shader_storage_texel_buffer_array_dynamic_indexing::Bool, shader_uniform_buffer_array_non_uniform_indexing::Bool, shader_sampled_image_array_non_uniform_indexing::Bool, shader_storage_buffer_array_non_uniform_indexing::Bool, shader_storage_image_array_non_uniform_indexing::Bool, shader_input_attachment_array_non_uniform_indexing::Bool, shader_uniform_texel_buffer_array_non_uniform_indexing::Bool, shader_storage_texel_buffer_array_non_uniform_indexing::Bool, descriptor_binding_uniform_buffer_update_after_bind::Bool, descriptor_binding_sampled_image_update_after_bind::Bool, descriptor_binding_storage_image_update_after_bind::Bool, descriptor_binding_storage_buffer_update_after_bind::Bool, descriptor_binding_uniform_texel_buffer_update_after_bind::Bool, descriptor_binding_storage_texel_buffer_update_after_bind::Bool, descriptor_binding_update_unused_while_pending::Bool, descriptor_binding_partially_bound::Bool, descriptor_binding_variable_descriptor_count::Bool, runtime_descriptor_array::Bool, sampler_filter_minmax::Bool, scalar_block_layout::Bool, imageless_framebuffer::Bool, uniform_buffer_standard_layout::Bool, shader_subgroup_extended_types::Bool, separate_depth_stencil_layouts::Bool, host_query_reset::Bool, timeline_semaphore::Bool, buffer_device_address::Bool, buffer_device_address_capture_replay::Bool, buffer_device_address_multi_device::Bool, vulkan_memory_model::Bool, vulkan_memory_model_device_scope::Bool, vulkan_memory_model_availability_visibility_chains::Bool, shader_output_viewport_index::Bool, shader_output_layer::Bool, subgroup_broadcast_dynamic_id::Bool; next = C_NULL) = PhysicalDeviceVulkan12Features(next, sampler_mirror_clamp_to_edge, draw_indirect_count, storage_buffer_8_bit_access, uniform_and_storage_buffer_8_bit_access, storage_push_constant_8, shader_buffer_int_64_atomics, shader_shared_int_64_atomics, shader_float_16, shader_int_8, descriptor_indexing, shader_input_attachment_array_dynamic_indexing, shader_uniform_texel_buffer_array_dynamic_indexing, shader_storage_texel_buffer_array_dynamic_indexing, shader_uniform_buffer_array_non_uniform_indexing, shader_sampled_image_array_non_uniform_indexing, shader_storage_buffer_array_non_uniform_indexing, shader_storage_image_array_non_uniform_indexing, shader_input_attachment_array_non_uniform_indexing, shader_uniform_texel_buffer_array_non_uniform_indexing, shader_storage_texel_buffer_array_non_uniform_indexing, descriptor_binding_uniform_buffer_update_after_bind, descriptor_binding_sampled_image_update_after_bind, descriptor_binding_storage_image_update_after_bind, descriptor_binding_storage_buffer_update_after_bind, descriptor_binding_uniform_texel_buffer_update_after_bind, descriptor_binding_storage_texel_buffer_update_after_bind, descriptor_binding_update_unused_while_pending, descriptor_binding_partially_bound, descriptor_binding_variable_descriptor_count, runtime_descriptor_array, sampler_filter_minmax, scalar_block_layout, imageless_framebuffer, uniform_buffer_standard_layout, shader_subgroup_extended_types, separate_depth_stencil_layouts, host_query_reset, timeline_semaphore, buffer_device_address, buffer_device_address_capture_replay, buffer_device_address_multi_device, vulkan_memory_model, vulkan_memory_model_device_scope, vulkan_memory_model_availability_visibility_chains, shader_output_viewport_index, shader_output_layer, subgroup_broadcast_dynamic_id)

PipelineCompilerControlCreateInfoAMD(; next = C_NULL, compiler_control_flags = 0) = PipelineCompilerControlCreateInfoAMD(next, compiler_control_flags)

PhysicalDeviceCoherentMemoryFeaturesAMD(device_coherent_memory::Bool; next = C_NULL) = PhysicalDeviceCoherentMemoryFeaturesAMD(next, device_coherent_memory)

SamplerCustomBorderColorCreateInfoEXT(custom_border_color::VkClearColorValue, format::Format; next = C_NULL) = SamplerCustomBorderColorCreateInfoEXT(next, custom_border_color, format)

PhysicalDeviceCustomBorderColorFeaturesEXT(custom_border_colors::Bool, custom_border_color_without_format::Bool; next = C_NULL) = PhysicalDeviceCustomBorderColorFeaturesEXT(next, custom_border_colors, custom_border_color_without_format)

AccelerationStructureGeometryTrianglesDataKHR(vertex_format::Format, vertex_data::VkDeviceOrHostAddressConstKHR, vertex_stride::Integer, max_vertex::Integer, index_type::IndexType, index_data::VkDeviceOrHostAddressConstKHR, transform_data::VkDeviceOrHostAddressConstKHR; next = C_NULL) = AccelerationStructureGeometryTrianglesDataKHR(next, vertex_format, vertex_data, vertex_stride, max_vertex, index_type, index_data, transform_data)

AccelerationStructureGeometryAabbsDataKHR(data::VkDeviceOrHostAddressConstKHR, stride::Integer; next = C_NULL) = AccelerationStructureGeometryAabbsDataKHR(next, data, stride)

AccelerationStructureGeometryInstancesDataKHR(array_of_pointers::Bool, data::VkDeviceOrHostAddressConstKHR; next = C_NULL) = AccelerationStructureGeometryInstancesDataKHR(next, array_of_pointers, data)

AccelerationStructureGeometryKHR(geometry_type::GeometryTypeKHR, geometry::VkAccelerationStructureGeometryDataKHR; next = C_NULL, flags = 0) = AccelerationStructureGeometryKHR(next, geometry_type, geometry, flags)

AccelerationStructureBuildGeometryInfoKHR(type::AccelerationStructureTypeKHR, mode::BuildAccelerationStructureModeKHR, scratch_data::VkDeviceOrHostAddressKHR; next = C_NULL, flags = 0, src_acceleration_structure = C_NULL, dst_acceleration_structure = C_NULL, geometries = C_NULL, geometries_2 = C_NULL) = AccelerationStructureBuildGeometryInfoKHR(next, type, flags, mode, src_acceleration_structure, dst_acceleration_structure, geometries, geometries_2, scratch_data)

AccelerationStructureCreateInfoKHR(buffer::Buffer, offset::Integer, size::Integer, type::AccelerationStructureTypeKHR; next = C_NULL, create_flags = 0, device_address = 0) = AccelerationStructureCreateInfoKHR(next, create_flags, buffer, offset, size, type, device_address)

AccelerationStructureInstanceKHR(transform::TransformMatrixKHR, instance_custom_index::Integer, mask::Integer, instance_shader_binding_table_record_offset::Integer, acceleration_structure_reference::Integer; flags = 0) = AccelerationStructureInstanceKHR(transform, instance_custom_index, mask, instance_shader_binding_table_record_offset, flags, acceleration_structure_reference)

AccelerationStructureDeviceAddressInfoKHR(acceleration_structure::AccelerationStructureKHR; next = C_NULL) = AccelerationStructureDeviceAddressInfoKHR(next, acceleration_structure)

AccelerationStructureVersionInfoKHR(version_data::AbstractArray; next = C_NULL) = AccelerationStructureVersionInfoKHR(next, version_data)

CopyAccelerationStructureInfoKHR(src::AccelerationStructureKHR, dst::AccelerationStructureKHR, mode::CopyAccelerationStructureModeKHR; next = C_NULL) = CopyAccelerationStructureInfoKHR(next, src, dst, mode)

CopyAccelerationStructureToMemoryInfoKHR(src::AccelerationStructureKHR, dst::VkDeviceOrHostAddressKHR, mode::CopyAccelerationStructureModeKHR; next = C_NULL) = CopyAccelerationStructureToMemoryInfoKHR(next, src, dst, mode)

CopyMemoryToAccelerationStructureInfoKHR(src::VkDeviceOrHostAddressConstKHR, dst::AccelerationStructureKHR, mode::CopyAccelerationStructureModeKHR; next = C_NULL) = CopyMemoryToAccelerationStructureInfoKHR(next, src, dst, mode)

RayTracingPipelineInterfaceCreateInfoKHR(max_pipeline_ray_payload_size::Integer, max_pipeline_ray_hit_attribute_size::Integer; next = C_NULL) = RayTracingPipelineInterfaceCreateInfoKHR(next, max_pipeline_ray_payload_size, max_pipeline_ray_hit_attribute_size)

PipelineLibraryCreateInfoKHR(libraries::AbstractArray; next = C_NULL) = PipelineLibraryCreateInfoKHR(next, libraries)

PhysicalDeviceExtendedDynamicStateFeaturesEXT(extended_dynamic_state::Bool; next = C_NULL) = PhysicalDeviceExtendedDynamicStateFeaturesEXT(next, extended_dynamic_state)

PhysicalDeviceExtendedDynamicState2FeaturesEXT(extended_dynamic_state_2::Bool, extended_dynamic_state_2_logic_op::Bool, extended_dynamic_state_2_patch_control_points::Bool; next = C_NULL) = PhysicalDeviceExtendedDynamicState2FeaturesEXT(next, extended_dynamic_state_2, extended_dynamic_state_2_logic_op, extended_dynamic_state_2_patch_control_points)

RenderPassTransformBeginInfoQCOM(transform::SurfaceTransformFlagKHR; next = C_NULL) = RenderPassTransformBeginInfoQCOM(next, transform)

CopyCommandTransformInfoQCOM(transform::SurfaceTransformFlagKHR; next = C_NULL) = CopyCommandTransformInfoQCOM(next, transform)

CommandBufferInheritanceRenderPassTransformInfoQCOM(transform::SurfaceTransformFlagKHR, render_area::Rect2D; next = C_NULL) = CommandBufferInheritanceRenderPassTransformInfoQCOM(next, transform, render_area)

PhysicalDeviceDiagnosticsConfigFeaturesNV(diagnostics_config::Bool; next = C_NULL) = PhysicalDeviceDiagnosticsConfigFeaturesNV(next, diagnostics_config)

DeviceDiagnosticsConfigCreateInfoNV(; next = C_NULL, flags = 0) = DeviceDiagnosticsConfigCreateInfoNV(next, flags)

PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR(shader_zero_initialize_workgroup_memory::Bool; next = C_NULL) = PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR(next, shader_zero_initialize_workgroup_memory)

PhysicalDeviceRobustness2FeaturesEXT(robust_buffer_access_2::Bool, robust_image_access_2::Bool, null_descriptor::Bool; next = C_NULL) = PhysicalDeviceRobustness2FeaturesEXT(next, robust_buffer_access_2, robust_image_access_2, null_descriptor)

PhysicalDeviceImageRobustnessFeaturesEXT(robust_image_access::Bool; next = C_NULL) = PhysicalDeviceImageRobustnessFeaturesEXT(next, robust_image_access)

PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR(workgroup_memory_explicit_layout::Bool, workgroup_memory_explicit_layout_scalar_block_layout::Bool, workgroup_memory_explicit_layout_8_bit_access::Bool, workgroup_memory_explicit_layout_16_bit_access::Bool; next = C_NULL) = PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR(next, workgroup_memory_explicit_layout, workgroup_memory_explicit_layout_scalar_block_layout, workgroup_memory_explicit_layout_8_bit_access, workgroup_memory_explicit_layout_16_bit_access)

PhysicalDevicePortabilitySubsetFeaturesKHR(constant_alpha_color_blend_factors::Bool, events::Bool, image_view_format_reinterpretation::Bool, image_view_format_swizzle::Bool, image_view_2_d_on_3_d_image::Bool, multisample_array_image::Bool, mutable_comparison_samplers::Bool, point_polygons::Bool, sampler_mip_lod_bias::Bool, separate_stencil_mask_ref::Bool, shader_sample_rate_interpolation_functions::Bool, tessellation_isolines::Bool, tessellation_point_mode::Bool, triangle_fans::Bool, vertex_attribute_access_beyond_stride::Bool; next = C_NULL) = PhysicalDevicePortabilitySubsetFeaturesKHR(next, constant_alpha_color_blend_factors, events, image_view_format_reinterpretation, image_view_format_swizzle, image_view_2_d_on_3_d_image, multisample_array_image, mutable_comparison_samplers, point_polygons, sampler_mip_lod_bias, separate_stencil_mask_ref, shader_sample_rate_interpolation_functions, tessellation_isolines, tessellation_point_mode, triangle_fans, vertex_attribute_access_beyond_stride)

PhysicalDevicePortabilitySubsetPropertiesKHR(min_vertex_input_binding_stride_alignment::Integer; next = C_NULL) = PhysicalDevicePortabilitySubsetPropertiesKHR(next, min_vertex_input_binding_stride_alignment)

PhysicalDevice4444FormatsFeaturesEXT(format_a4r4g4b4::Bool, format_a4b4g4r4::Bool; next = C_NULL) = PhysicalDevice4444FormatsFeaturesEXT(next, format_a4r4g4b4, format_a4b4g4r4)

BufferCopy2KHR(src_offset::Integer, dst_offset::Integer, size::Integer; next = C_NULL) = BufferCopy2KHR(next, src_offset, dst_offset, size)

ImageCopy2KHR(src_subresource::ImageSubresourceLayers, src_offset::Offset3D, dst_subresource::ImageSubresourceLayers, dst_offset::Offset3D, extent::Extent3D; next = C_NULL) = ImageCopy2KHR(next, src_subresource, src_offset, dst_subresource, dst_offset, extent)

ImageBlit2KHR(src_subresource::ImageSubresourceLayers, src_offsets::NTuple{2, Offset3D}, dst_subresource::ImageSubresourceLayers, dst_offsets::NTuple{2, Offset3D}; next = C_NULL) = ImageBlit2KHR(next, src_subresource, src_offsets, dst_subresource, dst_offsets)

BufferImageCopy2KHR(buffer_offset::Integer, buffer_row_length::Integer, buffer_image_height::Integer, image_subresource::ImageSubresourceLayers, image_offset::Offset3D, image_extent::Extent3D; next = C_NULL) = BufferImageCopy2KHR(next, buffer_offset, buffer_row_length, buffer_image_height, image_subresource, image_offset, image_extent)

ImageResolve2KHR(src_subresource::ImageSubresourceLayers, src_offset::Offset3D, dst_subresource::ImageSubresourceLayers, dst_offset::Offset3D, extent::Extent3D; next = C_NULL) = ImageResolve2KHR(next, src_subresource, src_offset, dst_subresource, dst_offset, extent)

CopyBufferInfo2KHR(src_buffer::Buffer, dst_buffer::Buffer, regions::AbstractArray; next = C_NULL) = CopyBufferInfo2KHR(next, src_buffer, dst_buffer, regions)

CopyImageInfo2KHR(src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray; next = C_NULL) = CopyImageInfo2KHR(next, src_image, src_image_layout, dst_image, dst_image_layout, regions)

BlitImageInfo2KHR(src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray, filter::Filter; next = C_NULL) = BlitImageInfo2KHR(next, src_image, src_image_layout, dst_image, dst_image_layout, regions, filter)

CopyBufferToImageInfo2KHR(src_buffer::Buffer, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray; next = C_NULL) = CopyBufferToImageInfo2KHR(next, src_buffer, dst_image, dst_image_layout, regions)

CopyImageToBufferInfo2KHR(src_image::Image, src_image_layout::ImageLayout, dst_buffer::Buffer, regions::AbstractArray; next = C_NULL) = CopyImageToBufferInfo2KHR(next, src_image, src_image_layout, dst_buffer, regions)

ResolveImageInfo2KHR(src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray; next = C_NULL) = ResolveImageInfo2KHR(next, src_image, src_image_layout, dst_image, dst_image_layout, regions)

PhysicalDeviceShaderImageAtomicInt64FeaturesEXT(shader_image_int_64_atomics::Bool, sparse_image_int_64_atomics::Bool; next = C_NULL) = PhysicalDeviceShaderImageAtomicInt64FeaturesEXT(next, shader_image_int_64_atomics, sparse_image_int_64_atomics)

FragmentShadingRateAttachmentInfoKHR(fragment_shading_rate_attachment::AttachmentReference2, shading_rate_attachment_texel_size::Extent2D; next = C_NULL) = FragmentShadingRateAttachmentInfoKHR(next, fragment_shading_rate_attachment, shading_rate_attachment_texel_size)

PipelineFragmentShadingRateStateCreateInfoKHR(fragment_size::Extent2D, combiner_ops::NTuple{2, FragmentShadingRateCombinerOpKHR}; next = C_NULL) = PipelineFragmentShadingRateStateCreateInfoKHR(next, fragment_size, combiner_ops)

PhysicalDeviceFragmentShadingRateFeaturesKHR(pipeline_fragment_shading_rate::Bool, primitive_fragment_shading_rate::Bool, attachment_fragment_shading_rate::Bool; next = C_NULL) = PhysicalDeviceFragmentShadingRateFeaturesKHR(next, pipeline_fragment_shading_rate, primitive_fragment_shading_rate, attachment_fragment_shading_rate)

PhysicalDeviceShaderTerminateInvocationFeaturesKHR(shader_terminate_invocation::Bool; next = C_NULL) = PhysicalDeviceShaderTerminateInvocationFeaturesKHR(next, shader_terminate_invocation)

PhysicalDeviceFragmentShadingRateEnumsFeaturesNV(fragment_shading_rate_enums::Bool, supersample_fragment_shading_rates::Bool, no_invocation_fragment_shading_rates::Bool; next = C_NULL) = PhysicalDeviceFragmentShadingRateEnumsFeaturesNV(next, fragment_shading_rate_enums, supersample_fragment_shading_rates, no_invocation_fragment_shading_rates)

PhysicalDeviceFragmentShadingRateEnumsPropertiesNV(max_fragment_shading_rate_invocation_count::SampleCountFlag; next = C_NULL) = PhysicalDeviceFragmentShadingRateEnumsPropertiesNV(next, max_fragment_shading_rate_invocation_count)

PipelineFragmentShadingRateEnumStateCreateInfoNV(shading_rate_type::FragmentShadingRateTypeNV, shading_rate::FragmentShadingRateNV, combiner_ops::NTuple{2, FragmentShadingRateCombinerOpKHR}; next = C_NULL) = PipelineFragmentShadingRateEnumStateCreateInfoNV(next, shading_rate_type, shading_rate, combiner_ops)

AccelerationStructureBuildSizesInfoKHR(acceleration_structure_size::Integer, update_scratch_size::Integer, build_scratch_size::Integer; next = C_NULL) = AccelerationStructureBuildSizesInfoKHR(next, acceleration_structure_size, update_scratch_size, build_scratch_size)

PhysicalDeviceMutableDescriptorTypeFeaturesVALVE(mutable_descriptor_type::Bool; next = C_NULL) = PhysicalDeviceMutableDescriptorTypeFeaturesVALVE(next, mutable_descriptor_type)

MutableDescriptorTypeCreateInfoVALVE(mutable_descriptor_type_lists::AbstractArray; next = C_NULL) = MutableDescriptorTypeCreateInfoVALVE(next, mutable_descriptor_type_lists)

PhysicalDeviceVertexInputDynamicStateFeaturesEXT(vertex_input_dynamic_state::Bool; next = C_NULL) = PhysicalDeviceVertexInputDynamicStateFeaturesEXT(next, vertex_input_dynamic_state)

VertexInputBindingDescription2EXT(binding::Integer, stride::Integer, input_rate::VertexInputRate, divisor::Integer; next = C_NULL) = VertexInputBindingDescription2EXT(next, binding, stride, input_rate, divisor)

VertexInputAttributeDescription2EXT(location::Integer, binding::Integer, format::Format, offset::Integer; next = C_NULL) = VertexInputAttributeDescription2EXT(next, location, binding, format, offset)

PhysicalDeviceColorWriteEnableFeaturesEXT(color_write_enable::Bool; next = C_NULL) = PhysicalDeviceColorWriteEnableFeaturesEXT(next, color_write_enable)

PipelineColorWriteCreateInfoEXT(color_write_enables::AbstractArray; next = C_NULL) = PipelineColorWriteCreateInfoEXT(next, color_write_enables)

MemoryBarrier2KHR(; next = C_NULL, src_stage_mask = 0, src_access_mask = 0, dst_stage_mask = 0, dst_access_mask = 0) = MemoryBarrier2KHR(next, src_stage_mask, src_access_mask, dst_stage_mask, dst_access_mask)

ImageMemoryBarrier2KHR(old_layout::ImageLayout, new_layout::ImageLayout, src_queue_family_index::Integer, dst_queue_family_index::Integer, image::Image, subresource_range::ImageSubresourceRange; next = C_NULL, src_stage_mask = 0, src_access_mask = 0, dst_stage_mask = 0, dst_access_mask = 0) = ImageMemoryBarrier2KHR(next, src_stage_mask, src_access_mask, dst_stage_mask, dst_access_mask, old_layout, new_layout, src_queue_family_index, dst_queue_family_index, image, subresource_range)

BufferMemoryBarrier2KHR(src_queue_family_index::Integer, dst_queue_family_index::Integer, buffer::Buffer, offset::Integer, size::Integer; next = C_NULL, src_stage_mask = 0, src_access_mask = 0, dst_stage_mask = 0, dst_access_mask = 0) = BufferMemoryBarrier2KHR(next, src_stage_mask, src_access_mask, dst_stage_mask, dst_access_mask, src_queue_family_index, dst_queue_family_index, buffer, offset, size)

DependencyInfoKHR(memory_barriers::AbstractArray, buffer_memory_barriers::AbstractArray, image_memory_barriers::AbstractArray; next = C_NULL, dependency_flags = 0) = DependencyInfoKHR(next, dependency_flags, memory_barriers, buffer_memory_barriers, image_memory_barriers)

SemaphoreSubmitInfoKHR(semaphore::Semaphore, value::Integer, device_index::Integer; next = C_NULL, stage_mask = 0) = SemaphoreSubmitInfoKHR(next, semaphore, value, stage_mask, device_index)

CommandBufferSubmitInfoKHR(command_buffer::CommandBuffer, device_mask::Integer; next = C_NULL) = CommandBufferSubmitInfoKHR(next, command_buffer, device_mask)

SubmitInfo2KHR(wait_semaphore_infos::AbstractArray, command_buffer_infos::AbstractArray, signal_semaphore_infos::AbstractArray; next = C_NULL, flags = 0) = SubmitInfo2KHR(next, flags, wait_semaphore_infos, command_buffer_infos, signal_semaphore_infos)

PhysicalDeviceSynchronization2FeaturesKHR(synchronization2::Bool; next = C_NULL) = PhysicalDeviceSynchronization2FeaturesKHR(next, synchronization2)

VideoQueueFamilyProperties2KHR(video_codec_operations::VideoCodecOperationFlagKHR; next = C_NULL) = VideoQueueFamilyProperties2KHR(next, video_codec_operations)

VideoProfilesKHR(profile_count::Integer, profiles::VideoProfileKHR; next = C_NULL) = VideoProfilesKHR(next, profile_count, profiles)

VideoProfileKHR(video_codec_operation::VideoCodecOperationFlagKHR, chroma_subsampling::VideoChromaSubsamplingFlagKHR, luma_bit_depth::VideoComponentBitDepthFlagKHR, chroma_bit_depth::VideoComponentBitDepthFlagKHR; next = C_NULL) = VideoProfileKHR(next, video_codec_operation, chroma_subsampling, luma_bit_depth, chroma_bit_depth)

VideoGetMemoryPropertiesKHR(memory_bind_index::Integer, memory_requirements::MemoryRequirements2; next = C_NULL) = VideoGetMemoryPropertiesKHR(next, memory_bind_index, memory_requirements)

VideoBindMemoryKHR(memory_bind_index::Integer, memory::DeviceMemory, memory_offset::Integer, memory_size::Integer; next = C_NULL) = VideoBindMemoryKHR(next, memory_bind_index, memory, memory_offset, memory_size)

VideoPictureResourceKHR(coded_offset::Offset2D, coded_extent::Extent2D, base_array_layer::Integer, image_view_binding::ImageView; next = C_NULL) = VideoPictureResourceKHR(next, coded_offset, coded_extent, base_array_layer, image_view_binding)

VideoReferenceSlotKHR(slot_index::Integer, picture_resource::VideoPictureResourceKHR; next = C_NULL) = VideoReferenceSlotKHR(next, slot_index, picture_resource)

VideoDecodeInfoKHR(coded_offset::Offset2D, coded_extent::Extent2D, src_buffer::Buffer, src_buffer_offset::Integer, src_buffer_range::Integer, dst_picture_resource::VideoPictureResourceKHR, setup_reference_slot::VideoReferenceSlotKHR, reference_slots::AbstractArray; next = C_NULL, flags = 0) = VideoDecodeInfoKHR(next, flags, coded_offset, coded_extent, src_buffer, src_buffer_offset, src_buffer_range, dst_picture_resource, setup_reference_slot, reference_slots)

VideoDecodeH264ProfileEXT(std_profile_idc::StdVideoH264ProfileIdc, field_layout::VideoDecodeH264FieldLayoutFlagEXT; next = C_NULL) = VideoDecodeH264ProfileEXT(next, std_profile_idc, field_layout)

VideoDecodeH264SessionCreateInfoEXT(flags::Integer, std_extension_version::ExtensionProperties; next = C_NULL) = VideoDecodeH264SessionCreateInfoEXT(next, flags, std_extension_version)

VideoDecodeH264SessionParametersAddInfoEXT(; next = C_NULL, sps_std = C_NULL, pps_std = C_NULL) = VideoDecodeH264SessionParametersAddInfoEXT(next, sps_std, pps_std)

VideoDecodeH264SessionParametersCreateInfoEXT(max_sps_std_count::Integer, max_pps_std_count::Integer; next = C_NULL, parameters_add_info = C_NULL) = VideoDecodeH264SessionParametersCreateInfoEXT(next, max_sps_std_count, max_pps_std_count, parameters_add_info)

VideoDecodeH264PictureInfoEXT(std_picture_info::StdVideoDecodeH264PictureInfo, slices_data_offsets::AbstractArray; next = C_NULL) = VideoDecodeH264PictureInfoEXT(next, std_picture_info, slices_data_offsets)

VideoDecodeH264DpbSlotInfoEXT(std_reference_info::StdVideoDecodeH264ReferenceInfo; next = C_NULL) = VideoDecodeH264DpbSlotInfoEXT(next, std_reference_info)

VideoDecodeH264MvcEXT(std_mvc::StdVideoDecodeH264Mvc; next = C_NULL) = VideoDecodeH264MvcEXT(next, std_mvc)

VideoDecodeH265ProfileEXT(std_profile_idc::StdVideoH265ProfileIdc; next = C_NULL) = VideoDecodeH265ProfileEXT(next, std_profile_idc)

VideoDecodeH265SessionCreateInfoEXT(flags::Integer, std_extension_version::ExtensionProperties; next = C_NULL) = VideoDecodeH265SessionCreateInfoEXT(next, flags, std_extension_version)

VideoDecodeH265SessionParametersAddInfoEXT(; next = C_NULL, sps_std = C_NULL, pps_std = C_NULL) = VideoDecodeH265SessionParametersAddInfoEXT(next, sps_std, pps_std)

VideoDecodeH265SessionParametersCreateInfoEXT(max_sps_std_count::Integer, max_pps_std_count::Integer; next = C_NULL, parameters_add_info = C_NULL) = VideoDecodeH265SessionParametersCreateInfoEXT(next, max_sps_std_count, max_pps_std_count, parameters_add_info)

VideoDecodeH265PictureInfoEXT(std_picture_info::StdVideoDecodeH265PictureInfo, slices_data_offsets::AbstractArray; next = C_NULL) = VideoDecodeH265PictureInfoEXT(next, std_picture_info, slices_data_offsets)

VideoDecodeH265DpbSlotInfoEXT(std_reference_info::StdVideoDecodeH265ReferenceInfo; next = C_NULL) = VideoDecodeH265DpbSlotInfoEXT(next, std_reference_info)

VideoSessionCreateInfoKHR(queue_family_index::Integer, video_profile::VideoProfileKHR, picture_format::Format, max_coded_extent::Extent2D, reference_pictures_format::Format, max_reference_pictures_slots_count::Integer, max_reference_pictures_active_count::Integer; next = C_NULL, flags = 0) = VideoSessionCreateInfoKHR(next, queue_family_index, flags, video_profile, picture_format, max_coded_extent, reference_pictures_format, max_reference_pictures_slots_count, max_reference_pictures_active_count)

VideoSessionParametersCreateInfoKHR(video_session_parameters_template::VideoSessionParametersKHR, video_session::VideoSessionKHR; next = C_NULL) = VideoSessionParametersCreateInfoKHR(next, video_session_parameters_template, video_session)

VideoSessionParametersUpdateInfoKHR(update_sequence_count::Integer; next = C_NULL) = VideoSessionParametersUpdateInfoKHR(next, update_sequence_count)

VideoBeginCodingInfoKHR(codec_quality_preset::VideoCodingQualityPresetFlagKHR, video_session::VideoSessionKHR, reference_slots::AbstractArray; next = C_NULL, flags = 0, video_session_parameters = C_NULL) = VideoBeginCodingInfoKHR(next, flags, codec_quality_preset, video_session, video_session_parameters, reference_slots)

VideoEndCodingInfoKHR(; next = C_NULL, flags = 0) = VideoEndCodingInfoKHR(next, flags)

VideoCodingControlInfoKHR(; next = C_NULL, flags = 0) = VideoCodingControlInfoKHR(next, flags)

VideoEncodeInfoKHR(quality_level::Integer, coded_extent::Extent2D, dst_bitstream_buffer::Buffer, dst_bitstream_buffer_offset::Integer, dst_bitstream_buffer_max_range::Integer, src_picture_resource::VideoPictureResourceKHR, setup_reference_slot::VideoReferenceSlotKHR, reference_slots::AbstractArray; next = C_NULL, flags = 0) = VideoEncodeInfoKHR(next, flags, quality_level, coded_extent, dst_bitstream_buffer, dst_bitstream_buffer_offset, dst_bitstream_buffer_max_range, src_picture_resource, setup_reference_slot, reference_slots)

VideoEncodeRateControlInfoKHR(flags::VideoEncodeRateControlFlagKHR, rate_control_mode::VideoEncodeRateControlModeFlagKHR, average_bitrate::Integer, peak_to_average_bitrate_ratio::Integer, frame_rate_numerator::Integer, frame_rate_denominator::Integer, virtual_buffer_size_in_ms::Integer; next = C_NULL) = VideoEncodeRateControlInfoKHR(next, flags, rate_control_mode, average_bitrate, peak_to_average_bitrate_ratio, frame_rate_numerator, frame_rate_denominator, virtual_buffer_size_in_ms)

VideoEncodeH264CapabilitiesEXT(flags::VideoEncodeH264CapabilitiesFlagEXT, input_mode_flags::VideoEncodeH264InputModeFlagEXT, output_mode_flags::VideoEncodeH264OutputModeFlagEXT, min_picture_size_in_mbs::Extent2D, max_picture_size_in_mbs::Extent2D, input_image_data_alignment::Extent2D, max_num_l_0_reference_for_p::Integer, max_num_l_0_reference_for_b::Integer, max_num_l_1_reference::Integer, quality_level_count::Integer, std_extension_version::ExtensionProperties; next = C_NULL) = VideoEncodeH264CapabilitiesEXT(next, flags, input_mode_flags, output_mode_flags, min_picture_size_in_mbs, max_picture_size_in_mbs, input_image_data_alignment, max_num_l_0_reference_for_p, max_num_l_0_reference_for_b, max_num_l_1_reference, quality_level_count, std_extension_version)

VideoEncodeH264SessionCreateInfoEXT(flags::VideoEncodeH264CreateFlagEXT, max_picture_size_in_mbs::Extent2D, std_extension_version::ExtensionProperties; next = C_NULL) = VideoEncodeH264SessionCreateInfoEXT(next, flags, max_picture_size_in_mbs, std_extension_version)

VideoEncodeH264SessionParametersAddInfoEXT(; next = C_NULL, sps_std = C_NULL, pps_std = C_NULL) = VideoEncodeH264SessionParametersAddInfoEXT(next, sps_std, pps_std)

VideoEncodeH264SessionParametersCreateInfoEXT(max_sps_std_count::Integer, max_pps_std_count::Integer; next = C_NULL, parameters_add_info = C_NULL) = VideoEncodeH264SessionParametersCreateInfoEXT(next, max_sps_std_count, max_pps_std_count, parameters_add_info)

VideoEncodeH264DpbSlotInfoEXT(slot_index::Integer, std_picture_info::StdVideoEncodeH264PictureInfo; next = C_NULL) = VideoEncodeH264DpbSlotInfoEXT(next, slot_index, std_picture_info)

VideoEncodeH264VclFrameInfoEXT(ref_default_final_list_0_entries::AbstractArray, ref_default_final_list_1_entries::AbstractArray, nalu_slice_entries::AbstractArray, current_picture_info::VideoEncodeH264DpbSlotInfoEXT; next = C_NULL) = VideoEncodeH264VclFrameInfoEXT(next, ref_default_final_list_0_entries, ref_default_final_list_1_entries, nalu_slice_entries, current_picture_info)

VideoEncodeH264EmitPictureParametersEXT(sps_id::Integer, emit_sps_enable::Bool, pps_id_entries::AbstractArray; next = C_NULL) = VideoEncodeH264EmitPictureParametersEXT(next, sps_id, emit_sps_enable, pps_id_entries)

VideoEncodeH264ProfileEXT(std_profile_idc::StdVideoH264ProfileIdc; next = C_NULL) = VideoEncodeH264ProfileEXT(next, std_profile_idc)

VideoEncodeH264NaluSliceEXT(slice_header_std::StdVideoEncodeH264SliceHeader, mb_count::Integer, ref_final_list_0_entries::AbstractArray, ref_final_list_1_entries::AbstractArray, preceding_nalu_bytes::Integer, min_qp::Integer, max_qp::Integer; next = C_NULL) = VideoEncodeH264NaluSliceEXT(next, slice_header_std, mb_count, ref_final_list_0_entries, ref_final_list_1_entries, preceding_nalu_bytes, min_qp, max_qp)

PhysicalDeviceInheritedViewportScissorFeaturesNV(inherited_viewport_scissor_2_d::Bool; next = C_NULL) = PhysicalDeviceInheritedViewportScissorFeaturesNV(next, inherited_viewport_scissor_2_d)

CommandBufferInheritanceViewportScissorInfoNV(viewport_scissor_2_d::Bool, viewport_depth_count::Integer, viewport_depths::Viewport; next = C_NULL) = CommandBufferInheritanceViewportScissorInfoNV(next, viewport_scissor_2_d, viewport_depth_count, viewport_depths)

PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT(ycbcr_444_formats::Bool; next = C_NULL) = PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT(next, ycbcr_444_formats)

PhysicalDeviceProvokingVertexFeaturesEXT(provoking_vertex_last::Bool, transform_feedback_preserves_provoking_vertex::Bool; next = C_NULL) = PhysicalDeviceProvokingVertexFeaturesEXT(next, provoking_vertex_last, transform_feedback_preserves_provoking_vertex)

PipelineRasterizationProvokingVertexStateCreateInfoEXT(provoking_vertex_mode::ProvokingVertexModeEXT; next = C_NULL) = PipelineRasterizationProvokingVertexStateCreateInfoEXT(next, provoking_vertex_mode)


_BaseOutStructure(x::BaseOutStructure) = _BaseOutStructure(; x.next)

_BaseInStructure(x::BaseInStructure) = _BaseInStructure(; x.next)

_Offset2D(x::Offset2D) = _Offset2D(x.x, x.y)

_Offset3D(x::Offset3D) = _Offset3D(x.x, x.y, x.z)

_Extent2D(x::Extent2D) = _Extent2D(x.width, x.height)

_Extent3D(x::Extent3D) = _Extent3D(x.width, x.height, x.depth)

_Viewport(x::Viewport) = _Viewport(x.x, x.y, x.width, x.height, x.min_depth, x.max_depth)

_Rect2D(x::Rect2D) = _Rect2D(convert_nonnull(_Offset2D, x.offset), convert_nonnull(_Extent2D, x.extent))

_ClearRect(x::ClearRect) = _ClearRect(convert_nonnull(_Rect2D, x.rect), x.base_array_layer, x.layer_count)

_ComponentMapping(x::ComponentMapping) = _ComponentMapping(x.r, x.g, x.b, x.a)

_ApplicationInfo(x::ApplicationInfo) = _ApplicationInfo(x.application_version, x.engine_version, x.api_version; x.next, x.application_name, x.engine_name)

_AllocationCallbacks(x::AllocationCallbacks) = _AllocationCallbacks(x.pfn_allocation, x.pfn_reallocation, x.pfn_free; x.user_data, x.pfn_internal_allocation, x.pfn_internal_free)

_DeviceQueueCreateInfo(x::DeviceQueueCreateInfo) = _DeviceQueueCreateInfo(x.queue_family_index, x.queue_priorities; x.next, x.flags)

_DeviceCreateInfo(x::DeviceCreateInfo) = _DeviceCreateInfo(convert_nonnull(Vector{_DeviceQueueCreateInfo}, x.queue_create_infos), x.enabled_layer_names, x.enabled_extension_names; x.next, x.flags, enabled_features = convert_nonnull(_PhysicalDeviceFeatures, x.enabled_features))

_InstanceCreateInfo(x::InstanceCreateInfo) = _InstanceCreateInfo(x.enabled_layer_names, x.enabled_extension_names; x.next, x.flags, application_info = convert_nonnull(_ApplicationInfo, x.application_info))

_MemoryAllocateInfo(x::MemoryAllocateInfo) = _MemoryAllocateInfo(x.allocation_size, x.memory_type_index; x.next)

_MappedMemoryRange(x::MappedMemoryRange) = _MappedMemoryRange(x.memory, x.offset, x.size; x.next)

_DescriptorBufferInfo(x::DescriptorBufferInfo) = _DescriptorBufferInfo(x.offset, x.range; x.buffer)

_DescriptorImageInfo(x::DescriptorImageInfo) = _DescriptorImageInfo(x.sampler, x.image_view, x.image_layout)

_WriteDescriptorSet(x::WriteDescriptorSet) = _WriteDescriptorSet(x.dst_set, x.dst_binding, x.dst_array_element, x.descriptor_type, convert_nonnull(Vector{_DescriptorImageInfo}, x.image_info), convert_nonnull(Vector{_DescriptorBufferInfo}, x.buffer_info), x.texel_buffer_view; x.next, x.descriptor_count)

_CopyDescriptorSet(x::CopyDescriptorSet) = _CopyDescriptorSet(x.src_set, x.src_binding, x.src_array_element, x.dst_set, x.dst_binding, x.dst_array_element, x.descriptor_count; x.next)

_BufferCreateInfo(x::BufferCreateInfo) = _BufferCreateInfo(x.size, x.usage, x.sharing_mode, x.queue_family_indices; x.next, x.flags)

_BufferViewCreateInfo(x::BufferViewCreateInfo) = _BufferViewCreateInfo(x.buffer, x.format, x.offset, x.range; x.next, x.flags)

_ImageSubresource(x::ImageSubresource) = _ImageSubresource(x.aspect_mask, x.mip_level, x.array_layer)

_ImageSubresourceLayers(x::ImageSubresourceLayers) = _ImageSubresourceLayers(x.aspect_mask, x.mip_level, x.base_array_layer, x.layer_count)

_ImageSubresourceRange(x::ImageSubresourceRange) = _ImageSubresourceRange(x.aspect_mask, x.base_mip_level, x.level_count, x.base_array_layer, x.layer_count)

_MemoryBarrier(x::MemoryBarrier) = _MemoryBarrier(; x.next, x.src_access_mask, x.dst_access_mask)

_BufferMemoryBarrier(x::BufferMemoryBarrier) = _BufferMemoryBarrier(x.src_access_mask, x.dst_access_mask, x.src_queue_family_index, x.dst_queue_family_index, x.buffer, x.offset, x.size; x.next)

_ImageMemoryBarrier(x::ImageMemoryBarrier) = _ImageMemoryBarrier(x.src_access_mask, x.dst_access_mask, x.old_layout, x.new_layout, x.src_queue_family_index, x.dst_queue_family_index, x.image, convert_nonnull(_ImageSubresourceRange, x.subresource_range); x.next)

_ImageCreateInfo(x::ImageCreateInfo) = _ImageCreateInfo(x.image_type, x.format, convert_nonnull(_Extent3D, x.extent), x.mip_levels, x.array_layers, x.samples, x.tiling, x.usage, x.sharing_mode, x.queue_family_indices, x.initial_layout; x.next, x.flags)

_ImageViewCreateInfo(x::ImageViewCreateInfo) = _ImageViewCreateInfo(x.image, x.view_type, x.format, convert_nonnull(_ComponentMapping, x.components), convert_nonnull(_ImageSubresourceRange, x.subresource_range); x.next, x.flags)

_BufferCopy(x::BufferCopy) = _BufferCopy(x.src_offset, x.dst_offset, x.size)

_SparseMemoryBind(x::SparseMemoryBind) = _SparseMemoryBind(x.resource_offset, x.size, x.memory_offset; x.memory, x.flags)

_SparseImageMemoryBind(x::SparseImageMemoryBind) = _SparseImageMemoryBind(convert_nonnull(_ImageSubresource, x.subresource), convert_nonnull(_Offset3D, x.offset), convert_nonnull(_Extent3D, x.extent), x.memory_offset; x.memory, x.flags)

_SparseBufferMemoryBindInfo(x::SparseBufferMemoryBindInfo) = _SparseBufferMemoryBindInfo(x.buffer, convert_nonnull(Vector{_SparseMemoryBind}, x.binds))

_SparseImageOpaqueMemoryBindInfo(x::SparseImageOpaqueMemoryBindInfo) = _SparseImageOpaqueMemoryBindInfo(x.image, convert_nonnull(Vector{_SparseMemoryBind}, x.binds))

_SparseImageMemoryBindInfo(x::SparseImageMemoryBindInfo) = _SparseImageMemoryBindInfo(x.image, convert_nonnull(Vector{_SparseImageMemoryBind}, x.binds))

_BindSparseInfo(x::BindSparseInfo) = _BindSparseInfo(x.wait_semaphores, convert_nonnull(Vector{_SparseBufferMemoryBindInfo}, x.buffer_binds), convert_nonnull(Vector{_SparseImageOpaqueMemoryBindInfo}, x.image_opaque_binds), convert_nonnull(Vector{_SparseImageMemoryBindInfo}, x.image_binds), x.signal_semaphores; x.next)

_ImageCopy(x::ImageCopy) = _ImageCopy(convert_nonnull(_ImageSubresourceLayers, x.src_subresource), convert_nonnull(_Offset3D, x.src_offset), convert_nonnull(_ImageSubresourceLayers, x.dst_subresource), convert_nonnull(_Offset3D, x.dst_offset), convert_nonnull(_Extent3D, x.extent))

_ImageBlit(x::ImageBlit) = _ImageBlit(convert_nonnull(_ImageSubresourceLayers, x.src_subresource), convert_nonnull(NTuple{2, _Offset3D}, x.src_offsets), convert_nonnull(_ImageSubresourceLayers, x.dst_subresource), convert_nonnull(NTuple{2, _Offset3D}, x.dst_offsets))

_BufferImageCopy(x::BufferImageCopy) = _BufferImageCopy(x.buffer_offset, x.buffer_row_length, x.buffer_image_height, convert_nonnull(_ImageSubresourceLayers, x.image_subresource), convert_nonnull(_Offset3D, x.image_offset), convert_nonnull(_Extent3D, x.image_extent))

_ImageResolve(x::ImageResolve) = _ImageResolve(convert_nonnull(_ImageSubresourceLayers, x.src_subresource), convert_nonnull(_Offset3D, x.src_offset), convert_nonnull(_ImageSubresourceLayers, x.dst_subresource), convert_nonnull(_Offset3D, x.dst_offset), convert_nonnull(_Extent3D, x.extent))

_ShaderModuleCreateInfo(x::ShaderModuleCreateInfo) = _ShaderModuleCreateInfo(x.code_size, x.code; x.next, x.flags)

_DescriptorSetLayoutBinding(x::DescriptorSetLayoutBinding) = _DescriptorSetLayoutBinding(x.binding, x.descriptor_type, x.stage_flags; x.descriptor_count, x.immutable_samplers)

_DescriptorSetLayoutCreateInfo(x::DescriptorSetLayoutCreateInfo) = _DescriptorSetLayoutCreateInfo(convert_nonnull(Vector{_DescriptorSetLayoutBinding}, x.bindings); x.next, x.flags)

_DescriptorPoolSize(x::DescriptorPoolSize) = _DescriptorPoolSize(x.type, x.descriptor_count)

_DescriptorPoolCreateInfo(x::DescriptorPoolCreateInfo) = _DescriptorPoolCreateInfo(x.max_sets, convert_nonnull(Vector{_DescriptorPoolSize}, x.pool_sizes); x.next, x.flags)

_DescriptorSetAllocateInfo(x::DescriptorSetAllocateInfo) = _DescriptorSetAllocateInfo(x.descriptor_pool, x.set_layouts; x.next)

_SpecializationMapEntry(x::SpecializationMapEntry) = _SpecializationMapEntry(x.constant_id, x.offset, x.size)

_SpecializationInfo(x::SpecializationInfo) = _SpecializationInfo(convert_nonnull(Vector{_SpecializationMapEntry}, x.map_entries), x.data; x.data_size)

_PipelineShaderStageCreateInfo(x::PipelineShaderStageCreateInfo) = _PipelineShaderStageCreateInfo(x.stage, x._module, x.name; x.next, x.flags, specialization_info = convert_nonnull(_SpecializationInfo, x.specialization_info))

_ComputePipelineCreateInfo(x::ComputePipelineCreateInfo) = _ComputePipelineCreateInfo(convert_nonnull(_PipelineShaderStageCreateInfo, x.stage), x.layout, x.base_pipeline_index; x.next, x.flags, x.base_pipeline_handle)

_VertexInputBindingDescription(x::VertexInputBindingDescription) = _VertexInputBindingDescription(x.binding, x.stride, x.input_rate)

_VertexInputAttributeDescription(x::VertexInputAttributeDescription) = _VertexInputAttributeDescription(x.location, x.binding, x.format, x.offset)

_PipelineVertexInputStateCreateInfo(x::PipelineVertexInputStateCreateInfo) = _PipelineVertexInputStateCreateInfo(convert_nonnull(Vector{_VertexInputBindingDescription}, x.vertex_binding_descriptions), convert_nonnull(Vector{_VertexInputAttributeDescription}, x.vertex_attribute_descriptions); x.next, x.flags)

_PipelineInputAssemblyStateCreateInfo(x::PipelineInputAssemblyStateCreateInfo) = _PipelineInputAssemblyStateCreateInfo(x.topology, x.primitive_restart_enable; x.next, x.flags)

_PipelineTessellationStateCreateInfo(x::PipelineTessellationStateCreateInfo) = _PipelineTessellationStateCreateInfo(x.patch_control_points; x.next, x.flags)

_PipelineViewportStateCreateInfo(x::PipelineViewportStateCreateInfo) = _PipelineViewportStateCreateInfo(; x.next, x.flags, viewports = convert_nonnull(Vector{_Viewport}, x.viewports), scissors = convert_nonnull(Vector{_Rect2D}, x.scissors))

_PipelineRasterizationStateCreateInfo(x::PipelineRasterizationStateCreateInfo) = _PipelineRasterizationStateCreateInfo(x.depth_clamp_enable, x.rasterizer_discard_enable, x.polygon_mode, x.front_face, x.depth_bias_enable, x.depth_bias_constant_factor, x.depth_bias_clamp, x.depth_bias_slope_factor, x.line_width; x.next, x.flags, x.cull_mode)

_PipelineMultisampleStateCreateInfo(x::PipelineMultisampleStateCreateInfo) = _PipelineMultisampleStateCreateInfo(x.rasterization_samples, x.sample_shading_enable, x.min_sample_shading, x.alpha_to_coverage_enable, x.alpha_to_one_enable; x.next, x.flags, x.sample_mask)

_PipelineColorBlendAttachmentState(x::PipelineColorBlendAttachmentState) = _PipelineColorBlendAttachmentState(x.blend_enable, x.src_color_blend_factor, x.dst_color_blend_factor, x.color_blend_op, x.src_alpha_blend_factor, x.dst_alpha_blend_factor, x.alpha_blend_op; x.color_write_mask)

_PipelineColorBlendStateCreateInfo(x::PipelineColorBlendStateCreateInfo) = _PipelineColorBlendStateCreateInfo(x.logic_op_enable, x.logic_op, convert_nonnull(Vector{_PipelineColorBlendAttachmentState}, x.attachments), x.blend_constants; x.next, x.flags)

_PipelineDynamicStateCreateInfo(x::PipelineDynamicStateCreateInfo) = _PipelineDynamicStateCreateInfo(x.dynamic_states; x.next, x.flags)

_StencilOpState(x::StencilOpState) = _StencilOpState(x.fail_op, x.pass_op, x.depth_fail_op, x.compare_op, x.compare_mask, x.write_mask, x.reference)

_PipelineDepthStencilStateCreateInfo(x::PipelineDepthStencilStateCreateInfo) = _PipelineDepthStencilStateCreateInfo(x.depth_test_enable, x.depth_write_enable, x.depth_compare_op, x.depth_bounds_test_enable, x.stencil_test_enable, convert_nonnull(_StencilOpState, x.front), convert_nonnull(_StencilOpState, x.back), x.min_depth_bounds, x.max_depth_bounds; x.next, x.flags)

_GraphicsPipelineCreateInfo(x::GraphicsPipelineCreateInfo) = _GraphicsPipelineCreateInfo(convert_nonnull(Vector{_PipelineShaderStageCreateInfo}, x.stages), convert_nonnull(_PipelineRasterizationStateCreateInfo, x.rasterization_state), x.layout, x.render_pass, x.subpass, x.base_pipeline_index; x.next, x.flags, vertex_input_state = convert_nonnull(_PipelineVertexInputStateCreateInfo, x.vertex_input_state), input_assembly_state = convert_nonnull(_PipelineInputAssemblyStateCreateInfo, x.input_assembly_state), tessellation_state = convert_nonnull(_PipelineTessellationStateCreateInfo, x.tessellation_state), viewport_state = convert_nonnull(_PipelineViewportStateCreateInfo, x.viewport_state), multisample_state = convert_nonnull(_PipelineMultisampleStateCreateInfo, x.multisample_state), depth_stencil_state = convert_nonnull(_PipelineDepthStencilStateCreateInfo, x.depth_stencil_state), color_blend_state = convert_nonnull(_PipelineColorBlendStateCreateInfo, x.color_blend_state), dynamic_state = convert_nonnull(_PipelineDynamicStateCreateInfo, x.dynamic_state), x.base_pipeline_handle)

_PipelineCacheCreateInfo(x::PipelineCacheCreateInfo) = _PipelineCacheCreateInfo(x.initial_data; x.next, x.flags, x.initial_data_size)

_PushConstantRange(x::PushConstantRange) = _PushConstantRange(x.stage_flags, x.offset, x.size)

_PipelineLayoutCreateInfo(x::PipelineLayoutCreateInfo) = _PipelineLayoutCreateInfo(x.set_layouts, convert_nonnull(Vector{_PushConstantRange}, x.push_constant_ranges); x.next, x.flags)

_SamplerCreateInfo(x::SamplerCreateInfo) = _SamplerCreateInfo(x.mag_filter, x.min_filter, x.mipmap_mode, x.address_mode_u, x.address_mode_v, x.address_mode_w, x.mip_lod_bias, x.anisotropy_enable, x.max_anisotropy, x.compare_enable, x.compare_op, x.min_lod, x.max_lod, x.border_color, x.unnormalized_coordinates; x.next, x.flags)

_CommandPoolCreateInfo(x::CommandPoolCreateInfo) = _CommandPoolCreateInfo(x.queue_family_index; x.next, x.flags)

_CommandBufferAllocateInfo(x::CommandBufferAllocateInfo) = _CommandBufferAllocateInfo(x.command_pool, x.level, x.command_buffer_count; x.next)

_CommandBufferInheritanceInfo(x::CommandBufferInheritanceInfo) = _CommandBufferInheritanceInfo(x.subpass, x.occlusion_query_enable; x.next, x.render_pass, x.framebuffer, x.query_flags, x.pipeline_statistics)

_CommandBufferBeginInfo(x::CommandBufferBeginInfo) = _CommandBufferBeginInfo(; x.next, x.flags, inheritance_info = convert_nonnull(_CommandBufferInheritanceInfo, x.inheritance_info))

_RenderPassBeginInfo(x::RenderPassBeginInfo) = _RenderPassBeginInfo(x.render_pass, x.framebuffer, convert_nonnull(_Rect2D, x.render_area), x.clear_values; x.next)

_ClearDepthStencilValue(x::ClearDepthStencilValue) = _ClearDepthStencilValue(x.depth, x.stencil)

_ClearAttachment(x::ClearAttachment) = _ClearAttachment(x.aspect_mask, x.color_attachment, x.clear_value)

_AttachmentDescription(x::AttachmentDescription) = _AttachmentDescription(x.format, x.samples, x.load_op, x.store_op, x.stencil_load_op, x.stencil_store_op, x.initial_layout, x.final_layout; x.flags)

_AttachmentReference(x::AttachmentReference) = _AttachmentReference(x.attachment, x.layout)

_SubpassDescription(x::SubpassDescription) = _SubpassDescription(x.pipeline_bind_point, convert_nonnull(Vector{_AttachmentReference}, x.input_attachments), convert_nonnull(Vector{_AttachmentReference}, x.color_attachments), x.preserve_attachments; x.flags, resolve_attachments = convert_nonnull(Vector{_AttachmentReference}, x.resolve_attachments), depth_stencil_attachment = convert_nonnull(_AttachmentReference, x.depth_stencil_attachment))

_SubpassDependency(x::SubpassDependency) = _SubpassDependency(x.src_subpass, x.dst_subpass; x.src_stage_mask, x.dst_stage_mask, x.src_access_mask, x.dst_access_mask, x.dependency_flags)

_RenderPassCreateInfo(x::RenderPassCreateInfo) = _RenderPassCreateInfo(convert_nonnull(Vector{_AttachmentDescription}, x.attachments), convert_nonnull(Vector{_SubpassDescription}, x.subpasses), convert_nonnull(Vector{_SubpassDependency}, x.dependencies); x.next, x.flags)

_EventCreateInfo(x::EventCreateInfo) = _EventCreateInfo(; x.next, x.flags)

_FenceCreateInfo(x::FenceCreateInfo) = _FenceCreateInfo(; x.next, x.flags)

_PhysicalDeviceFeatures(x::PhysicalDeviceFeatures) = _PhysicalDeviceFeatures(x.robust_buffer_access, x.full_draw_index_uint_32, x.image_cube_array, x.independent_blend, x.geometry_shader, x.tessellation_shader, x.sample_rate_shading, x.dual_src_blend, x.logic_op, x.multi_draw_indirect, x.draw_indirect_first_instance, x.depth_clamp, x.depth_bias_clamp, x.fill_mode_non_solid, x.depth_bounds, x.wide_lines, x.large_points, x.alpha_to_one, x.multi_viewport, x.sampler_anisotropy, x.texture_compression_etc_2, x.texture_compression_astc_ldr, x.texture_compression_bc, x.occlusion_query_precise, x.pipeline_statistics_query, x.vertex_pipeline_stores_and_atomics, x.fragment_stores_and_atomics, x.shader_tessellation_and_geometry_point_size, x.shader_image_gather_extended, x.shader_storage_image_extended_formats, x.shader_storage_image_multisample, x.shader_storage_image_read_without_format, x.shader_storage_image_write_without_format, x.shader_uniform_buffer_array_dynamic_indexing, x.shader_sampled_image_array_dynamic_indexing, x.shader_storage_buffer_array_dynamic_indexing, x.shader_storage_image_array_dynamic_indexing, x.shader_clip_distance, x.shader_cull_distance, x.shader_float_64, x.shader_int_64, x.shader_int_16, x.shader_resource_residency, x.shader_resource_min_lod, x.sparse_binding, x.sparse_residency_buffer, x.sparse_residency_image_2_d, x.sparse_residency_image_3_d, x.sparse_residency_2_samples, x.sparse_residency_4_samples, x.sparse_residency_8_samples, x.sparse_residency_16_samples, x.sparse_residency_aliased, x.variable_multisample_rate, x.inherited_queries)

_SemaphoreCreateInfo(x::SemaphoreCreateInfo) = _SemaphoreCreateInfo(; x.next, x.flags)

_QueryPoolCreateInfo(x::QueryPoolCreateInfo) = _QueryPoolCreateInfo(x.query_type, x.query_count; x.next, x.flags, x.pipeline_statistics)

_FramebufferCreateInfo(x::FramebufferCreateInfo) = _FramebufferCreateInfo(x.render_pass, x.attachments, x.width, x.height, x.layers; x.next, x.flags)

_DrawIndirectCommand(x::DrawIndirectCommand) = _DrawIndirectCommand(x.vertex_count, x.instance_count, x.first_vertex, x.first_instance)

_DrawIndexedIndirectCommand(x::DrawIndexedIndirectCommand) = _DrawIndexedIndirectCommand(x.index_count, x.instance_count, x.first_index, x.vertex_offset, x.first_instance)

_DispatchIndirectCommand(x::DispatchIndirectCommand) = _DispatchIndirectCommand(x.x, x.y, x.z)

_SubmitInfo(x::SubmitInfo) = _SubmitInfo(x.wait_semaphores, x.wait_dst_stage_mask, x.command_buffers, x.signal_semaphores; x.next)

_DisplayModeParametersKHR(x::DisplayModeParametersKHR) = _DisplayModeParametersKHR(convert_nonnull(_Extent2D, x.visible_region), x.refresh_rate)

_DisplayModeCreateInfoKHR(x::DisplayModeCreateInfoKHR) = _DisplayModeCreateInfoKHR(convert_nonnull(_DisplayModeParametersKHR, x.parameters); x.next, x.flags)

_DisplaySurfaceCreateInfoKHR(x::DisplaySurfaceCreateInfoKHR) = _DisplaySurfaceCreateInfoKHR(x.display_mode, x.plane_index, x.plane_stack_index, x.transform, x.global_alpha, x.alpha_mode, convert_nonnull(_Extent2D, x.image_extent); x.next, x.flags)

_DisplayPresentInfoKHR(x::DisplayPresentInfoKHR) = _DisplayPresentInfoKHR(convert_nonnull(_Rect2D, x.src_rect), convert_nonnull(_Rect2D, x.dst_rect), x.persistent; x.next)

_AndroidSurfaceCreateInfoKHR(x::AndroidSurfaceCreateInfoKHR) = _AndroidSurfaceCreateInfoKHR(x.window; x.next, x.flags)

_ViSurfaceCreateInfoNN(x::ViSurfaceCreateInfoNN) = _ViSurfaceCreateInfoNN(x.window; x.next, x.flags)

_WaylandSurfaceCreateInfoKHR(x::WaylandSurfaceCreateInfoKHR) = _WaylandSurfaceCreateInfoKHR(x.display, x.surface; x.next, x.flags)

_Win32SurfaceCreateInfoKHR(x::Win32SurfaceCreateInfoKHR) = _Win32SurfaceCreateInfoKHR(x.hinstance, x.hwnd; x.next, x.flags)

_XlibSurfaceCreateInfoKHR(x::XlibSurfaceCreateInfoKHR) = _XlibSurfaceCreateInfoKHR(x.dpy, x.window; x.next, x.flags)

_XcbSurfaceCreateInfoKHR(x::XcbSurfaceCreateInfoKHR) = _XcbSurfaceCreateInfoKHR(x.connection, x.window; x.next, x.flags)

_DirectFBSurfaceCreateInfoEXT(x::DirectFBSurfaceCreateInfoEXT) = _DirectFBSurfaceCreateInfoEXT(x.dfb, x.surface; x.next, x.flags)

_ImagePipeSurfaceCreateInfoFUCHSIA(x::ImagePipeSurfaceCreateInfoFUCHSIA) = _ImagePipeSurfaceCreateInfoFUCHSIA(x.image_pipe_handle; x.next, x.flags)

_StreamDescriptorSurfaceCreateInfoGGP(x::StreamDescriptorSurfaceCreateInfoGGP) = _StreamDescriptorSurfaceCreateInfoGGP(x.stream_descriptor; x.next, x.flags)

_ScreenSurfaceCreateInfoQNX(x::ScreenSurfaceCreateInfoQNX) = _ScreenSurfaceCreateInfoQNX(x.context, x.window; x.next, x.flags)

_SwapchainCreateInfoKHR(x::SwapchainCreateInfoKHR) = _SwapchainCreateInfoKHR(x.surface, x.min_image_count, x.image_format, x.image_color_space, convert_nonnull(_Extent2D, x.image_extent), x.image_array_layers, x.image_usage, x.image_sharing_mode, x.queue_family_indices, x.pre_transform, x.composite_alpha, x.present_mode, x.clipped; x.next, x.flags, x.old_swapchain)

_PresentInfoKHR(x::PresentInfoKHR) = _PresentInfoKHR(x.wait_semaphores, x.swapchains, x.image_indices; x.next, x.results)

_DebugReportCallbackCreateInfoEXT(x::DebugReportCallbackCreateInfoEXT) = _DebugReportCallbackCreateInfoEXT(x.pfn_callback; x.next, x.flags, x.user_data)

_ValidationFlagsEXT(x::ValidationFlagsEXT) = _ValidationFlagsEXT(x.disabled_validation_checks; x.next)

_ValidationFeaturesEXT(x::ValidationFeaturesEXT) = _ValidationFeaturesEXT(x.enabled_validation_features, x.disabled_validation_features; x.next)

_PipelineRasterizationStateRasterizationOrderAMD(x::PipelineRasterizationStateRasterizationOrderAMD) = _PipelineRasterizationStateRasterizationOrderAMD(x.rasterization_order; x.next)

_DebugMarkerObjectNameInfoEXT(x::DebugMarkerObjectNameInfoEXT) = _DebugMarkerObjectNameInfoEXT(x.object_type, x.object, x.object_name; x.next)

_DebugMarkerObjectTagInfoEXT(x::DebugMarkerObjectTagInfoEXT) = _DebugMarkerObjectTagInfoEXT(x.object_type, x.object, x.tag_name, x.tag_size, x.tag; x.next)

_DebugMarkerMarkerInfoEXT(x::DebugMarkerMarkerInfoEXT) = _DebugMarkerMarkerInfoEXT(x.marker_name, x.color; x.next)

_DedicatedAllocationImageCreateInfoNV(x::DedicatedAllocationImageCreateInfoNV) = _DedicatedAllocationImageCreateInfoNV(x.dedicated_allocation; x.next)

_DedicatedAllocationBufferCreateInfoNV(x::DedicatedAllocationBufferCreateInfoNV) = _DedicatedAllocationBufferCreateInfoNV(x.dedicated_allocation; x.next)

_DedicatedAllocationMemoryAllocateInfoNV(x::DedicatedAllocationMemoryAllocateInfoNV) = _DedicatedAllocationMemoryAllocateInfoNV(; x.next, x.image, x.buffer)

_ExternalMemoryImageCreateInfoNV(x::ExternalMemoryImageCreateInfoNV) = _ExternalMemoryImageCreateInfoNV(; x.next, x.handle_types)

_ExportMemoryAllocateInfoNV(x::ExportMemoryAllocateInfoNV) = _ExportMemoryAllocateInfoNV(; x.next, x.handle_types)

_ImportMemoryWin32HandleInfoNV(x::ImportMemoryWin32HandleInfoNV) = _ImportMemoryWin32HandleInfoNV(; x.next, x.handle_type, x.handle)

_ExportMemoryWin32HandleInfoNV(x::ExportMemoryWin32HandleInfoNV) = _ExportMemoryWin32HandleInfoNV(; x.next, x.attributes, x.dw_access)

_Win32KeyedMutexAcquireReleaseInfoNV(x::Win32KeyedMutexAcquireReleaseInfoNV) = _Win32KeyedMutexAcquireReleaseInfoNV(x.acquire_syncs, x.acquire_keys, x.acquire_timeout_milliseconds, x.release_syncs, x.release_keys; x.next)

_PhysicalDeviceDeviceGeneratedCommandsFeaturesNV(x::PhysicalDeviceDeviceGeneratedCommandsFeaturesNV) = _PhysicalDeviceDeviceGeneratedCommandsFeaturesNV(x.device_generated_commands; x.next)

_DevicePrivateDataCreateInfoEXT(x::DevicePrivateDataCreateInfoEXT) = _DevicePrivateDataCreateInfoEXT(x.private_data_slot_request_count; x.next)

_PrivateDataSlotCreateInfoEXT(x::PrivateDataSlotCreateInfoEXT) = _PrivateDataSlotCreateInfoEXT(x.flags; x.next)

_PhysicalDevicePrivateDataFeaturesEXT(x::PhysicalDevicePrivateDataFeaturesEXT) = _PhysicalDevicePrivateDataFeaturesEXT(x.private_data; x.next)

_GraphicsShaderGroupCreateInfoNV(x::GraphicsShaderGroupCreateInfoNV) = _GraphicsShaderGroupCreateInfoNV(convert_nonnull(Vector{_PipelineShaderStageCreateInfo}, x.stages); x.next, vertex_input_state = convert_nonnull(_PipelineVertexInputStateCreateInfo, x.vertex_input_state), tessellation_state = convert_nonnull(_PipelineTessellationStateCreateInfo, x.tessellation_state))

_GraphicsPipelineShaderGroupsCreateInfoNV(x::GraphicsPipelineShaderGroupsCreateInfoNV) = _GraphicsPipelineShaderGroupsCreateInfoNV(convert_nonnull(Vector{_GraphicsShaderGroupCreateInfoNV}, x.groups), x.pipelines; x.next)

_BindShaderGroupIndirectCommandNV(x::BindShaderGroupIndirectCommandNV) = _BindShaderGroupIndirectCommandNV(x.group_index)

_BindIndexBufferIndirectCommandNV(x::BindIndexBufferIndirectCommandNV) = _BindIndexBufferIndirectCommandNV(x.buffer_address, x.size, x.index_type)

_BindVertexBufferIndirectCommandNV(x::BindVertexBufferIndirectCommandNV) = _BindVertexBufferIndirectCommandNV(x.buffer_address, x.size, x.stride)

_SetStateFlagsIndirectCommandNV(x::SetStateFlagsIndirectCommandNV) = _SetStateFlagsIndirectCommandNV(x.data)

_IndirectCommandsStreamNV(x::IndirectCommandsStreamNV) = _IndirectCommandsStreamNV(x.buffer, x.offset)

_IndirectCommandsLayoutTokenNV(x::IndirectCommandsLayoutTokenNV) = _IndirectCommandsLayoutTokenNV(x.token_type, x.stream, x.offset, x.vertex_binding_unit, x.vertex_dynamic_stride, x.pushconstant_offset, x.pushconstant_size, x.index_types, x.index_type_values; x.next, x.pushconstant_pipeline_layout, x.pushconstant_shader_stage_flags, x.indirect_state_flags)

_IndirectCommandsLayoutCreateInfoNV(x::IndirectCommandsLayoutCreateInfoNV) = _IndirectCommandsLayoutCreateInfoNV(x.pipeline_bind_point, convert_nonnull(Vector{_IndirectCommandsLayoutTokenNV}, x.tokens), x.stream_strides; x.next, x.flags)

_GeneratedCommandsInfoNV(x::GeneratedCommandsInfoNV) = _GeneratedCommandsInfoNV(x.pipeline_bind_point, x.pipeline, x.indirect_commands_layout, convert_nonnull(Vector{_IndirectCommandsStreamNV}, x.streams), x.sequences_count, x.preprocess_buffer, x.preprocess_offset, x.preprocess_size, x.sequences_count_offset, x.sequences_index_offset; x.next, x.sequences_count_buffer, x.sequences_index_buffer)

_GeneratedCommandsMemoryRequirementsInfoNV(x::GeneratedCommandsMemoryRequirementsInfoNV) = _GeneratedCommandsMemoryRequirementsInfoNV(x.pipeline_bind_point, x.pipeline, x.indirect_commands_layout, x.max_sequences_count; x.next)

_PhysicalDeviceFeatures2(x::PhysicalDeviceFeatures2) = _PhysicalDeviceFeatures2(convert_nonnull(_PhysicalDeviceFeatures, x.features); x.next)

_PhysicalDeviceImageFormatInfo2(x::PhysicalDeviceImageFormatInfo2) = _PhysicalDeviceImageFormatInfo2(x.format, x.type, x.tiling, x.usage; x.next, x.flags)

_PhysicalDeviceSparseImageFormatInfo2(x::PhysicalDeviceSparseImageFormatInfo2) = _PhysicalDeviceSparseImageFormatInfo2(x.format, x.type, x.samples, x.usage, x.tiling; x.next)

_ConformanceVersion(x::ConformanceVersion) = _ConformanceVersion(x.major, x.minor, x.subminor, x.patch)

_PresentRegionsKHR(x::PresentRegionsKHR) = _PresentRegionsKHR(; x.next, regions = convert_nonnull(Vector{_PresentRegionKHR}, x.regions))

_PresentRegionKHR(x::PresentRegionKHR) = _PresentRegionKHR(; rectangles = convert_nonnull(Vector{_RectLayerKHR}, x.rectangles))

_RectLayerKHR(x::RectLayerKHR) = _RectLayerKHR(convert_nonnull(_Offset2D, x.offset), convert_nonnull(_Extent2D, x.extent), x.layer)

_PhysicalDeviceVariablePointersFeatures(x::PhysicalDeviceVariablePointersFeatures) = _PhysicalDeviceVariablePointersFeatures(x.variable_pointers_storage_buffer, x.variable_pointers; x.next)

_PhysicalDeviceExternalImageFormatInfo(x::PhysicalDeviceExternalImageFormatInfo) = _PhysicalDeviceExternalImageFormatInfo(; x.next, x.handle_type)

_PhysicalDeviceExternalBufferInfo(x::PhysicalDeviceExternalBufferInfo) = _PhysicalDeviceExternalBufferInfo(x.usage, x.handle_type; x.next, x.flags)

_ExternalMemoryImageCreateInfo(x::ExternalMemoryImageCreateInfo) = _ExternalMemoryImageCreateInfo(; x.next, x.handle_types)

_ExternalMemoryBufferCreateInfo(x::ExternalMemoryBufferCreateInfo) = _ExternalMemoryBufferCreateInfo(; x.next, x.handle_types)

_ExportMemoryAllocateInfo(x::ExportMemoryAllocateInfo) = _ExportMemoryAllocateInfo(; x.next, x.handle_types)

_ImportMemoryWin32HandleInfoKHR(x::ImportMemoryWin32HandleInfoKHR) = _ImportMemoryWin32HandleInfoKHR(; x.next, x.handle_type, x.handle, x.name)

_ExportMemoryWin32HandleInfoKHR(x::ExportMemoryWin32HandleInfoKHR) = _ExportMemoryWin32HandleInfoKHR(x.dw_access, x.name; x.next, x.attributes)

_ImportMemoryZirconHandleInfoFUCHSIA(x::ImportMemoryZirconHandleInfoFUCHSIA) = _ImportMemoryZirconHandleInfoFUCHSIA(; x.next, x.handle_type, x.handle)

_MemoryGetZirconHandleInfoFUCHSIA(x::MemoryGetZirconHandleInfoFUCHSIA) = _MemoryGetZirconHandleInfoFUCHSIA(x.memory, x.handle_type; x.next)

_MemoryGetWin32HandleInfoKHR(x::MemoryGetWin32HandleInfoKHR) = _MemoryGetWin32HandleInfoKHR(x.memory, x.handle_type; x.next)

_ImportMemoryFdInfoKHR(x::ImportMemoryFdInfoKHR) = _ImportMemoryFdInfoKHR(x.fd; x.next, x.handle_type)

_MemoryGetFdInfoKHR(x::MemoryGetFdInfoKHR) = _MemoryGetFdInfoKHR(x.memory, x.handle_type; x.next)

_Win32KeyedMutexAcquireReleaseInfoKHR(x::Win32KeyedMutexAcquireReleaseInfoKHR) = _Win32KeyedMutexAcquireReleaseInfoKHR(x.acquire_syncs, x.acquire_keys, x.acquire_timeouts, x.release_syncs, x.release_keys; x.next)

_PhysicalDeviceExternalSemaphoreInfo(x::PhysicalDeviceExternalSemaphoreInfo) = _PhysicalDeviceExternalSemaphoreInfo(x.handle_type; x.next)

_ExportSemaphoreCreateInfo(x::ExportSemaphoreCreateInfo) = _ExportSemaphoreCreateInfo(; x.next, x.handle_types)

_ImportSemaphoreWin32HandleInfoKHR(x::ImportSemaphoreWin32HandleInfoKHR) = _ImportSemaphoreWin32HandleInfoKHR(x.semaphore, x.handle_type; x.next, x.flags, x.handle, x.name)

_ExportSemaphoreWin32HandleInfoKHR(x::ExportSemaphoreWin32HandleInfoKHR) = _ExportSemaphoreWin32HandleInfoKHR(x.dw_access, x.name; x.next, x.attributes)

_D3D12FenceSubmitInfoKHR(x::D3D12FenceSubmitInfoKHR) = _D3D12FenceSubmitInfoKHR(; x.next, x.wait_semaphore_values, x.signal_semaphore_values)

_SemaphoreGetWin32HandleInfoKHR(x::SemaphoreGetWin32HandleInfoKHR) = _SemaphoreGetWin32HandleInfoKHR(x.semaphore, x.handle_type; x.next)

_ImportSemaphoreFdInfoKHR(x::ImportSemaphoreFdInfoKHR) = _ImportSemaphoreFdInfoKHR(x.semaphore, x.handle_type, x.fd; x.next, x.flags)

_SemaphoreGetFdInfoKHR(x::SemaphoreGetFdInfoKHR) = _SemaphoreGetFdInfoKHR(x.semaphore, x.handle_type; x.next)

_ImportSemaphoreZirconHandleInfoFUCHSIA(x::ImportSemaphoreZirconHandleInfoFUCHSIA) = _ImportSemaphoreZirconHandleInfoFUCHSIA(x.semaphore, x.handle_type, x.zircon_handle; x.next, x.flags)

_SemaphoreGetZirconHandleInfoFUCHSIA(x::SemaphoreGetZirconHandleInfoFUCHSIA) = _SemaphoreGetZirconHandleInfoFUCHSIA(x.semaphore, x.handle_type; x.next)

_PhysicalDeviceExternalFenceInfo(x::PhysicalDeviceExternalFenceInfo) = _PhysicalDeviceExternalFenceInfo(x.handle_type; x.next)

_ExportFenceCreateInfo(x::ExportFenceCreateInfo) = _ExportFenceCreateInfo(; x.next, x.handle_types)

_ImportFenceWin32HandleInfoKHR(x::ImportFenceWin32HandleInfoKHR) = _ImportFenceWin32HandleInfoKHR(x.fence, x.handle_type; x.next, x.flags, x.handle, x.name)

_ExportFenceWin32HandleInfoKHR(x::ExportFenceWin32HandleInfoKHR) = _ExportFenceWin32HandleInfoKHR(x.dw_access, x.name; x.next, x.attributes)

_FenceGetWin32HandleInfoKHR(x::FenceGetWin32HandleInfoKHR) = _FenceGetWin32HandleInfoKHR(x.fence, x.handle_type; x.next)

_ImportFenceFdInfoKHR(x::ImportFenceFdInfoKHR) = _ImportFenceFdInfoKHR(x.fence, x.handle_type, x.fd; x.next, x.flags)

_FenceGetFdInfoKHR(x::FenceGetFdInfoKHR) = _FenceGetFdInfoKHR(x.fence, x.handle_type; x.next)

_PhysicalDeviceMultiviewFeatures(x::PhysicalDeviceMultiviewFeatures) = _PhysicalDeviceMultiviewFeatures(x.multiview, x.multiview_geometry_shader, x.multiview_tessellation_shader; x.next)

_RenderPassMultiviewCreateInfo(x::RenderPassMultiviewCreateInfo) = _RenderPassMultiviewCreateInfo(x.view_masks, x.view_offsets, x.correlation_masks; x.next)

_DisplayPowerInfoEXT(x::DisplayPowerInfoEXT) = _DisplayPowerInfoEXT(x.power_state; x.next)

_DeviceEventInfoEXT(x::DeviceEventInfoEXT) = _DeviceEventInfoEXT(x.device_event; x.next)

_DisplayEventInfoEXT(x::DisplayEventInfoEXT) = _DisplayEventInfoEXT(x.display_event; x.next)

_SwapchainCounterCreateInfoEXT(x::SwapchainCounterCreateInfoEXT) = _SwapchainCounterCreateInfoEXT(; x.next, x.surface_counters)

_MemoryAllocateFlagsInfo(x::MemoryAllocateFlagsInfo) = _MemoryAllocateFlagsInfo(x.device_mask; x.next, x.flags)

_BindBufferMemoryInfo(x::BindBufferMemoryInfo) = _BindBufferMemoryInfo(x.buffer, x.memory, x.memory_offset; x.next)

_BindBufferMemoryDeviceGroupInfo(x::BindBufferMemoryDeviceGroupInfo) = _BindBufferMemoryDeviceGroupInfo(x.device_indices; x.next)

_BindImageMemoryInfo(x::BindImageMemoryInfo) = _BindImageMemoryInfo(x.image, x.memory, x.memory_offset; x.next)

_BindImageMemoryDeviceGroupInfo(x::BindImageMemoryDeviceGroupInfo) = _BindImageMemoryDeviceGroupInfo(x.device_indices, convert_nonnull(Vector{_Rect2D}, x.split_instance_bind_regions); x.next)

_DeviceGroupRenderPassBeginInfo(x::DeviceGroupRenderPassBeginInfo) = _DeviceGroupRenderPassBeginInfo(x.device_mask, convert_nonnull(Vector{_Rect2D}, x.device_render_areas); x.next)

_DeviceGroupCommandBufferBeginInfo(x::DeviceGroupCommandBufferBeginInfo) = _DeviceGroupCommandBufferBeginInfo(x.device_mask; x.next)

_DeviceGroupSubmitInfo(x::DeviceGroupSubmitInfo) = _DeviceGroupSubmitInfo(x.wait_semaphore_device_indices, x.command_buffer_device_masks, x.signal_semaphore_device_indices; x.next)

_DeviceGroupBindSparseInfo(x::DeviceGroupBindSparseInfo) = _DeviceGroupBindSparseInfo(x.resource_device_index, x.memory_device_index; x.next)

_ImageSwapchainCreateInfoKHR(x::ImageSwapchainCreateInfoKHR) = _ImageSwapchainCreateInfoKHR(; x.next, x.swapchain)

_BindImageMemorySwapchainInfoKHR(x::BindImageMemorySwapchainInfoKHR) = _BindImageMemorySwapchainInfoKHR(x.swapchain, x.image_index; x.next)

_AcquireNextImageInfoKHR(x::AcquireNextImageInfoKHR) = _AcquireNextImageInfoKHR(x.swapchain, x.timeout, x.device_mask; x.next, x.semaphore, x.fence)

_DeviceGroupPresentInfoKHR(x::DeviceGroupPresentInfoKHR) = _DeviceGroupPresentInfoKHR(x.device_masks, x.mode; x.next)

_DeviceGroupDeviceCreateInfo(x::DeviceGroupDeviceCreateInfo) = _DeviceGroupDeviceCreateInfo(x.physical_devices; x.next)

_DeviceGroupSwapchainCreateInfoKHR(x::DeviceGroupSwapchainCreateInfoKHR) = _DeviceGroupSwapchainCreateInfoKHR(x.modes; x.next)

_DescriptorUpdateTemplateEntry(x::DescriptorUpdateTemplateEntry) = _DescriptorUpdateTemplateEntry(x.dst_binding, x.dst_array_element, x.descriptor_count, x.descriptor_type, x.offset, x.stride)

_DescriptorUpdateTemplateCreateInfo(x::DescriptorUpdateTemplateCreateInfo) = _DescriptorUpdateTemplateCreateInfo(convert_nonnull(Vector{_DescriptorUpdateTemplateEntry}, x.descriptor_update_entries), x.template_type, x.descriptor_set_layout, x.pipeline_bind_point, x.pipeline_layout, x.set; x.next, x.flags)

_XYColorEXT(x::XYColorEXT) = _XYColorEXT(x.x, x.y)

_HdrMetadataEXT(x::HdrMetadataEXT) = _HdrMetadataEXT(convert_nonnull(_XYColorEXT, x.display_primary_red), convert_nonnull(_XYColorEXT, x.display_primary_green), convert_nonnull(_XYColorEXT, x.display_primary_blue), convert_nonnull(_XYColorEXT, x.white_point), x.max_luminance, x.min_luminance, x.max_content_light_level, x.max_frame_average_light_level; x.next)

_SwapchainDisplayNativeHdrCreateInfoAMD(x::SwapchainDisplayNativeHdrCreateInfoAMD) = _SwapchainDisplayNativeHdrCreateInfoAMD(x.local_dimming_enable; x.next)

_PresentTimesInfoGOOGLE(x::PresentTimesInfoGOOGLE) = _PresentTimesInfoGOOGLE(; x.next, times = convert_nonnull(Vector{_PresentTimeGOOGLE}, x.times))

_PresentTimeGOOGLE(x::PresentTimeGOOGLE) = _PresentTimeGOOGLE(x.present_id, x.desired_present_time)

_IOSSurfaceCreateInfoMVK(x::IOSSurfaceCreateInfoMVK) = _IOSSurfaceCreateInfoMVK(x.view; x.next, x.flags)

_MacOSSurfaceCreateInfoMVK(x::MacOSSurfaceCreateInfoMVK) = _MacOSSurfaceCreateInfoMVK(x.view; x.next, x.flags)

_MetalSurfaceCreateInfoEXT(x::MetalSurfaceCreateInfoEXT) = _MetalSurfaceCreateInfoEXT(x.layer; x.next, x.flags)

_ViewportWScalingNV(x::ViewportWScalingNV) = _ViewportWScalingNV(x.xcoeff, x.ycoeff)

_PipelineViewportWScalingStateCreateInfoNV(x::PipelineViewportWScalingStateCreateInfoNV) = _PipelineViewportWScalingStateCreateInfoNV(x.viewport_w_scaling_enable; x.next, viewport_w_scalings = convert_nonnull(Vector{_ViewportWScalingNV}, x.viewport_w_scalings))

_ViewportSwizzleNV(x::ViewportSwizzleNV) = _ViewportSwizzleNV(x.x, x.y, x.z, x.w)

_PipelineViewportSwizzleStateCreateInfoNV(x::PipelineViewportSwizzleStateCreateInfoNV) = _PipelineViewportSwizzleStateCreateInfoNV(convert_nonnull(Vector{_ViewportSwizzleNV}, x.viewport_swizzles); x.next, x.flags)

_PipelineDiscardRectangleStateCreateInfoEXT(x::PipelineDiscardRectangleStateCreateInfoEXT) = _PipelineDiscardRectangleStateCreateInfoEXT(x.discard_rectangle_mode, convert_nonnull(Vector{_Rect2D}, x.discard_rectangles); x.next, x.flags)

_InputAttachmentAspectReference(x::InputAttachmentAspectReference) = _InputAttachmentAspectReference(x.subpass, x.input_attachment_index, x.aspect_mask)

_RenderPassInputAttachmentAspectCreateInfo(x::RenderPassInputAttachmentAspectCreateInfo) = _RenderPassInputAttachmentAspectCreateInfo(convert_nonnull(Vector{_InputAttachmentAspectReference}, x.aspect_references); x.next)

_PhysicalDeviceSurfaceInfo2KHR(x::PhysicalDeviceSurfaceInfo2KHR) = _PhysicalDeviceSurfaceInfo2KHR(x.surface; x.next)

_DisplayPlaneInfo2KHR(x::DisplayPlaneInfo2KHR) = _DisplayPlaneInfo2KHR(x.mode, x.plane_index; x.next)

_PhysicalDevice16BitStorageFeatures(x::PhysicalDevice16BitStorageFeatures) = _PhysicalDevice16BitStorageFeatures(x.storage_buffer_16_bit_access, x.uniform_and_storage_buffer_16_bit_access, x.storage_push_constant_16, x.storage_input_output_16; x.next)

_PhysicalDeviceShaderSubgroupExtendedTypesFeatures(x::PhysicalDeviceShaderSubgroupExtendedTypesFeatures) = _PhysicalDeviceShaderSubgroupExtendedTypesFeatures(x.shader_subgroup_extended_types; x.next)

_BufferMemoryRequirementsInfo2(x::BufferMemoryRequirementsInfo2) = _BufferMemoryRequirementsInfo2(x.buffer; x.next)

_ImageMemoryRequirementsInfo2(x::ImageMemoryRequirementsInfo2) = _ImageMemoryRequirementsInfo2(x.image; x.next)

_ImageSparseMemoryRequirementsInfo2(x::ImageSparseMemoryRequirementsInfo2) = _ImageSparseMemoryRequirementsInfo2(x.image; x.next)

_MemoryDedicatedAllocateInfo(x::MemoryDedicatedAllocateInfo) = _MemoryDedicatedAllocateInfo(; x.next, x.image, x.buffer)

_ImageViewUsageCreateInfo(x::ImageViewUsageCreateInfo) = _ImageViewUsageCreateInfo(x.usage; x.next)

_PipelineTessellationDomainOriginStateCreateInfo(x::PipelineTessellationDomainOriginStateCreateInfo) = _PipelineTessellationDomainOriginStateCreateInfo(x.domain_origin; x.next)

_SamplerYcbcrConversionInfo(x::SamplerYcbcrConversionInfo) = _SamplerYcbcrConversionInfo(x.conversion; x.next)

_SamplerYcbcrConversionCreateInfo(x::SamplerYcbcrConversionCreateInfo) = _SamplerYcbcrConversionCreateInfo(x.format, x.ycbcr_model, x.ycbcr_range, convert_nonnull(_ComponentMapping, x.components), x.x_chroma_offset, x.y_chroma_offset, x.chroma_filter, x.force_explicit_reconstruction; x.next)

_BindImagePlaneMemoryInfo(x::BindImagePlaneMemoryInfo) = _BindImagePlaneMemoryInfo(x.plane_aspect; x.next)

_ImagePlaneMemoryRequirementsInfo(x::ImagePlaneMemoryRequirementsInfo) = _ImagePlaneMemoryRequirementsInfo(x.plane_aspect; x.next)

_PhysicalDeviceSamplerYcbcrConversionFeatures(x::PhysicalDeviceSamplerYcbcrConversionFeatures) = _PhysicalDeviceSamplerYcbcrConversionFeatures(x.sampler_ycbcr_conversion; x.next)

_ConditionalRenderingBeginInfoEXT(x::ConditionalRenderingBeginInfoEXT) = _ConditionalRenderingBeginInfoEXT(x.buffer, x.offset; x.next, x.flags)

_ProtectedSubmitInfo(x::ProtectedSubmitInfo) = _ProtectedSubmitInfo(x.protected_submit; x.next)

_PhysicalDeviceProtectedMemoryFeatures(x::PhysicalDeviceProtectedMemoryFeatures) = _PhysicalDeviceProtectedMemoryFeatures(x.protected_memory; x.next)

_DeviceQueueInfo2(x::DeviceQueueInfo2) = _DeviceQueueInfo2(x.queue_family_index, x.queue_index; x.next, x.flags)

_PipelineCoverageToColorStateCreateInfoNV(x::PipelineCoverageToColorStateCreateInfoNV) = _PipelineCoverageToColorStateCreateInfoNV(x.coverage_to_color_enable; x.next, x.flags, x.coverage_to_color_location)

_SampleLocationEXT(x::SampleLocationEXT) = _SampleLocationEXT(x.x, x.y)

_SampleLocationsInfoEXT(x::SampleLocationsInfoEXT) = _SampleLocationsInfoEXT(x.sample_locations_per_pixel, convert_nonnull(_Extent2D, x.sample_location_grid_size), convert_nonnull(Vector{_SampleLocationEXT}, x.sample_locations); x.next)

_AttachmentSampleLocationsEXT(x::AttachmentSampleLocationsEXT) = _AttachmentSampleLocationsEXT(x.attachment_index, convert_nonnull(_SampleLocationsInfoEXT, x.sample_locations_info))

_SubpassSampleLocationsEXT(x::SubpassSampleLocationsEXT) = _SubpassSampleLocationsEXT(x.subpass_index, convert_nonnull(_SampleLocationsInfoEXT, x.sample_locations_info))

_RenderPassSampleLocationsBeginInfoEXT(x::RenderPassSampleLocationsBeginInfoEXT) = _RenderPassSampleLocationsBeginInfoEXT(convert_nonnull(Vector{_AttachmentSampleLocationsEXT}, x.attachment_initial_sample_locations), convert_nonnull(Vector{_SubpassSampleLocationsEXT}, x.post_subpass_sample_locations); x.next)

_PipelineSampleLocationsStateCreateInfoEXT(x::PipelineSampleLocationsStateCreateInfoEXT) = _PipelineSampleLocationsStateCreateInfoEXT(x.sample_locations_enable, convert_nonnull(_SampleLocationsInfoEXT, x.sample_locations_info); x.next)

_SamplerReductionModeCreateInfo(x::SamplerReductionModeCreateInfo) = _SamplerReductionModeCreateInfo(x.reduction_mode; x.next)

_PhysicalDeviceBlendOperationAdvancedFeaturesEXT(x::PhysicalDeviceBlendOperationAdvancedFeaturesEXT) = _PhysicalDeviceBlendOperationAdvancedFeaturesEXT(x.advanced_blend_coherent_operations; x.next)

_PipelineColorBlendAdvancedStateCreateInfoEXT(x::PipelineColorBlendAdvancedStateCreateInfoEXT) = _PipelineColorBlendAdvancedStateCreateInfoEXT(x.src_premultiplied, x.dst_premultiplied, x.blend_overlap; x.next)

_PhysicalDeviceInlineUniformBlockFeaturesEXT(x::PhysicalDeviceInlineUniformBlockFeaturesEXT) = _PhysicalDeviceInlineUniformBlockFeaturesEXT(x.inline_uniform_block, x.descriptor_binding_inline_uniform_block_update_after_bind; x.next)

_WriteDescriptorSetInlineUniformBlockEXT(x::WriteDescriptorSetInlineUniformBlockEXT) = _WriteDescriptorSetInlineUniformBlockEXT(x.data_size, x.data; x.next)

_DescriptorPoolInlineUniformBlockCreateInfoEXT(x::DescriptorPoolInlineUniformBlockCreateInfoEXT) = _DescriptorPoolInlineUniformBlockCreateInfoEXT(x.max_inline_uniform_block_bindings; x.next)

_PipelineCoverageModulationStateCreateInfoNV(x::PipelineCoverageModulationStateCreateInfoNV) = _PipelineCoverageModulationStateCreateInfoNV(x.coverage_modulation_mode, x.coverage_modulation_table_enable; x.next, x.flags, x.coverage_modulation_table)

_ImageFormatListCreateInfo(x::ImageFormatListCreateInfo) = _ImageFormatListCreateInfo(x.view_formats; x.next)

_ValidationCacheCreateInfoEXT(x::ValidationCacheCreateInfoEXT) = _ValidationCacheCreateInfoEXT(x.initial_data; x.next, x.flags, x.initial_data_size)

_ShaderModuleValidationCacheCreateInfoEXT(x::ShaderModuleValidationCacheCreateInfoEXT) = _ShaderModuleValidationCacheCreateInfoEXT(x.validation_cache; x.next)

_PhysicalDeviceShaderDrawParametersFeatures(x::PhysicalDeviceShaderDrawParametersFeatures) = _PhysicalDeviceShaderDrawParametersFeatures(x.shader_draw_parameters; x.next)

_PhysicalDeviceShaderFloat16Int8Features(x::PhysicalDeviceShaderFloat16Int8Features) = _PhysicalDeviceShaderFloat16Int8Features(x.shader_float_16, x.shader_int_8; x.next)

_PhysicalDeviceHostQueryResetFeatures(x::PhysicalDeviceHostQueryResetFeatures) = _PhysicalDeviceHostQueryResetFeatures(x.host_query_reset; x.next)

_DeviceQueueGlobalPriorityCreateInfoEXT(x::DeviceQueueGlobalPriorityCreateInfoEXT) = _DeviceQueueGlobalPriorityCreateInfoEXT(x.global_priority; x.next)

_DebugUtilsObjectNameInfoEXT(x::DebugUtilsObjectNameInfoEXT) = _DebugUtilsObjectNameInfoEXT(x.object_type, x.object_handle; x.next, x.object_name)

_DebugUtilsObjectTagInfoEXT(x::DebugUtilsObjectTagInfoEXT) = _DebugUtilsObjectTagInfoEXT(x.object_type, x.object_handle, x.tag_name, x.tag_size, x.tag; x.next)

_DebugUtilsLabelEXT(x::DebugUtilsLabelEXT) = _DebugUtilsLabelEXT(x.label_name, x.color; x.next)

_DebugUtilsMessengerCreateInfoEXT(x::DebugUtilsMessengerCreateInfoEXT) = _DebugUtilsMessengerCreateInfoEXT(x.message_severity, x.message_type, x.pfn_user_callback; x.next, x.flags, x.user_data)

_DebugUtilsMessengerCallbackDataEXT(x::DebugUtilsMessengerCallbackDataEXT) = _DebugUtilsMessengerCallbackDataEXT(x.message_id_number, x.message, convert_nonnull(Vector{_DebugUtilsLabelEXT}, x.queue_labels), convert_nonnull(Vector{_DebugUtilsLabelEXT}, x.cmd_buf_labels), convert_nonnull(Vector{_DebugUtilsObjectNameInfoEXT}, x.objects); x.next, x.flags, x.message_id_name)

_PhysicalDeviceDeviceMemoryReportFeaturesEXT(x::PhysicalDeviceDeviceMemoryReportFeaturesEXT) = _PhysicalDeviceDeviceMemoryReportFeaturesEXT(x.device_memory_report; x.next)

_DeviceDeviceMemoryReportCreateInfoEXT(x::DeviceDeviceMemoryReportCreateInfoEXT) = _DeviceDeviceMemoryReportCreateInfoEXT(x.flags, x.pfn_user_callback, x.user_data; x.next)

_ImportMemoryHostPointerInfoEXT(x::ImportMemoryHostPointerInfoEXT) = _ImportMemoryHostPointerInfoEXT(x.handle_type, x.host_pointer; x.next)

_CalibratedTimestampInfoEXT(x::CalibratedTimestampInfoEXT) = _CalibratedTimestampInfoEXT(x.time_domain; x.next)

_PipelineRasterizationConservativeStateCreateInfoEXT(x::PipelineRasterizationConservativeStateCreateInfoEXT) = _PipelineRasterizationConservativeStateCreateInfoEXT(x.conservative_rasterization_mode, x.extra_primitive_overestimation_size; x.next, x.flags)

_PhysicalDeviceDescriptorIndexingFeatures(x::PhysicalDeviceDescriptorIndexingFeatures) = _PhysicalDeviceDescriptorIndexingFeatures(x.shader_input_attachment_array_dynamic_indexing, x.shader_uniform_texel_buffer_array_dynamic_indexing, x.shader_storage_texel_buffer_array_dynamic_indexing, x.shader_uniform_buffer_array_non_uniform_indexing, x.shader_sampled_image_array_non_uniform_indexing, x.shader_storage_buffer_array_non_uniform_indexing, x.shader_storage_image_array_non_uniform_indexing, x.shader_input_attachment_array_non_uniform_indexing, x.shader_uniform_texel_buffer_array_non_uniform_indexing, x.shader_storage_texel_buffer_array_non_uniform_indexing, x.descriptor_binding_uniform_buffer_update_after_bind, x.descriptor_binding_sampled_image_update_after_bind, x.descriptor_binding_storage_image_update_after_bind, x.descriptor_binding_storage_buffer_update_after_bind, x.descriptor_binding_uniform_texel_buffer_update_after_bind, x.descriptor_binding_storage_texel_buffer_update_after_bind, x.descriptor_binding_update_unused_while_pending, x.descriptor_binding_partially_bound, x.descriptor_binding_variable_descriptor_count, x.runtime_descriptor_array; x.next)

_DescriptorSetLayoutBindingFlagsCreateInfo(x::DescriptorSetLayoutBindingFlagsCreateInfo) = _DescriptorSetLayoutBindingFlagsCreateInfo(x.binding_flags; x.next)

_DescriptorSetVariableDescriptorCountAllocateInfo(x::DescriptorSetVariableDescriptorCountAllocateInfo) = _DescriptorSetVariableDescriptorCountAllocateInfo(x.descriptor_counts; x.next)

_AttachmentDescription2(x::AttachmentDescription2) = _AttachmentDescription2(x.format, x.samples, x.load_op, x.store_op, x.stencil_load_op, x.stencil_store_op, x.initial_layout, x.final_layout; x.next, x.flags)

_AttachmentReference2(x::AttachmentReference2) = _AttachmentReference2(x.attachment, x.layout, x.aspect_mask; x.next)

_SubpassDescription2(x::SubpassDescription2) = _SubpassDescription2(x.pipeline_bind_point, x.view_mask, convert_nonnull(Vector{_AttachmentReference2}, x.input_attachments), convert_nonnull(Vector{_AttachmentReference2}, x.color_attachments), x.preserve_attachments; x.next, x.flags, resolve_attachments = convert_nonnull(Vector{_AttachmentReference2}, x.resolve_attachments), depth_stencil_attachment = convert_nonnull(_AttachmentReference2, x.depth_stencil_attachment))

_SubpassDependency2(x::SubpassDependency2) = _SubpassDependency2(x.src_subpass, x.dst_subpass, x.view_offset; x.next, x.src_stage_mask, x.dst_stage_mask, x.src_access_mask, x.dst_access_mask, x.dependency_flags)

_RenderPassCreateInfo2(x::RenderPassCreateInfo2) = _RenderPassCreateInfo2(convert_nonnull(Vector{_AttachmentDescription2}, x.attachments), convert_nonnull(Vector{_SubpassDescription2}, x.subpasses), convert_nonnull(Vector{_SubpassDependency2}, x.dependencies), x.correlated_view_masks; x.next, x.flags)

_SubpassBeginInfo(x::SubpassBeginInfo) = _SubpassBeginInfo(x.contents; x.next)

_SubpassEndInfo(x::SubpassEndInfo) = _SubpassEndInfo(; x.next)

_PhysicalDeviceTimelineSemaphoreFeatures(x::PhysicalDeviceTimelineSemaphoreFeatures) = _PhysicalDeviceTimelineSemaphoreFeatures(x.timeline_semaphore; x.next)

_SemaphoreTypeCreateInfo(x::SemaphoreTypeCreateInfo) = _SemaphoreTypeCreateInfo(x.semaphore_type, x.initial_value; x.next)

_TimelineSemaphoreSubmitInfo(x::TimelineSemaphoreSubmitInfo) = _TimelineSemaphoreSubmitInfo(; x.next, x.wait_semaphore_values, x.signal_semaphore_values)

_SemaphoreWaitInfo(x::SemaphoreWaitInfo) = _SemaphoreWaitInfo(x.semaphores, x.values; x.next, x.flags)

_SemaphoreSignalInfo(x::SemaphoreSignalInfo) = _SemaphoreSignalInfo(x.semaphore, x.value; x.next)

_VertexInputBindingDivisorDescriptionEXT(x::VertexInputBindingDivisorDescriptionEXT) = _VertexInputBindingDivisorDescriptionEXT(x.binding, x.divisor)

_PipelineVertexInputDivisorStateCreateInfoEXT(x::PipelineVertexInputDivisorStateCreateInfoEXT) = _PipelineVertexInputDivisorStateCreateInfoEXT(convert_nonnull(Vector{_VertexInputBindingDivisorDescriptionEXT}, x.vertex_binding_divisors); x.next)

_ImportAndroidHardwareBufferInfoANDROID(x::ImportAndroidHardwareBufferInfoANDROID) = _ImportAndroidHardwareBufferInfoANDROID(x.buffer; x.next)

_MemoryGetAndroidHardwareBufferInfoANDROID(x::MemoryGetAndroidHardwareBufferInfoANDROID) = _MemoryGetAndroidHardwareBufferInfoANDROID(x.memory; x.next)

_CommandBufferInheritanceConditionalRenderingInfoEXT(x::CommandBufferInheritanceConditionalRenderingInfoEXT) = _CommandBufferInheritanceConditionalRenderingInfoEXT(x.conditional_rendering_enable; x.next)

_ExternalFormatANDROID(x::ExternalFormatANDROID) = _ExternalFormatANDROID(x.external_format; x.next)

_PhysicalDevice8BitStorageFeatures(x::PhysicalDevice8BitStorageFeatures) = _PhysicalDevice8BitStorageFeatures(x.storage_buffer_8_bit_access, x.uniform_and_storage_buffer_8_bit_access, x.storage_push_constant_8; x.next)

_PhysicalDeviceConditionalRenderingFeaturesEXT(x::PhysicalDeviceConditionalRenderingFeaturesEXT) = _PhysicalDeviceConditionalRenderingFeaturesEXT(x.conditional_rendering, x.inherited_conditional_rendering; x.next)

_PhysicalDeviceVulkanMemoryModelFeatures(x::PhysicalDeviceVulkanMemoryModelFeatures) = _PhysicalDeviceVulkanMemoryModelFeatures(x.vulkan_memory_model, x.vulkan_memory_model_device_scope, x.vulkan_memory_model_availability_visibility_chains; x.next)

_PhysicalDeviceShaderAtomicInt64Features(x::PhysicalDeviceShaderAtomicInt64Features) = _PhysicalDeviceShaderAtomicInt64Features(x.shader_buffer_int_64_atomics, x.shader_shared_int_64_atomics; x.next)

_PhysicalDeviceShaderAtomicFloatFeaturesEXT(x::PhysicalDeviceShaderAtomicFloatFeaturesEXT) = _PhysicalDeviceShaderAtomicFloatFeaturesEXT(x.shader_buffer_float_32_atomics, x.shader_buffer_float_32_atomic_add, x.shader_buffer_float_64_atomics, x.shader_buffer_float_64_atomic_add, x.shader_shared_float_32_atomics, x.shader_shared_float_32_atomic_add, x.shader_shared_float_64_atomics, x.shader_shared_float_64_atomic_add, x.shader_image_float_32_atomics, x.shader_image_float_32_atomic_add, x.sparse_image_float_32_atomics, x.sparse_image_float_32_atomic_add; x.next)

_PhysicalDeviceVertexAttributeDivisorFeaturesEXT(x::PhysicalDeviceVertexAttributeDivisorFeaturesEXT) = _PhysicalDeviceVertexAttributeDivisorFeaturesEXT(x.vertex_attribute_instance_rate_divisor, x.vertex_attribute_instance_rate_zero_divisor; x.next)

_SubpassDescriptionDepthStencilResolve(x::SubpassDescriptionDepthStencilResolve) = _SubpassDescriptionDepthStencilResolve(x.depth_resolve_mode, x.stencil_resolve_mode; x.next, depth_stencil_resolve_attachment = convert_nonnull(_AttachmentReference2, x.depth_stencil_resolve_attachment))

_ImageViewASTCDecodeModeEXT(x::ImageViewASTCDecodeModeEXT) = _ImageViewASTCDecodeModeEXT(x.decode_mode; x.next)

_PhysicalDeviceASTCDecodeFeaturesEXT(x::PhysicalDeviceASTCDecodeFeaturesEXT) = _PhysicalDeviceASTCDecodeFeaturesEXT(x.decode_mode_shared_exponent; x.next)

_PhysicalDeviceTransformFeedbackFeaturesEXT(x::PhysicalDeviceTransformFeedbackFeaturesEXT) = _PhysicalDeviceTransformFeedbackFeaturesEXT(x.transform_feedback, x.geometry_streams; x.next)

_PipelineRasterizationStateStreamCreateInfoEXT(x::PipelineRasterizationStateStreamCreateInfoEXT) = _PipelineRasterizationStateStreamCreateInfoEXT(x.rasterization_stream; x.next, x.flags)

_PhysicalDeviceRepresentativeFragmentTestFeaturesNV(x::PhysicalDeviceRepresentativeFragmentTestFeaturesNV) = _PhysicalDeviceRepresentativeFragmentTestFeaturesNV(x.representative_fragment_test; x.next)

_PipelineRepresentativeFragmentTestStateCreateInfoNV(x::PipelineRepresentativeFragmentTestStateCreateInfoNV) = _PipelineRepresentativeFragmentTestStateCreateInfoNV(x.representative_fragment_test_enable; x.next)

_PhysicalDeviceExclusiveScissorFeaturesNV(x::PhysicalDeviceExclusiveScissorFeaturesNV) = _PhysicalDeviceExclusiveScissorFeaturesNV(x.exclusive_scissor; x.next)

_PipelineViewportExclusiveScissorStateCreateInfoNV(x::PipelineViewportExclusiveScissorStateCreateInfoNV) = _PipelineViewportExclusiveScissorStateCreateInfoNV(convert_nonnull(Vector{_Rect2D}, x.exclusive_scissors); x.next)

_PhysicalDeviceCornerSampledImageFeaturesNV(x::PhysicalDeviceCornerSampledImageFeaturesNV) = _PhysicalDeviceCornerSampledImageFeaturesNV(x.corner_sampled_image; x.next)

_PhysicalDeviceComputeShaderDerivativesFeaturesNV(x::PhysicalDeviceComputeShaderDerivativesFeaturesNV) = _PhysicalDeviceComputeShaderDerivativesFeaturesNV(x.compute_derivative_group_quads, x.compute_derivative_group_linear; x.next)

_PhysicalDeviceFragmentShaderBarycentricFeaturesNV(x::PhysicalDeviceFragmentShaderBarycentricFeaturesNV) = _PhysicalDeviceFragmentShaderBarycentricFeaturesNV(x.fragment_shader_barycentric; x.next)

_PhysicalDeviceShaderImageFootprintFeaturesNV(x::PhysicalDeviceShaderImageFootprintFeaturesNV) = _PhysicalDeviceShaderImageFootprintFeaturesNV(x.image_footprint; x.next)

_PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV(x::PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV) = _PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV(x.dedicated_allocation_image_aliasing; x.next)

_ShadingRatePaletteNV(x::ShadingRatePaletteNV) = _ShadingRatePaletteNV(x.shading_rate_palette_entries)

_PipelineViewportShadingRateImageStateCreateInfoNV(x::PipelineViewportShadingRateImageStateCreateInfoNV) = _PipelineViewportShadingRateImageStateCreateInfoNV(x.shading_rate_image_enable, convert_nonnull(Vector{_ShadingRatePaletteNV}, x.shading_rate_palettes); x.next)

_PhysicalDeviceShadingRateImageFeaturesNV(x::PhysicalDeviceShadingRateImageFeaturesNV) = _PhysicalDeviceShadingRateImageFeaturesNV(x.shading_rate_image, x.shading_rate_coarse_sample_order; x.next)

_CoarseSampleLocationNV(x::CoarseSampleLocationNV) = _CoarseSampleLocationNV(x.pixel_x, x.pixel_y, x.sample)

_CoarseSampleOrderCustomNV(x::CoarseSampleOrderCustomNV) = _CoarseSampleOrderCustomNV(x.shading_rate, x.sample_count, convert_nonnull(Vector{_CoarseSampleLocationNV}, x.sample_locations))

_PipelineViewportCoarseSampleOrderStateCreateInfoNV(x::PipelineViewportCoarseSampleOrderStateCreateInfoNV) = _PipelineViewportCoarseSampleOrderStateCreateInfoNV(x.sample_order_type, convert_nonnull(Vector{_CoarseSampleOrderCustomNV}, x.custom_sample_orders); x.next)

_PhysicalDeviceMeshShaderFeaturesNV(x::PhysicalDeviceMeshShaderFeaturesNV) = _PhysicalDeviceMeshShaderFeaturesNV(x.task_shader, x.mesh_shader; x.next)

_DrawMeshTasksIndirectCommandNV(x::DrawMeshTasksIndirectCommandNV) = _DrawMeshTasksIndirectCommandNV(x.task_count, x.first_task)

_RayTracingShaderGroupCreateInfoNV(x::RayTracingShaderGroupCreateInfoNV) = _RayTracingShaderGroupCreateInfoNV(x.type, x.general_shader, x.closest_hit_shader, x.any_hit_shader, x.intersection_shader; x.next)

_RayTracingShaderGroupCreateInfoKHR(x::RayTracingShaderGroupCreateInfoKHR) = _RayTracingShaderGroupCreateInfoKHR(x.type, x.general_shader, x.closest_hit_shader, x.any_hit_shader, x.intersection_shader; x.next, x.shader_group_capture_replay_handle)

_RayTracingPipelineCreateInfoNV(x::RayTracingPipelineCreateInfoNV) = _RayTracingPipelineCreateInfoNV(convert_nonnull(Vector{_PipelineShaderStageCreateInfo}, x.stages), convert_nonnull(Vector{_RayTracingShaderGroupCreateInfoNV}, x.groups), x.max_recursion_depth, x.layout, x.base_pipeline_index; x.next, x.flags, x.base_pipeline_handle)

_RayTracingPipelineCreateInfoKHR(x::RayTracingPipelineCreateInfoKHR) = _RayTracingPipelineCreateInfoKHR(convert_nonnull(Vector{_PipelineShaderStageCreateInfo}, x.stages), convert_nonnull(Vector{_RayTracingShaderGroupCreateInfoKHR}, x.groups), x.max_pipeline_ray_recursion_depth, x.layout, x.base_pipeline_index; x.next, x.flags, library_info = convert_nonnull(_PipelineLibraryCreateInfoKHR, x.library_info), library_interface = convert_nonnull(_RayTracingPipelineInterfaceCreateInfoKHR, x.library_interface), dynamic_state = convert_nonnull(_PipelineDynamicStateCreateInfo, x.dynamic_state), x.base_pipeline_handle)

_GeometryTrianglesNV(x::GeometryTrianglesNV) = _GeometryTrianglesNV(x.vertex_offset, x.vertex_count, x.vertex_stride, x.vertex_format, x.index_offset, x.index_count, x.index_type, x.transform_offset; x.next, x.vertex_data, x.index_data, x.transform_data)

_GeometryAABBNV(x::GeometryAABBNV) = _GeometryAABBNV(x.num_aab_bs, x.stride, x.offset; x.next, x.aabb_data)

_GeometryDataNV(x::GeometryDataNV) = _GeometryDataNV(convert_nonnull(_GeometryTrianglesNV, x.triangles), convert_nonnull(_GeometryAABBNV, x.aabbs))

_GeometryNV(x::GeometryNV) = _GeometryNV(x.geometry_type, convert_nonnull(_GeometryDataNV, x.geometry); x.next, x.flags)

_AccelerationStructureInfoNV(x::AccelerationStructureInfoNV) = _AccelerationStructureInfoNV(x.type, convert_nonnull(Vector{_GeometryNV}, x.geometries); x.next, x.flags, x.instance_count)

_AccelerationStructureCreateInfoNV(x::AccelerationStructureCreateInfoNV) = _AccelerationStructureCreateInfoNV(x.compacted_size, convert_nonnull(_AccelerationStructureInfoNV, x.info); x.next)

_BindAccelerationStructureMemoryInfoNV(x::BindAccelerationStructureMemoryInfoNV) = _BindAccelerationStructureMemoryInfoNV(x.acceleration_structure, x.memory, x.memory_offset, x.device_indices; x.next)

_WriteDescriptorSetAccelerationStructureKHR(x::WriteDescriptorSetAccelerationStructureKHR) = _WriteDescriptorSetAccelerationStructureKHR(x.acceleration_structures; x.next)

_WriteDescriptorSetAccelerationStructureNV(x::WriteDescriptorSetAccelerationStructureNV) = _WriteDescriptorSetAccelerationStructureNV(x.acceleration_structures; x.next)

_AccelerationStructureMemoryRequirementsInfoNV(x::AccelerationStructureMemoryRequirementsInfoNV) = _AccelerationStructureMemoryRequirementsInfoNV(x.type, x.acceleration_structure; x.next)

_PhysicalDeviceAccelerationStructureFeaturesKHR(x::PhysicalDeviceAccelerationStructureFeaturesKHR) = _PhysicalDeviceAccelerationStructureFeaturesKHR(x.acceleration_structure, x.acceleration_structure_capture_replay, x.acceleration_structure_indirect_build, x.acceleration_structure_host_commands, x.descriptor_binding_acceleration_structure_update_after_bind; x.next)

_PhysicalDeviceRayTracingPipelineFeaturesKHR(x::PhysicalDeviceRayTracingPipelineFeaturesKHR) = _PhysicalDeviceRayTracingPipelineFeaturesKHR(x.ray_tracing_pipeline, x.ray_tracing_pipeline_shader_group_handle_capture_replay, x.ray_tracing_pipeline_shader_group_handle_capture_replay_mixed, x.ray_tracing_pipeline_trace_rays_indirect, x.ray_traversal_primitive_culling; x.next)

_PhysicalDeviceRayQueryFeaturesKHR(x::PhysicalDeviceRayQueryFeaturesKHR) = _PhysicalDeviceRayQueryFeaturesKHR(x.ray_query; x.next)

_StridedDeviceAddressRegionKHR(x::StridedDeviceAddressRegionKHR) = _StridedDeviceAddressRegionKHR(x.stride, x.size; x.device_address)

_TraceRaysIndirectCommandKHR(x::TraceRaysIndirectCommandKHR) = _TraceRaysIndirectCommandKHR(x.width, x.height, x.depth)

_PhysicalDeviceImageDrmFormatModifierInfoEXT(x::PhysicalDeviceImageDrmFormatModifierInfoEXT) = _PhysicalDeviceImageDrmFormatModifierInfoEXT(x.drm_format_modifier, x.sharing_mode, x.queue_family_indices; x.next)

_ImageDrmFormatModifierListCreateInfoEXT(x::ImageDrmFormatModifierListCreateInfoEXT) = _ImageDrmFormatModifierListCreateInfoEXT(x.drm_format_modifiers; x.next)

_ImageDrmFormatModifierExplicitCreateInfoEXT(x::ImageDrmFormatModifierExplicitCreateInfoEXT) = _ImageDrmFormatModifierExplicitCreateInfoEXT(x.drm_format_modifier, x.plane_layouts; x.next)

_ImageStencilUsageCreateInfo(x::ImageStencilUsageCreateInfo) = _ImageStencilUsageCreateInfo(x.stencil_usage; x.next)

_DeviceMemoryOverallocationCreateInfoAMD(x::DeviceMemoryOverallocationCreateInfoAMD) = _DeviceMemoryOverallocationCreateInfoAMD(x.overallocation_behavior; x.next)

_PhysicalDeviceFragmentDensityMapFeaturesEXT(x::PhysicalDeviceFragmentDensityMapFeaturesEXT) = _PhysicalDeviceFragmentDensityMapFeaturesEXT(x.fragment_density_map, x.fragment_density_map_dynamic, x.fragment_density_map_non_subsampled_images; x.next)

_PhysicalDeviceFragmentDensityMap2FeaturesEXT(x::PhysicalDeviceFragmentDensityMap2FeaturesEXT) = _PhysicalDeviceFragmentDensityMap2FeaturesEXT(x.fragment_density_map_deferred; x.next)

_RenderPassFragmentDensityMapCreateInfoEXT(x::RenderPassFragmentDensityMapCreateInfoEXT) = _RenderPassFragmentDensityMapCreateInfoEXT(convert_nonnull(_AttachmentReference, x.fragment_density_map_attachment); x.next)

_PhysicalDeviceScalarBlockLayoutFeatures(x::PhysicalDeviceScalarBlockLayoutFeatures) = _PhysicalDeviceScalarBlockLayoutFeatures(x.scalar_block_layout; x.next)

_SurfaceProtectedCapabilitiesKHR(x::SurfaceProtectedCapabilitiesKHR) = _SurfaceProtectedCapabilitiesKHR(x.supports_protected; x.next)

_PhysicalDeviceUniformBufferStandardLayoutFeatures(x::PhysicalDeviceUniformBufferStandardLayoutFeatures) = _PhysicalDeviceUniformBufferStandardLayoutFeatures(x.uniform_buffer_standard_layout; x.next)

_PhysicalDeviceDepthClipEnableFeaturesEXT(x::PhysicalDeviceDepthClipEnableFeaturesEXT) = _PhysicalDeviceDepthClipEnableFeaturesEXT(x.depth_clip_enable; x.next)

_PipelineRasterizationDepthClipStateCreateInfoEXT(x::PipelineRasterizationDepthClipStateCreateInfoEXT) = _PipelineRasterizationDepthClipStateCreateInfoEXT(x.depth_clip_enable; x.next, x.flags)

_PhysicalDeviceMemoryPriorityFeaturesEXT(x::PhysicalDeviceMemoryPriorityFeaturesEXT) = _PhysicalDeviceMemoryPriorityFeaturesEXT(x.memory_priority; x.next)

_MemoryPriorityAllocateInfoEXT(x::MemoryPriorityAllocateInfoEXT) = _MemoryPriorityAllocateInfoEXT(x.priority; x.next)

_PhysicalDeviceBufferDeviceAddressFeatures(x::PhysicalDeviceBufferDeviceAddressFeatures) = _PhysicalDeviceBufferDeviceAddressFeatures(x.buffer_device_address, x.buffer_device_address_capture_replay, x.buffer_device_address_multi_device; x.next)

_PhysicalDeviceBufferDeviceAddressFeaturesEXT(x::PhysicalDeviceBufferDeviceAddressFeaturesEXT) = _PhysicalDeviceBufferDeviceAddressFeaturesEXT(x.buffer_device_address, x.buffer_device_address_capture_replay, x.buffer_device_address_multi_device; x.next)

_BufferDeviceAddressInfo(x::BufferDeviceAddressInfo) = _BufferDeviceAddressInfo(x.buffer; x.next)

_BufferOpaqueCaptureAddressCreateInfo(x::BufferOpaqueCaptureAddressCreateInfo) = _BufferOpaqueCaptureAddressCreateInfo(x.opaque_capture_address; x.next)

_BufferDeviceAddressCreateInfoEXT(x::BufferDeviceAddressCreateInfoEXT) = _BufferDeviceAddressCreateInfoEXT(x.device_address; x.next)

_PhysicalDeviceImageViewImageFormatInfoEXT(x::PhysicalDeviceImageViewImageFormatInfoEXT) = _PhysicalDeviceImageViewImageFormatInfoEXT(x.image_view_type; x.next)

_PhysicalDeviceImagelessFramebufferFeatures(x::PhysicalDeviceImagelessFramebufferFeatures) = _PhysicalDeviceImagelessFramebufferFeatures(x.imageless_framebuffer; x.next)

_FramebufferAttachmentsCreateInfo(x::FramebufferAttachmentsCreateInfo) = _FramebufferAttachmentsCreateInfo(convert_nonnull(Vector{_FramebufferAttachmentImageInfo}, x.attachment_image_infos); x.next)

_FramebufferAttachmentImageInfo(x::FramebufferAttachmentImageInfo) = _FramebufferAttachmentImageInfo(x.usage, x.width, x.height, x.layer_count, x.view_formats; x.next, x.flags)

_RenderPassAttachmentBeginInfo(x::RenderPassAttachmentBeginInfo) = _RenderPassAttachmentBeginInfo(x.attachments; x.next)

_PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT(x::PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT) = _PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT(x.texture_compression_astc_hdr; x.next)

_PhysicalDeviceCooperativeMatrixFeaturesNV(x::PhysicalDeviceCooperativeMatrixFeaturesNV) = _PhysicalDeviceCooperativeMatrixFeaturesNV(x.cooperative_matrix, x.cooperative_matrix_robust_buffer_access; x.next)

_CooperativeMatrixPropertiesNV(x::CooperativeMatrixPropertiesNV) = _CooperativeMatrixPropertiesNV(x.m_size, x.n_size, x.k_size, x.a_type, x.b_type, x.c_type, x.d_type, x.scope; x.next)

_PhysicalDeviceYcbcrImageArraysFeaturesEXT(x::PhysicalDeviceYcbcrImageArraysFeaturesEXT) = _PhysicalDeviceYcbcrImageArraysFeaturesEXT(x.ycbcr_image_arrays; x.next)

_ImageViewHandleInfoNVX(x::ImageViewHandleInfoNVX) = _ImageViewHandleInfoNVX(x.image_view, x.descriptor_type; x.next, x.sampler)

_PresentFrameTokenGGP(x::PresentFrameTokenGGP) = _PresentFrameTokenGGP(x.frame_token; x.next)

_PipelineCreationFeedbackCreateInfoEXT(x::PipelineCreationFeedbackCreateInfoEXT) = _PipelineCreationFeedbackCreateInfoEXT(x.pipeline_creation_feedback, x.pipeline_stage_creation_feedbacks; x.next)

_SurfaceFullScreenExclusiveInfoEXT(x::SurfaceFullScreenExclusiveInfoEXT) = _SurfaceFullScreenExclusiveInfoEXT(x.full_screen_exclusive; x.next)

_SurfaceFullScreenExclusiveWin32InfoEXT(x::SurfaceFullScreenExclusiveWin32InfoEXT) = _SurfaceFullScreenExclusiveWin32InfoEXT(x.hmonitor; x.next)

_SurfaceCapabilitiesFullScreenExclusiveEXT(x::SurfaceCapabilitiesFullScreenExclusiveEXT) = _SurfaceCapabilitiesFullScreenExclusiveEXT(x.full_screen_exclusive_supported; x.next)

_PhysicalDevicePerformanceQueryFeaturesKHR(x::PhysicalDevicePerformanceQueryFeaturesKHR) = _PhysicalDevicePerformanceQueryFeaturesKHR(x.performance_counter_query_pools, x.performance_counter_multiple_query_pools; x.next)

_QueryPoolPerformanceCreateInfoKHR(x::QueryPoolPerformanceCreateInfoKHR) = _QueryPoolPerformanceCreateInfoKHR(x.queue_family_index, x.counter_indices; x.next)

_AcquireProfilingLockInfoKHR(x::AcquireProfilingLockInfoKHR) = _AcquireProfilingLockInfoKHR(x.timeout; x.next, x.flags)

_PerformanceQuerySubmitInfoKHR(x::PerformanceQuerySubmitInfoKHR) = _PerformanceQuerySubmitInfoKHR(x.counter_pass_index; x.next)

_HeadlessSurfaceCreateInfoEXT(x::HeadlessSurfaceCreateInfoEXT) = _HeadlessSurfaceCreateInfoEXT(; x.next, x.flags)

_PhysicalDeviceCoverageReductionModeFeaturesNV(x::PhysicalDeviceCoverageReductionModeFeaturesNV) = _PhysicalDeviceCoverageReductionModeFeaturesNV(x.coverage_reduction_mode; x.next)

_PipelineCoverageReductionStateCreateInfoNV(x::PipelineCoverageReductionStateCreateInfoNV) = _PipelineCoverageReductionStateCreateInfoNV(x.coverage_reduction_mode; x.next, x.flags)

_PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL(x::PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL) = _PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL(x.shader_integer_functions_2; x.next)

_PerformanceValueINTEL(x::PerformanceValueINTEL) = _PerformanceValueINTEL(x.type, x.data)

_InitializePerformanceApiInfoINTEL(x::InitializePerformanceApiInfoINTEL) = _InitializePerformanceApiInfoINTEL(; x.next, x.user_data)

_QueryPoolPerformanceQueryCreateInfoINTEL(x::QueryPoolPerformanceQueryCreateInfoINTEL) = _QueryPoolPerformanceQueryCreateInfoINTEL(x.performance_counters_sampling; x.next)

_PerformanceMarkerInfoINTEL(x::PerformanceMarkerInfoINTEL) = _PerformanceMarkerInfoINTEL(x.marker; x.next)

_PerformanceStreamMarkerInfoINTEL(x::PerformanceStreamMarkerInfoINTEL) = _PerformanceStreamMarkerInfoINTEL(x.marker; x.next)

_PerformanceOverrideInfoINTEL(x::PerformanceOverrideInfoINTEL) = _PerformanceOverrideInfoINTEL(x.type, x.enable, x.parameter; x.next)

_PerformanceConfigurationAcquireInfoINTEL(x::PerformanceConfigurationAcquireInfoINTEL) = _PerformanceConfigurationAcquireInfoINTEL(x.type; x.next)

_PhysicalDeviceShaderClockFeaturesKHR(x::PhysicalDeviceShaderClockFeaturesKHR) = _PhysicalDeviceShaderClockFeaturesKHR(x.shader_subgroup_clock, x.shader_device_clock; x.next)

_PhysicalDeviceIndexTypeUint8FeaturesEXT(x::PhysicalDeviceIndexTypeUint8FeaturesEXT) = _PhysicalDeviceIndexTypeUint8FeaturesEXT(x.index_type_uint_8; x.next)

_PhysicalDeviceShaderSMBuiltinsFeaturesNV(x::PhysicalDeviceShaderSMBuiltinsFeaturesNV) = _PhysicalDeviceShaderSMBuiltinsFeaturesNV(x.shader_sm_builtins; x.next)

_PhysicalDeviceFragmentShaderInterlockFeaturesEXT(x::PhysicalDeviceFragmentShaderInterlockFeaturesEXT) = _PhysicalDeviceFragmentShaderInterlockFeaturesEXT(x.fragment_shader_sample_interlock, x.fragment_shader_pixel_interlock, x.fragment_shader_shading_rate_interlock; x.next)

_PhysicalDeviceSeparateDepthStencilLayoutsFeatures(x::PhysicalDeviceSeparateDepthStencilLayoutsFeatures) = _PhysicalDeviceSeparateDepthStencilLayoutsFeatures(x.separate_depth_stencil_layouts; x.next)

_AttachmentReferenceStencilLayout(x::AttachmentReferenceStencilLayout) = _AttachmentReferenceStencilLayout(x.stencil_layout; x.next)

_AttachmentDescriptionStencilLayout(x::AttachmentDescriptionStencilLayout) = _AttachmentDescriptionStencilLayout(x.stencil_initial_layout, x.stencil_final_layout; x.next)

_PhysicalDevicePipelineExecutablePropertiesFeaturesKHR(x::PhysicalDevicePipelineExecutablePropertiesFeaturesKHR) = _PhysicalDevicePipelineExecutablePropertiesFeaturesKHR(x.pipeline_executable_info; x.next)

_PipelineInfoKHR(x::PipelineInfoKHR) = _PipelineInfoKHR(x.pipeline; x.next)

_PipelineExecutableInfoKHR(x::PipelineExecutableInfoKHR) = _PipelineExecutableInfoKHR(x.pipeline, x.executable_index; x.next)

_PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT(x::PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT) = _PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT(x.shader_demote_to_helper_invocation; x.next)

_PhysicalDeviceTexelBufferAlignmentFeaturesEXT(x::PhysicalDeviceTexelBufferAlignmentFeaturesEXT) = _PhysicalDeviceTexelBufferAlignmentFeaturesEXT(x.texel_buffer_alignment; x.next)

_PhysicalDeviceSubgroupSizeControlFeaturesEXT(x::PhysicalDeviceSubgroupSizeControlFeaturesEXT) = _PhysicalDeviceSubgroupSizeControlFeaturesEXT(x.subgroup_size_control, x.compute_full_subgroups; x.next)

_MemoryOpaqueCaptureAddressAllocateInfo(x::MemoryOpaqueCaptureAddressAllocateInfo) = _MemoryOpaqueCaptureAddressAllocateInfo(x.opaque_capture_address; x.next)

_DeviceMemoryOpaqueCaptureAddressInfo(x::DeviceMemoryOpaqueCaptureAddressInfo) = _DeviceMemoryOpaqueCaptureAddressInfo(x.memory; x.next)

_PhysicalDeviceLineRasterizationFeaturesEXT(x::PhysicalDeviceLineRasterizationFeaturesEXT) = _PhysicalDeviceLineRasterizationFeaturesEXT(x.rectangular_lines, x.bresenham_lines, x.smooth_lines, x.stippled_rectangular_lines, x.stippled_bresenham_lines, x.stippled_smooth_lines; x.next)

_PipelineRasterizationLineStateCreateInfoEXT(x::PipelineRasterizationLineStateCreateInfoEXT) = _PipelineRasterizationLineStateCreateInfoEXT(x.line_rasterization_mode, x.stippled_line_enable, x.line_stipple_factor, x.line_stipple_pattern; x.next)

_PhysicalDevicePipelineCreationCacheControlFeaturesEXT(x::PhysicalDevicePipelineCreationCacheControlFeaturesEXT) = _PhysicalDevicePipelineCreationCacheControlFeaturesEXT(x.pipeline_creation_cache_control; x.next)

_PhysicalDeviceVulkan11Features(x::PhysicalDeviceVulkan11Features) = _PhysicalDeviceVulkan11Features(x.storage_buffer_16_bit_access, x.uniform_and_storage_buffer_16_bit_access, x.storage_push_constant_16, x.storage_input_output_16, x.multiview, x.multiview_geometry_shader, x.multiview_tessellation_shader, x.variable_pointers_storage_buffer, x.variable_pointers, x.protected_memory, x.sampler_ycbcr_conversion, x.shader_draw_parameters; x.next)

_PhysicalDeviceVulkan12Features(x::PhysicalDeviceVulkan12Features) = _PhysicalDeviceVulkan12Features(x.sampler_mirror_clamp_to_edge, x.draw_indirect_count, x.storage_buffer_8_bit_access, x.uniform_and_storage_buffer_8_bit_access, x.storage_push_constant_8, x.shader_buffer_int_64_atomics, x.shader_shared_int_64_atomics, x.shader_float_16, x.shader_int_8, x.descriptor_indexing, x.shader_input_attachment_array_dynamic_indexing, x.shader_uniform_texel_buffer_array_dynamic_indexing, x.shader_storage_texel_buffer_array_dynamic_indexing, x.shader_uniform_buffer_array_non_uniform_indexing, x.shader_sampled_image_array_non_uniform_indexing, x.shader_storage_buffer_array_non_uniform_indexing, x.shader_storage_image_array_non_uniform_indexing, x.shader_input_attachment_array_non_uniform_indexing, x.shader_uniform_texel_buffer_array_non_uniform_indexing, x.shader_storage_texel_buffer_array_non_uniform_indexing, x.descriptor_binding_uniform_buffer_update_after_bind, x.descriptor_binding_sampled_image_update_after_bind, x.descriptor_binding_storage_image_update_after_bind, x.descriptor_binding_storage_buffer_update_after_bind, x.descriptor_binding_uniform_texel_buffer_update_after_bind, x.descriptor_binding_storage_texel_buffer_update_after_bind, x.descriptor_binding_update_unused_while_pending, x.descriptor_binding_partially_bound, x.descriptor_binding_variable_descriptor_count, x.runtime_descriptor_array, x.sampler_filter_minmax, x.scalar_block_layout, x.imageless_framebuffer, x.uniform_buffer_standard_layout, x.shader_subgroup_extended_types, x.separate_depth_stencil_layouts, x.host_query_reset, x.timeline_semaphore, x.buffer_device_address, x.buffer_device_address_capture_replay, x.buffer_device_address_multi_device, x.vulkan_memory_model, x.vulkan_memory_model_device_scope, x.vulkan_memory_model_availability_visibility_chains, x.shader_output_viewport_index, x.shader_output_layer, x.subgroup_broadcast_dynamic_id; x.next)

_PipelineCompilerControlCreateInfoAMD(x::PipelineCompilerControlCreateInfoAMD) = _PipelineCompilerControlCreateInfoAMD(; x.next, x.compiler_control_flags)

_PhysicalDeviceCoherentMemoryFeaturesAMD(x::PhysicalDeviceCoherentMemoryFeaturesAMD) = _PhysicalDeviceCoherentMemoryFeaturesAMD(x.device_coherent_memory; x.next)

_SamplerCustomBorderColorCreateInfoEXT(x::SamplerCustomBorderColorCreateInfoEXT) = _SamplerCustomBorderColorCreateInfoEXT(x.custom_border_color, x.format; x.next)

_PhysicalDeviceCustomBorderColorFeaturesEXT(x::PhysicalDeviceCustomBorderColorFeaturesEXT) = _PhysicalDeviceCustomBorderColorFeaturesEXT(x.custom_border_colors, x.custom_border_color_without_format; x.next)

_AccelerationStructureGeometryTrianglesDataKHR(x::AccelerationStructureGeometryTrianglesDataKHR) = _AccelerationStructureGeometryTrianglesDataKHR(x.vertex_format, x.vertex_data, x.vertex_stride, x.max_vertex, x.index_type, x.index_data, x.transform_data; x.next)

_AccelerationStructureGeometryAabbsDataKHR(x::AccelerationStructureGeometryAabbsDataKHR) = _AccelerationStructureGeometryAabbsDataKHR(x.data, x.stride; x.next)

_AccelerationStructureGeometryInstancesDataKHR(x::AccelerationStructureGeometryInstancesDataKHR) = _AccelerationStructureGeometryInstancesDataKHR(x.array_of_pointers, x.data; x.next)

_AccelerationStructureGeometryKHR(x::AccelerationStructureGeometryKHR) = _AccelerationStructureGeometryKHR(x.geometry_type, x.geometry; x.next, x.flags)

_AccelerationStructureBuildGeometryInfoKHR(x::AccelerationStructureBuildGeometryInfoKHR) = _AccelerationStructureBuildGeometryInfoKHR(x.type, x.mode, x.scratch_data; x.next, x.flags, x.src_acceleration_structure, x.dst_acceleration_structure, geometries = convert_nonnull(Vector{_AccelerationStructureGeometryKHR}, x.geometries), geometries_2 = convert_nonnull(Vector{_AccelerationStructureGeometryKHR}, x.geometries_2))

_AccelerationStructureBuildRangeInfoKHR(x::AccelerationStructureBuildRangeInfoKHR) = _AccelerationStructureBuildRangeInfoKHR(x.primitive_count, x.primitive_offset, x.first_vertex, x.transform_offset)

_AccelerationStructureCreateInfoKHR(x::AccelerationStructureCreateInfoKHR) = _AccelerationStructureCreateInfoKHR(x.buffer, x.offset, x.size, x.type; x.next, x.create_flags, x.device_address)

_AabbPositionsKHR(x::AabbPositionsKHR) = _AabbPositionsKHR(x.min_x, x.min_y, x.min_z, x.max_x, x.max_y, x.max_z)

_TransformMatrixKHR(x::TransformMatrixKHR) = _TransformMatrixKHR(x.matrix)

_AccelerationStructureInstanceKHR(x::AccelerationStructureInstanceKHR) = _AccelerationStructureInstanceKHR(convert_nonnull(_TransformMatrixKHR, x.transform), x.instance_custom_index, x.mask, x.instance_shader_binding_table_record_offset, x.acceleration_structure_reference; x.flags)

_AccelerationStructureDeviceAddressInfoKHR(x::AccelerationStructureDeviceAddressInfoKHR) = _AccelerationStructureDeviceAddressInfoKHR(x.acceleration_structure; x.next)

_AccelerationStructureVersionInfoKHR(x::AccelerationStructureVersionInfoKHR) = _AccelerationStructureVersionInfoKHR(x.version_data; x.next)

_CopyAccelerationStructureInfoKHR(x::CopyAccelerationStructureInfoKHR) = _CopyAccelerationStructureInfoKHR(x.src, x.dst, x.mode; x.next)

_CopyAccelerationStructureToMemoryInfoKHR(x::CopyAccelerationStructureToMemoryInfoKHR) = _CopyAccelerationStructureToMemoryInfoKHR(x.src, x.dst, x.mode; x.next)

_CopyMemoryToAccelerationStructureInfoKHR(x::CopyMemoryToAccelerationStructureInfoKHR) = _CopyMemoryToAccelerationStructureInfoKHR(x.src, x.dst, x.mode; x.next)

_RayTracingPipelineInterfaceCreateInfoKHR(x::RayTracingPipelineInterfaceCreateInfoKHR) = _RayTracingPipelineInterfaceCreateInfoKHR(x.max_pipeline_ray_payload_size, x.max_pipeline_ray_hit_attribute_size; x.next)

_PipelineLibraryCreateInfoKHR(x::PipelineLibraryCreateInfoKHR) = _PipelineLibraryCreateInfoKHR(x.libraries; x.next)

_PhysicalDeviceExtendedDynamicStateFeaturesEXT(x::PhysicalDeviceExtendedDynamicStateFeaturesEXT) = _PhysicalDeviceExtendedDynamicStateFeaturesEXT(x.extended_dynamic_state; x.next)

_PhysicalDeviceExtendedDynamicState2FeaturesEXT(x::PhysicalDeviceExtendedDynamicState2FeaturesEXT) = _PhysicalDeviceExtendedDynamicState2FeaturesEXT(x.extended_dynamic_state_2, x.extended_dynamic_state_2_logic_op, x.extended_dynamic_state_2_patch_control_points; x.next)

_RenderPassTransformBeginInfoQCOM(x::RenderPassTransformBeginInfoQCOM) = _RenderPassTransformBeginInfoQCOM(x.transform; x.next)

_CopyCommandTransformInfoQCOM(x::CopyCommandTransformInfoQCOM) = _CopyCommandTransformInfoQCOM(x.transform; x.next)

_CommandBufferInheritanceRenderPassTransformInfoQCOM(x::CommandBufferInheritanceRenderPassTransformInfoQCOM) = _CommandBufferInheritanceRenderPassTransformInfoQCOM(x.transform, convert_nonnull(_Rect2D, x.render_area); x.next)

_PhysicalDeviceDiagnosticsConfigFeaturesNV(x::PhysicalDeviceDiagnosticsConfigFeaturesNV) = _PhysicalDeviceDiagnosticsConfigFeaturesNV(x.diagnostics_config; x.next)

_DeviceDiagnosticsConfigCreateInfoNV(x::DeviceDiagnosticsConfigCreateInfoNV) = _DeviceDiagnosticsConfigCreateInfoNV(; x.next, x.flags)

_PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR(x::PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR) = _PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR(x.shader_zero_initialize_workgroup_memory; x.next)

_PhysicalDeviceRobustness2FeaturesEXT(x::PhysicalDeviceRobustness2FeaturesEXT) = _PhysicalDeviceRobustness2FeaturesEXT(x.robust_buffer_access_2, x.robust_image_access_2, x.null_descriptor; x.next)

_PhysicalDeviceImageRobustnessFeaturesEXT(x::PhysicalDeviceImageRobustnessFeaturesEXT) = _PhysicalDeviceImageRobustnessFeaturesEXT(x.robust_image_access; x.next)

_PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR(x::PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR) = _PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR(x.workgroup_memory_explicit_layout, x.workgroup_memory_explicit_layout_scalar_block_layout, x.workgroup_memory_explicit_layout_8_bit_access, x.workgroup_memory_explicit_layout_16_bit_access; x.next)

_PhysicalDevicePortabilitySubsetFeaturesKHR(x::PhysicalDevicePortabilitySubsetFeaturesKHR) = _PhysicalDevicePortabilitySubsetFeaturesKHR(x.constant_alpha_color_blend_factors, x.events, x.image_view_format_reinterpretation, x.image_view_format_swizzle, x.image_view_2_d_on_3_d_image, x.multisample_array_image, x.mutable_comparison_samplers, x.point_polygons, x.sampler_mip_lod_bias, x.separate_stencil_mask_ref, x.shader_sample_rate_interpolation_functions, x.tessellation_isolines, x.tessellation_point_mode, x.triangle_fans, x.vertex_attribute_access_beyond_stride; x.next)

_PhysicalDevicePortabilitySubsetPropertiesKHR(x::PhysicalDevicePortabilitySubsetPropertiesKHR) = _PhysicalDevicePortabilitySubsetPropertiesKHR(x.min_vertex_input_binding_stride_alignment; x.next)

_PhysicalDevice4444FormatsFeaturesEXT(x::PhysicalDevice4444FormatsFeaturesEXT) = _PhysicalDevice4444FormatsFeaturesEXT(x.format_a4r4g4b4, x.format_a4b4g4r4; x.next)

_BufferCopy2KHR(x::BufferCopy2KHR) = _BufferCopy2KHR(x.src_offset, x.dst_offset, x.size; x.next)

_ImageCopy2KHR(x::ImageCopy2KHR) = _ImageCopy2KHR(convert_nonnull(_ImageSubresourceLayers, x.src_subresource), convert_nonnull(_Offset3D, x.src_offset), convert_nonnull(_ImageSubresourceLayers, x.dst_subresource), convert_nonnull(_Offset3D, x.dst_offset), convert_nonnull(_Extent3D, x.extent); x.next)

_ImageBlit2KHR(x::ImageBlit2KHR) = _ImageBlit2KHR(convert_nonnull(_ImageSubresourceLayers, x.src_subresource), convert_nonnull(NTuple{2, _Offset3D}, x.src_offsets), convert_nonnull(_ImageSubresourceLayers, x.dst_subresource), convert_nonnull(NTuple{2, _Offset3D}, x.dst_offsets); x.next)

_BufferImageCopy2KHR(x::BufferImageCopy2KHR) = _BufferImageCopy2KHR(x.buffer_offset, x.buffer_row_length, x.buffer_image_height, convert_nonnull(_ImageSubresourceLayers, x.image_subresource), convert_nonnull(_Offset3D, x.image_offset), convert_nonnull(_Extent3D, x.image_extent); x.next)

_ImageResolve2KHR(x::ImageResolve2KHR) = _ImageResolve2KHR(convert_nonnull(_ImageSubresourceLayers, x.src_subresource), convert_nonnull(_Offset3D, x.src_offset), convert_nonnull(_ImageSubresourceLayers, x.dst_subresource), convert_nonnull(_Offset3D, x.dst_offset), convert_nonnull(_Extent3D, x.extent); x.next)

_CopyBufferInfo2KHR(x::CopyBufferInfo2KHR) = _CopyBufferInfo2KHR(x.src_buffer, x.dst_buffer, convert_nonnull(Vector{_BufferCopy2KHR}, x.regions); x.next)

_CopyImageInfo2KHR(x::CopyImageInfo2KHR) = _CopyImageInfo2KHR(x.src_image, x.src_image_layout, x.dst_image, x.dst_image_layout, convert_nonnull(Vector{_ImageCopy2KHR}, x.regions); x.next)

_BlitImageInfo2KHR(x::BlitImageInfo2KHR) = _BlitImageInfo2KHR(x.src_image, x.src_image_layout, x.dst_image, x.dst_image_layout, convert_nonnull(Vector{_ImageBlit2KHR}, x.regions), x.filter; x.next)

_CopyBufferToImageInfo2KHR(x::CopyBufferToImageInfo2KHR) = _CopyBufferToImageInfo2KHR(x.src_buffer, x.dst_image, x.dst_image_layout, convert_nonnull(Vector{_BufferImageCopy2KHR}, x.regions); x.next)

_CopyImageToBufferInfo2KHR(x::CopyImageToBufferInfo2KHR) = _CopyImageToBufferInfo2KHR(x.src_image, x.src_image_layout, x.dst_buffer, convert_nonnull(Vector{_BufferImageCopy2KHR}, x.regions); x.next)

_ResolveImageInfo2KHR(x::ResolveImageInfo2KHR) = _ResolveImageInfo2KHR(x.src_image, x.src_image_layout, x.dst_image, x.dst_image_layout, convert_nonnull(Vector{_ImageResolve2KHR}, x.regions); x.next)

_PhysicalDeviceShaderImageAtomicInt64FeaturesEXT(x::PhysicalDeviceShaderImageAtomicInt64FeaturesEXT) = _PhysicalDeviceShaderImageAtomicInt64FeaturesEXT(x.shader_image_int_64_atomics, x.sparse_image_int_64_atomics; x.next)

_FragmentShadingRateAttachmentInfoKHR(x::FragmentShadingRateAttachmentInfoKHR) = _FragmentShadingRateAttachmentInfoKHR(convert_nonnull(_AttachmentReference2, x.fragment_shading_rate_attachment), convert_nonnull(_Extent2D, x.shading_rate_attachment_texel_size); x.next)

_PipelineFragmentShadingRateStateCreateInfoKHR(x::PipelineFragmentShadingRateStateCreateInfoKHR) = _PipelineFragmentShadingRateStateCreateInfoKHR(convert_nonnull(_Extent2D, x.fragment_size), x.combiner_ops; x.next)

_PhysicalDeviceFragmentShadingRateFeaturesKHR(x::PhysicalDeviceFragmentShadingRateFeaturesKHR) = _PhysicalDeviceFragmentShadingRateFeaturesKHR(x.pipeline_fragment_shading_rate, x.primitive_fragment_shading_rate, x.attachment_fragment_shading_rate; x.next)

_PhysicalDeviceShaderTerminateInvocationFeaturesKHR(x::PhysicalDeviceShaderTerminateInvocationFeaturesKHR) = _PhysicalDeviceShaderTerminateInvocationFeaturesKHR(x.shader_terminate_invocation; x.next)

_PhysicalDeviceFragmentShadingRateEnumsFeaturesNV(x::PhysicalDeviceFragmentShadingRateEnumsFeaturesNV) = _PhysicalDeviceFragmentShadingRateEnumsFeaturesNV(x.fragment_shading_rate_enums, x.supersample_fragment_shading_rates, x.no_invocation_fragment_shading_rates; x.next)

_PhysicalDeviceFragmentShadingRateEnumsPropertiesNV(x::PhysicalDeviceFragmentShadingRateEnumsPropertiesNV) = _PhysicalDeviceFragmentShadingRateEnumsPropertiesNV(x.max_fragment_shading_rate_invocation_count; x.next)

_PipelineFragmentShadingRateEnumStateCreateInfoNV(x::PipelineFragmentShadingRateEnumStateCreateInfoNV) = _PipelineFragmentShadingRateEnumStateCreateInfoNV(x.shading_rate_type, x.shading_rate, x.combiner_ops; x.next)

_AccelerationStructureBuildSizesInfoKHR(x::AccelerationStructureBuildSizesInfoKHR) = _AccelerationStructureBuildSizesInfoKHR(x.acceleration_structure_size, x.update_scratch_size, x.build_scratch_size; x.next)

_PhysicalDeviceMutableDescriptorTypeFeaturesVALVE(x::PhysicalDeviceMutableDescriptorTypeFeaturesVALVE) = _PhysicalDeviceMutableDescriptorTypeFeaturesVALVE(x.mutable_descriptor_type; x.next)

_MutableDescriptorTypeListVALVE(x::MutableDescriptorTypeListVALVE) = _MutableDescriptorTypeListVALVE(x.descriptor_types)

_MutableDescriptorTypeCreateInfoVALVE(x::MutableDescriptorTypeCreateInfoVALVE) = _MutableDescriptorTypeCreateInfoVALVE(convert_nonnull(Vector{_MutableDescriptorTypeListVALVE}, x.mutable_descriptor_type_lists); x.next)

_PhysicalDeviceVertexInputDynamicStateFeaturesEXT(x::PhysicalDeviceVertexInputDynamicStateFeaturesEXT) = _PhysicalDeviceVertexInputDynamicStateFeaturesEXT(x.vertex_input_dynamic_state; x.next)

_VertexInputBindingDescription2EXT(x::VertexInputBindingDescription2EXT) = _VertexInputBindingDescription2EXT(x.binding, x.stride, x.input_rate, x.divisor; x.next)

_VertexInputAttributeDescription2EXT(x::VertexInputAttributeDescription2EXT) = _VertexInputAttributeDescription2EXT(x.location, x.binding, x.format, x.offset; x.next)

_PhysicalDeviceColorWriteEnableFeaturesEXT(x::PhysicalDeviceColorWriteEnableFeaturesEXT) = _PhysicalDeviceColorWriteEnableFeaturesEXT(x.color_write_enable; x.next)

_PipelineColorWriteCreateInfoEXT(x::PipelineColorWriteCreateInfoEXT) = _PipelineColorWriteCreateInfoEXT(x.color_write_enables; x.next)

_MemoryBarrier2KHR(x::MemoryBarrier2KHR) = _MemoryBarrier2KHR(; x.next, x.src_stage_mask, x.src_access_mask, x.dst_stage_mask, x.dst_access_mask)

_ImageMemoryBarrier2KHR(x::ImageMemoryBarrier2KHR) = _ImageMemoryBarrier2KHR(x.old_layout, x.new_layout, x.src_queue_family_index, x.dst_queue_family_index, x.image, convert_nonnull(_ImageSubresourceRange, x.subresource_range); x.next, x.src_stage_mask, x.src_access_mask, x.dst_stage_mask, x.dst_access_mask)

_BufferMemoryBarrier2KHR(x::BufferMemoryBarrier2KHR) = _BufferMemoryBarrier2KHR(x.src_queue_family_index, x.dst_queue_family_index, x.buffer, x.offset, x.size; x.next, x.src_stage_mask, x.src_access_mask, x.dst_stage_mask, x.dst_access_mask)

_DependencyInfoKHR(x::DependencyInfoKHR) = _DependencyInfoKHR(convert_nonnull(Vector{_MemoryBarrier2KHR}, x.memory_barriers), convert_nonnull(Vector{_BufferMemoryBarrier2KHR}, x.buffer_memory_barriers), convert_nonnull(Vector{_ImageMemoryBarrier2KHR}, x.image_memory_barriers); x.next, x.dependency_flags)

_SemaphoreSubmitInfoKHR(x::SemaphoreSubmitInfoKHR) = _SemaphoreSubmitInfoKHR(x.semaphore, x.value, x.device_index; x.next, x.stage_mask)

_CommandBufferSubmitInfoKHR(x::CommandBufferSubmitInfoKHR) = _CommandBufferSubmitInfoKHR(x.command_buffer, x.device_mask; x.next)

_SubmitInfo2KHR(x::SubmitInfo2KHR) = _SubmitInfo2KHR(convert_nonnull(Vector{_SemaphoreSubmitInfoKHR}, x.wait_semaphore_infos), convert_nonnull(Vector{_CommandBufferSubmitInfoKHR}, x.command_buffer_infos), convert_nonnull(Vector{_SemaphoreSubmitInfoKHR}, x.signal_semaphore_infos); x.next, x.flags)

_PhysicalDeviceSynchronization2FeaturesKHR(x::PhysicalDeviceSynchronization2FeaturesKHR) = _PhysicalDeviceSynchronization2FeaturesKHR(x.synchronization2; x.next)

_VideoQueueFamilyProperties2KHR(x::VideoQueueFamilyProperties2KHR) = _VideoQueueFamilyProperties2KHR(x.video_codec_operations; x.next)

_VideoProfilesKHR(x::VideoProfilesKHR) = _VideoProfilesKHR(x.profile_count, convert_nonnull(_VideoProfileKHR, x.profiles); x.next)

_VideoProfileKHR(x::VideoProfileKHR) = _VideoProfileKHR(x.video_codec_operation, x.chroma_subsampling, x.luma_bit_depth, x.chroma_bit_depth; x.next)

_VideoGetMemoryPropertiesKHR(x::VideoGetMemoryPropertiesKHR) = _VideoGetMemoryPropertiesKHR(x.memory_bind_index, x.memory_requirements; x.next)

_VideoBindMemoryKHR(x::VideoBindMemoryKHR) = _VideoBindMemoryKHR(x.memory_bind_index, x.memory, x.memory_offset, x.memory_size; x.next)

_VideoPictureResourceKHR(x::VideoPictureResourceKHR) = _VideoPictureResourceKHR(convert_nonnull(_Offset2D, x.coded_offset), convert_nonnull(_Extent2D, x.coded_extent), x.base_array_layer, x.image_view_binding; x.next)

_VideoReferenceSlotKHR(x::VideoReferenceSlotKHR) = _VideoReferenceSlotKHR(x.slot_index, convert_nonnull(_VideoPictureResourceKHR, x.picture_resource); x.next)

_VideoDecodeInfoKHR(x::VideoDecodeInfoKHR) = _VideoDecodeInfoKHR(convert_nonnull(_Offset2D, x.coded_offset), convert_nonnull(_Extent2D, x.coded_extent), x.src_buffer, x.src_buffer_offset, x.src_buffer_range, convert_nonnull(_VideoPictureResourceKHR, x.dst_picture_resource), convert_nonnull(_VideoReferenceSlotKHR, x.setup_reference_slot), convert_nonnull(Vector{_VideoReferenceSlotKHR}, x.reference_slots); x.next, x.flags)

_VideoDecodeH264ProfileEXT(x::VideoDecodeH264ProfileEXT) = _VideoDecodeH264ProfileEXT(x.std_profile_idc, x.field_layout; x.next)

_VideoDecodeH264SessionCreateInfoEXT(x::VideoDecodeH264SessionCreateInfoEXT) = _VideoDecodeH264SessionCreateInfoEXT(x.flags, x.std_extension_version; x.next)

_VideoDecodeH264SessionParametersAddInfoEXT(x::VideoDecodeH264SessionParametersAddInfoEXT) = _VideoDecodeH264SessionParametersAddInfoEXT(; x.next, x.sps_std, x.pps_std)

_VideoDecodeH264SessionParametersCreateInfoEXT(x::VideoDecodeH264SessionParametersCreateInfoEXT) = _VideoDecodeH264SessionParametersCreateInfoEXT(x.max_sps_std_count, x.max_pps_std_count; x.next, parameters_add_info = convert_nonnull(_VideoDecodeH264SessionParametersAddInfoEXT, x.parameters_add_info))

_VideoDecodeH264PictureInfoEXT(x::VideoDecodeH264PictureInfoEXT) = _VideoDecodeH264PictureInfoEXT(x.std_picture_info, x.slices_data_offsets; x.next)

_VideoDecodeH264DpbSlotInfoEXT(x::VideoDecodeH264DpbSlotInfoEXT) = _VideoDecodeH264DpbSlotInfoEXT(x.std_reference_info; x.next)

_VideoDecodeH264MvcEXT(x::VideoDecodeH264MvcEXT) = _VideoDecodeH264MvcEXT(x.std_mvc; x.next)

_VideoDecodeH265ProfileEXT(x::VideoDecodeH265ProfileEXT) = _VideoDecodeH265ProfileEXT(x.std_profile_idc; x.next)

_VideoDecodeH265SessionCreateInfoEXT(x::VideoDecodeH265SessionCreateInfoEXT) = _VideoDecodeH265SessionCreateInfoEXT(x.flags, x.std_extension_version; x.next)

_VideoDecodeH265SessionParametersAddInfoEXT(x::VideoDecodeH265SessionParametersAddInfoEXT) = _VideoDecodeH265SessionParametersAddInfoEXT(; x.next, x.sps_std, x.pps_std)

_VideoDecodeH265SessionParametersCreateInfoEXT(x::VideoDecodeH265SessionParametersCreateInfoEXT) = _VideoDecodeH265SessionParametersCreateInfoEXT(x.max_sps_std_count, x.max_pps_std_count; x.next, parameters_add_info = convert_nonnull(_VideoDecodeH265SessionParametersAddInfoEXT, x.parameters_add_info))

_VideoDecodeH265PictureInfoEXT(x::VideoDecodeH265PictureInfoEXT) = _VideoDecodeH265PictureInfoEXT(x.std_picture_info, x.slices_data_offsets; x.next)

_VideoDecodeH265DpbSlotInfoEXT(x::VideoDecodeH265DpbSlotInfoEXT) = _VideoDecodeH265DpbSlotInfoEXT(x.std_reference_info; x.next)

_VideoSessionCreateInfoKHR(x::VideoSessionCreateInfoKHR) = _VideoSessionCreateInfoKHR(x.queue_family_index, convert_nonnull(_VideoProfileKHR, x.video_profile), x.picture_format, convert_nonnull(_Extent2D, x.max_coded_extent), x.reference_pictures_format, x.max_reference_pictures_slots_count, x.max_reference_pictures_active_count; x.next, x.flags)

_VideoSessionParametersCreateInfoKHR(x::VideoSessionParametersCreateInfoKHR) = _VideoSessionParametersCreateInfoKHR(x.video_session_parameters_template, x.video_session; x.next)

_VideoSessionParametersUpdateInfoKHR(x::VideoSessionParametersUpdateInfoKHR) = _VideoSessionParametersUpdateInfoKHR(x.update_sequence_count; x.next)

_VideoBeginCodingInfoKHR(x::VideoBeginCodingInfoKHR) = _VideoBeginCodingInfoKHR(x.codec_quality_preset, x.video_session, convert_nonnull(Vector{_VideoReferenceSlotKHR}, x.reference_slots); x.next, x.flags, x.video_session_parameters)

_VideoEndCodingInfoKHR(x::VideoEndCodingInfoKHR) = _VideoEndCodingInfoKHR(; x.next, x.flags)

_VideoCodingControlInfoKHR(x::VideoCodingControlInfoKHR) = _VideoCodingControlInfoKHR(; x.next, x.flags)

_VideoEncodeInfoKHR(x::VideoEncodeInfoKHR) = _VideoEncodeInfoKHR(x.quality_level, convert_nonnull(_Extent2D, x.coded_extent), x.dst_bitstream_buffer, x.dst_bitstream_buffer_offset, x.dst_bitstream_buffer_max_range, convert_nonnull(_VideoPictureResourceKHR, x.src_picture_resource), convert_nonnull(_VideoReferenceSlotKHR, x.setup_reference_slot), convert_nonnull(Vector{_VideoReferenceSlotKHR}, x.reference_slots); x.next, x.flags)

_VideoEncodeRateControlInfoKHR(x::VideoEncodeRateControlInfoKHR) = _VideoEncodeRateControlInfoKHR(x.flags, x.rate_control_mode, x.average_bitrate, x.peak_to_average_bitrate_ratio, x.frame_rate_numerator, x.frame_rate_denominator, x.virtual_buffer_size_in_ms; x.next)

_VideoEncodeH264CapabilitiesEXT(x::VideoEncodeH264CapabilitiesEXT) = _VideoEncodeH264CapabilitiesEXT(x.flags, x.input_mode_flags, x.output_mode_flags, convert_nonnull(_Extent2D, x.min_picture_size_in_mbs), convert_nonnull(_Extent2D, x.max_picture_size_in_mbs), convert_nonnull(_Extent2D, x.input_image_data_alignment), x.max_num_l_0_reference_for_p, x.max_num_l_0_reference_for_b, x.max_num_l_1_reference, x.quality_level_count, x.std_extension_version; x.next)

_VideoEncodeH264SessionCreateInfoEXT(x::VideoEncodeH264SessionCreateInfoEXT) = _VideoEncodeH264SessionCreateInfoEXT(x.flags, convert_nonnull(_Extent2D, x.max_picture_size_in_mbs), x.std_extension_version; x.next)

_VideoEncodeH264SessionParametersAddInfoEXT(x::VideoEncodeH264SessionParametersAddInfoEXT) = _VideoEncodeH264SessionParametersAddInfoEXT(; x.next, x.sps_std, x.pps_std)

_VideoEncodeH264SessionParametersCreateInfoEXT(x::VideoEncodeH264SessionParametersCreateInfoEXT) = _VideoEncodeH264SessionParametersCreateInfoEXT(x.max_sps_std_count, x.max_pps_std_count; x.next, parameters_add_info = convert_nonnull(_VideoEncodeH264SessionParametersAddInfoEXT, x.parameters_add_info))

_VideoEncodeH264DpbSlotInfoEXT(x::VideoEncodeH264DpbSlotInfoEXT) = _VideoEncodeH264DpbSlotInfoEXT(x.slot_index, x.std_picture_info; x.next)

_VideoEncodeH264VclFrameInfoEXT(x::VideoEncodeH264VclFrameInfoEXT) = _VideoEncodeH264VclFrameInfoEXT(convert_nonnull(Vector{_VideoEncodeH264DpbSlotInfoEXT}, x.ref_default_final_list_0_entries), convert_nonnull(Vector{_VideoEncodeH264DpbSlotInfoEXT}, x.ref_default_final_list_1_entries), convert_nonnull(Vector{_VideoEncodeH264NaluSliceEXT}, x.nalu_slice_entries), convert_nonnull(_VideoEncodeH264DpbSlotInfoEXT, x.current_picture_info); x.next)

_VideoEncodeH264EmitPictureParametersEXT(x::VideoEncodeH264EmitPictureParametersEXT) = _VideoEncodeH264EmitPictureParametersEXT(x.sps_id, x.emit_sps_enable, x.pps_id_entries; x.next)

_VideoEncodeH264ProfileEXT(x::VideoEncodeH264ProfileEXT) = _VideoEncodeH264ProfileEXT(x.std_profile_idc; x.next)

_VideoEncodeH264NaluSliceEXT(x::VideoEncodeH264NaluSliceEXT) = _VideoEncodeH264NaluSliceEXT(x.slice_header_std, x.mb_count, convert_nonnull(Vector{_VideoEncodeH264DpbSlotInfoEXT}, x.ref_final_list_0_entries), convert_nonnull(Vector{_VideoEncodeH264DpbSlotInfoEXT}, x.ref_final_list_1_entries), x.preceding_nalu_bytes, x.min_qp, x.max_qp; x.next)

_PhysicalDeviceInheritedViewportScissorFeaturesNV(x::PhysicalDeviceInheritedViewportScissorFeaturesNV) = _PhysicalDeviceInheritedViewportScissorFeaturesNV(x.inherited_viewport_scissor_2_d; x.next)

_CommandBufferInheritanceViewportScissorInfoNV(x::CommandBufferInheritanceViewportScissorInfoNV) = _CommandBufferInheritanceViewportScissorInfoNV(x.viewport_scissor_2_d, x.viewport_depth_count, convert_nonnull(_Viewport, x.viewport_depths); x.next)

_PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT(x::PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT) = _PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT(x.ycbcr_444_formats; x.next)

_PhysicalDeviceProvokingVertexFeaturesEXT(x::PhysicalDeviceProvokingVertexFeaturesEXT) = _PhysicalDeviceProvokingVertexFeaturesEXT(x.provoking_vertex_last, x.transform_feedback_preserves_provoking_vertex; x.next)

_PipelineRasterizationProvokingVertexStateCreateInfoEXT(x::PipelineRasterizationProvokingVertexStateCreateInfoEXT) = _PipelineRasterizationProvokingVertexStateCreateInfoEXT(x.provoking_vertex_mode; x.next)


convert(T::Type{_BaseOutStructure}, x::BaseOutStructure) = T(x)

convert(T::Type{_BaseInStructure}, x::BaseInStructure) = T(x)

convert(T::Type{_Offset2D}, x::Offset2D) = T(x)

convert(T::Type{_Offset3D}, x::Offset3D) = T(x)

convert(T::Type{_Extent2D}, x::Extent2D) = T(x)

convert(T::Type{_Extent3D}, x::Extent3D) = T(x)

convert(T::Type{_Viewport}, x::Viewport) = T(x)

convert(T::Type{_Rect2D}, x::Rect2D) = T(x)

convert(T::Type{_ClearRect}, x::ClearRect) = T(x)

convert(T::Type{_ComponentMapping}, x::ComponentMapping) = T(x)

convert(T::Type{_ApplicationInfo}, x::ApplicationInfo) = T(x)

convert(T::Type{_AllocationCallbacks}, x::AllocationCallbacks) = T(x)

convert(T::Type{_DeviceQueueCreateInfo}, x::DeviceQueueCreateInfo) = T(x)

convert(T::Type{_DeviceCreateInfo}, x::DeviceCreateInfo) = T(x)

convert(T::Type{_InstanceCreateInfo}, x::InstanceCreateInfo) = T(x)

convert(T::Type{_MemoryAllocateInfo}, x::MemoryAllocateInfo) = T(x)

convert(T::Type{_MappedMemoryRange}, x::MappedMemoryRange) = T(x)

convert(T::Type{_DescriptorBufferInfo}, x::DescriptorBufferInfo) = T(x)

convert(T::Type{_DescriptorImageInfo}, x::DescriptorImageInfo) = T(x)

convert(T::Type{_WriteDescriptorSet}, x::WriteDescriptorSet) = T(x)

convert(T::Type{_CopyDescriptorSet}, x::CopyDescriptorSet) = T(x)

convert(T::Type{_BufferCreateInfo}, x::BufferCreateInfo) = T(x)

convert(T::Type{_BufferViewCreateInfo}, x::BufferViewCreateInfo) = T(x)

convert(T::Type{_ImageSubresource}, x::ImageSubresource) = T(x)

convert(T::Type{_ImageSubresourceLayers}, x::ImageSubresourceLayers) = T(x)

convert(T::Type{_ImageSubresourceRange}, x::ImageSubresourceRange) = T(x)

convert(T::Type{_MemoryBarrier}, x::MemoryBarrier) = T(x)

convert(T::Type{_BufferMemoryBarrier}, x::BufferMemoryBarrier) = T(x)

convert(T::Type{_ImageMemoryBarrier}, x::ImageMemoryBarrier) = T(x)

convert(T::Type{_ImageCreateInfo}, x::ImageCreateInfo) = T(x)

convert(T::Type{_ImageViewCreateInfo}, x::ImageViewCreateInfo) = T(x)

convert(T::Type{_BufferCopy}, x::BufferCopy) = T(x)

convert(T::Type{_SparseMemoryBind}, x::SparseMemoryBind) = T(x)

convert(T::Type{_SparseImageMemoryBind}, x::SparseImageMemoryBind) = T(x)

convert(T::Type{_SparseBufferMemoryBindInfo}, x::SparseBufferMemoryBindInfo) = T(x)

convert(T::Type{_SparseImageOpaqueMemoryBindInfo}, x::SparseImageOpaqueMemoryBindInfo) = T(x)

convert(T::Type{_SparseImageMemoryBindInfo}, x::SparseImageMemoryBindInfo) = T(x)

convert(T::Type{_BindSparseInfo}, x::BindSparseInfo) = T(x)

convert(T::Type{_ImageCopy}, x::ImageCopy) = T(x)

convert(T::Type{_ImageBlit}, x::ImageBlit) = T(x)

convert(T::Type{_BufferImageCopy}, x::BufferImageCopy) = T(x)

convert(T::Type{_ImageResolve}, x::ImageResolve) = T(x)

convert(T::Type{_ShaderModuleCreateInfo}, x::ShaderModuleCreateInfo) = T(x)

convert(T::Type{_DescriptorSetLayoutBinding}, x::DescriptorSetLayoutBinding) = T(x)

convert(T::Type{_DescriptorSetLayoutCreateInfo}, x::DescriptorSetLayoutCreateInfo) = T(x)

convert(T::Type{_DescriptorPoolSize}, x::DescriptorPoolSize) = T(x)

convert(T::Type{_DescriptorPoolCreateInfo}, x::DescriptorPoolCreateInfo) = T(x)

convert(T::Type{_DescriptorSetAllocateInfo}, x::DescriptorSetAllocateInfo) = T(x)

convert(T::Type{_SpecializationMapEntry}, x::SpecializationMapEntry) = T(x)

convert(T::Type{_SpecializationInfo}, x::SpecializationInfo) = T(x)

convert(T::Type{_PipelineShaderStageCreateInfo}, x::PipelineShaderStageCreateInfo) = T(x)

convert(T::Type{_ComputePipelineCreateInfo}, x::ComputePipelineCreateInfo) = T(x)

convert(T::Type{_VertexInputBindingDescription}, x::VertexInputBindingDescription) = T(x)

convert(T::Type{_VertexInputAttributeDescription}, x::VertexInputAttributeDescription) = T(x)

convert(T::Type{_PipelineVertexInputStateCreateInfo}, x::PipelineVertexInputStateCreateInfo) = T(x)

convert(T::Type{_PipelineInputAssemblyStateCreateInfo}, x::PipelineInputAssemblyStateCreateInfo) = T(x)

convert(T::Type{_PipelineTessellationStateCreateInfo}, x::PipelineTessellationStateCreateInfo) = T(x)

convert(T::Type{_PipelineViewportStateCreateInfo}, x::PipelineViewportStateCreateInfo) = T(x)

convert(T::Type{_PipelineRasterizationStateCreateInfo}, x::PipelineRasterizationStateCreateInfo) = T(x)

convert(T::Type{_PipelineMultisampleStateCreateInfo}, x::PipelineMultisampleStateCreateInfo) = T(x)

convert(T::Type{_PipelineColorBlendAttachmentState}, x::PipelineColorBlendAttachmentState) = T(x)

convert(T::Type{_PipelineColorBlendStateCreateInfo}, x::PipelineColorBlendStateCreateInfo) = T(x)

convert(T::Type{_PipelineDynamicStateCreateInfo}, x::PipelineDynamicStateCreateInfo) = T(x)

convert(T::Type{_StencilOpState}, x::StencilOpState) = T(x)

convert(T::Type{_PipelineDepthStencilStateCreateInfo}, x::PipelineDepthStencilStateCreateInfo) = T(x)

convert(T::Type{_GraphicsPipelineCreateInfo}, x::GraphicsPipelineCreateInfo) = T(x)

convert(T::Type{_PipelineCacheCreateInfo}, x::PipelineCacheCreateInfo) = T(x)

convert(T::Type{_PushConstantRange}, x::PushConstantRange) = T(x)

convert(T::Type{_PipelineLayoutCreateInfo}, x::PipelineLayoutCreateInfo) = T(x)

convert(T::Type{_SamplerCreateInfo}, x::SamplerCreateInfo) = T(x)

convert(T::Type{_CommandPoolCreateInfo}, x::CommandPoolCreateInfo) = T(x)

convert(T::Type{_CommandBufferAllocateInfo}, x::CommandBufferAllocateInfo) = T(x)

convert(T::Type{_CommandBufferInheritanceInfo}, x::CommandBufferInheritanceInfo) = T(x)

convert(T::Type{_CommandBufferBeginInfo}, x::CommandBufferBeginInfo) = T(x)

convert(T::Type{_RenderPassBeginInfo}, x::RenderPassBeginInfo) = T(x)

convert(T::Type{_ClearDepthStencilValue}, x::ClearDepthStencilValue) = T(x)

convert(T::Type{_ClearAttachment}, x::ClearAttachment) = T(x)

convert(T::Type{_AttachmentDescription}, x::AttachmentDescription) = T(x)

convert(T::Type{_AttachmentReference}, x::AttachmentReference) = T(x)

convert(T::Type{_SubpassDescription}, x::SubpassDescription) = T(x)

convert(T::Type{_SubpassDependency}, x::SubpassDependency) = T(x)

convert(T::Type{_RenderPassCreateInfo}, x::RenderPassCreateInfo) = T(x)

convert(T::Type{_EventCreateInfo}, x::EventCreateInfo) = T(x)

convert(T::Type{_FenceCreateInfo}, x::FenceCreateInfo) = T(x)

convert(T::Type{_PhysicalDeviceFeatures}, x::PhysicalDeviceFeatures) = T(x)

convert(T::Type{_SemaphoreCreateInfo}, x::SemaphoreCreateInfo) = T(x)

convert(T::Type{_QueryPoolCreateInfo}, x::QueryPoolCreateInfo) = T(x)

convert(T::Type{_FramebufferCreateInfo}, x::FramebufferCreateInfo) = T(x)

convert(T::Type{_DrawIndirectCommand}, x::DrawIndirectCommand) = T(x)

convert(T::Type{_DrawIndexedIndirectCommand}, x::DrawIndexedIndirectCommand) = T(x)

convert(T::Type{_DispatchIndirectCommand}, x::DispatchIndirectCommand) = T(x)

convert(T::Type{_SubmitInfo}, x::SubmitInfo) = T(x)

convert(T::Type{_DisplayModeParametersKHR}, x::DisplayModeParametersKHR) = T(x)

convert(T::Type{_DisplayModeCreateInfoKHR}, x::DisplayModeCreateInfoKHR) = T(x)

convert(T::Type{_DisplaySurfaceCreateInfoKHR}, x::DisplaySurfaceCreateInfoKHR) = T(x)

convert(T::Type{_DisplayPresentInfoKHR}, x::DisplayPresentInfoKHR) = T(x)

convert(T::Type{_AndroidSurfaceCreateInfoKHR}, x::AndroidSurfaceCreateInfoKHR) = T(x)

convert(T::Type{_ViSurfaceCreateInfoNN}, x::ViSurfaceCreateInfoNN) = T(x)

convert(T::Type{_WaylandSurfaceCreateInfoKHR}, x::WaylandSurfaceCreateInfoKHR) = T(x)

convert(T::Type{_Win32SurfaceCreateInfoKHR}, x::Win32SurfaceCreateInfoKHR) = T(x)

convert(T::Type{_XlibSurfaceCreateInfoKHR}, x::XlibSurfaceCreateInfoKHR) = T(x)

convert(T::Type{_XcbSurfaceCreateInfoKHR}, x::XcbSurfaceCreateInfoKHR) = T(x)

convert(T::Type{_DirectFBSurfaceCreateInfoEXT}, x::DirectFBSurfaceCreateInfoEXT) = T(x)

convert(T::Type{_ImagePipeSurfaceCreateInfoFUCHSIA}, x::ImagePipeSurfaceCreateInfoFUCHSIA) = T(x)

convert(T::Type{_StreamDescriptorSurfaceCreateInfoGGP}, x::StreamDescriptorSurfaceCreateInfoGGP) = T(x)

convert(T::Type{_ScreenSurfaceCreateInfoQNX}, x::ScreenSurfaceCreateInfoQNX) = T(x)

convert(T::Type{_SwapchainCreateInfoKHR}, x::SwapchainCreateInfoKHR) = T(x)

convert(T::Type{_PresentInfoKHR}, x::PresentInfoKHR) = T(x)

convert(T::Type{_DebugReportCallbackCreateInfoEXT}, x::DebugReportCallbackCreateInfoEXT) = T(x)

convert(T::Type{_ValidationFlagsEXT}, x::ValidationFlagsEXT) = T(x)

convert(T::Type{_ValidationFeaturesEXT}, x::ValidationFeaturesEXT) = T(x)

convert(T::Type{_PipelineRasterizationStateRasterizationOrderAMD}, x::PipelineRasterizationStateRasterizationOrderAMD) = T(x)

convert(T::Type{_DebugMarkerObjectNameInfoEXT}, x::DebugMarkerObjectNameInfoEXT) = T(x)

convert(T::Type{_DebugMarkerObjectTagInfoEXT}, x::DebugMarkerObjectTagInfoEXT) = T(x)

convert(T::Type{_DebugMarkerMarkerInfoEXT}, x::DebugMarkerMarkerInfoEXT) = T(x)

convert(T::Type{_DedicatedAllocationImageCreateInfoNV}, x::DedicatedAllocationImageCreateInfoNV) = T(x)

convert(T::Type{_DedicatedAllocationBufferCreateInfoNV}, x::DedicatedAllocationBufferCreateInfoNV) = T(x)

convert(T::Type{_DedicatedAllocationMemoryAllocateInfoNV}, x::DedicatedAllocationMemoryAllocateInfoNV) = T(x)

convert(T::Type{_ExternalMemoryImageCreateInfoNV}, x::ExternalMemoryImageCreateInfoNV) = T(x)

convert(T::Type{_ExportMemoryAllocateInfoNV}, x::ExportMemoryAllocateInfoNV) = T(x)

convert(T::Type{_ImportMemoryWin32HandleInfoNV}, x::ImportMemoryWin32HandleInfoNV) = T(x)

convert(T::Type{_ExportMemoryWin32HandleInfoNV}, x::ExportMemoryWin32HandleInfoNV) = T(x)

convert(T::Type{_Win32KeyedMutexAcquireReleaseInfoNV}, x::Win32KeyedMutexAcquireReleaseInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceDeviceGeneratedCommandsFeaturesNV}, x::PhysicalDeviceDeviceGeneratedCommandsFeaturesNV) = T(x)

convert(T::Type{_DevicePrivateDataCreateInfoEXT}, x::DevicePrivateDataCreateInfoEXT) = T(x)

convert(T::Type{_PrivateDataSlotCreateInfoEXT}, x::PrivateDataSlotCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDevicePrivateDataFeaturesEXT}, x::PhysicalDevicePrivateDataFeaturesEXT) = T(x)

convert(T::Type{_GraphicsShaderGroupCreateInfoNV}, x::GraphicsShaderGroupCreateInfoNV) = T(x)

convert(T::Type{_GraphicsPipelineShaderGroupsCreateInfoNV}, x::GraphicsPipelineShaderGroupsCreateInfoNV) = T(x)

convert(T::Type{_BindShaderGroupIndirectCommandNV}, x::BindShaderGroupIndirectCommandNV) = T(x)

convert(T::Type{_BindIndexBufferIndirectCommandNV}, x::BindIndexBufferIndirectCommandNV) = T(x)

convert(T::Type{_BindVertexBufferIndirectCommandNV}, x::BindVertexBufferIndirectCommandNV) = T(x)

convert(T::Type{_SetStateFlagsIndirectCommandNV}, x::SetStateFlagsIndirectCommandNV) = T(x)

convert(T::Type{_IndirectCommandsStreamNV}, x::IndirectCommandsStreamNV) = T(x)

convert(T::Type{_IndirectCommandsLayoutTokenNV}, x::IndirectCommandsLayoutTokenNV) = T(x)

convert(T::Type{_IndirectCommandsLayoutCreateInfoNV}, x::IndirectCommandsLayoutCreateInfoNV) = T(x)

convert(T::Type{_GeneratedCommandsInfoNV}, x::GeneratedCommandsInfoNV) = T(x)

convert(T::Type{_GeneratedCommandsMemoryRequirementsInfoNV}, x::GeneratedCommandsMemoryRequirementsInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceFeatures2}, x::PhysicalDeviceFeatures2) = T(x)

convert(T::Type{_PhysicalDeviceImageFormatInfo2}, x::PhysicalDeviceImageFormatInfo2) = T(x)

convert(T::Type{_PhysicalDeviceSparseImageFormatInfo2}, x::PhysicalDeviceSparseImageFormatInfo2) = T(x)

convert(T::Type{_ConformanceVersion}, x::ConformanceVersion) = T(x)

convert(T::Type{_PresentRegionsKHR}, x::PresentRegionsKHR) = T(x)

convert(T::Type{_PresentRegionKHR}, x::PresentRegionKHR) = T(x)

convert(T::Type{_RectLayerKHR}, x::RectLayerKHR) = T(x)

convert(T::Type{_PhysicalDeviceVariablePointersFeatures}, x::PhysicalDeviceVariablePointersFeatures) = T(x)

convert(T::Type{_PhysicalDeviceExternalImageFormatInfo}, x::PhysicalDeviceExternalImageFormatInfo) = T(x)

convert(T::Type{_PhysicalDeviceExternalBufferInfo}, x::PhysicalDeviceExternalBufferInfo) = T(x)

convert(T::Type{_ExternalMemoryImageCreateInfo}, x::ExternalMemoryImageCreateInfo) = T(x)

convert(T::Type{_ExternalMemoryBufferCreateInfo}, x::ExternalMemoryBufferCreateInfo) = T(x)

convert(T::Type{_ExportMemoryAllocateInfo}, x::ExportMemoryAllocateInfo) = T(x)

convert(T::Type{_ImportMemoryWin32HandleInfoKHR}, x::ImportMemoryWin32HandleInfoKHR) = T(x)

convert(T::Type{_ExportMemoryWin32HandleInfoKHR}, x::ExportMemoryWin32HandleInfoKHR) = T(x)

convert(T::Type{_ImportMemoryZirconHandleInfoFUCHSIA}, x::ImportMemoryZirconHandleInfoFUCHSIA) = T(x)

convert(T::Type{_MemoryGetZirconHandleInfoFUCHSIA}, x::MemoryGetZirconHandleInfoFUCHSIA) = T(x)

convert(T::Type{_MemoryGetWin32HandleInfoKHR}, x::MemoryGetWin32HandleInfoKHR) = T(x)

convert(T::Type{_ImportMemoryFdInfoKHR}, x::ImportMemoryFdInfoKHR) = T(x)

convert(T::Type{_MemoryGetFdInfoKHR}, x::MemoryGetFdInfoKHR) = T(x)

convert(T::Type{_Win32KeyedMutexAcquireReleaseInfoKHR}, x::Win32KeyedMutexAcquireReleaseInfoKHR) = T(x)

convert(T::Type{_PhysicalDeviceExternalSemaphoreInfo}, x::PhysicalDeviceExternalSemaphoreInfo) = T(x)

convert(T::Type{_ExportSemaphoreCreateInfo}, x::ExportSemaphoreCreateInfo) = T(x)

convert(T::Type{_ImportSemaphoreWin32HandleInfoKHR}, x::ImportSemaphoreWin32HandleInfoKHR) = T(x)

convert(T::Type{_ExportSemaphoreWin32HandleInfoKHR}, x::ExportSemaphoreWin32HandleInfoKHR) = T(x)

convert(T::Type{_D3D12FenceSubmitInfoKHR}, x::D3D12FenceSubmitInfoKHR) = T(x)

convert(T::Type{_SemaphoreGetWin32HandleInfoKHR}, x::SemaphoreGetWin32HandleInfoKHR) = T(x)

convert(T::Type{_ImportSemaphoreFdInfoKHR}, x::ImportSemaphoreFdInfoKHR) = T(x)

convert(T::Type{_SemaphoreGetFdInfoKHR}, x::SemaphoreGetFdInfoKHR) = T(x)

convert(T::Type{_ImportSemaphoreZirconHandleInfoFUCHSIA}, x::ImportSemaphoreZirconHandleInfoFUCHSIA) = T(x)

convert(T::Type{_SemaphoreGetZirconHandleInfoFUCHSIA}, x::SemaphoreGetZirconHandleInfoFUCHSIA) = T(x)

convert(T::Type{_PhysicalDeviceExternalFenceInfo}, x::PhysicalDeviceExternalFenceInfo) = T(x)

convert(T::Type{_ExportFenceCreateInfo}, x::ExportFenceCreateInfo) = T(x)

convert(T::Type{_ImportFenceWin32HandleInfoKHR}, x::ImportFenceWin32HandleInfoKHR) = T(x)

convert(T::Type{_ExportFenceWin32HandleInfoKHR}, x::ExportFenceWin32HandleInfoKHR) = T(x)

convert(T::Type{_FenceGetWin32HandleInfoKHR}, x::FenceGetWin32HandleInfoKHR) = T(x)

convert(T::Type{_ImportFenceFdInfoKHR}, x::ImportFenceFdInfoKHR) = T(x)

convert(T::Type{_FenceGetFdInfoKHR}, x::FenceGetFdInfoKHR) = T(x)

convert(T::Type{_PhysicalDeviceMultiviewFeatures}, x::PhysicalDeviceMultiviewFeatures) = T(x)

convert(T::Type{_RenderPassMultiviewCreateInfo}, x::RenderPassMultiviewCreateInfo) = T(x)

convert(T::Type{_DisplayPowerInfoEXT}, x::DisplayPowerInfoEXT) = T(x)

convert(T::Type{_DeviceEventInfoEXT}, x::DeviceEventInfoEXT) = T(x)

convert(T::Type{_DisplayEventInfoEXT}, x::DisplayEventInfoEXT) = T(x)

convert(T::Type{_SwapchainCounterCreateInfoEXT}, x::SwapchainCounterCreateInfoEXT) = T(x)

convert(T::Type{_MemoryAllocateFlagsInfo}, x::MemoryAllocateFlagsInfo) = T(x)

convert(T::Type{_BindBufferMemoryInfo}, x::BindBufferMemoryInfo) = T(x)

convert(T::Type{_BindBufferMemoryDeviceGroupInfo}, x::BindBufferMemoryDeviceGroupInfo) = T(x)

convert(T::Type{_BindImageMemoryInfo}, x::BindImageMemoryInfo) = T(x)

convert(T::Type{_BindImageMemoryDeviceGroupInfo}, x::BindImageMemoryDeviceGroupInfo) = T(x)

convert(T::Type{_DeviceGroupRenderPassBeginInfo}, x::DeviceGroupRenderPassBeginInfo) = T(x)

convert(T::Type{_DeviceGroupCommandBufferBeginInfo}, x::DeviceGroupCommandBufferBeginInfo) = T(x)

convert(T::Type{_DeviceGroupSubmitInfo}, x::DeviceGroupSubmitInfo) = T(x)

convert(T::Type{_DeviceGroupBindSparseInfo}, x::DeviceGroupBindSparseInfo) = T(x)

convert(T::Type{_ImageSwapchainCreateInfoKHR}, x::ImageSwapchainCreateInfoKHR) = T(x)

convert(T::Type{_BindImageMemorySwapchainInfoKHR}, x::BindImageMemorySwapchainInfoKHR) = T(x)

convert(T::Type{_AcquireNextImageInfoKHR}, x::AcquireNextImageInfoKHR) = T(x)

convert(T::Type{_DeviceGroupPresentInfoKHR}, x::DeviceGroupPresentInfoKHR) = T(x)

convert(T::Type{_DeviceGroupDeviceCreateInfo}, x::DeviceGroupDeviceCreateInfo) = T(x)

convert(T::Type{_DeviceGroupSwapchainCreateInfoKHR}, x::DeviceGroupSwapchainCreateInfoKHR) = T(x)

convert(T::Type{_DescriptorUpdateTemplateEntry}, x::DescriptorUpdateTemplateEntry) = T(x)

convert(T::Type{_DescriptorUpdateTemplateCreateInfo}, x::DescriptorUpdateTemplateCreateInfo) = T(x)

convert(T::Type{_XYColorEXT}, x::XYColorEXT) = T(x)

convert(T::Type{_HdrMetadataEXT}, x::HdrMetadataEXT) = T(x)

convert(T::Type{_SwapchainDisplayNativeHdrCreateInfoAMD}, x::SwapchainDisplayNativeHdrCreateInfoAMD) = T(x)

convert(T::Type{_PresentTimesInfoGOOGLE}, x::PresentTimesInfoGOOGLE) = T(x)

convert(T::Type{_PresentTimeGOOGLE}, x::PresentTimeGOOGLE) = T(x)

convert(T::Type{_IOSSurfaceCreateInfoMVK}, x::IOSSurfaceCreateInfoMVK) = T(x)

convert(T::Type{_MacOSSurfaceCreateInfoMVK}, x::MacOSSurfaceCreateInfoMVK) = T(x)

convert(T::Type{_MetalSurfaceCreateInfoEXT}, x::MetalSurfaceCreateInfoEXT) = T(x)

convert(T::Type{_ViewportWScalingNV}, x::ViewportWScalingNV) = T(x)

convert(T::Type{_PipelineViewportWScalingStateCreateInfoNV}, x::PipelineViewportWScalingStateCreateInfoNV) = T(x)

convert(T::Type{_ViewportSwizzleNV}, x::ViewportSwizzleNV) = T(x)

convert(T::Type{_PipelineViewportSwizzleStateCreateInfoNV}, x::PipelineViewportSwizzleStateCreateInfoNV) = T(x)

convert(T::Type{_PipelineDiscardRectangleStateCreateInfoEXT}, x::PipelineDiscardRectangleStateCreateInfoEXT) = T(x)

convert(T::Type{_InputAttachmentAspectReference}, x::InputAttachmentAspectReference) = T(x)

convert(T::Type{_RenderPassInputAttachmentAspectCreateInfo}, x::RenderPassInputAttachmentAspectCreateInfo) = T(x)

convert(T::Type{_PhysicalDeviceSurfaceInfo2KHR}, x::PhysicalDeviceSurfaceInfo2KHR) = T(x)

convert(T::Type{_DisplayPlaneInfo2KHR}, x::DisplayPlaneInfo2KHR) = T(x)

convert(T::Type{_PhysicalDevice16BitStorageFeatures}, x::PhysicalDevice16BitStorageFeatures) = T(x)

convert(T::Type{_PhysicalDeviceShaderSubgroupExtendedTypesFeatures}, x::PhysicalDeviceShaderSubgroupExtendedTypesFeatures) = T(x)

convert(T::Type{_BufferMemoryRequirementsInfo2}, x::BufferMemoryRequirementsInfo2) = T(x)

convert(T::Type{_ImageMemoryRequirementsInfo2}, x::ImageMemoryRequirementsInfo2) = T(x)

convert(T::Type{_ImageSparseMemoryRequirementsInfo2}, x::ImageSparseMemoryRequirementsInfo2) = T(x)

convert(T::Type{_MemoryDedicatedAllocateInfo}, x::MemoryDedicatedAllocateInfo) = T(x)

convert(T::Type{_ImageViewUsageCreateInfo}, x::ImageViewUsageCreateInfo) = T(x)

convert(T::Type{_PipelineTessellationDomainOriginStateCreateInfo}, x::PipelineTessellationDomainOriginStateCreateInfo) = T(x)

convert(T::Type{_SamplerYcbcrConversionInfo}, x::SamplerYcbcrConversionInfo) = T(x)

convert(T::Type{_SamplerYcbcrConversionCreateInfo}, x::SamplerYcbcrConversionCreateInfo) = T(x)

convert(T::Type{_BindImagePlaneMemoryInfo}, x::BindImagePlaneMemoryInfo) = T(x)

convert(T::Type{_ImagePlaneMemoryRequirementsInfo}, x::ImagePlaneMemoryRequirementsInfo) = T(x)

convert(T::Type{_PhysicalDeviceSamplerYcbcrConversionFeatures}, x::PhysicalDeviceSamplerYcbcrConversionFeatures) = T(x)

convert(T::Type{_ConditionalRenderingBeginInfoEXT}, x::ConditionalRenderingBeginInfoEXT) = T(x)

convert(T::Type{_ProtectedSubmitInfo}, x::ProtectedSubmitInfo) = T(x)

convert(T::Type{_PhysicalDeviceProtectedMemoryFeatures}, x::PhysicalDeviceProtectedMemoryFeatures) = T(x)

convert(T::Type{_DeviceQueueInfo2}, x::DeviceQueueInfo2) = T(x)

convert(T::Type{_PipelineCoverageToColorStateCreateInfoNV}, x::PipelineCoverageToColorStateCreateInfoNV) = T(x)

convert(T::Type{_SampleLocationEXT}, x::SampleLocationEXT) = T(x)

convert(T::Type{_SampleLocationsInfoEXT}, x::SampleLocationsInfoEXT) = T(x)

convert(T::Type{_AttachmentSampleLocationsEXT}, x::AttachmentSampleLocationsEXT) = T(x)

convert(T::Type{_SubpassSampleLocationsEXT}, x::SubpassSampleLocationsEXT) = T(x)

convert(T::Type{_RenderPassSampleLocationsBeginInfoEXT}, x::RenderPassSampleLocationsBeginInfoEXT) = T(x)

convert(T::Type{_PipelineSampleLocationsStateCreateInfoEXT}, x::PipelineSampleLocationsStateCreateInfoEXT) = T(x)

convert(T::Type{_SamplerReductionModeCreateInfo}, x::SamplerReductionModeCreateInfo) = T(x)

convert(T::Type{_PhysicalDeviceBlendOperationAdvancedFeaturesEXT}, x::PhysicalDeviceBlendOperationAdvancedFeaturesEXT) = T(x)

convert(T::Type{_PipelineColorBlendAdvancedStateCreateInfoEXT}, x::PipelineColorBlendAdvancedStateCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceInlineUniformBlockFeaturesEXT}, x::PhysicalDeviceInlineUniformBlockFeaturesEXT) = T(x)

convert(T::Type{_WriteDescriptorSetInlineUniformBlockEXT}, x::WriteDescriptorSetInlineUniformBlockEXT) = T(x)

convert(T::Type{_DescriptorPoolInlineUniformBlockCreateInfoEXT}, x::DescriptorPoolInlineUniformBlockCreateInfoEXT) = T(x)

convert(T::Type{_PipelineCoverageModulationStateCreateInfoNV}, x::PipelineCoverageModulationStateCreateInfoNV) = T(x)

convert(T::Type{_ImageFormatListCreateInfo}, x::ImageFormatListCreateInfo) = T(x)

convert(T::Type{_ValidationCacheCreateInfoEXT}, x::ValidationCacheCreateInfoEXT) = T(x)

convert(T::Type{_ShaderModuleValidationCacheCreateInfoEXT}, x::ShaderModuleValidationCacheCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceShaderDrawParametersFeatures}, x::PhysicalDeviceShaderDrawParametersFeatures) = T(x)

convert(T::Type{_PhysicalDeviceShaderFloat16Int8Features}, x::PhysicalDeviceShaderFloat16Int8Features) = T(x)

convert(T::Type{_PhysicalDeviceHostQueryResetFeatures}, x::PhysicalDeviceHostQueryResetFeatures) = T(x)

convert(T::Type{_DeviceQueueGlobalPriorityCreateInfoEXT}, x::DeviceQueueGlobalPriorityCreateInfoEXT) = T(x)

convert(T::Type{_DebugUtilsObjectNameInfoEXT}, x::DebugUtilsObjectNameInfoEXT) = T(x)

convert(T::Type{_DebugUtilsObjectTagInfoEXT}, x::DebugUtilsObjectTagInfoEXT) = T(x)

convert(T::Type{_DebugUtilsLabelEXT}, x::DebugUtilsLabelEXT) = T(x)

convert(T::Type{_DebugUtilsMessengerCreateInfoEXT}, x::DebugUtilsMessengerCreateInfoEXT) = T(x)

convert(T::Type{_DebugUtilsMessengerCallbackDataEXT}, x::DebugUtilsMessengerCallbackDataEXT) = T(x)

convert(T::Type{_PhysicalDeviceDeviceMemoryReportFeaturesEXT}, x::PhysicalDeviceDeviceMemoryReportFeaturesEXT) = T(x)

convert(T::Type{_DeviceDeviceMemoryReportCreateInfoEXT}, x::DeviceDeviceMemoryReportCreateInfoEXT) = T(x)

convert(T::Type{_ImportMemoryHostPointerInfoEXT}, x::ImportMemoryHostPointerInfoEXT) = T(x)

convert(T::Type{_CalibratedTimestampInfoEXT}, x::CalibratedTimestampInfoEXT) = T(x)

convert(T::Type{_PipelineRasterizationConservativeStateCreateInfoEXT}, x::PipelineRasterizationConservativeStateCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceDescriptorIndexingFeatures}, x::PhysicalDeviceDescriptorIndexingFeatures) = T(x)

convert(T::Type{_DescriptorSetLayoutBindingFlagsCreateInfo}, x::DescriptorSetLayoutBindingFlagsCreateInfo) = T(x)

convert(T::Type{_DescriptorSetVariableDescriptorCountAllocateInfo}, x::DescriptorSetVariableDescriptorCountAllocateInfo) = T(x)

convert(T::Type{_AttachmentDescription2}, x::AttachmentDescription2) = T(x)

convert(T::Type{_AttachmentReference2}, x::AttachmentReference2) = T(x)

convert(T::Type{_SubpassDescription2}, x::SubpassDescription2) = T(x)

convert(T::Type{_SubpassDependency2}, x::SubpassDependency2) = T(x)

convert(T::Type{_RenderPassCreateInfo2}, x::RenderPassCreateInfo2) = T(x)

convert(T::Type{_SubpassBeginInfo}, x::SubpassBeginInfo) = T(x)

convert(T::Type{_SubpassEndInfo}, x::SubpassEndInfo) = T(x)

convert(T::Type{_PhysicalDeviceTimelineSemaphoreFeatures}, x::PhysicalDeviceTimelineSemaphoreFeatures) = T(x)

convert(T::Type{_SemaphoreTypeCreateInfo}, x::SemaphoreTypeCreateInfo) = T(x)

convert(T::Type{_TimelineSemaphoreSubmitInfo}, x::TimelineSemaphoreSubmitInfo) = T(x)

convert(T::Type{_SemaphoreWaitInfo}, x::SemaphoreWaitInfo) = T(x)

convert(T::Type{_SemaphoreSignalInfo}, x::SemaphoreSignalInfo) = T(x)

convert(T::Type{_VertexInputBindingDivisorDescriptionEXT}, x::VertexInputBindingDivisorDescriptionEXT) = T(x)

convert(T::Type{_PipelineVertexInputDivisorStateCreateInfoEXT}, x::PipelineVertexInputDivisorStateCreateInfoEXT) = T(x)

convert(T::Type{_ImportAndroidHardwareBufferInfoANDROID}, x::ImportAndroidHardwareBufferInfoANDROID) = T(x)

convert(T::Type{_MemoryGetAndroidHardwareBufferInfoANDROID}, x::MemoryGetAndroidHardwareBufferInfoANDROID) = T(x)

convert(T::Type{_CommandBufferInheritanceConditionalRenderingInfoEXT}, x::CommandBufferInheritanceConditionalRenderingInfoEXT) = T(x)

convert(T::Type{_ExternalFormatANDROID}, x::ExternalFormatANDROID) = T(x)

convert(T::Type{_PhysicalDevice8BitStorageFeatures}, x::PhysicalDevice8BitStorageFeatures) = T(x)

convert(T::Type{_PhysicalDeviceConditionalRenderingFeaturesEXT}, x::PhysicalDeviceConditionalRenderingFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceVulkanMemoryModelFeatures}, x::PhysicalDeviceVulkanMemoryModelFeatures) = T(x)

convert(T::Type{_PhysicalDeviceShaderAtomicInt64Features}, x::PhysicalDeviceShaderAtomicInt64Features) = T(x)

convert(T::Type{_PhysicalDeviceShaderAtomicFloatFeaturesEXT}, x::PhysicalDeviceShaderAtomicFloatFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceVertexAttributeDivisorFeaturesEXT}, x::PhysicalDeviceVertexAttributeDivisorFeaturesEXT) = T(x)

convert(T::Type{_SubpassDescriptionDepthStencilResolve}, x::SubpassDescriptionDepthStencilResolve) = T(x)

convert(T::Type{_ImageViewASTCDecodeModeEXT}, x::ImageViewASTCDecodeModeEXT) = T(x)

convert(T::Type{_PhysicalDeviceASTCDecodeFeaturesEXT}, x::PhysicalDeviceASTCDecodeFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceTransformFeedbackFeaturesEXT}, x::PhysicalDeviceTransformFeedbackFeaturesEXT) = T(x)

convert(T::Type{_PipelineRasterizationStateStreamCreateInfoEXT}, x::PipelineRasterizationStateStreamCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceRepresentativeFragmentTestFeaturesNV}, x::PhysicalDeviceRepresentativeFragmentTestFeaturesNV) = T(x)

convert(T::Type{_PipelineRepresentativeFragmentTestStateCreateInfoNV}, x::PipelineRepresentativeFragmentTestStateCreateInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceExclusiveScissorFeaturesNV}, x::PhysicalDeviceExclusiveScissorFeaturesNV) = T(x)

convert(T::Type{_PipelineViewportExclusiveScissorStateCreateInfoNV}, x::PipelineViewportExclusiveScissorStateCreateInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceCornerSampledImageFeaturesNV}, x::PhysicalDeviceCornerSampledImageFeaturesNV) = T(x)

convert(T::Type{_PhysicalDeviceComputeShaderDerivativesFeaturesNV}, x::PhysicalDeviceComputeShaderDerivativesFeaturesNV) = T(x)

convert(T::Type{_PhysicalDeviceFragmentShaderBarycentricFeaturesNV}, x::PhysicalDeviceFragmentShaderBarycentricFeaturesNV) = T(x)

convert(T::Type{_PhysicalDeviceShaderImageFootprintFeaturesNV}, x::PhysicalDeviceShaderImageFootprintFeaturesNV) = T(x)

convert(T::Type{_PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV}, x::PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV) = T(x)

convert(T::Type{_ShadingRatePaletteNV}, x::ShadingRatePaletteNV) = T(x)

convert(T::Type{_PipelineViewportShadingRateImageStateCreateInfoNV}, x::PipelineViewportShadingRateImageStateCreateInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceShadingRateImageFeaturesNV}, x::PhysicalDeviceShadingRateImageFeaturesNV) = T(x)

convert(T::Type{_CoarseSampleLocationNV}, x::CoarseSampleLocationNV) = T(x)

convert(T::Type{_CoarseSampleOrderCustomNV}, x::CoarseSampleOrderCustomNV) = T(x)

convert(T::Type{_PipelineViewportCoarseSampleOrderStateCreateInfoNV}, x::PipelineViewportCoarseSampleOrderStateCreateInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceMeshShaderFeaturesNV}, x::PhysicalDeviceMeshShaderFeaturesNV) = T(x)

convert(T::Type{_DrawMeshTasksIndirectCommandNV}, x::DrawMeshTasksIndirectCommandNV) = T(x)

convert(T::Type{_RayTracingShaderGroupCreateInfoNV}, x::RayTracingShaderGroupCreateInfoNV) = T(x)

convert(T::Type{_RayTracingShaderGroupCreateInfoKHR}, x::RayTracingShaderGroupCreateInfoKHR) = T(x)

convert(T::Type{_RayTracingPipelineCreateInfoNV}, x::RayTracingPipelineCreateInfoNV) = T(x)

convert(T::Type{_RayTracingPipelineCreateInfoKHR}, x::RayTracingPipelineCreateInfoKHR) = T(x)

convert(T::Type{_GeometryTrianglesNV}, x::GeometryTrianglesNV) = T(x)

convert(T::Type{_GeometryAABBNV}, x::GeometryAABBNV) = T(x)

convert(T::Type{_GeometryDataNV}, x::GeometryDataNV) = T(x)

convert(T::Type{_GeometryNV}, x::GeometryNV) = T(x)

convert(T::Type{_AccelerationStructureInfoNV}, x::AccelerationStructureInfoNV) = T(x)

convert(T::Type{_AccelerationStructureCreateInfoNV}, x::AccelerationStructureCreateInfoNV) = T(x)

convert(T::Type{_BindAccelerationStructureMemoryInfoNV}, x::BindAccelerationStructureMemoryInfoNV) = T(x)

convert(T::Type{_WriteDescriptorSetAccelerationStructureKHR}, x::WriteDescriptorSetAccelerationStructureKHR) = T(x)

convert(T::Type{_WriteDescriptorSetAccelerationStructureNV}, x::WriteDescriptorSetAccelerationStructureNV) = T(x)

convert(T::Type{_AccelerationStructureMemoryRequirementsInfoNV}, x::AccelerationStructureMemoryRequirementsInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceAccelerationStructureFeaturesKHR}, x::PhysicalDeviceAccelerationStructureFeaturesKHR) = T(x)

convert(T::Type{_PhysicalDeviceRayTracingPipelineFeaturesKHR}, x::PhysicalDeviceRayTracingPipelineFeaturesKHR) = T(x)

convert(T::Type{_PhysicalDeviceRayQueryFeaturesKHR}, x::PhysicalDeviceRayQueryFeaturesKHR) = T(x)

convert(T::Type{_StridedDeviceAddressRegionKHR}, x::StridedDeviceAddressRegionKHR) = T(x)

convert(T::Type{_TraceRaysIndirectCommandKHR}, x::TraceRaysIndirectCommandKHR) = T(x)

convert(T::Type{_PhysicalDeviceImageDrmFormatModifierInfoEXT}, x::PhysicalDeviceImageDrmFormatModifierInfoEXT) = T(x)

convert(T::Type{_ImageDrmFormatModifierListCreateInfoEXT}, x::ImageDrmFormatModifierListCreateInfoEXT) = T(x)

convert(T::Type{_ImageDrmFormatModifierExplicitCreateInfoEXT}, x::ImageDrmFormatModifierExplicitCreateInfoEXT) = T(x)

convert(T::Type{_ImageStencilUsageCreateInfo}, x::ImageStencilUsageCreateInfo) = T(x)

convert(T::Type{_DeviceMemoryOverallocationCreateInfoAMD}, x::DeviceMemoryOverallocationCreateInfoAMD) = T(x)

convert(T::Type{_PhysicalDeviceFragmentDensityMapFeaturesEXT}, x::PhysicalDeviceFragmentDensityMapFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceFragmentDensityMap2FeaturesEXT}, x::PhysicalDeviceFragmentDensityMap2FeaturesEXT) = T(x)

convert(T::Type{_RenderPassFragmentDensityMapCreateInfoEXT}, x::RenderPassFragmentDensityMapCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceScalarBlockLayoutFeatures}, x::PhysicalDeviceScalarBlockLayoutFeatures) = T(x)

convert(T::Type{_SurfaceProtectedCapabilitiesKHR}, x::SurfaceProtectedCapabilitiesKHR) = T(x)

convert(T::Type{_PhysicalDeviceUniformBufferStandardLayoutFeatures}, x::PhysicalDeviceUniformBufferStandardLayoutFeatures) = T(x)

convert(T::Type{_PhysicalDeviceDepthClipEnableFeaturesEXT}, x::PhysicalDeviceDepthClipEnableFeaturesEXT) = T(x)

convert(T::Type{_PipelineRasterizationDepthClipStateCreateInfoEXT}, x::PipelineRasterizationDepthClipStateCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceMemoryPriorityFeaturesEXT}, x::PhysicalDeviceMemoryPriorityFeaturesEXT) = T(x)

convert(T::Type{_MemoryPriorityAllocateInfoEXT}, x::MemoryPriorityAllocateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceBufferDeviceAddressFeatures}, x::PhysicalDeviceBufferDeviceAddressFeatures) = T(x)

convert(T::Type{_PhysicalDeviceBufferDeviceAddressFeaturesEXT}, x::PhysicalDeviceBufferDeviceAddressFeaturesEXT) = T(x)

convert(T::Type{_BufferDeviceAddressInfo}, x::BufferDeviceAddressInfo) = T(x)

convert(T::Type{_BufferOpaqueCaptureAddressCreateInfo}, x::BufferOpaqueCaptureAddressCreateInfo) = T(x)

convert(T::Type{_BufferDeviceAddressCreateInfoEXT}, x::BufferDeviceAddressCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceImageViewImageFormatInfoEXT}, x::PhysicalDeviceImageViewImageFormatInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceImagelessFramebufferFeatures}, x::PhysicalDeviceImagelessFramebufferFeatures) = T(x)

convert(T::Type{_FramebufferAttachmentsCreateInfo}, x::FramebufferAttachmentsCreateInfo) = T(x)

convert(T::Type{_FramebufferAttachmentImageInfo}, x::FramebufferAttachmentImageInfo) = T(x)

convert(T::Type{_RenderPassAttachmentBeginInfo}, x::RenderPassAttachmentBeginInfo) = T(x)

convert(T::Type{_PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT}, x::PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceCooperativeMatrixFeaturesNV}, x::PhysicalDeviceCooperativeMatrixFeaturesNV) = T(x)

convert(T::Type{_CooperativeMatrixPropertiesNV}, x::CooperativeMatrixPropertiesNV) = T(x)

convert(T::Type{_PhysicalDeviceYcbcrImageArraysFeaturesEXT}, x::PhysicalDeviceYcbcrImageArraysFeaturesEXT) = T(x)

convert(T::Type{_ImageViewHandleInfoNVX}, x::ImageViewHandleInfoNVX) = T(x)

convert(T::Type{_PresentFrameTokenGGP}, x::PresentFrameTokenGGP) = T(x)

convert(T::Type{_PipelineCreationFeedbackCreateInfoEXT}, x::PipelineCreationFeedbackCreateInfoEXT) = T(x)

convert(T::Type{_SurfaceFullScreenExclusiveInfoEXT}, x::SurfaceFullScreenExclusiveInfoEXT) = T(x)

convert(T::Type{_SurfaceFullScreenExclusiveWin32InfoEXT}, x::SurfaceFullScreenExclusiveWin32InfoEXT) = T(x)

convert(T::Type{_SurfaceCapabilitiesFullScreenExclusiveEXT}, x::SurfaceCapabilitiesFullScreenExclusiveEXT) = T(x)

convert(T::Type{_PhysicalDevicePerformanceQueryFeaturesKHR}, x::PhysicalDevicePerformanceQueryFeaturesKHR) = T(x)

convert(T::Type{_QueryPoolPerformanceCreateInfoKHR}, x::QueryPoolPerformanceCreateInfoKHR) = T(x)

convert(T::Type{_AcquireProfilingLockInfoKHR}, x::AcquireProfilingLockInfoKHR) = T(x)

convert(T::Type{_PerformanceQuerySubmitInfoKHR}, x::PerformanceQuerySubmitInfoKHR) = T(x)

convert(T::Type{_HeadlessSurfaceCreateInfoEXT}, x::HeadlessSurfaceCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceCoverageReductionModeFeaturesNV}, x::PhysicalDeviceCoverageReductionModeFeaturesNV) = T(x)

convert(T::Type{_PipelineCoverageReductionStateCreateInfoNV}, x::PipelineCoverageReductionStateCreateInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL}, x::PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL) = T(x)

convert(T::Type{_PerformanceValueINTEL}, x::PerformanceValueINTEL) = T(x)

convert(T::Type{_InitializePerformanceApiInfoINTEL}, x::InitializePerformanceApiInfoINTEL) = T(x)

convert(T::Type{_QueryPoolPerformanceQueryCreateInfoINTEL}, x::QueryPoolPerformanceQueryCreateInfoINTEL) = T(x)

convert(T::Type{_PerformanceMarkerInfoINTEL}, x::PerformanceMarkerInfoINTEL) = T(x)

convert(T::Type{_PerformanceStreamMarkerInfoINTEL}, x::PerformanceStreamMarkerInfoINTEL) = T(x)

convert(T::Type{_PerformanceOverrideInfoINTEL}, x::PerformanceOverrideInfoINTEL) = T(x)

convert(T::Type{_PerformanceConfigurationAcquireInfoINTEL}, x::PerformanceConfigurationAcquireInfoINTEL) = T(x)

convert(T::Type{_PhysicalDeviceShaderClockFeaturesKHR}, x::PhysicalDeviceShaderClockFeaturesKHR) = T(x)

convert(T::Type{_PhysicalDeviceIndexTypeUint8FeaturesEXT}, x::PhysicalDeviceIndexTypeUint8FeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceShaderSMBuiltinsFeaturesNV}, x::PhysicalDeviceShaderSMBuiltinsFeaturesNV) = T(x)

convert(T::Type{_PhysicalDeviceFragmentShaderInterlockFeaturesEXT}, x::PhysicalDeviceFragmentShaderInterlockFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceSeparateDepthStencilLayoutsFeatures}, x::PhysicalDeviceSeparateDepthStencilLayoutsFeatures) = T(x)

convert(T::Type{_AttachmentReferenceStencilLayout}, x::AttachmentReferenceStencilLayout) = T(x)

convert(T::Type{_AttachmentDescriptionStencilLayout}, x::AttachmentDescriptionStencilLayout) = T(x)

convert(T::Type{_PhysicalDevicePipelineExecutablePropertiesFeaturesKHR}, x::PhysicalDevicePipelineExecutablePropertiesFeaturesKHR) = T(x)

convert(T::Type{_PipelineInfoKHR}, x::PipelineInfoKHR) = T(x)

convert(T::Type{_PipelineExecutableInfoKHR}, x::PipelineExecutableInfoKHR) = T(x)

convert(T::Type{_PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT}, x::PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceTexelBufferAlignmentFeaturesEXT}, x::PhysicalDeviceTexelBufferAlignmentFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceSubgroupSizeControlFeaturesEXT}, x::PhysicalDeviceSubgroupSizeControlFeaturesEXT) = T(x)

convert(T::Type{_MemoryOpaqueCaptureAddressAllocateInfo}, x::MemoryOpaqueCaptureAddressAllocateInfo) = T(x)

convert(T::Type{_DeviceMemoryOpaqueCaptureAddressInfo}, x::DeviceMemoryOpaqueCaptureAddressInfo) = T(x)

convert(T::Type{_PhysicalDeviceLineRasterizationFeaturesEXT}, x::PhysicalDeviceLineRasterizationFeaturesEXT) = T(x)

convert(T::Type{_PipelineRasterizationLineStateCreateInfoEXT}, x::PipelineRasterizationLineStateCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDevicePipelineCreationCacheControlFeaturesEXT}, x::PhysicalDevicePipelineCreationCacheControlFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceVulkan11Features}, x::PhysicalDeviceVulkan11Features) = T(x)

convert(T::Type{_PhysicalDeviceVulkan12Features}, x::PhysicalDeviceVulkan12Features) = T(x)

convert(T::Type{_PipelineCompilerControlCreateInfoAMD}, x::PipelineCompilerControlCreateInfoAMD) = T(x)

convert(T::Type{_PhysicalDeviceCoherentMemoryFeaturesAMD}, x::PhysicalDeviceCoherentMemoryFeaturesAMD) = T(x)

convert(T::Type{_SamplerCustomBorderColorCreateInfoEXT}, x::SamplerCustomBorderColorCreateInfoEXT) = T(x)

convert(T::Type{_PhysicalDeviceCustomBorderColorFeaturesEXT}, x::PhysicalDeviceCustomBorderColorFeaturesEXT) = T(x)

convert(T::Type{_AccelerationStructureGeometryTrianglesDataKHR}, x::AccelerationStructureGeometryTrianglesDataKHR) = T(x)

convert(T::Type{_AccelerationStructureGeometryAabbsDataKHR}, x::AccelerationStructureGeometryAabbsDataKHR) = T(x)

convert(T::Type{_AccelerationStructureGeometryInstancesDataKHR}, x::AccelerationStructureGeometryInstancesDataKHR) = T(x)

convert(T::Type{_AccelerationStructureGeometryKHR}, x::AccelerationStructureGeometryKHR) = T(x)

convert(T::Type{_AccelerationStructureBuildGeometryInfoKHR}, x::AccelerationStructureBuildGeometryInfoKHR) = T(x)

convert(T::Type{_AccelerationStructureBuildRangeInfoKHR}, x::AccelerationStructureBuildRangeInfoKHR) = T(x)

convert(T::Type{_AccelerationStructureCreateInfoKHR}, x::AccelerationStructureCreateInfoKHR) = T(x)

convert(T::Type{_AabbPositionsKHR}, x::AabbPositionsKHR) = T(x)

convert(T::Type{_TransformMatrixKHR}, x::TransformMatrixKHR) = T(x)

convert(T::Type{_AccelerationStructureInstanceKHR}, x::AccelerationStructureInstanceKHR) = T(x)

convert(T::Type{_AccelerationStructureDeviceAddressInfoKHR}, x::AccelerationStructureDeviceAddressInfoKHR) = T(x)

convert(T::Type{_AccelerationStructureVersionInfoKHR}, x::AccelerationStructureVersionInfoKHR) = T(x)

convert(T::Type{_CopyAccelerationStructureInfoKHR}, x::CopyAccelerationStructureInfoKHR) = T(x)

convert(T::Type{_CopyAccelerationStructureToMemoryInfoKHR}, x::CopyAccelerationStructureToMemoryInfoKHR) = T(x)

convert(T::Type{_CopyMemoryToAccelerationStructureInfoKHR}, x::CopyMemoryToAccelerationStructureInfoKHR) = T(x)

convert(T::Type{_RayTracingPipelineInterfaceCreateInfoKHR}, x::RayTracingPipelineInterfaceCreateInfoKHR) = T(x)

convert(T::Type{_PipelineLibraryCreateInfoKHR}, x::PipelineLibraryCreateInfoKHR) = T(x)

convert(T::Type{_PhysicalDeviceExtendedDynamicStateFeaturesEXT}, x::PhysicalDeviceExtendedDynamicStateFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceExtendedDynamicState2FeaturesEXT}, x::PhysicalDeviceExtendedDynamicState2FeaturesEXT) = T(x)

convert(T::Type{_RenderPassTransformBeginInfoQCOM}, x::RenderPassTransformBeginInfoQCOM) = T(x)

convert(T::Type{_CopyCommandTransformInfoQCOM}, x::CopyCommandTransformInfoQCOM) = T(x)

convert(T::Type{_CommandBufferInheritanceRenderPassTransformInfoQCOM}, x::CommandBufferInheritanceRenderPassTransformInfoQCOM) = T(x)

convert(T::Type{_PhysicalDeviceDiagnosticsConfigFeaturesNV}, x::PhysicalDeviceDiagnosticsConfigFeaturesNV) = T(x)

convert(T::Type{_DeviceDiagnosticsConfigCreateInfoNV}, x::DeviceDiagnosticsConfigCreateInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR}, x::PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR) = T(x)

convert(T::Type{_PhysicalDeviceRobustness2FeaturesEXT}, x::PhysicalDeviceRobustness2FeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceImageRobustnessFeaturesEXT}, x::PhysicalDeviceImageRobustnessFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR}, x::PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR) = T(x)

convert(T::Type{_PhysicalDevicePortabilitySubsetFeaturesKHR}, x::PhysicalDevicePortabilitySubsetFeaturesKHR) = T(x)

convert(T::Type{_PhysicalDevicePortabilitySubsetPropertiesKHR}, x::PhysicalDevicePortabilitySubsetPropertiesKHR) = T(x)

convert(T::Type{_PhysicalDevice4444FormatsFeaturesEXT}, x::PhysicalDevice4444FormatsFeaturesEXT) = T(x)

convert(T::Type{_BufferCopy2KHR}, x::BufferCopy2KHR) = T(x)

convert(T::Type{_ImageCopy2KHR}, x::ImageCopy2KHR) = T(x)

convert(T::Type{_ImageBlit2KHR}, x::ImageBlit2KHR) = T(x)

convert(T::Type{_BufferImageCopy2KHR}, x::BufferImageCopy2KHR) = T(x)

convert(T::Type{_ImageResolve2KHR}, x::ImageResolve2KHR) = T(x)

convert(T::Type{_CopyBufferInfo2KHR}, x::CopyBufferInfo2KHR) = T(x)

convert(T::Type{_CopyImageInfo2KHR}, x::CopyImageInfo2KHR) = T(x)

convert(T::Type{_BlitImageInfo2KHR}, x::BlitImageInfo2KHR) = T(x)

convert(T::Type{_CopyBufferToImageInfo2KHR}, x::CopyBufferToImageInfo2KHR) = T(x)

convert(T::Type{_CopyImageToBufferInfo2KHR}, x::CopyImageToBufferInfo2KHR) = T(x)

convert(T::Type{_ResolveImageInfo2KHR}, x::ResolveImageInfo2KHR) = T(x)

convert(T::Type{_PhysicalDeviceShaderImageAtomicInt64FeaturesEXT}, x::PhysicalDeviceShaderImageAtomicInt64FeaturesEXT) = T(x)

convert(T::Type{_FragmentShadingRateAttachmentInfoKHR}, x::FragmentShadingRateAttachmentInfoKHR) = T(x)

convert(T::Type{_PipelineFragmentShadingRateStateCreateInfoKHR}, x::PipelineFragmentShadingRateStateCreateInfoKHR) = T(x)

convert(T::Type{_PhysicalDeviceFragmentShadingRateFeaturesKHR}, x::PhysicalDeviceFragmentShadingRateFeaturesKHR) = T(x)

convert(T::Type{_PhysicalDeviceShaderTerminateInvocationFeaturesKHR}, x::PhysicalDeviceShaderTerminateInvocationFeaturesKHR) = T(x)

convert(T::Type{_PhysicalDeviceFragmentShadingRateEnumsFeaturesNV}, x::PhysicalDeviceFragmentShadingRateEnumsFeaturesNV) = T(x)

convert(T::Type{_PhysicalDeviceFragmentShadingRateEnumsPropertiesNV}, x::PhysicalDeviceFragmentShadingRateEnumsPropertiesNV) = T(x)

convert(T::Type{_PipelineFragmentShadingRateEnumStateCreateInfoNV}, x::PipelineFragmentShadingRateEnumStateCreateInfoNV) = T(x)

convert(T::Type{_AccelerationStructureBuildSizesInfoKHR}, x::AccelerationStructureBuildSizesInfoKHR) = T(x)

convert(T::Type{_PhysicalDeviceMutableDescriptorTypeFeaturesVALVE}, x::PhysicalDeviceMutableDescriptorTypeFeaturesVALVE) = T(x)

convert(T::Type{_MutableDescriptorTypeListVALVE}, x::MutableDescriptorTypeListVALVE) = T(x)

convert(T::Type{_MutableDescriptorTypeCreateInfoVALVE}, x::MutableDescriptorTypeCreateInfoVALVE) = T(x)

convert(T::Type{_PhysicalDeviceVertexInputDynamicStateFeaturesEXT}, x::PhysicalDeviceVertexInputDynamicStateFeaturesEXT) = T(x)

convert(T::Type{_VertexInputBindingDescription2EXT}, x::VertexInputBindingDescription2EXT) = T(x)

convert(T::Type{_VertexInputAttributeDescription2EXT}, x::VertexInputAttributeDescription2EXT) = T(x)

convert(T::Type{_PhysicalDeviceColorWriteEnableFeaturesEXT}, x::PhysicalDeviceColorWriteEnableFeaturesEXT) = T(x)

convert(T::Type{_PipelineColorWriteCreateInfoEXT}, x::PipelineColorWriteCreateInfoEXT) = T(x)

convert(T::Type{_MemoryBarrier2KHR}, x::MemoryBarrier2KHR) = T(x)

convert(T::Type{_ImageMemoryBarrier2KHR}, x::ImageMemoryBarrier2KHR) = T(x)

convert(T::Type{_BufferMemoryBarrier2KHR}, x::BufferMemoryBarrier2KHR) = T(x)

convert(T::Type{_DependencyInfoKHR}, x::DependencyInfoKHR) = T(x)

convert(T::Type{_SemaphoreSubmitInfoKHR}, x::SemaphoreSubmitInfoKHR) = T(x)

convert(T::Type{_CommandBufferSubmitInfoKHR}, x::CommandBufferSubmitInfoKHR) = T(x)

convert(T::Type{_SubmitInfo2KHR}, x::SubmitInfo2KHR) = T(x)

convert(T::Type{_PhysicalDeviceSynchronization2FeaturesKHR}, x::PhysicalDeviceSynchronization2FeaturesKHR) = T(x)

convert(T::Type{_VideoQueueFamilyProperties2KHR}, x::VideoQueueFamilyProperties2KHR) = T(x)

convert(T::Type{_VideoProfilesKHR}, x::VideoProfilesKHR) = T(x)

convert(T::Type{_VideoProfileKHR}, x::VideoProfileKHR) = T(x)

convert(T::Type{_VideoGetMemoryPropertiesKHR}, x::VideoGetMemoryPropertiesKHR) = T(x)

convert(T::Type{_VideoBindMemoryKHR}, x::VideoBindMemoryKHR) = T(x)

convert(T::Type{_VideoPictureResourceKHR}, x::VideoPictureResourceKHR) = T(x)

convert(T::Type{_VideoReferenceSlotKHR}, x::VideoReferenceSlotKHR) = T(x)

convert(T::Type{_VideoDecodeInfoKHR}, x::VideoDecodeInfoKHR) = T(x)

convert(T::Type{_VideoDecodeH264ProfileEXT}, x::VideoDecodeH264ProfileEXT) = T(x)

convert(T::Type{_VideoDecodeH264SessionCreateInfoEXT}, x::VideoDecodeH264SessionCreateInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH264SessionParametersAddInfoEXT}, x::VideoDecodeH264SessionParametersAddInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH264SessionParametersCreateInfoEXT}, x::VideoDecodeH264SessionParametersCreateInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH264PictureInfoEXT}, x::VideoDecodeH264PictureInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH264DpbSlotInfoEXT}, x::VideoDecodeH264DpbSlotInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH264MvcEXT}, x::VideoDecodeH264MvcEXT) = T(x)

convert(T::Type{_VideoDecodeH265ProfileEXT}, x::VideoDecodeH265ProfileEXT) = T(x)

convert(T::Type{_VideoDecodeH265SessionCreateInfoEXT}, x::VideoDecodeH265SessionCreateInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH265SessionParametersAddInfoEXT}, x::VideoDecodeH265SessionParametersAddInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH265SessionParametersCreateInfoEXT}, x::VideoDecodeH265SessionParametersCreateInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH265PictureInfoEXT}, x::VideoDecodeH265PictureInfoEXT) = T(x)

convert(T::Type{_VideoDecodeH265DpbSlotInfoEXT}, x::VideoDecodeH265DpbSlotInfoEXT) = T(x)

convert(T::Type{_VideoSessionCreateInfoKHR}, x::VideoSessionCreateInfoKHR) = T(x)

convert(T::Type{_VideoSessionParametersCreateInfoKHR}, x::VideoSessionParametersCreateInfoKHR) = T(x)

convert(T::Type{_VideoSessionParametersUpdateInfoKHR}, x::VideoSessionParametersUpdateInfoKHR) = T(x)

convert(T::Type{_VideoBeginCodingInfoKHR}, x::VideoBeginCodingInfoKHR) = T(x)

convert(T::Type{_VideoEndCodingInfoKHR}, x::VideoEndCodingInfoKHR) = T(x)

convert(T::Type{_VideoCodingControlInfoKHR}, x::VideoCodingControlInfoKHR) = T(x)

convert(T::Type{_VideoEncodeInfoKHR}, x::VideoEncodeInfoKHR) = T(x)

convert(T::Type{_VideoEncodeRateControlInfoKHR}, x::VideoEncodeRateControlInfoKHR) = T(x)

convert(T::Type{_VideoEncodeH264CapabilitiesEXT}, x::VideoEncodeH264CapabilitiesEXT) = T(x)

convert(T::Type{_VideoEncodeH264SessionCreateInfoEXT}, x::VideoEncodeH264SessionCreateInfoEXT) = T(x)

convert(T::Type{_VideoEncodeH264SessionParametersAddInfoEXT}, x::VideoEncodeH264SessionParametersAddInfoEXT) = T(x)

convert(T::Type{_VideoEncodeH264SessionParametersCreateInfoEXT}, x::VideoEncodeH264SessionParametersCreateInfoEXT) = T(x)

convert(T::Type{_VideoEncodeH264DpbSlotInfoEXT}, x::VideoEncodeH264DpbSlotInfoEXT) = T(x)

convert(T::Type{_VideoEncodeH264VclFrameInfoEXT}, x::VideoEncodeH264VclFrameInfoEXT) = T(x)

convert(T::Type{_VideoEncodeH264EmitPictureParametersEXT}, x::VideoEncodeH264EmitPictureParametersEXT) = T(x)

convert(T::Type{_VideoEncodeH264ProfileEXT}, x::VideoEncodeH264ProfileEXT) = T(x)

convert(T::Type{_VideoEncodeH264NaluSliceEXT}, x::VideoEncodeH264NaluSliceEXT) = T(x)

convert(T::Type{_PhysicalDeviceInheritedViewportScissorFeaturesNV}, x::PhysicalDeviceInheritedViewportScissorFeaturesNV) = T(x)

convert(T::Type{_CommandBufferInheritanceViewportScissorInfoNV}, x::CommandBufferInheritanceViewportScissorInfoNV) = T(x)

convert(T::Type{_PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT}, x::PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT) = T(x)

convert(T::Type{_PhysicalDeviceProvokingVertexFeaturesEXT}, x::PhysicalDeviceProvokingVertexFeaturesEXT) = T(x)

convert(T::Type{_PipelineRasterizationProvokingVertexStateCreateInfoEXT}, x::PipelineRasterizationProvokingVertexStateCreateInfoEXT) = T(x)


create_instance(create_info::InstanceCreateInfo; allocator = C_NULL) = create_instance(convert(_InstanceCreateInfo, create_info); allocator)

create_device(physical_device::PhysicalDevice, create_info::DeviceCreateInfo; allocator = C_NULL) = create_device(physical_device, convert(_DeviceCreateInfo, create_info); allocator)

queue_submit(queue::Queue, submits::AbstractArray{<:SubmitInfo}; fence = C_NULL) = queue_submit(queue, convert(Vector{_SubmitInfo}, submits); fence)

allocate_memory(device::Device, allocate_info::MemoryAllocateInfo; allocator = C_NULL) = allocate_memory(device, convert(_MemoryAllocateInfo, allocate_info); allocator)

flush_mapped_memory_ranges(device::Device, memory_ranges::AbstractArray{<:MappedMemoryRange}) = flush_mapped_memory_ranges(device, convert(Vector{_MappedMemoryRange}, memory_ranges))

invalidate_mapped_memory_ranges(device::Device, memory_ranges::AbstractArray{<:MappedMemoryRange}) = invalidate_mapped_memory_ranges(device, convert(Vector{_MappedMemoryRange}, memory_ranges))

queue_bind_sparse(queue::Queue, bind_info::AbstractArray{<:BindSparseInfo}; fence = C_NULL) = queue_bind_sparse(queue, convert(Vector{_BindSparseInfo}, bind_info); fence)

create_fence(device::Device, create_info::FenceCreateInfo; allocator = C_NULL) = create_fence(device, convert(_FenceCreateInfo, create_info); allocator)

create_semaphore(device::Device, create_info::SemaphoreCreateInfo; allocator = C_NULL) = create_semaphore(device, convert(_SemaphoreCreateInfo, create_info); allocator)

create_event(device::Device, create_info::EventCreateInfo; allocator = C_NULL) = create_event(device, convert(_EventCreateInfo, create_info); allocator)

create_query_pool(device::Device, create_info::QueryPoolCreateInfo; allocator = C_NULL) = create_query_pool(device, convert(_QueryPoolCreateInfo, create_info); allocator)

create_buffer(device::Device, create_info::BufferCreateInfo; allocator = C_NULL) = create_buffer(device, convert(_BufferCreateInfo, create_info); allocator)

create_buffer_view(device::Device, create_info::BufferViewCreateInfo; allocator = C_NULL) = create_buffer_view(device, convert(_BufferViewCreateInfo, create_info); allocator)

create_image(device::Device, create_info::ImageCreateInfo; allocator = C_NULL) = create_image(device, convert(_ImageCreateInfo, create_info); allocator)

get_image_subresource_layout(device::Device, image::Image, subresource::ImageSubresource) = get_image_subresource_layout(device, image, convert(_ImageSubresource, subresource))

create_image_view(device::Device, create_info::ImageViewCreateInfo; allocator = C_NULL) = create_image_view(device, convert(_ImageViewCreateInfo, create_info); allocator)

create_shader_module(device::Device, create_info::ShaderModuleCreateInfo; allocator = C_NULL) = create_shader_module(device, convert(_ShaderModuleCreateInfo, create_info); allocator)

create_pipeline_cache(device::Device, create_info::PipelineCacheCreateInfo; allocator = C_NULL) = create_pipeline_cache(device, convert(_PipelineCacheCreateInfo, create_info); allocator)

create_graphics_pipelines(device::Device, create_infos::AbstractArray{<:GraphicsPipelineCreateInfo}; pipeline_cache = C_NULL, allocator = C_NULL) = create_graphics_pipelines(device, convert(Vector{_GraphicsPipelineCreateInfo}, create_infos); pipeline_cache, allocator)

create_compute_pipelines(device::Device, create_infos::AbstractArray{<:ComputePipelineCreateInfo}; pipeline_cache = C_NULL, allocator = C_NULL) = create_compute_pipelines(device, convert(Vector{_ComputePipelineCreateInfo}, create_infos); pipeline_cache, allocator)

create_pipeline_layout(device::Device, create_info::PipelineLayoutCreateInfo; allocator = C_NULL) = create_pipeline_layout(device, convert(_PipelineLayoutCreateInfo, create_info); allocator)

create_sampler(device::Device, create_info::SamplerCreateInfo; allocator = C_NULL) = create_sampler(device, convert(_SamplerCreateInfo, create_info); allocator)

create_descriptor_set_layout(device::Device, create_info::DescriptorSetLayoutCreateInfo; allocator = C_NULL) = create_descriptor_set_layout(device, convert(_DescriptorSetLayoutCreateInfo, create_info); allocator)

create_descriptor_pool(device::Device, create_info::DescriptorPoolCreateInfo; allocator = C_NULL) = create_descriptor_pool(device, convert(_DescriptorPoolCreateInfo, create_info); allocator)

allocate_descriptor_sets(device::Device, allocate_info::DescriptorSetAllocateInfo) = allocate_descriptor_sets(device, convert(_DescriptorSetAllocateInfo, allocate_info))

update_descriptor_sets(device::Device, descriptor_writes::AbstractArray{<:WriteDescriptorSet}, descriptor_copies::AbstractArray{<:CopyDescriptorSet}) = update_descriptor_sets(device, convert(Vector{_WriteDescriptorSet}, descriptor_writes), convert(Vector{_CopyDescriptorSet}, descriptor_copies))

create_framebuffer(device::Device, create_info::FramebufferCreateInfo; allocator = C_NULL) = create_framebuffer(device, convert(_FramebufferCreateInfo, create_info); allocator)

create_render_pass(device::Device, create_info::RenderPassCreateInfo; allocator = C_NULL) = create_render_pass(device, convert(_RenderPassCreateInfo, create_info); allocator)

create_command_pool(device::Device, create_info::CommandPoolCreateInfo; allocator = C_NULL) = create_command_pool(device, convert(_CommandPoolCreateInfo, create_info); allocator)

allocate_command_buffers(device::Device, allocate_info::CommandBufferAllocateInfo) = allocate_command_buffers(device, convert(_CommandBufferAllocateInfo, allocate_info))

begin_command_buffer(command_buffer::CommandBuffer, begin_info::CommandBufferBeginInfo) = begin_command_buffer(command_buffer, convert(_CommandBufferBeginInfo, begin_info))

cmd_set_viewport(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}) = cmd_set_viewport(command_buffer, convert(Vector{_Viewport}, viewports))

cmd_set_scissor(command_buffer::CommandBuffer, scissors::AbstractArray{<:Rect2D}) = cmd_set_scissor(command_buffer, convert(Vector{_Rect2D}, scissors))

cmd_copy_buffer(command_buffer::CommandBuffer, src_buffer::Buffer, dst_buffer::Buffer, regions::AbstractArray{<:BufferCopy}) = cmd_copy_buffer(command_buffer, src_buffer, dst_buffer, convert(Vector{_BufferCopy}, regions))

cmd_copy_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray{<:ImageCopy}) = cmd_copy_image(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, convert(Vector{_ImageCopy}, regions))

cmd_blit_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray{<:ImageBlit}, filter::Filter) = cmd_blit_image(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, convert(Vector{_ImageBlit}, regions), filter)

cmd_copy_buffer_to_image(command_buffer::CommandBuffer, src_buffer::Buffer, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray{<:BufferImageCopy}) = cmd_copy_buffer_to_image(command_buffer, src_buffer, dst_image, dst_image_layout, convert(Vector{_BufferImageCopy}, regions))

cmd_copy_image_to_buffer(command_buffer::CommandBuffer, src_image::Image, src_image_layout::ImageLayout, dst_buffer::Buffer, regions::AbstractArray{<:BufferImageCopy}) = cmd_copy_image_to_buffer(command_buffer, src_image, src_image_layout, dst_buffer, convert(Vector{_BufferImageCopy}, regions))

cmd_clear_color_image(command_buffer::CommandBuffer, image::Image, image_layout::ImageLayout, color::VkClearColorValue, ranges::AbstractArray{<:ImageSubresourceRange}) = cmd_clear_color_image(command_buffer, image, image_layout, color, convert(Vector{_ImageSubresourceRange}, ranges))

cmd_clear_depth_stencil_image(command_buffer::CommandBuffer, image::Image, image_layout::ImageLayout, depth_stencil::ClearDepthStencilValue, ranges::AbstractArray{<:ImageSubresourceRange}) = cmd_clear_depth_stencil_image(command_buffer, image, image_layout, convert(_ClearDepthStencilValue, depth_stencil), convert(Vector{_ImageSubresourceRange}, ranges))

cmd_clear_attachments(command_buffer::CommandBuffer, attachments::AbstractArray{<:ClearAttachment}, rects::AbstractArray{<:ClearRect}) = cmd_clear_attachments(command_buffer, convert(Vector{_ClearAttachment}, attachments), convert(Vector{_ClearRect}, rects))

cmd_resolve_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray{<:ImageResolve}) = cmd_resolve_image(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, convert(Vector{_ImageResolve}, regions))

cmd_wait_events(command_buffer::CommandBuffer, events::AbstractArray{<:Event}, memory_barriers::AbstractArray{<:MemoryBarrier}, buffer_memory_barriers::AbstractArray{<:BufferMemoryBarrier}, image_memory_barriers::AbstractArray{<:ImageMemoryBarrier}; src_stage_mask = 0, dst_stage_mask = 0) = cmd_wait_events(command_buffer, events, convert(Vector{_MemoryBarrier}, memory_barriers), convert(Vector{_BufferMemoryBarrier}, buffer_memory_barriers), convert(Vector{_ImageMemoryBarrier}, image_memory_barriers); src_stage_mask, dst_stage_mask)

cmd_pipeline_barrier(command_buffer::CommandBuffer, src_stage_mask::PipelineStageFlag, dst_stage_mask::PipelineStageFlag, memory_barriers::AbstractArray{<:MemoryBarrier}, buffer_memory_barriers::AbstractArray{<:BufferMemoryBarrier}, image_memory_barriers::AbstractArray{<:ImageMemoryBarrier}; dependency_flags = 0) = cmd_pipeline_barrier(command_buffer, src_stage_mask, dst_stage_mask, convert(Vector{_MemoryBarrier}, memory_barriers), convert(Vector{_BufferMemoryBarrier}, buffer_memory_barriers), convert(Vector{_ImageMemoryBarrier}, image_memory_barriers); dependency_flags)

cmd_begin_conditional_rendering_ext(command_buffer::CommandBuffer, conditional_rendering_begin::ConditionalRenderingBeginInfoEXT) = cmd_begin_conditional_rendering_ext(command_buffer, convert(_ConditionalRenderingBeginInfoEXT, conditional_rendering_begin))

cmd_begin_render_pass(command_buffer::CommandBuffer, render_pass_begin::RenderPassBeginInfo, contents::SubpassContents) = cmd_begin_render_pass(command_buffer, convert(_RenderPassBeginInfo, render_pass_begin), contents)

create_android_surface_khr(instance::Instance, create_info::AndroidSurfaceCreateInfoKHR; allocator = C_NULL) = create_android_surface_khr(instance, convert(_AndroidSurfaceCreateInfoKHR, create_info); allocator)

create_display_mode_khr(physical_device::PhysicalDevice, display::DisplayKHR, create_info::DisplayModeCreateInfoKHR; allocator = C_NULL) = create_display_mode_khr(physical_device, display, convert(_DisplayModeCreateInfoKHR, create_info); allocator)

create_display_plane_surface_khr(instance::Instance, create_info::DisplaySurfaceCreateInfoKHR; allocator = C_NULL) = create_display_plane_surface_khr(instance, convert(_DisplaySurfaceCreateInfoKHR, create_info); allocator)

create_shared_swapchains_khr(device::Device, create_infos::AbstractArray{<:SwapchainCreateInfoKHR}; allocator = C_NULL) = create_shared_swapchains_khr(device, convert(Vector{_SwapchainCreateInfoKHR}, create_infos); allocator)

create_swapchain_khr(device::Device, create_info::SwapchainCreateInfoKHR; allocator = C_NULL) = create_swapchain_khr(device, convert(_SwapchainCreateInfoKHR, create_info); allocator)

queue_present_khr(queue::Queue, present_info::PresentInfoKHR) = queue_present_khr(queue, convert(_PresentInfoKHR, present_info))

create_vi_surface_nn(instance::Instance, create_info::ViSurfaceCreateInfoNN; allocator = C_NULL) = create_vi_surface_nn(instance, convert(_ViSurfaceCreateInfoNN, create_info); allocator)

create_wayland_surface_khr(instance::Instance, create_info::WaylandSurfaceCreateInfoKHR; allocator = C_NULL) = create_wayland_surface_khr(instance, convert(_WaylandSurfaceCreateInfoKHR, create_info); allocator)

create_win_32_surface_khr(instance::Instance, create_info::Win32SurfaceCreateInfoKHR; allocator = C_NULL) = create_win_32_surface_khr(instance, convert(_Win32SurfaceCreateInfoKHR, create_info); allocator)

create_xlib_surface_khr(instance::Instance, create_info::XlibSurfaceCreateInfoKHR; allocator = C_NULL) = create_xlib_surface_khr(instance, convert(_XlibSurfaceCreateInfoKHR, create_info); allocator)

create_xcb_surface_khr(instance::Instance, create_info::XcbSurfaceCreateInfoKHR; allocator = C_NULL) = create_xcb_surface_khr(instance, convert(_XcbSurfaceCreateInfoKHR, create_info); allocator)

create_direct_fb_surface_ext(instance::Instance, create_info::DirectFBSurfaceCreateInfoEXT; allocator = C_NULL) = create_direct_fb_surface_ext(instance, convert(_DirectFBSurfaceCreateInfoEXT, create_info); allocator)

create_image_pipe_surface_fuchsia(instance::Instance, create_info::ImagePipeSurfaceCreateInfoFUCHSIA; allocator = C_NULL) = create_image_pipe_surface_fuchsia(instance, convert(_ImagePipeSurfaceCreateInfoFUCHSIA, create_info); allocator)

create_stream_descriptor_surface_ggp(instance::Instance, create_info::StreamDescriptorSurfaceCreateInfoGGP; allocator = C_NULL) = create_stream_descriptor_surface_ggp(instance, convert(_StreamDescriptorSurfaceCreateInfoGGP, create_info); allocator)

create_screen_surface_qnx(instance::Instance, create_info::ScreenSurfaceCreateInfoQNX; allocator = C_NULL) = create_screen_surface_qnx(instance, convert(_ScreenSurfaceCreateInfoQNX, create_info); allocator)

create_debug_report_callback_ext(instance::Instance, create_info::DebugReportCallbackCreateInfoEXT; allocator = C_NULL) = create_debug_report_callback_ext(instance, convert(_DebugReportCallbackCreateInfoEXT, create_info); allocator)

debug_marker_set_object_name_ext(device::Device, name_info::DebugMarkerObjectNameInfoEXT) = debug_marker_set_object_name_ext(device, convert(_DebugMarkerObjectNameInfoEXT, name_info))

debug_marker_set_object_tag_ext(device::Device, tag_info::DebugMarkerObjectTagInfoEXT) = debug_marker_set_object_tag_ext(device, convert(_DebugMarkerObjectTagInfoEXT, tag_info))

cmd_debug_marker_begin_ext(command_buffer::CommandBuffer, marker_info::DebugMarkerMarkerInfoEXT) = cmd_debug_marker_begin_ext(command_buffer, convert(_DebugMarkerMarkerInfoEXT, marker_info))

cmd_debug_marker_insert_ext(command_buffer::CommandBuffer, marker_info::DebugMarkerMarkerInfoEXT) = cmd_debug_marker_insert_ext(command_buffer, convert(_DebugMarkerMarkerInfoEXT, marker_info))

cmd_execute_generated_commands_nv(command_buffer::CommandBuffer, is_preprocessed::Bool, generated_commands_info::GeneratedCommandsInfoNV) = cmd_execute_generated_commands_nv(command_buffer, is_preprocessed, convert(_GeneratedCommandsInfoNV, generated_commands_info))

cmd_preprocess_generated_commands_nv(command_buffer::CommandBuffer, generated_commands_info::GeneratedCommandsInfoNV) = cmd_preprocess_generated_commands_nv(command_buffer, convert(_GeneratedCommandsInfoNV, generated_commands_info))

get_generated_commands_memory_requirements_nv(device::Device, info::GeneratedCommandsMemoryRequirementsInfoNV) = get_generated_commands_memory_requirements_nv(device, convert(_GeneratedCommandsMemoryRequirementsInfoNV, info))

create_indirect_commands_layout_nv(device::Device, create_info::IndirectCommandsLayoutCreateInfoNV; allocator = C_NULL) = create_indirect_commands_layout_nv(device, convert(_IndirectCommandsLayoutCreateInfoNV, create_info); allocator)

get_physical_device_image_format_properties_2(physical_device::PhysicalDevice, image_format_info::PhysicalDeviceImageFormatInfo2) = get_physical_device_image_format_properties_2(physical_device, convert(_PhysicalDeviceImageFormatInfo2, image_format_info))

get_physical_device_sparse_image_format_properties_2(physical_device::PhysicalDevice, format_info::PhysicalDeviceSparseImageFormatInfo2) = get_physical_device_sparse_image_format_properties_2(physical_device, convert(_PhysicalDeviceSparseImageFormatInfo2, format_info))

cmd_push_descriptor_set_khr(command_buffer::CommandBuffer, pipeline_bind_point::PipelineBindPoint, layout::PipelineLayout, set::Integer, descriptor_writes::AbstractArray{<:WriteDescriptorSet}) = cmd_push_descriptor_set_khr(command_buffer, pipeline_bind_point, layout, set, convert(Vector{_WriteDescriptorSet}, descriptor_writes))

get_physical_device_external_buffer_properties(physical_device::PhysicalDevice, external_buffer_info::PhysicalDeviceExternalBufferInfo) = get_physical_device_external_buffer_properties(physical_device, convert(_PhysicalDeviceExternalBufferInfo, external_buffer_info))

get_memory_win_32_handle_khr(device::Device, get_win_32_handle_info::MemoryGetWin32HandleInfoKHR, handle::vk.HANDLE) = get_memory_win_32_handle_khr(device, convert(_MemoryGetWin32HandleInfoKHR, get_win_32_handle_info), handle)

get_memory_fd_khr(device::Device, get_fd_info::MemoryGetFdInfoKHR) = get_memory_fd_khr(device, convert(_MemoryGetFdInfoKHR, get_fd_info))

get_memory_zircon_handle_fuchsia(device::Device, get_zircon_handle_info::MemoryGetZirconHandleInfoFUCHSIA, zircon_handle::vk.zx_handle_t) = get_memory_zircon_handle_fuchsia(device, convert(_MemoryGetZirconHandleInfoFUCHSIA, get_zircon_handle_info), zircon_handle)

get_physical_device_external_semaphore_properties(physical_device::PhysicalDevice, external_semaphore_info::PhysicalDeviceExternalSemaphoreInfo) = get_physical_device_external_semaphore_properties(physical_device, convert(_PhysicalDeviceExternalSemaphoreInfo, external_semaphore_info))

get_semaphore_win_32_handle_khr(device::Device, get_win_32_handle_info::SemaphoreGetWin32HandleInfoKHR, handle::vk.HANDLE) = get_semaphore_win_32_handle_khr(device, convert(_SemaphoreGetWin32HandleInfoKHR, get_win_32_handle_info), handle)

import_semaphore_win_32_handle_khr(device::Device, import_semaphore_win_32_handle_info::ImportSemaphoreWin32HandleInfoKHR) = import_semaphore_win_32_handle_khr(device, convert(_ImportSemaphoreWin32HandleInfoKHR, import_semaphore_win_32_handle_info))

get_semaphore_fd_khr(device::Device, get_fd_info::SemaphoreGetFdInfoKHR) = get_semaphore_fd_khr(device, convert(_SemaphoreGetFdInfoKHR, get_fd_info))

import_semaphore_fd_khr(device::Device, import_semaphore_fd_info::ImportSemaphoreFdInfoKHR) = import_semaphore_fd_khr(device, convert(_ImportSemaphoreFdInfoKHR, import_semaphore_fd_info))

get_semaphore_zircon_handle_fuchsia(device::Device, get_zircon_handle_info::SemaphoreGetZirconHandleInfoFUCHSIA, zircon_handle::vk.zx_handle_t) = get_semaphore_zircon_handle_fuchsia(device, convert(_SemaphoreGetZirconHandleInfoFUCHSIA, get_zircon_handle_info), zircon_handle)

import_semaphore_zircon_handle_fuchsia(device::Device, import_semaphore_zircon_handle_info::ImportSemaphoreZirconHandleInfoFUCHSIA) = import_semaphore_zircon_handle_fuchsia(device, convert(_ImportSemaphoreZirconHandleInfoFUCHSIA, import_semaphore_zircon_handle_info))

get_physical_device_external_fence_properties(physical_device::PhysicalDevice, external_fence_info::PhysicalDeviceExternalFenceInfo) = get_physical_device_external_fence_properties(physical_device, convert(_PhysicalDeviceExternalFenceInfo, external_fence_info))

get_fence_win_32_handle_khr(device::Device, get_win_32_handle_info::FenceGetWin32HandleInfoKHR, handle::vk.HANDLE) = get_fence_win_32_handle_khr(device, convert(_FenceGetWin32HandleInfoKHR, get_win_32_handle_info), handle)

import_fence_win_32_handle_khr(device::Device, import_fence_win_32_handle_info::ImportFenceWin32HandleInfoKHR) = import_fence_win_32_handle_khr(device, convert(_ImportFenceWin32HandleInfoKHR, import_fence_win_32_handle_info))

get_fence_fd_khr(device::Device, get_fd_info::FenceGetFdInfoKHR) = get_fence_fd_khr(device, convert(_FenceGetFdInfoKHR, get_fd_info))

import_fence_fd_khr(device::Device, import_fence_fd_info::ImportFenceFdInfoKHR) = import_fence_fd_khr(device, convert(_ImportFenceFdInfoKHR, import_fence_fd_info))

display_power_control_ext(device::Device, display::DisplayKHR, display_power_info::DisplayPowerInfoEXT) = display_power_control_ext(device, display, convert(_DisplayPowerInfoEXT, display_power_info))

register_device_event_ext(device::Device, device_event_info::DeviceEventInfoEXT; allocator = C_NULL) = register_device_event_ext(device, convert(_DeviceEventInfoEXT, device_event_info); allocator)

register_display_event_ext(device::Device, display::DisplayKHR, display_event_info::DisplayEventInfoEXT; allocator = C_NULL) = register_display_event_ext(device, display, convert(_DisplayEventInfoEXT, display_event_info); allocator)

bind_buffer_memory_2(device::Device, bind_infos::AbstractArray{<:BindBufferMemoryInfo}) = bind_buffer_memory_2(device, convert(Vector{_BindBufferMemoryInfo}, bind_infos))

bind_image_memory_2(device::Device, bind_infos::AbstractArray{<:BindImageMemoryInfo}) = bind_image_memory_2(device, convert(Vector{_BindImageMemoryInfo}, bind_infos))

acquire_next_image_2_khr(device::Device, acquire_info::AcquireNextImageInfoKHR) = acquire_next_image_2_khr(device, convert(_AcquireNextImageInfoKHR, acquire_info))

create_descriptor_update_template(device::Device, create_info::DescriptorUpdateTemplateCreateInfo; allocator = C_NULL) = create_descriptor_update_template(device, convert(_DescriptorUpdateTemplateCreateInfo, create_info); allocator)

set_hdr_metadata_ext(device::Device, swapchains::AbstractArray{<:SwapchainKHR}, metadata::AbstractArray{<:HdrMetadataEXT}) = set_hdr_metadata_ext(device, swapchains, convert(Vector{_HdrMetadataEXT}, metadata))

create_ios_surface_mvk(instance::Instance, create_info::IOSSurfaceCreateInfoMVK; allocator = C_NULL) = create_ios_surface_mvk(instance, convert(_IOSSurfaceCreateInfoMVK, create_info); allocator)

create_mac_os_surface_mvk(instance::Instance, create_info::MacOSSurfaceCreateInfoMVK; allocator = C_NULL) = create_mac_os_surface_mvk(instance, convert(_MacOSSurfaceCreateInfoMVK, create_info); allocator)

create_metal_surface_ext(instance::Instance, create_info::MetalSurfaceCreateInfoEXT; allocator = C_NULL) = create_metal_surface_ext(instance, convert(_MetalSurfaceCreateInfoEXT, create_info); allocator)

cmd_set_viewport_w_scaling_nv(command_buffer::CommandBuffer, viewport_w_scalings::AbstractArray{<:ViewportWScalingNV}) = cmd_set_viewport_w_scaling_nv(command_buffer, convert(Vector{_ViewportWScalingNV}, viewport_w_scalings))

cmd_set_discard_rectangle_ext(command_buffer::CommandBuffer, discard_rectangles::AbstractArray{<:Rect2D}) = cmd_set_discard_rectangle_ext(command_buffer, convert(Vector{_Rect2D}, discard_rectangles))

cmd_set_sample_locations_ext(command_buffer::CommandBuffer, sample_locations_info::SampleLocationsInfoEXT) = cmd_set_sample_locations_ext(command_buffer, convert(_SampleLocationsInfoEXT, sample_locations_info))

get_physical_device_surface_capabilities_2_khr(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR) = get_physical_device_surface_capabilities_2_khr(physical_device, convert(_PhysicalDeviceSurfaceInfo2KHR, surface_info))

get_physical_device_surface_formats_2_khr(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR) = get_physical_device_surface_formats_2_khr(physical_device, convert(_PhysicalDeviceSurfaceInfo2KHR, surface_info))

get_display_plane_capabilities_2_khr(physical_device::PhysicalDevice, display_plane_info::DisplayPlaneInfo2KHR) = get_display_plane_capabilities_2_khr(physical_device, convert(_DisplayPlaneInfo2KHR, display_plane_info))

get_buffer_memory_requirements_2(device::Device, info::BufferMemoryRequirementsInfo2) = get_buffer_memory_requirements_2(device, convert(_BufferMemoryRequirementsInfo2, info))

get_image_memory_requirements_2(device::Device, info::ImageMemoryRequirementsInfo2) = get_image_memory_requirements_2(device, convert(_ImageMemoryRequirementsInfo2, info))

get_image_sparse_memory_requirements_2(device::Device, info::ImageSparseMemoryRequirementsInfo2) = get_image_sparse_memory_requirements_2(device, convert(_ImageSparseMemoryRequirementsInfo2, info))

create_sampler_ycbcr_conversion(device::Device, create_info::SamplerYcbcrConversionCreateInfo; allocator = C_NULL) = create_sampler_ycbcr_conversion(device, convert(_SamplerYcbcrConversionCreateInfo, create_info); allocator)

get_device_queue_2(device::Device, queue_info::DeviceQueueInfo2) = get_device_queue_2(device, convert(_DeviceQueueInfo2, queue_info))

create_validation_cache_ext(device::Device, create_info::ValidationCacheCreateInfoEXT; allocator = C_NULL) = create_validation_cache_ext(device, convert(_ValidationCacheCreateInfoEXT, create_info); allocator)

get_descriptor_set_layout_support(device::Device, create_info::DescriptorSetLayoutCreateInfo) = get_descriptor_set_layout_support(device, convert(_DescriptorSetLayoutCreateInfo, create_info))

get_calibrated_timestamps_ext(device::Device, timestamp_infos::AbstractArray{<:CalibratedTimestampInfoEXT}) = get_calibrated_timestamps_ext(device, convert(Vector{_CalibratedTimestampInfoEXT}, timestamp_infos))

set_debug_utils_object_name_ext(device::Device, name_info::DebugUtilsObjectNameInfoEXT) = set_debug_utils_object_name_ext(device, convert(_DebugUtilsObjectNameInfoEXT, name_info))

set_debug_utils_object_tag_ext(device::Device, tag_info::DebugUtilsObjectTagInfoEXT) = set_debug_utils_object_tag_ext(device, convert(_DebugUtilsObjectTagInfoEXT, tag_info))

queue_begin_debug_utils_label_ext(queue::Queue, label_info::DebugUtilsLabelEXT) = queue_begin_debug_utils_label_ext(queue, convert(_DebugUtilsLabelEXT, label_info))

queue_insert_debug_utils_label_ext(queue::Queue, label_info::DebugUtilsLabelEXT) = queue_insert_debug_utils_label_ext(queue, convert(_DebugUtilsLabelEXT, label_info))

cmd_begin_debug_utils_label_ext(command_buffer::CommandBuffer, label_info::DebugUtilsLabelEXT) = cmd_begin_debug_utils_label_ext(command_buffer, convert(_DebugUtilsLabelEXT, label_info))

cmd_insert_debug_utils_label_ext(command_buffer::CommandBuffer, label_info::DebugUtilsLabelEXT) = cmd_insert_debug_utils_label_ext(command_buffer, convert(_DebugUtilsLabelEXT, label_info))

create_debug_utils_messenger_ext(instance::Instance, create_info::DebugUtilsMessengerCreateInfoEXT; allocator = C_NULL) = create_debug_utils_messenger_ext(instance, convert(_DebugUtilsMessengerCreateInfoEXT, create_info); allocator)

submit_debug_utils_message_ext(instance::Instance, message_severity::DebugUtilsMessageSeverityFlagEXT, message_types::DebugUtilsMessageTypeFlagEXT, callback_data::DebugUtilsMessengerCallbackDataEXT) = submit_debug_utils_message_ext(instance, message_severity, message_types, convert(_DebugUtilsMessengerCallbackDataEXT, callback_data))

create_render_pass_2(device::Device, create_info::RenderPassCreateInfo2; allocator = C_NULL) = create_render_pass_2(device, convert(_RenderPassCreateInfo2, create_info); allocator)

cmd_begin_render_pass_2(command_buffer::CommandBuffer, render_pass_begin::RenderPassBeginInfo, subpass_begin_info::SubpassBeginInfo) = cmd_begin_render_pass_2(command_buffer, convert(_RenderPassBeginInfo, render_pass_begin), convert(_SubpassBeginInfo, subpass_begin_info))

cmd_next_subpass_2(command_buffer::CommandBuffer, subpass_begin_info::SubpassBeginInfo, subpass_end_info::SubpassEndInfo) = cmd_next_subpass_2(command_buffer, convert(_SubpassBeginInfo, subpass_begin_info), convert(_SubpassEndInfo, subpass_end_info))

cmd_end_render_pass_2(command_buffer::CommandBuffer, subpass_end_info::SubpassEndInfo) = cmd_end_render_pass_2(command_buffer, convert(_SubpassEndInfo, subpass_end_info))

wait_semaphores(device::Device, wait_info::SemaphoreWaitInfo, timeout::Integer) = wait_semaphores(device, convert(_SemaphoreWaitInfo, wait_info), timeout)

signal_semaphore(device::Device, signal_info::SemaphoreSignalInfo) = signal_semaphore(device, convert(_SemaphoreSignalInfo, signal_info))

get_memory_android_hardware_buffer_android(device::Device, info::MemoryGetAndroidHardwareBufferInfoANDROID) = get_memory_android_hardware_buffer_android(device, convert(_MemoryGetAndroidHardwareBufferInfoANDROID, info))

cmd_set_exclusive_scissor_nv(command_buffer::CommandBuffer, exclusive_scissors::AbstractArray{<:Rect2D}) = cmd_set_exclusive_scissor_nv(command_buffer, convert(Vector{_Rect2D}, exclusive_scissors))

cmd_set_viewport_shading_rate_palette_nv(command_buffer::CommandBuffer, shading_rate_palettes::AbstractArray{<:ShadingRatePaletteNV}) = cmd_set_viewport_shading_rate_palette_nv(command_buffer, convert(Vector{_ShadingRatePaletteNV}, shading_rate_palettes))

cmd_set_coarse_sample_order_nv(command_buffer::CommandBuffer, sample_order_type::CoarseSampleOrderTypeNV, custom_sample_orders::AbstractArray{<:CoarseSampleOrderCustomNV}) = cmd_set_coarse_sample_order_nv(command_buffer, sample_order_type, convert(Vector{_CoarseSampleOrderCustomNV}, custom_sample_orders))

create_acceleration_structure_nv(device::Device, create_info::AccelerationStructureCreateInfoNV; allocator = C_NULL) = create_acceleration_structure_nv(device, convert(_AccelerationStructureCreateInfoNV, create_info); allocator)

get_acceleration_structure_memory_requirements_nv(device::Device, info::AccelerationStructureMemoryRequirementsInfoNV) = get_acceleration_structure_memory_requirements_nv(device, convert(_AccelerationStructureMemoryRequirementsInfoNV, info))

bind_acceleration_structure_memory_nv(device::Device, bind_infos::AbstractArray{<:BindAccelerationStructureMemoryInfoNV}) = bind_acceleration_structure_memory_nv(device, convert(Vector{_BindAccelerationStructureMemoryInfoNV}, bind_infos))

cmd_copy_acceleration_structure_khr(command_buffer::CommandBuffer, info::CopyAccelerationStructureInfoKHR) = cmd_copy_acceleration_structure_khr(command_buffer, convert(_CopyAccelerationStructureInfoKHR, info))

copy_acceleration_structure_khr(device::Device, info::CopyAccelerationStructureInfoKHR; deferred_operation = C_NULL) = copy_acceleration_structure_khr(device, convert(_CopyAccelerationStructureInfoKHR, info); deferred_operation)

cmd_copy_acceleration_structure_to_memory_khr(command_buffer::CommandBuffer, info::CopyAccelerationStructureToMemoryInfoKHR) = cmd_copy_acceleration_structure_to_memory_khr(command_buffer, convert(_CopyAccelerationStructureToMemoryInfoKHR, info))

copy_acceleration_structure_to_memory_khr(device::Device, info::CopyAccelerationStructureToMemoryInfoKHR; deferred_operation = C_NULL) = copy_acceleration_structure_to_memory_khr(device, convert(_CopyAccelerationStructureToMemoryInfoKHR, info); deferred_operation)

cmd_copy_memory_to_acceleration_structure_khr(command_buffer::CommandBuffer, info::CopyMemoryToAccelerationStructureInfoKHR) = cmd_copy_memory_to_acceleration_structure_khr(command_buffer, convert(_CopyMemoryToAccelerationStructureInfoKHR, info))

copy_memory_to_acceleration_structure_khr(device::Device, info::CopyMemoryToAccelerationStructureInfoKHR; deferred_operation = C_NULL) = copy_memory_to_acceleration_structure_khr(device, convert(_CopyMemoryToAccelerationStructureInfoKHR, info); deferred_operation)

cmd_build_acceleration_structure_nv(command_buffer::CommandBuffer, info::AccelerationStructureInfoNV, instance_offset::Integer, update::Bool, dst::AccelerationStructureNV, scratch::Buffer, scratch_offset::Integer; instance_data = C_NULL, src = C_NULL) = cmd_build_acceleration_structure_nv(command_buffer, convert(_AccelerationStructureInfoNV, info), instance_offset, update, dst, scratch, scratch_offset; instance_data, src)

cmd_trace_rays_khr(command_buffer::CommandBuffer, raygen_shader_binding_table::StridedDeviceAddressRegionKHR, miss_shader_binding_table::StridedDeviceAddressRegionKHR, hit_shader_binding_table::StridedDeviceAddressRegionKHR, callable_shader_binding_table::StridedDeviceAddressRegionKHR, width::Integer, height::Integer, depth::Integer) = cmd_trace_rays_khr(command_buffer, convert(_StridedDeviceAddressRegionKHR, raygen_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, miss_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, hit_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, callable_shader_binding_table), width, height, depth)

create_ray_tracing_pipelines_nv(device::Device, create_infos::AbstractArray{<:RayTracingPipelineCreateInfoNV}; pipeline_cache = C_NULL, allocator = C_NULL) = create_ray_tracing_pipelines_nv(device, convert(Vector{_RayTracingPipelineCreateInfoNV}, create_infos); pipeline_cache, allocator)

create_ray_tracing_pipelines_khr(device::Device, create_infos::AbstractArray{<:RayTracingPipelineCreateInfoKHR}; deferred_operation = C_NULL, pipeline_cache = C_NULL, allocator = C_NULL) = create_ray_tracing_pipelines_khr(device, convert(Vector{_RayTracingPipelineCreateInfoKHR}, create_infos); deferred_operation, pipeline_cache, allocator)

cmd_trace_rays_indirect_khr(command_buffer::CommandBuffer, raygen_shader_binding_table::StridedDeviceAddressRegionKHR, miss_shader_binding_table::StridedDeviceAddressRegionKHR, hit_shader_binding_table::StridedDeviceAddressRegionKHR, callable_shader_binding_table::StridedDeviceAddressRegionKHR, indirect_device_address::Integer) = cmd_trace_rays_indirect_khr(command_buffer, convert(_StridedDeviceAddressRegionKHR, raygen_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, miss_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, hit_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, callable_shader_binding_table), indirect_device_address)

get_device_acceleration_structure_compatibility_khr(device::Device, version_info::AccelerationStructureVersionInfoKHR) = get_device_acceleration_structure_compatibility_khr(device, convert(_AccelerationStructureVersionInfoKHR, version_info))

get_image_view_handle_nvx(device::Device, info::ImageViewHandleInfoNVX) = get_image_view_handle_nvx(device, convert(_ImageViewHandleInfoNVX, info))

get_physical_device_surface_present_modes_2_ext(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR) = get_physical_device_surface_present_modes_2_ext(physical_device, convert(_PhysicalDeviceSurfaceInfo2KHR, surface_info))

get_device_group_surface_present_modes_2_ext(device::Device, surface_info::PhysicalDeviceSurfaceInfo2KHR, modes::DeviceGroupPresentModeFlagKHR) = get_device_group_surface_present_modes_2_ext(device, convert(_PhysicalDeviceSurfaceInfo2KHR, surface_info), modes)

get_physical_device_queue_family_performance_query_passes_khr(physical_device::PhysicalDevice, performance_query_create_info::QueryPoolPerformanceCreateInfoKHR) = get_physical_device_queue_family_performance_query_passes_khr(physical_device, convert(_QueryPoolPerformanceCreateInfoKHR, performance_query_create_info))

acquire_profiling_lock_khr(device::Device, info::AcquireProfilingLockInfoKHR) = acquire_profiling_lock_khr(device, convert(_AcquireProfilingLockInfoKHR, info))

get_buffer_opaque_capture_address(device::Device, info::BufferDeviceAddressInfo) = get_buffer_opaque_capture_address(device, convert(_BufferDeviceAddressInfo, info))

get_buffer_device_address(device::Device, info::BufferDeviceAddressInfo) = get_buffer_device_address(device, convert(_BufferDeviceAddressInfo, info))

create_headless_surface_ext(instance::Instance, create_info::HeadlessSurfaceCreateInfoEXT; allocator = C_NULL) = create_headless_surface_ext(instance, convert(_HeadlessSurfaceCreateInfoEXT, create_info); allocator)

initialize_performance_api_intel(device::Device, initialize_info::InitializePerformanceApiInfoINTEL) = initialize_performance_api_intel(device, convert(_InitializePerformanceApiInfoINTEL, initialize_info))

cmd_set_performance_marker_intel(command_buffer::CommandBuffer, marker_info::PerformanceMarkerInfoINTEL) = cmd_set_performance_marker_intel(command_buffer, convert(_PerformanceMarkerInfoINTEL, marker_info))

cmd_set_performance_stream_marker_intel(command_buffer::CommandBuffer, marker_info::PerformanceStreamMarkerInfoINTEL) = cmd_set_performance_stream_marker_intel(command_buffer, convert(_PerformanceStreamMarkerInfoINTEL, marker_info))

cmd_set_performance_override_intel(command_buffer::CommandBuffer, override_info::PerformanceOverrideInfoINTEL) = cmd_set_performance_override_intel(command_buffer, convert(_PerformanceOverrideInfoINTEL, override_info))

acquire_performance_configuration_intel(device::Device, acquire_info::PerformanceConfigurationAcquireInfoINTEL) = acquire_performance_configuration_intel(device, convert(_PerformanceConfigurationAcquireInfoINTEL, acquire_info))

get_device_memory_opaque_capture_address(device::Device, info::DeviceMemoryOpaqueCaptureAddressInfo) = get_device_memory_opaque_capture_address(device, convert(_DeviceMemoryOpaqueCaptureAddressInfo, info))

get_pipeline_executable_properties_khr(device::Device, pipeline_info::PipelineInfoKHR) = get_pipeline_executable_properties_khr(device, convert(_PipelineInfoKHR, pipeline_info))

get_pipeline_executable_statistics_khr(device::Device, executable_info::PipelineExecutableInfoKHR) = get_pipeline_executable_statistics_khr(device, convert(_PipelineExecutableInfoKHR, executable_info))

get_pipeline_executable_internal_representations_khr(device::Device, executable_info::PipelineExecutableInfoKHR) = get_pipeline_executable_internal_representations_khr(device, convert(_PipelineExecutableInfoKHR, executable_info))

create_acceleration_structure_khr(device::Device, create_info::AccelerationStructureCreateInfoKHR; allocator = C_NULL) = create_acceleration_structure_khr(device, convert(_AccelerationStructureCreateInfoKHR, create_info); allocator)

cmd_build_acceleration_structures_khr(command_buffer::CommandBuffer, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, build_range_infos::AbstractArray{<:AccelerationStructureBuildRangeInfoKHR}) = cmd_build_acceleration_structures_khr(command_buffer, convert(Vector{_AccelerationStructureBuildGeometryInfoKHR}, infos), convert(Vector{_AccelerationStructureBuildRangeInfoKHR}, build_range_infos))

cmd_build_acceleration_structures_indirect_khr(command_buffer::CommandBuffer, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, indirect_device_addresses::AbstractArray{<:Integer}, indirect_strides::AbstractArray{<:Integer}, max_primitive_counts::AbstractArray{<:Integer}) = cmd_build_acceleration_structures_indirect_khr(command_buffer, convert(Vector{_AccelerationStructureBuildGeometryInfoKHR}, infos), indirect_device_addresses, indirect_strides, max_primitive_counts)

build_acceleration_structures_khr(device::Device, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, build_range_infos::AbstractArray{<:AccelerationStructureBuildRangeInfoKHR}; deferred_operation = C_NULL) = build_acceleration_structures_khr(device, convert(Vector{_AccelerationStructureBuildGeometryInfoKHR}, infos), convert(Vector{_AccelerationStructureBuildRangeInfoKHR}, build_range_infos); deferred_operation)

get_acceleration_structure_device_address_khr(device::Device, info::AccelerationStructureDeviceAddressInfoKHR) = get_acceleration_structure_device_address_khr(device, convert(_AccelerationStructureDeviceAddressInfoKHR, info))

cmd_set_viewport_with_count_ext(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}) = cmd_set_viewport_with_count_ext(command_buffer, convert(Vector{_Viewport}, viewports))

cmd_set_scissor_with_count_ext(command_buffer::CommandBuffer, scissors::AbstractArray{<:Rect2D}) = cmd_set_scissor_with_count_ext(command_buffer, convert(Vector{_Rect2D}, scissors))

create_private_data_slot_ext(device::Device, create_info::PrivateDataSlotCreateInfoEXT; allocator = C_NULL) = create_private_data_slot_ext(device, convert(_PrivateDataSlotCreateInfoEXT, create_info); allocator)

cmd_copy_buffer_2_khr(command_buffer::CommandBuffer, copy_buffer_info::CopyBufferInfo2KHR) = cmd_copy_buffer_2_khr(command_buffer, convert(_CopyBufferInfo2KHR, copy_buffer_info))

cmd_copy_image_2_khr(command_buffer::CommandBuffer, copy_image_info::CopyImageInfo2KHR) = cmd_copy_image_2_khr(command_buffer, convert(_CopyImageInfo2KHR, copy_image_info))

cmd_blit_image_2_khr(command_buffer::CommandBuffer, blit_image_info::BlitImageInfo2KHR) = cmd_blit_image_2_khr(command_buffer, convert(_BlitImageInfo2KHR, blit_image_info))

cmd_copy_buffer_to_image_2_khr(command_buffer::CommandBuffer, copy_buffer_to_image_info::CopyBufferToImageInfo2KHR) = cmd_copy_buffer_to_image_2_khr(command_buffer, convert(_CopyBufferToImageInfo2KHR, copy_buffer_to_image_info))

cmd_copy_image_to_buffer_2_khr(command_buffer::CommandBuffer, copy_image_to_buffer_info::CopyImageToBufferInfo2KHR) = cmd_copy_image_to_buffer_2_khr(command_buffer, convert(_CopyImageToBufferInfo2KHR, copy_image_to_buffer_info))

cmd_resolve_image_2_khr(command_buffer::CommandBuffer, resolve_image_info::ResolveImageInfo2KHR) = cmd_resolve_image_2_khr(command_buffer, convert(_ResolveImageInfo2KHR, resolve_image_info))

cmd_set_fragment_shading_rate_khr(command_buffer::CommandBuffer, fragment_size::Extent2D, combiner_ops::NTuple{2, FragmentShadingRateCombinerOpKHR}) = cmd_set_fragment_shading_rate_khr(command_buffer, convert(_Extent2D, fragment_size), combiner_ops)

get_acceleration_structure_build_sizes_khr(device::Device, build_type::AccelerationStructureBuildTypeKHR, build_info::AccelerationStructureBuildGeometryInfoKHR; max_primitive_counts = C_NULL) = get_acceleration_structure_build_sizes_khr(device, build_type, convert(_AccelerationStructureBuildGeometryInfoKHR, build_info); max_primitive_counts)

cmd_set_vertex_input_ext(command_buffer::CommandBuffer, vertex_binding_descriptions::AbstractArray{<:VertexInputBindingDescription2EXT}, vertex_attribute_descriptions::AbstractArray{<:VertexInputAttributeDescription2EXT}) = cmd_set_vertex_input_ext(command_buffer, convert(Vector{_VertexInputBindingDescription2EXT}, vertex_binding_descriptions), convert(Vector{_VertexInputAttributeDescription2EXT}, vertex_attribute_descriptions))

cmd_set_event_2_khr(command_buffer::CommandBuffer, event::Event, dependency_info::DependencyInfoKHR) = cmd_set_event_2_khr(command_buffer, event, convert(_DependencyInfoKHR, dependency_info))

cmd_wait_events_2_khr(command_buffer::CommandBuffer, events::AbstractArray{<:Event}, dependency_infos::AbstractArray{<:DependencyInfoKHR}) = cmd_wait_events_2_khr(command_buffer, events, convert(Vector{_DependencyInfoKHR}, dependency_infos))

cmd_pipeline_barrier_2_khr(command_buffer::CommandBuffer, dependency_info::DependencyInfoKHR) = cmd_pipeline_barrier_2_khr(command_buffer, convert(_DependencyInfoKHR, dependency_info))

queue_submit_2_khr(queue::Queue, submits::AbstractArray{<:SubmitInfo2KHR}; fence = C_NULL) = queue_submit_2_khr(queue, convert(Vector{_SubmitInfo2KHR}, submits); fence)

get_physical_device_video_capabilities_khr(physical_device::PhysicalDevice, video_profile::VideoProfileKHR) = get_physical_device_video_capabilities_khr(physical_device, convert(_VideoProfileKHR, video_profile))

create_video_session_khr(device::Device, create_info::VideoSessionCreateInfoKHR; allocator = C_NULL) = create_video_session_khr(device, convert(_VideoSessionCreateInfoKHR, create_info); allocator)

create_video_session_parameters_khr(device::Device, create_info::VideoSessionParametersCreateInfoKHR; allocator = C_NULL) = create_video_session_parameters_khr(device, convert(_VideoSessionParametersCreateInfoKHR, create_info); allocator)

update_video_session_parameters_khr(device::Device, video_session_parameters::VideoSessionParametersKHR, update_info::VideoSessionParametersUpdateInfoKHR) = update_video_session_parameters_khr(device, video_session_parameters, convert(_VideoSessionParametersUpdateInfoKHR, update_info))

bind_video_session_memory_khr(device::Device, video_session::VideoSessionKHR, video_session_bind_memories::AbstractArray{<:VideoBindMemoryKHR}) = bind_video_session_memory_khr(device, video_session, convert(Vector{_VideoBindMemoryKHR}, video_session_bind_memories))

cmd_decode_video_khr(command_buffer::CommandBuffer, frame_info::VideoDecodeInfoKHR) = cmd_decode_video_khr(command_buffer, convert(_VideoDecodeInfoKHR, frame_info))

cmd_begin_video_coding_khr(command_buffer::CommandBuffer, begin_info::VideoBeginCodingInfoKHR) = cmd_begin_video_coding_khr(command_buffer, convert(_VideoBeginCodingInfoKHR, begin_info))

cmd_control_video_coding_khr(command_buffer::CommandBuffer, coding_control_info::VideoCodingControlInfoKHR) = cmd_control_video_coding_khr(command_buffer, convert(_VideoCodingControlInfoKHR, coding_control_info))

cmd_end_video_coding_khr(command_buffer::CommandBuffer, end_coding_info::VideoEndCodingInfoKHR) = cmd_end_video_coding_khr(command_buffer, convert(_VideoEndCodingInfoKHR, end_coding_info))

cmd_encode_video_khr(command_buffer::CommandBuffer, encode_info::VideoEncodeInfoKHR) = cmd_encode_video_khr(command_buffer, convert(_VideoEncodeInfoKHR, encode_info))

create_device(physical_device::PhysicalDevice, queue_create_infos::AbstractArray{<:DeviceQueueCreateInfo}, enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; allocator = C_NULL, next = C_NULL, flags = 0, enabled_features = C_NULL) = create_device(physical_device, convert(Vector{_DeviceQueueCreateInfo}, queue_create_infos), enabled_layer_names, enabled_extension_names; allocator, next, flags, enabled_features)

create_image(device::Device, image_type::ImageType, format::Format, extent::Extent3D, mip_levels::Integer, array_layers::Integer, samples::SampleCountFlag, tiling::ImageTiling, usage::ImageUsageFlag, sharing_mode::SharingMode, queue_family_indices::AbstractArray{<:Integer}, initial_layout::ImageLayout; allocator = C_NULL, next = C_NULL, flags = 0) = create_image(device, image_type, format, convert(_Extent3D, extent), mip_levels, array_layers, samples, tiling, usage, sharing_mode, queue_family_indices, initial_layout; allocator, next, flags)

create_image_view(device::Device, image::Image, view_type::ImageViewType, format::Format, components::ComponentMapping, subresource_range::ImageSubresourceRange; allocator = C_NULL, next = C_NULL, flags = 0) = create_image_view(device, image, view_type, format, convert(_ComponentMapping, components), convert(_ImageSubresourceRange, subresource_range); allocator, next, flags)

create_pipeline_layout(device::Device, set_layouts::AbstractArray{<:DescriptorSetLayout}, push_constant_ranges::AbstractArray{<:PushConstantRange}; allocator = C_NULL, next = C_NULL, flags = 0) = create_pipeline_layout(device, set_layouts, convert(Vector{_PushConstantRange}, push_constant_ranges); allocator, next, flags)

create_descriptor_set_layout(device::Device, bindings::AbstractArray{<:DescriptorSetLayoutBinding}; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_set_layout(device, convert(Vector{_DescriptorSetLayoutBinding}, bindings); allocator, next, flags)

create_descriptor_pool(device::Device, max_sets::Integer, pool_sizes::AbstractArray{<:DescriptorPoolSize}; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_pool(device, max_sets, convert(Vector{_DescriptorPoolSize}, pool_sizes); allocator, next, flags)

create_render_pass(device::Device, attachments::AbstractArray{<:AttachmentDescription}, subpasses::AbstractArray{<:SubpassDescription}, dependencies::AbstractArray{<:SubpassDependency}; allocator = C_NULL, next = C_NULL, flags = 0) = create_render_pass(device, convert(Vector{_AttachmentDescription}, attachments), convert(Vector{_SubpassDescription}, subpasses), convert(Vector{_SubpassDependency}, dependencies); allocator, next, flags)

create_render_pass_2(device::Device, attachments::AbstractArray{<:AttachmentDescription2}, subpasses::AbstractArray{<:SubpassDescription2}, dependencies::AbstractArray{<:SubpassDependency2}, correlated_view_masks::AbstractArray{<:Integer}; allocator = C_NULL, next = C_NULL, flags = 0) = create_render_pass_2(device, convert(Vector{_AttachmentDescription2}, attachments), convert(Vector{_SubpassDescription2}, subpasses), convert(Vector{_SubpassDependency2}, dependencies), correlated_view_masks; allocator, next, flags)

create_indirect_commands_layout_nv(device::Device, pipeline_bind_point::PipelineBindPoint, tokens::AbstractArray{<:IndirectCommandsLayoutTokenNV}, stream_strides::AbstractArray{<:Integer}; allocator = C_NULL, next = C_NULL, flags = 0) = create_indirect_commands_layout_nv(device, pipeline_bind_point, convert(Vector{_IndirectCommandsLayoutTokenNV}, tokens), stream_strides; allocator, next, flags)

create_descriptor_update_template(device::Device, descriptor_update_entries::AbstractArray{<:DescriptorUpdateTemplateEntry}, template_type::DescriptorUpdateTemplateType, descriptor_set_layout::DescriptorSetLayout, pipeline_bind_point::PipelineBindPoint, pipeline_layout::PipelineLayout, set::Integer; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_update_template(device, convert(Vector{_DescriptorUpdateTemplateEntry}, descriptor_update_entries), template_type, descriptor_set_layout, pipeline_bind_point, pipeline_layout, set; allocator, next, flags)

create_sampler_ycbcr_conversion(device::Device, format::Format, ycbcr_model::SamplerYcbcrModelConversion, ycbcr_range::SamplerYcbcrRange, components::ComponentMapping, x_chroma_offset::ChromaLocation, y_chroma_offset::ChromaLocation, chroma_filter::Filter, force_explicit_reconstruction::Bool; allocator = C_NULL, next = C_NULL) = create_sampler_ycbcr_conversion(device, format, ycbcr_model, ycbcr_range, convert(_ComponentMapping, components), x_chroma_offset, y_chroma_offset, chroma_filter, force_explicit_reconstruction; allocator, next)

create_acceleration_structure_nv(device::Device, compacted_size::Integer, info::AccelerationStructureInfoNV; allocator = C_NULL, next = C_NULL) = create_acceleration_structure_nv(device, compacted_size, convert(_AccelerationStructureInfoNV, info); allocator, next)

create_display_mode_khr(physical_device::PhysicalDevice, display::DisplayKHR, parameters::DisplayModeParametersKHR; allocator = C_NULL, next = C_NULL, flags = 0) = create_display_mode_khr(physical_device, display, convert(_DisplayModeParametersKHR, parameters); allocator, next, flags)

create_swapchain_khr(device::Device, surface::SurfaceKHR, min_image_count::Integer, image_format::Format, image_color_space::ColorSpaceKHR, image_extent::Extent2D, image_array_layers::Integer, image_usage::ImageUsageFlag, image_sharing_mode::SharingMode, queue_family_indices::AbstractArray{<:Integer}, pre_transform::SurfaceTransformFlagKHR, composite_alpha::CompositeAlphaFlagKHR, present_mode::PresentModeKHR, clipped::Bool; allocator = C_NULL, next = C_NULL, flags = 0, old_swapchain = C_NULL) = create_swapchain_khr(device, surface, min_image_count, image_format, image_color_space, convert(_Extent2D, image_extent), image_array_layers, image_usage, image_sharing_mode, queue_family_indices, pre_transform, composite_alpha, present_mode, clipped; allocator, next, flags, old_swapchain)

create_video_session_khr(device::Device, queue_family_index::Integer, video_profile::VideoProfileKHR, picture_format::Format, max_coded_extent::Extent2D, reference_pictures_format::Format, max_reference_pictures_slots_count::Integer, max_reference_pictures_active_count::Integer; allocator = C_NULL, next = C_NULL, flags = 0) = create_video_session_khr(device, queue_family_index, convert(_VideoProfileKHR, video_profile), picture_format, convert(_Extent2D, max_coded_extent), reference_pictures_format, max_reference_pictures_slots_count, max_reference_pictures_active_count; allocator, next, flags)

Device(physical_device::PhysicalDevice, queue_create_infos::AbstractArray{<:DeviceQueueCreateInfo}, enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}; allocator = C_NULL, next = C_NULL, flags = 0, enabled_features = C_NULL) = Device(physical_device, convert(Vector{_DeviceQueueCreateInfo}, queue_create_infos), enabled_layer_names, enabled_extension_names; allocator, next, flags, enabled_features)

Image(device::Device, image_type::ImageType, format::Format, extent::Extent3D, mip_levels::Integer, array_layers::Integer, samples::SampleCountFlag, tiling::ImageTiling, usage::ImageUsageFlag, sharing_mode::SharingMode, queue_family_indices::AbstractArray{<:Integer}, initial_layout::ImageLayout; allocator = C_NULL, next = C_NULL, flags = 0) = Image(device, image_type, format, convert(_Extent3D, extent), mip_levels, array_layers, samples, tiling, usage, sharing_mode, queue_family_indices, initial_layout; allocator, next, flags)

ImageView(device::Device, image::Image, view_type::ImageViewType, format::Format, components::ComponentMapping, subresource_range::ImageSubresourceRange; allocator = C_NULL, next = C_NULL, flags = 0) = ImageView(device, image, view_type, format, convert(_ComponentMapping, components), convert(_ImageSubresourceRange, subresource_range); allocator, next, flags)

PipelineLayout(device::Device, set_layouts::AbstractArray{<:DescriptorSetLayout}, push_constant_ranges::AbstractArray{<:PushConstantRange}; allocator = C_NULL, next = C_NULL, flags = 0) = PipelineLayout(device, set_layouts, convert(Vector{_PushConstantRange}, push_constant_ranges); allocator, next, flags)

DescriptorSetLayout(device::Device, bindings::AbstractArray{<:DescriptorSetLayoutBinding}; allocator = C_NULL, next = C_NULL, flags = 0) = DescriptorSetLayout(device, convert(Vector{_DescriptorSetLayoutBinding}, bindings); allocator, next, flags)

DescriptorPool(device::Device, max_sets::Integer, pool_sizes::AbstractArray{<:DescriptorPoolSize}; allocator = C_NULL, next = C_NULL, flags = 0) = DescriptorPool(device, max_sets, convert(Vector{_DescriptorPoolSize}, pool_sizes); allocator, next, flags)

RenderPass(device::Device, attachments::AbstractArray{<:AttachmentDescription}, subpasses::AbstractArray{<:SubpassDescription}, dependencies::AbstractArray{<:SubpassDependency}; allocator = C_NULL, next = C_NULL, flags = 0) = RenderPass(device, convert(Vector{_AttachmentDescription}, attachments), convert(Vector{_SubpassDescription}, subpasses), convert(Vector{_SubpassDependency}, dependencies); allocator, next, flags)

RenderPass(device::Device, attachments::AbstractArray{<:AttachmentDescription2}, subpasses::AbstractArray{<:SubpassDescription2}, dependencies::AbstractArray{<:SubpassDependency2}, correlated_view_masks::AbstractArray{<:Integer}; allocator = C_NULL, next = C_NULL, flags = 0) = RenderPass(device, convert(Vector{_AttachmentDescription2}, attachments), convert(Vector{_SubpassDescription2}, subpasses), convert(Vector{_SubpassDependency2}, dependencies), correlated_view_masks; allocator, next, flags)

IndirectCommandsLayoutNV(device::Device, pipeline_bind_point::PipelineBindPoint, tokens::AbstractArray{<:IndirectCommandsLayoutTokenNV}, stream_strides::AbstractArray{<:Integer}; allocator = C_NULL, next = C_NULL, flags = 0) = IndirectCommandsLayoutNV(device, pipeline_bind_point, convert(Vector{_IndirectCommandsLayoutTokenNV}, tokens), stream_strides; allocator, next, flags)

DescriptorUpdateTemplate(device::Device, descriptor_update_entries::AbstractArray{<:DescriptorUpdateTemplateEntry}, template_type::DescriptorUpdateTemplateType, descriptor_set_layout::DescriptorSetLayout, pipeline_bind_point::PipelineBindPoint, pipeline_layout::PipelineLayout, set::Integer; allocator = C_NULL, next = C_NULL, flags = 0) = DescriptorUpdateTemplate(device, convert(Vector{_DescriptorUpdateTemplateEntry}, descriptor_update_entries), template_type, descriptor_set_layout, pipeline_bind_point, pipeline_layout, set; allocator, next, flags)

SamplerYcbcrConversion(device::Device, format::Format, ycbcr_model::SamplerYcbcrModelConversion, ycbcr_range::SamplerYcbcrRange, components::ComponentMapping, x_chroma_offset::ChromaLocation, y_chroma_offset::ChromaLocation, chroma_filter::Filter, force_explicit_reconstruction::Bool; allocator = C_NULL, next = C_NULL) = SamplerYcbcrConversion(device, format, ycbcr_model, ycbcr_range, convert(_ComponentMapping, components), x_chroma_offset, y_chroma_offset, chroma_filter, force_explicit_reconstruction; allocator, next)

AccelerationStructureNV(device::Device, compacted_size::Integer, info::AccelerationStructureInfoNV; allocator = C_NULL, next = C_NULL) = AccelerationStructureNV(device, compacted_size, convert(_AccelerationStructureInfoNV, info); allocator, next)

DisplayModeKHR(physical_device::PhysicalDevice, display::DisplayKHR, parameters::DisplayModeParametersKHR; allocator = C_NULL, next = C_NULL, flags = 0) = DisplayModeKHR(physical_device, display, convert(_DisplayModeParametersKHR, parameters); allocator, next, flags)

SwapchainKHR(device::Device, surface::SurfaceKHR, min_image_count::Integer, image_format::Format, image_color_space::ColorSpaceKHR, image_extent::Extent2D, image_array_layers::Integer, image_usage::ImageUsageFlag, image_sharing_mode::SharingMode, queue_family_indices::AbstractArray{<:Integer}, pre_transform::SurfaceTransformFlagKHR, composite_alpha::CompositeAlphaFlagKHR, present_mode::PresentModeKHR, clipped::Bool; allocator = C_NULL, next = C_NULL, flags = 0, old_swapchain = C_NULL) = SwapchainKHR(device, surface, min_image_count, image_format, image_color_space, convert(_Extent2D, image_extent), image_array_layers, image_usage, image_sharing_mode, queue_family_indices, pre_transform, composite_alpha, present_mode, clipped; allocator, next, flags, old_swapchain)

VideoSessionKHR(device::Device, queue_family_index::Integer, video_profile::VideoProfileKHR, picture_format::Format, max_coded_extent::Extent2D, reference_pictures_format::Format, max_reference_pictures_slots_count::Integer, max_reference_pictures_active_count::Integer; allocator = C_NULL, next = C_NULL, flags = 0) = VideoSessionKHR(device, queue_family_index, convert(_VideoProfileKHR, video_profile), picture_format, convert(_Extent2D, max_coded_extent), reference_pictures_format, max_reference_pictures_slots_count, max_reference_pictures_active_count; allocator, next, flags)

create_instance(create_info::InstanceCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_instance(convert(_InstanceCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_device(physical_device::PhysicalDevice, create_info::DeviceCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_device(physical_device, convert(_DeviceCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

queue_submit(queue::Queue, submits::AbstractArray{<:SubmitInfo}, fun_ptr::FunctionPtr; fence = C_NULL) = queue_submit(queue, convert(Vector{_SubmitInfo}, submits), fun_ptr; fence)

allocate_memory(device::Device, allocate_info::MemoryAllocateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = allocate_memory(device, convert(_MemoryAllocateInfo, allocate_info), fun_ptr_create, fun_ptr_destroy; allocator)

flush_mapped_memory_ranges(device::Device, memory_ranges::AbstractArray{<:MappedMemoryRange}, fun_ptr::FunctionPtr) = flush_mapped_memory_ranges(device, convert(Vector{_MappedMemoryRange}, memory_ranges), fun_ptr)

invalidate_mapped_memory_ranges(device::Device, memory_ranges::AbstractArray{<:MappedMemoryRange}, fun_ptr::FunctionPtr) = invalidate_mapped_memory_ranges(device, convert(Vector{_MappedMemoryRange}, memory_ranges), fun_ptr)

queue_bind_sparse(queue::Queue, bind_info::AbstractArray{<:BindSparseInfo}, fun_ptr::FunctionPtr; fence = C_NULL) = queue_bind_sparse(queue, convert(Vector{_BindSparseInfo}, bind_info), fun_ptr; fence)

create_fence(device::Device, create_info::FenceCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_fence(device, convert(_FenceCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_semaphore(device::Device, create_info::SemaphoreCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_semaphore(device, convert(_SemaphoreCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_event(device::Device, create_info::EventCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_event(device, convert(_EventCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_query_pool(device::Device, create_info::QueryPoolCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_query_pool(device, convert(_QueryPoolCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_buffer(device::Device, create_info::BufferCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_buffer(device, convert(_BufferCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_buffer_view(device::Device, create_info::BufferViewCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_buffer_view(device, convert(_BufferViewCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_image(device::Device, create_info::ImageCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_image(device, convert(_ImageCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

get_image_subresource_layout(device::Device, image::Image, subresource::ImageSubresource, fun_ptr::FunctionPtr) = get_image_subresource_layout(device, image, convert(_ImageSubresource, subresource), fun_ptr)

create_image_view(device::Device, create_info::ImageViewCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_image_view(device, convert(_ImageViewCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_shader_module(device::Device, create_info::ShaderModuleCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_shader_module(device, convert(_ShaderModuleCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_pipeline_cache(device::Device, create_info::PipelineCacheCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_pipeline_cache(device, convert(_PipelineCacheCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_graphics_pipelines(device::Device, create_infos::AbstractArray{<:GraphicsPipelineCreateInfo}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; pipeline_cache = C_NULL, allocator = C_NULL) = create_graphics_pipelines(device, convert(Vector{_GraphicsPipelineCreateInfo}, create_infos), fun_ptr_create, fun_ptr_destroy; pipeline_cache, allocator)

create_compute_pipelines(device::Device, create_infos::AbstractArray{<:ComputePipelineCreateInfo}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; pipeline_cache = C_NULL, allocator = C_NULL) = create_compute_pipelines(device, convert(Vector{_ComputePipelineCreateInfo}, create_infos), fun_ptr_create, fun_ptr_destroy; pipeline_cache, allocator)

create_pipeline_layout(device::Device, create_info::PipelineLayoutCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_pipeline_layout(device, convert(_PipelineLayoutCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_sampler(device::Device, create_info::SamplerCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_sampler(device, convert(_SamplerCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_descriptor_set_layout(device::Device, create_info::DescriptorSetLayoutCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_descriptor_set_layout(device, convert(_DescriptorSetLayoutCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_descriptor_pool(device::Device, create_info::DescriptorPoolCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_descriptor_pool(device, convert(_DescriptorPoolCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

allocate_descriptor_sets(device::Device, allocate_info::DescriptorSetAllocateInfo, fun_ptr_create::FunctionPtr) = allocate_descriptor_sets(device, convert(_DescriptorSetAllocateInfo, allocate_info), fun_ptr_create)

update_descriptor_sets(device::Device, descriptor_writes::AbstractArray{<:WriteDescriptorSet}, descriptor_copies::AbstractArray{<:CopyDescriptorSet}, fun_ptr::FunctionPtr) = update_descriptor_sets(device, convert(Vector{_WriteDescriptorSet}, descriptor_writes), convert(Vector{_CopyDescriptorSet}, descriptor_copies), fun_ptr)

create_framebuffer(device::Device, create_info::FramebufferCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_framebuffer(device, convert(_FramebufferCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_render_pass(device::Device, create_info::RenderPassCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_render_pass(device, convert(_RenderPassCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_command_pool(device::Device, create_info::CommandPoolCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_command_pool(device, convert(_CommandPoolCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

allocate_command_buffers(device::Device, allocate_info::CommandBufferAllocateInfo, fun_ptr_create::FunctionPtr) = allocate_command_buffers(device, convert(_CommandBufferAllocateInfo, allocate_info), fun_ptr_create)

begin_command_buffer(command_buffer::CommandBuffer, begin_info::CommandBufferBeginInfo, fun_ptr::FunctionPtr) = begin_command_buffer(command_buffer, convert(_CommandBufferBeginInfo, begin_info), fun_ptr)

cmd_set_viewport(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}, fun_ptr::FunctionPtr) = cmd_set_viewport(command_buffer, convert(Vector{_Viewport}, viewports), fun_ptr)

cmd_set_scissor(command_buffer::CommandBuffer, scissors::AbstractArray{<:Rect2D}, fun_ptr::FunctionPtr) = cmd_set_scissor(command_buffer, convert(Vector{_Rect2D}, scissors), fun_ptr)

cmd_copy_buffer(command_buffer::CommandBuffer, src_buffer::Buffer, dst_buffer::Buffer, regions::AbstractArray{<:BufferCopy}, fun_ptr::FunctionPtr) = cmd_copy_buffer(command_buffer, src_buffer, dst_buffer, convert(Vector{_BufferCopy}, regions), fun_ptr)

cmd_copy_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray{<:ImageCopy}, fun_ptr::FunctionPtr) = cmd_copy_image(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, convert(Vector{_ImageCopy}, regions), fun_ptr)

cmd_blit_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray{<:ImageBlit}, filter::Filter, fun_ptr::FunctionPtr) = cmd_blit_image(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, convert(Vector{_ImageBlit}, regions), filter, fun_ptr)

cmd_copy_buffer_to_image(command_buffer::CommandBuffer, src_buffer::Buffer, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray{<:BufferImageCopy}, fun_ptr::FunctionPtr) = cmd_copy_buffer_to_image(command_buffer, src_buffer, dst_image, dst_image_layout, convert(Vector{_BufferImageCopy}, regions), fun_ptr)

cmd_copy_image_to_buffer(command_buffer::CommandBuffer, src_image::Image, src_image_layout::ImageLayout, dst_buffer::Buffer, regions::AbstractArray{<:BufferImageCopy}, fun_ptr::FunctionPtr) = cmd_copy_image_to_buffer(command_buffer, src_image, src_image_layout, dst_buffer, convert(Vector{_BufferImageCopy}, regions), fun_ptr)

cmd_clear_color_image(command_buffer::CommandBuffer, image::Image, image_layout::ImageLayout, color::VkClearColorValue, ranges::AbstractArray{<:ImageSubresourceRange}, fun_ptr::FunctionPtr) = cmd_clear_color_image(command_buffer, image, image_layout, color, convert(Vector{_ImageSubresourceRange}, ranges), fun_ptr)

cmd_clear_depth_stencil_image(command_buffer::CommandBuffer, image::Image, image_layout::ImageLayout, depth_stencil::ClearDepthStencilValue, ranges::AbstractArray{<:ImageSubresourceRange}, fun_ptr::FunctionPtr) = cmd_clear_depth_stencil_image(command_buffer, image, image_layout, convert(_ClearDepthStencilValue, depth_stencil), convert(Vector{_ImageSubresourceRange}, ranges), fun_ptr)

cmd_clear_attachments(command_buffer::CommandBuffer, attachments::AbstractArray{<:ClearAttachment}, rects::AbstractArray{<:ClearRect}, fun_ptr::FunctionPtr) = cmd_clear_attachments(command_buffer, convert(Vector{_ClearAttachment}, attachments), convert(Vector{_ClearRect}, rects), fun_ptr)

cmd_resolve_image(command_buffer::CommandBuffer, src_image::Image, src_image_layout::ImageLayout, dst_image::Image, dst_image_layout::ImageLayout, regions::AbstractArray{<:ImageResolve}, fun_ptr::FunctionPtr) = cmd_resolve_image(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, convert(Vector{_ImageResolve}, regions), fun_ptr)

cmd_wait_events(command_buffer::CommandBuffer, events::AbstractArray{<:Event}, memory_barriers::AbstractArray{<:MemoryBarrier}, buffer_memory_barriers::AbstractArray{<:BufferMemoryBarrier}, image_memory_barriers::AbstractArray{<:ImageMemoryBarrier}, fun_ptr::FunctionPtr; src_stage_mask = 0, dst_stage_mask = 0) = cmd_wait_events(command_buffer, events, convert(Vector{_MemoryBarrier}, memory_barriers), convert(Vector{_BufferMemoryBarrier}, buffer_memory_barriers), convert(Vector{_ImageMemoryBarrier}, image_memory_barriers), fun_ptr; src_stage_mask, dst_stage_mask)

cmd_pipeline_barrier(command_buffer::CommandBuffer, src_stage_mask::PipelineStageFlag, dst_stage_mask::PipelineStageFlag, memory_barriers::AbstractArray{<:MemoryBarrier}, buffer_memory_barriers::AbstractArray{<:BufferMemoryBarrier}, image_memory_barriers::AbstractArray{<:ImageMemoryBarrier}, fun_ptr::FunctionPtr; dependency_flags = 0) = cmd_pipeline_barrier(command_buffer, src_stage_mask, dst_stage_mask, convert(Vector{_MemoryBarrier}, memory_barriers), convert(Vector{_BufferMemoryBarrier}, buffer_memory_barriers), convert(Vector{_ImageMemoryBarrier}, image_memory_barriers), fun_ptr; dependency_flags)

cmd_begin_conditional_rendering_ext(command_buffer::CommandBuffer, conditional_rendering_begin::ConditionalRenderingBeginInfoEXT, fun_ptr::FunctionPtr) = cmd_begin_conditional_rendering_ext(command_buffer, convert(_ConditionalRenderingBeginInfoEXT, conditional_rendering_begin), fun_ptr)

cmd_begin_render_pass(command_buffer::CommandBuffer, render_pass_begin::RenderPassBeginInfo, contents::SubpassContents, fun_ptr::FunctionPtr) = cmd_begin_render_pass(command_buffer, convert(_RenderPassBeginInfo, render_pass_begin), contents, fun_ptr)

create_android_surface_khr(instance::Instance, create_info::AndroidSurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_android_surface_khr(instance, convert(_AndroidSurfaceCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_display_mode_khr(physical_device::PhysicalDevice, display::DisplayKHR, create_info::DisplayModeCreateInfoKHR, fun_ptr_create::FunctionPtr; allocator = C_NULL) = create_display_mode_khr(physical_device, display, convert(_DisplayModeCreateInfoKHR, create_info), fun_ptr_create; allocator)

create_display_plane_surface_khr(instance::Instance, create_info::DisplaySurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_display_plane_surface_khr(instance, convert(_DisplaySurfaceCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_shared_swapchains_khr(device::Device, create_infos::AbstractArray{<:SwapchainCreateInfoKHR}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_shared_swapchains_khr(device, convert(Vector{_SwapchainCreateInfoKHR}, create_infos), fun_ptr_create, fun_ptr_destroy; allocator)

create_swapchain_khr(device::Device, create_info::SwapchainCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_swapchain_khr(device, convert(_SwapchainCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

queue_present_khr(queue::Queue, present_info::PresentInfoKHR, fun_ptr::FunctionPtr) = queue_present_khr(queue, convert(_PresentInfoKHR, present_info), fun_ptr)

create_vi_surface_nn(instance::Instance, create_info::ViSurfaceCreateInfoNN, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_vi_surface_nn(instance, convert(_ViSurfaceCreateInfoNN, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_wayland_surface_khr(instance::Instance, create_info::WaylandSurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_wayland_surface_khr(instance, convert(_WaylandSurfaceCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_win_32_surface_khr(instance::Instance, create_info::Win32SurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_win_32_surface_khr(instance, convert(_Win32SurfaceCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_xlib_surface_khr(instance::Instance, create_info::XlibSurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_xlib_surface_khr(instance, convert(_XlibSurfaceCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_xcb_surface_khr(instance::Instance, create_info::XcbSurfaceCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_xcb_surface_khr(instance, convert(_XcbSurfaceCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_direct_fb_surface_ext(instance::Instance, create_info::DirectFBSurfaceCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_direct_fb_surface_ext(instance, convert(_DirectFBSurfaceCreateInfoEXT, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_image_pipe_surface_fuchsia(instance::Instance, create_info::ImagePipeSurfaceCreateInfoFUCHSIA, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_image_pipe_surface_fuchsia(instance, convert(_ImagePipeSurfaceCreateInfoFUCHSIA, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_stream_descriptor_surface_ggp(instance::Instance, create_info::StreamDescriptorSurfaceCreateInfoGGP, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_stream_descriptor_surface_ggp(instance, convert(_StreamDescriptorSurfaceCreateInfoGGP, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_screen_surface_qnx(instance::Instance, create_info::ScreenSurfaceCreateInfoQNX, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_screen_surface_qnx(instance, convert(_ScreenSurfaceCreateInfoQNX, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_debug_report_callback_ext(instance::Instance, create_info::DebugReportCallbackCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_debug_report_callback_ext(instance, convert(_DebugReportCallbackCreateInfoEXT, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

debug_marker_set_object_name_ext(device::Device, name_info::DebugMarkerObjectNameInfoEXT, fun_ptr::FunctionPtr) = debug_marker_set_object_name_ext(device, convert(_DebugMarkerObjectNameInfoEXT, name_info), fun_ptr)

debug_marker_set_object_tag_ext(device::Device, tag_info::DebugMarkerObjectTagInfoEXT, fun_ptr::FunctionPtr) = debug_marker_set_object_tag_ext(device, convert(_DebugMarkerObjectTagInfoEXT, tag_info), fun_ptr)

cmd_debug_marker_begin_ext(command_buffer::CommandBuffer, marker_info::DebugMarkerMarkerInfoEXT, fun_ptr::FunctionPtr) = cmd_debug_marker_begin_ext(command_buffer, convert(_DebugMarkerMarkerInfoEXT, marker_info), fun_ptr)

cmd_debug_marker_insert_ext(command_buffer::CommandBuffer, marker_info::DebugMarkerMarkerInfoEXT, fun_ptr::FunctionPtr) = cmd_debug_marker_insert_ext(command_buffer, convert(_DebugMarkerMarkerInfoEXT, marker_info), fun_ptr)

cmd_execute_generated_commands_nv(command_buffer::CommandBuffer, is_preprocessed::Bool, generated_commands_info::GeneratedCommandsInfoNV, fun_ptr::FunctionPtr) = cmd_execute_generated_commands_nv(command_buffer, is_preprocessed, convert(_GeneratedCommandsInfoNV, generated_commands_info), fun_ptr)

cmd_preprocess_generated_commands_nv(command_buffer::CommandBuffer, generated_commands_info::GeneratedCommandsInfoNV, fun_ptr::FunctionPtr) = cmd_preprocess_generated_commands_nv(command_buffer, convert(_GeneratedCommandsInfoNV, generated_commands_info), fun_ptr)

get_generated_commands_memory_requirements_nv(device::Device, info::GeneratedCommandsMemoryRequirementsInfoNV, fun_ptr::FunctionPtr) = get_generated_commands_memory_requirements_nv(device, convert(_GeneratedCommandsMemoryRequirementsInfoNV, info), fun_ptr)

create_indirect_commands_layout_nv(device::Device, create_info::IndirectCommandsLayoutCreateInfoNV, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_indirect_commands_layout_nv(device, convert(_IndirectCommandsLayoutCreateInfoNV, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

get_physical_device_image_format_properties_2(physical_device::PhysicalDevice, image_format_info::PhysicalDeviceImageFormatInfo2, fun_ptr::FunctionPtr) = get_physical_device_image_format_properties_2(physical_device, convert(_PhysicalDeviceImageFormatInfo2, image_format_info), fun_ptr)

get_physical_device_sparse_image_format_properties_2(physical_device::PhysicalDevice, format_info::PhysicalDeviceSparseImageFormatInfo2, fun_ptr::FunctionPtr) = get_physical_device_sparse_image_format_properties_2(physical_device, convert(_PhysicalDeviceSparseImageFormatInfo2, format_info), fun_ptr)

cmd_push_descriptor_set_khr(command_buffer::CommandBuffer, pipeline_bind_point::PipelineBindPoint, layout::PipelineLayout, set::Integer, descriptor_writes::AbstractArray{<:WriteDescriptorSet}, fun_ptr::FunctionPtr) = cmd_push_descriptor_set_khr(command_buffer, pipeline_bind_point, layout, set, convert(Vector{_WriteDescriptorSet}, descriptor_writes), fun_ptr)

get_physical_device_external_buffer_properties(physical_device::PhysicalDevice, external_buffer_info::PhysicalDeviceExternalBufferInfo, fun_ptr::FunctionPtr) = get_physical_device_external_buffer_properties(physical_device, convert(_PhysicalDeviceExternalBufferInfo, external_buffer_info), fun_ptr)

get_memory_win_32_handle_khr(device::Device, get_win_32_handle_info::MemoryGetWin32HandleInfoKHR, handle::vk.HANDLE, fun_ptr::FunctionPtr) = get_memory_win_32_handle_khr(device, convert(_MemoryGetWin32HandleInfoKHR, get_win_32_handle_info), handle, fun_ptr)

get_memory_fd_khr(device::Device, get_fd_info::MemoryGetFdInfoKHR, fun_ptr::FunctionPtr) = get_memory_fd_khr(device, convert(_MemoryGetFdInfoKHR, get_fd_info), fun_ptr)

get_memory_zircon_handle_fuchsia(device::Device, get_zircon_handle_info::MemoryGetZirconHandleInfoFUCHSIA, zircon_handle::vk.zx_handle_t, fun_ptr::FunctionPtr) = get_memory_zircon_handle_fuchsia(device, convert(_MemoryGetZirconHandleInfoFUCHSIA, get_zircon_handle_info), zircon_handle, fun_ptr)

get_physical_device_external_semaphore_properties(physical_device::PhysicalDevice, external_semaphore_info::PhysicalDeviceExternalSemaphoreInfo, fun_ptr::FunctionPtr) = get_physical_device_external_semaphore_properties(physical_device, convert(_PhysicalDeviceExternalSemaphoreInfo, external_semaphore_info), fun_ptr)

get_semaphore_win_32_handle_khr(device::Device, get_win_32_handle_info::SemaphoreGetWin32HandleInfoKHR, handle::vk.HANDLE, fun_ptr::FunctionPtr) = get_semaphore_win_32_handle_khr(device, convert(_SemaphoreGetWin32HandleInfoKHR, get_win_32_handle_info), handle, fun_ptr)

import_semaphore_win_32_handle_khr(device::Device, import_semaphore_win_32_handle_info::ImportSemaphoreWin32HandleInfoKHR, fun_ptr::FunctionPtr) = import_semaphore_win_32_handle_khr(device, convert(_ImportSemaphoreWin32HandleInfoKHR, import_semaphore_win_32_handle_info), fun_ptr)

get_semaphore_fd_khr(device::Device, get_fd_info::SemaphoreGetFdInfoKHR, fun_ptr::FunctionPtr) = get_semaphore_fd_khr(device, convert(_SemaphoreGetFdInfoKHR, get_fd_info), fun_ptr)

import_semaphore_fd_khr(device::Device, import_semaphore_fd_info::ImportSemaphoreFdInfoKHR, fun_ptr::FunctionPtr) = import_semaphore_fd_khr(device, convert(_ImportSemaphoreFdInfoKHR, import_semaphore_fd_info), fun_ptr)

get_semaphore_zircon_handle_fuchsia(device::Device, get_zircon_handle_info::SemaphoreGetZirconHandleInfoFUCHSIA, zircon_handle::vk.zx_handle_t, fun_ptr::FunctionPtr) = get_semaphore_zircon_handle_fuchsia(device, convert(_SemaphoreGetZirconHandleInfoFUCHSIA, get_zircon_handle_info), zircon_handle, fun_ptr)

import_semaphore_zircon_handle_fuchsia(device::Device, import_semaphore_zircon_handle_info::ImportSemaphoreZirconHandleInfoFUCHSIA, fun_ptr::FunctionPtr) = import_semaphore_zircon_handle_fuchsia(device, convert(_ImportSemaphoreZirconHandleInfoFUCHSIA, import_semaphore_zircon_handle_info), fun_ptr)

get_physical_device_external_fence_properties(physical_device::PhysicalDevice, external_fence_info::PhysicalDeviceExternalFenceInfo, fun_ptr::FunctionPtr) = get_physical_device_external_fence_properties(physical_device, convert(_PhysicalDeviceExternalFenceInfo, external_fence_info), fun_ptr)

get_fence_win_32_handle_khr(device::Device, get_win_32_handle_info::FenceGetWin32HandleInfoKHR, handle::vk.HANDLE, fun_ptr::FunctionPtr) = get_fence_win_32_handle_khr(device, convert(_FenceGetWin32HandleInfoKHR, get_win_32_handle_info), handle, fun_ptr)

import_fence_win_32_handle_khr(device::Device, import_fence_win_32_handle_info::ImportFenceWin32HandleInfoKHR, fun_ptr::FunctionPtr) = import_fence_win_32_handle_khr(device, convert(_ImportFenceWin32HandleInfoKHR, import_fence_win_32_handle_info), fun_ptr)

get_fence_fd_khr(device::Device, get_fd_info::FenceGetFdInfoKHR, fun_ptr::FunctionPtr) = get_fence_fd_khr(device, convert(_FenceGetFdInfoKHR, get_fd_info), fun_ptr)

import_fence_fd_khr(device::Device, import_fence_fd_info::ImportFenceFdInfoKHR, fun_ptr::FunctionPtr) = import_fence_fd_khr(device, convert(_ImportFenceFdInfoKHR, import_fence_fd_info), fun_ptr)

display_power_control_ext(device::Device, display::DisplayKHR, display_power_info::DisplayPowerInfoEXT, fun_ptr::FunctionPtr) = display_power_control_ext(device, display, convert(_DisplayPowerInfoEXT, display_power_info), fun_ptr)

register_device_event_ext(device::Device, device_event_info::DeviceEventInfoEXT, fun_ptr::FunctionPtr; allocator = C_NULL) = register_device_event_ext(device, convert(_DeviceEventInfoEXT, device_event_info), fun_ptr; allocator)

register_display_event_ext(device::Device, display::DisplayKHR, display_event_info::DisplayEventInfoEXT, fun_ptr::FunctionPtr; allocator = C_NULL) = register_display_event_ext(device, display, convert(_DisplayEventInfoEXT, display_event_info), fun_ptr; allocator)

bind_buffer_memory_2(device::Device, bind_infos::AbstractArray{<:BindBufferMemoryInfo}, fun_ptr::FunctionPtr) = bind_buffer_memory_2(device, convert(Vector{_BindBufferMemoryInfo}, bind_infos), fun_ptr)

bind_image_memory_2(device::Device, bind_infos::AbstractArray{<:BindImageMemoryInfo}, fun_ptr::FunctionPtr) = bind_image_memory_2(device, convert(Vector{_BindImageMemoryInfo}, bind_infos), fun_ptr)

acquire_next_image_2_khr(device::Device, acquire_info::AcquireNextImageInfoKHR, fun_ptr::FunctionPtr) = acquire_next_image_2_khr(device, convert(_AcquireNextImageInfoKHR, acquire_info), fun_ptr)

create_descriptor_update_template(device::Device, create_info::DescriptorUpdateTemplateCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_descriptor_update_template(device, convert(_DescriptorUpdateTemplateCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

set_hdr_metadata_ext(device::Device, swapchains::AbstractArray{<:SwapchainKHR}, metadata::AbstractArray{<:HdrMetadataEXT}, fun_ptr::FunctionPtr) = set_hdr_metadata_ext(device, swapchains, convert(Vector{_HdrMetadataEXT}, metadata), fun_ptr)

create_ios_surface_mvk(instance::Instance, create_info::IOSSurfaceCreateInfoMVK, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_ios_surface_mvk(instance, convert(_IOSSurfaceCreateInfoMVK, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_mac_os_surface_mvk(instance::Instance, create_info::MacOSSurfaceCreateInfoMVK, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_mac_os_surface_mvk(instance, convert(_MacOSSurfaceCreateInfoMVK, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_metal_surface_ext(instance::Instance, create_info::MetalSurfaceCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_metal_surface_ext(instance, convert(_MetalSurfaceCreateInfoEXT, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

cmd_set_viewport_w_scaling_nv(command_buffer::CommandBuffer, viewport_w_scalings::AbstractArray{<:ViewportWScalingNV}, fun_ptr::FunctionPtr) = cmd_set_viewport_w_scaling_nv(command_buffer, convert(Vector{_ViewportWScalingNV}, viewport_w_scalings), fun_ptr)

cmd_set_discard_rectangle_ext(command_buffer::CommandBuffer, discard_rectangles::AbstractArray{<:Rect2D}, fun_ptr::FunctionPtr) = cmd_set_discard_rectangle_ext(command_buffer, convert(Vector{_Rect2D}, discard_rectangles), fun_ptr)

cmd_set_sample_locations_ext(command_buffer::CommandBuffer, sample_locations_info::SampleLocationsInfoEXT, fun_ptr::FunctionPtr) = cmd_set_sample_locations_ext(command_buffer, convert(_SampleLocationsInfoEXT, sample_locations_info), fun_ptr)

get_physical_device_surface_capabilities_2_khr(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR, fun_ptr::FunctionPtr) = get_physical_device_surface_capabilities_2_khr(physical_device, convert(_PhysicalDeviceSurfaceInfo2KHR, surface_info), fun_ptr)

get_physical_device_surface_formats_2_khr(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR, fun_ptr::FunctionPtr) = get_physical_device_surface_formats_2_khr(physical_device, convert(_PhysicalDeviceSurfaceInfo2KHR, surface_info), fun_ptr)

get_display_plane_capabilities_2_khr(physical_device::PhysicalDevice, display_plane_info::DisplayPlaneInfo2KHR, fun_ptr::FunctionPtr) = get_display_plane_capabilities_2_khr(physical_device, convert(_DisplayPlaneInfo2KHR, display_plane_info), fun_ptr)

get_buffer_memory_requirements_2(device::Device, info::BufferMemoryRequirementsInfo2, fun_ptr::FunctionPtr) = get_buffer_memory_requirements_2(device, convert(_BufferMemoryRequirementsInfo2, info), fun_ptr)

get_image_memory_requirements_2(device::Device, info::ImageMemoryRequirementsInfo2, fun_ptr::FunctionPtr) = get_image_memory_requirements_2(device, convert(_ImageMemoryRequirementsInfo2, info), fun_ptr)

get_image_sparse_memory_requirements_2(device::Device, info::ImageSparseMemoryRequirementsInfo2, fun_ptr::FunctionPtr) = get_image_sparse_memory_requirements_2(device, convert(_ImageSparseMemoryRequirementsInfo2, info), fun_ptr)

create_sampler_ycbcr_conversion(device::Device, create_info::SamplerYcbcrConversionCreateInfo, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_sampler_ycbcr_conversion(device, convert(_SamplerYcbcrConversionCreateInfo, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

get_device_queue_2(device::Device, queue_info::DeviceQueueInfo2, fun_ptr::FunctionPtr) = get_device_queue_2(device, convert(_DeviceQueueInfo2, queue_info), fun_ptr)

create_validation_cache_ext(device::Device, create_info::ValidationCacheCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_validation_cache_ext(device, convert(_ValidationCacheCreateInfoEXT, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

get_descriptor_set_layout_support(device::Device, create_info::DescriptorSetLayoutCreateInfo, fun_ptr::FunctionPtr) = get_descriptor_set_layout_support(device, convert(_DescriptorSetLayoutCreateInfo, create_info), fun_ptr)

get_calibrated_timestamps_ext(device::Device, timestamp_infos::AbstractArray{<:CalibratedTimestampInfoEXT}, fun_ptr::FunctionPtr) = get_calibrated_timestamps_ext(device, convert(Vector{_CalibratedTimestampInfoEXT}, timestamp_infos), fun_ptr)

set_debug_utils_object_name_ext(device::Device, name_info::DebugUtilsObjectNameInfoEXT, fun_ptr::FunctionPtr) = set_debug_utils_object_name_ext(device, convert(_DebugUtilsObjectNameInfoEXT, name_info), fun_ptr)

set_debug_utils_object_tag_ext(device::Device, tag_info::DebugUtilsObjectTagInfoEXT, fun_ptr::FunctionPtr) = set_debug_utils_object_tag_ext(device, convert(_DebugUtilsObjectTagInfoEXT, tag_info), fun_ptr)

queue_begin_debug_utils_label_ext(queue::Queue, label_info::DebugUtilsLabelEXT, fun_ptr::FunctionPtr) = queue_begin_debug_utils_label_ext(queue, convert(_DebugUtilsLabelEXT, label_info), fun_ptr)

queue_insert_debug_utils_label_ext(queue::Queue, label_info::DebugUtilsLabelEXT, fun_ptr::FunctionPtr) = queue_insert_debug_utils_label_ext(queue, convert(_DebugUtilsLabelEXT, label_info), fun_ptr)

cmd_begin_debug_utils_label_ext(command_buffer::CommandBuffer, label_info::DebugUtilsLabelEXT, fun_ptr::FunctionPtr) = cmd_begin_debug_utils_label_ext(command_buffer, convert(_DebugUtilsLabelEXT, label_info), fun_ptr)

cmd_insert_debug_utils_label_ext(command_buffer::CommandBuffer, label_info::DebugUtilsLabelEXT, fun_ptr::FunctionPtr) = cmd_insert_debug_utils_label_ext(command_buffer, convert(_DebugUtilsLabelEXT, label_info), fun_ptr)

create_debug_utils_messenger_ext(instance::Instance, create_info::DebugUtilsMessengerCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_debug_utils_messenger_ext(instance, convert(_DebugUtilsMessengerCreateInfoEXT, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

submit_debug_utils_message_ext(instance::Instance, message_severity::DebugUtilsMessageSeverityFlagEXT, message_types::DebugUtilsMessageTypeFlagEXT, callback_data::DebugUtilsMessengerCallbackDataEXT, fun_ptr::FunctionPtr) = submit_debug_utils_message_ext(instance, message_severity, message_types, convert(_DebugUtilsMessengerCallbackDataEXT, callback_data), fun_ptr)

create_render_pass_2(device::Device, create_info::RenderPassCreateInfo2, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_render_pass_2(device, convert(_RenderPassCreateInfo2, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

cmd_begin_render_pass_2(command_buffer::CommandBuffer, render_pass_begin::RenderPassBeginInfo, subpass_begin_info::SubpassBeginInfo, fun_ptr::FunctionPtr) = cmd_begin_render_pass_2(command_buffer, convert(_RenderPassBeginInfo, render_pass_begin), convert(_SubpassBeginInfo, subpass_begin_info), fun_ptr)

cmd_next_subpass_2(command_buffer::CommandBuffer, subpass_begin_info::SubpassBeginInfo, subpass_end_info::SubpassEndInfo, fun_ptr::FunctionPtr) = cmd_next_subpass_2(command_buffer, convert(_SubpassBeginInfo, subpass_begin_info), convert(_SubpassEndInfo, subpass_end_info), fun_ptr)

cmd_end_render_pass_2(command_buffer::CommandBuffer, subpass_end_info::SubpassEndInfo, fun_ptr::FunctionPtr) = cmd_end_render_pass_2(command_buffer, convert(_SubpassEndInfo, subpass_end_info), fun_ptr)

wait_semaphores(device::Device, wait_info::SemaphoreWaitInfo, timeout::Integer, fun_ptr::FunctionPtr) = wait_semaphores(device, convert(_SemaphoreWaitInfo, wait_info), timeout, fun_ptr)

signal_semaphore(device::Device, signal_info::SemaphoreSignalInfo, fun_ptr::FunctionPtr) = signal_semaphore(device, convert(_SemaphoreSignalInfo, signal_info), fun_ptr)

get_memory_android_hardware_buffer_android(device::Device, info::MemoryGetAndroidHardwareBufferInfoANDROID, fun_ptr::FunctionPtr) = get_memory_android_hardware_buffer_android(device, convert(_MemoryGetAndroidHardwareBufferInfoANDROID, info), fun_ptr)

cmd_set_exclusive_scissor_nv(command_buffer::CommandBuffer, exclusive_scissors::AbstractArray{<:Rect2D}, fun_ptr::FunctionPtr) = cmd_set_exclusive_scissor_nv(command_buffer, convert(Vector{_Rect2D}, exclusive_scissors), fun_ptr)

cmd_set_viewport_shading_rate_palette_nv(command_buffer::CommandBuffer, shading_rate_palettes::AbstractArray{<:ShadingRatePaletteNV}, fun_ptr::FunctionPtr) = cmd_set_viewport_shading_rate_palette_nv(command_buffer, convert(Vector{_ShadingRatePaletteNV}, shading_rate_palettes), fun_ptr)

cmd_set_coarse_sample_order_nv(command_buffer::CommandBuffer, sample_order_type::CoarseSampleOrderTypeNV, custom_sample_orders::AbstractArray{<:CoarseSampleOrderCustomNV}, fun_ptr::FunctionPtr) = cmd_set_coarse_sample_order_nv(command_buffer, sample_order_type, convert(Vector{_CoarseSampleOrderCustomNV}, custom_sample_orders), fun_ptr)

create_acceleration_structure_nv(device::Device, create_info::AccelerationStructureCreateInfoNV, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_acceleration_structure_nv(device, convert(_AccelerationStructureCreateInfoNV, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

get_acceleration_structure_memory_requirements_nv(device::Device, info::AccelerationStructureMemoryRequirementsInfoNV, fun_ptr::FunctionPtr) = get_acceleration_structure_memory_requirements_nv(device, convert(_AccelerationStructureMemoryRequirementsInfoNV, info), fun_ptr)

bind_acceleration_structure_memory_nv(device::Device, bind_infos::AbstractArray{<:BindAccelerationStructureMemoryInfoNV}, fun_ptr::FunctionPtr) = bind_acceleration_structure_memory_nv(device, convert(Vector{_BindAccelerationStructureMemoryInfoNV}, bind_infos), fun_ptr)

cmd_copy_acceleration_structure_khr(command_buffer::CommandBuffer, info::CopyAccelerationStructureInfoKHR, fun_ptr::FunctionPtr) = cmd_copy_acceleration_structure_khr(command_buffer, convert(_CopyAccelerationStructureInfoKHR, info), fun_ptr)

copy_acceleration_structure_khr(device::Device, info::CopyAccelerationStructureInfoKHR, fun_ptr::FunctionPtr; deferred_operation = C_NULL) = copy_acceleration_structure_khr(device, convert(_CopyAccelerationStructureInfoKHR, info), fun_ptr; deferred_operation)

cmd_copy_acceleration_structure_to_memory_khr(command_buffer::CommandBuffer, info::CopyAccelerationStructureToMemoryInfoKHR, fun_ptr::FunctionPtr) = cmd_copy_acceleration_structure_to_memory_khr(command_buffer, convert(_CopyAccelerationStructureToMemoryInfoKHR, info), fun_ptr)

copy_acceleration_structure_to_memory_khr(device::Device, info::CopyAccelerationStructureToMemoryInfoKHR, fun_ptr::FunctionPtr; deferred_operation = C_NULL) = copy_acceleration_structure_to_memory_khr(device, convert(_CopyAccelerationStructureToMemoryInfoKHR, info), fun_ptr; deferred_operation)

cmd_copy_memory_to_acceleration_structure_khr(command_buffer::CommandBuffer, info::CopyMemoryToAccelerationStructureInfoKHR, fun_ptr::FunctionPtr) = cmd_copy_memory_to_acceleration_structure_khr(command_buffer, convert(_CopyMemoryToAccelerationStructureInfoKHR, info), fun_ptr)

copy_memory_to_acceleration_structure_khr(device::Device, info::CopyMemoryToAccelerationStructureInfoKHR, fun_ptr::FunctionPtr; deferred_operation = C_NULL) = copy_memory_to_acceleration_structure_khr(device, convert(_CopyMemoryToAccelerationStructureInfoKHR, info), fun_ptr; deferred_operation)

cmd_build_acceleration_structure_nv(command_buffer::CommandBuffer, info::AccelerationStructureInfoNV, instance_offset::Integer, update::Bool, dst::AccelerationStructureNV, scratch::Buffer, scratch_offset::Integer, fun_ptr::FunctionPtr; instance_data = C_NULL, src = C_NULL) = cmd_build_acceleration_structure_nv(command_buffer, convert(_AccelerationStructureInfoNV, info), instance_offset, update, dst, scratch, scratch_offset, fun_ptr; instance_data, src)

cmd_trace_rays_khr(command_buffer::CommandBuffer, raygen_shader_binding_table::StridedDeviceAddressRegionKHR, miss_shader_binding_table::StridedDeviceAddressRegionKHR, hit_shader_binding_table::StridedDeviceAddressRegionKHR, callable_shader_binding_table::StridedDeviceAddressRegionKHR, width::Integer, height::Integer, depth::Integer, fun_ptr::FunctionPtr) = cmd_trace_rays_khr(command_buffer, convert(_StridedDeviceAddressRegionKHR, raygen_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, miss_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, hit_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, callable_shader_binding_table), width, height, depth, fun_ptr)

create_ray_tracing_pipelines_nv(device::Device, create_infos::AbstractArray{<:RayTracingPipelineCreateInfoNV}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; pipeline_cache = C_NULL, allocator = C_NULL) = create_ray_tracing_pipelines_nv(device, convert(Vector{_RayTracingPipelineCreateInfoNV}, create_infos), fun_ptr_create, fun_ptr_destroy; pipeline_cache, allocator)

create_ray_tracing_pipelines_khr(device::Device, create_infos::AbstractArray{<:RayTracingPipelineCreateInfoKHR}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; deferred_operation = C_NULL, pipeline_cache = C_NULL, allocator = C_NULL) = create_ray_tracing_pipelines_khr(device, convert(Vector{_RayTracingPipelineCreateInfoKHR}, create_infos), fun_ptr_create, fun_ptr_destroy; deferred_operation, pipeline_cache, allocator)

cmd_trace_rays_indirect_khr(command_buffer::CommandBuffer, raygen_shader_binding_table::StridedDeviceAddressRegionKHR, miss_shader_binding_table::StridedDeviceAddressRegionKHR, hit_shader_binding_table::StridedDeviceAddressRegionKHR, callable_shader_binding_table::StridedDeviceAddressRegionKHR, indirect_device_address::Integer, fun_ptr::FunctionPtr) = cmd_trace_rays_indirect_khr(command_buffer, convert(_StridedDeviceAddressRegionKHR, raygen_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, miss_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, hit_shader_binding_table), convert(_StridedDeviceAddressRegionKHR, callable_shader_binding_table), indirect_device_address, fun_ptr)

get_device_acceleration_structure_compatibility_khr(device::Device, version_info::AccelerationStructureVersionInfoKHR, fun_ptr::FunctionPtr) = get_device_acceleration_structure_compatibility_khr(device, convert(_AccelerationStructureVersionInfoKHR, version_info), fun_ptr)

get_image_view_handle_nvx(device::Device, info::ImageViewHandleInfoNVX, fun_ptr::FunctionPtr) = get_image_view_handle_nvx(device, convert(_ImageViewHandleInfoNVX, info), fun_ptr)

get_physical_device_surface_present_modes_2_ext(physical_device::PhysicalDevice, surface_info::PhysicalDeviceSurfaceInfo2KHR, fun_ptr::FunctionPtr) = get_physical_device_surface_present_modes_2_ext(physical_device, convert(_PhysicalDeviceSurfaceInfo2KHR, surface_info), fun_ptr)

get_device_group_surface_present_modes_2_ext(device::Device, surface_info::PhysicalDeviceSurfaceInfo2KHR, modes::DeviceGroupPresentModeFlagKHR, fun_ptr::FunctionPtr) = get_device_group_surface_present_modes_2_ext(device, convert(_PhysicalDeviceSurfaceInfo2KHR, surface_info), modes, fun_ptr)

get_physical_device_queue_family_performance_query_passes_khr(physical_device::PhysicalDevice, performance_query_create_info::QueryPoolPerformanceCreateInfoKHR, fun_ptr::FunctionPtr) = get_physical_device_queue_family_performance_query_passes_khr(physical_device, convert(_QueryPoolPerformanceCreateInfoKHR, performance_query_create_info), fun_ptr)

acquire_profiling_lock_khr(device::Device, info::AcquireProfilingLockInfoKHR, fun_ptr::FunctionPtr) = acquire_profiling_lock_khr(device, convert(_AcquireProfilingLockInfoKHR, info), fun_ptr)

get_buffer_opaque_capture_address(device::Device, info::BufferDeviceAddressInfo, fun_ptr::FunctionPtr) = get_buffer_opaque_capture_address(device, convert(_BufferDeviceAddressInfo, info), fun_ptr)

get_buffer_device_address(device::Device, info::BufferDeviceAddressInfo, fun_ptr::FunctionPtr) = get_buffer_device_address(device, convert(_BufferDeviceAddressInfo, info), fun_ptr)

create_headless_surface_ext(instance::Instance, create_info::HeadlessSurfaceCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_headless_surface_ext(instance, convert(_HeadlessSurfaceCreateInfoEXT, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

initialize_performance_api_intel(device::Device, initialize_info::InitializePerformanceApiInfoINTEL, fun_ptr::FunctionPtr) = initialize_performance_api_intel(device, convert(_InitializePerformanceApiInfoINTEL, initialize_info), fun_ptr)

cmd_set_performance_marker_intel(command_buffer::CommandBuffer, marker_info::PerformanceMarkerInfoINTEL, fun_ptr::FunctionPtr) = cmd_set_performance_marker_intel(command_buffer, convert(_PerformanceMarkerInfoINTEL, marker_info), fun_ptr)

cmd_set_performance_stream_marker_intel(command_buffer::CommandBuffer, marker_info::PerformanceStreamMarkerInfoINTEL, fun_ptr::FunctionPtr) = cmd_set_performance_stream_marker_intel(command_buffer, convert(_PerformanceStreamMarkerInfoINTEL, marker_info), fun_ptr)

cmd_set_performance_override_intel(command_buffer::CommandBuffer, override_info::PerformanceOverrideInfoINTEL, fun_ptr::FunctionPtr) = cmd_set_performance_override_intel(command_buffer, convert(_PerformanceOverrideInfoINTEL, override_info), fun_ptr)

acquire_performance_configuration_intel(device::Device, acquire_info::PerformanceConfigurationAcquireInfoINTEL, fun_ptr::FunctionPtr) = acquire_performance_configuration_intel(device, convert(_PerformanceConfigurationAcquireInfoINTEL, acquire_info), fun_ptr)

get_device_memory_opaque_capture_address(device::Device, info::DeviceMemoryOpaqueCaptureAddressInfo, fun_ptr::FunctionPtr) = get_device_memory_opaque_capture_address(device, convert(_DeviceMemoryOpaqueCaptureAddressInfo, info), fun_ptr)

get_pipeline_executable_properties_khr(device::Device, pipeline_info::PipelineInfoKHR, fun_ptr::FunctionPtr) = get_pipeline_executable_properties_khr(device, convert(_PipelineInfoKHR, pipeline_info), fun_ptr)

get_pipeline_executable_statistics_khr(device::Device, executable_info::PipelineExecutableInfoKHR, fun_ptr::FunctionPtr) = get_pipeline_executable_statistics_khr(device, convert(_PipelineExecutableInfoKHR, executable_info), fun_ptr)

get_pipeline_executable_internal_representations_khr(device::Device, executable_info::PipelineExecutableInfoKHR, fun_ptr::FunctionPtr) = get_pipeline_executable_internal_representations_khr(device, convert(_PipelineExecutableInfoKHR, executable_info), fun_ptr)

create_acceleration_structure_khr(device::Device, create_info::AccelerationStructureCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_acceleration_structure_khr(device, convert(_AccelerationStructureCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

cmd_build_acceleration_structures_khr(command_buffer::CommandBuffer, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, build_range_infos::AbstractArray{<:AccelerationStructureBuildRangeInfoKHR}, fun_ptr::FunctionPtr) = cmd_build_acceleration_structures_khr(command_buffer, convert(Vector{_AccelerationStructureBuildGeometryInfoKHR}, infos), convert(Vector{_AccelerationStructureBuildRangeInfoKHR}, build_range_infos), fun_ptr)

cmd_build_acceleration_structures_indirect_khr(command_buffer::CommandBuffer, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, indirect_device_addresses::AbstractArray{<:Integer}, indirect_strides::AbstractArray{<:Integer}, max_primitive_counts::AbstractArray{<:Integer}, fun_ptr::FunctionPtr) = cmd_build_acceleration_structures_indirect_khr(command_buffer, convert(Vector{_AccelerationStructureBuildGeometryInfoKHR}, infos), indirect_device_addresses, indirect_strides, max_primitive_counts, fun_ptr)

build_acceleration_structures_khr(device::Device, infos::AbstractArray{<:AccelerationStructureBuildGeometryInfoKHR}, build_range_infos::AbstractArray{<:AccelerationStructureBuildRangeInfoKHR}, fun_ptr::FunctionPtr; deferred_operation = C_NULL) = build_acceleration_structures_khr(device, convert(Vector{_AccelerationStructureBuildGeometryInfoKHR}, infos), convert(Vector{_AccelerationStructureBuildRangeInfoKHR}, build_range_infos), fun_ptr; deferred_operation)

get_acceleration_structure_device_address_khr(device::Device, info::AccelerationStructureDeviceAddressInfoKHR, fun_ptr::FunctionPtr) = get_acceleration_structure_device_address_khr(device, convert(_AccelerationStructureDeviceAddressInfoKHR, info), fun_ptr)

cmd_set_viewport_with_count_ext(command_buffer::CommandBuffer, viewports::AbstractArray{<:Viewport}, fun_ptr::FunctionPtr) = cmd_set_viewport_with_count_ext(command_buffer, convert(Vector{_Viewport}, viewports), fun_ptr)

cmd_set_scissor_with_count_ext(command_buffer::CommandBuffer, scissors::AbstractArray{<:Rect2D}, fun_ptr::FunctionPtr) = cmd_set_scissor_with_count_ext(command_buffer, convert(Vector{_Rect2D}, scissors), fun_ptr)

create_private_data_slot_ext(device::Device, create_info::PrivateDataSlotCreateInfoEXT, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_private_data_slot_ext(device, convert(_PrivateDataSlotCreateInfoEXT, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

cmd_copy_buffer_2_khr(command_buffer::CommandBuffer, copy_buffer_info::CopyBufferInfo2KHR, fun_ptr::FunctionPtr) = cmd_copy_buffer_2_khr(command_buffer, convert(_CopyBufferInfo2KHR, copy_buffer_info), fun_ptr)

cmd_copy_image_2_khr(command_buffer::CommandBuffer, copy_image_info::CopyImageInfo2KHR, fun_ptr::FunctionPtr) = cmd_copy_image_2_khr(command_buffer, convert(_CopyImageInfo2KHR, copy_image_info), fun_ptr)

cmd_blit_image_2_khr(command_buffer::CommandBuffer, blit_image_info::BlitImageInfo2KHR, fun_ptr::FunctionPtr) = cmd_blit_image_2_khr(command_buffer, convert(_BlitImageInfo2KHR, blit_image_info), fun_ptr)

cmd_copy_buffer_to_image_2_khr(command_buffer::CommandBuffer, copy_buffer_to_image_info::CopyBufferToImageInfo2KHR, fun_ptr::FunctionPtr) = cmd_copy_buffer_to_image_2_khr(command_buffer, convert(_CopyBufferToImageInfo2KHR, copy_buffer_to_image_info), fun_ptr)

cmd_copy_image_to_buffer_2_khr(command_buffer::CommandBuffer, copy_image_to_buffer_info::CopyImageToBufferInfo2KHR, fun_ptr::FunctionPtr) = cmd_copy_image_to_buffer_2_khr(command_buffer, convert(_CopyImageToBufferInfo2KHR, copy_image_to_buffer_info), fun_ptr)

cmd_resolve_image_2_khr(command_buffer::CommandBuffer, resolve_image_info::ResolveImageInfo2KHR, fun_ptr::FunctionPtr) = cmd_resolve_image_2_khr(command_buffer, convert(_ResolveImageInfo2KHR, resolve_image_info), fun_ptr)

cmd_set_fragment_shading_rate_khr(command_buffer::CommandBuffer, fragment_size::Extent2D, combiner_ops::NTuple{2, FragmentShadingRateCombinerOpKHR}, fun_ptr::FunctionPtr) = cmd_set_fragment_shading_rate_khr(command_buffer, convert(_Extent2D, fragment_size), combiner_ops, fun_ptr)

get_acceleration_structure_build_sizes_khr(device::Device, build_type::AccelerationStructureBuildTypeKHR, build_info::AccelerationStructureBuildGeometryInfoKHR, fun_ptr::FunctionPtr; max_primitive_counts = C_NULL) = get_acceleration_structure_build_sizes_khr(device, build_type, convert(_AccelerationStructureBuildGeometryInfoKHR, build_info), fun_ptr; max_primitive_counts)

cmd_set_vertex_input_ext(command_buffer::CommandBuffer, vertex_binding_descriptions::AbstractArray{<:VertexInputBindingDescription2EXT}, vertex_attribute_descriptions::AbstractArray{<:VertexInputAttributeDescription2EXT}, fun_ptr::FunctionPtr) = cmd_set_vertex_input_ext(command_buffer, convert(Vector{_VertexInputBindingDescription2EXT}, vertex_binding_descriptions), convert(Vector{_VertexInputAttributeDescription2EXT}, vertex_attribute_descriptions), fun_ptr)

cmd_set_event_2_khr(command_buffer::CommandBuffer, event::Event, dependency_info::DependencyInfoKHR, fun_ptr::FunctionPtr) = cmd_set_event_2_khr(command_buffer, event, convert(_DependencyInfoKHR, dependency_info), fun_ptr)

cmd_wait_events_2_khr(command_buffer::CommandBuffer, events::AbstractArray{<:Event}, dependency_infos::AbstractArray{<:DependencyInfoKHR}, fun_ptr::FunctionPtr) = cmd_wait_events_2_khr(command_buffer, events, convert(Vector{_DependencyInfoKHR}, dependency_infos), fun_ptr)

cmd_pipeline_barrier_2_khr(command_buffer::CommandBuffer, dependency_info::DependencyInfoKHR, fun_ptr::FunctionPtr) = cmd_pipeline_barrier_2_khr(command_buffer, convert(_DependencyInfoKHR, dependency_info), fun_ptr)

queue_submit_2_khr(queue::Queue, submits::AbstractArray{<:SubmitInfo2KHR}, fun_ptr::FunctionPtr; fence = C_NULL) = queue_submit_2_khr(queue, convert(Vector{_SubmitInfo2KHR}, submits), fun_ptr; fence)

get_physical_device_video_capabilities_khr(physical_device::PhysicalDevice, video_profile::VideoProfileKHR, fun_ptr::FunctionPtr) = get_physical_device_video_capabilities_khr(physical_device, convert(_VideoProfileKHR, video_profile), fun_ptr)

create_video_session_khr(device::Device, create_info::VideoSessionCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_video_session_khr(device, convert(_VideoSessionCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

create_video_session_parameters_khr(device::Device, create_info::VideoSessionParametersCreateInfoKHR, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL) = create_video_session_parameters_khr(device, convert(_VideoSessionParametersCreateInfoKHR, create_info), fun_ptr_create, fun_ptr_destroy; allocator)

update_video_session_parameters_khr(device::Device, video_session_parameters::VideoSessionParametersKHR, update_info::VideoSessionParametersUpdateInfoKHR, fun_ptr::FunctionPtr) = update_video_session_parameters_khr(device, video_session_parameters, convert(_VideoSessionParametersUpdateInfoKHR, update_info), fun_ptr)

bind_video_session_memory_khr(device::Device, video_session::VideoSessionKHR, video_session_bind_memories::AbstractArray{<:VideoBindMemoryKHR}, fun_ptr::FunctionPtr) = bind_video_session_memory_khr(device, video_session, convert(Vector{_VideoBindMemoryKHR}, video_session_bind_memories), fun_ptr)

cmd_decode_video_khr(command_buffer::CommandBuffer, frame_info::VideoDecodeInfoKHR, fun_ptr::FunctionPtr) = cmd_decode_video_khr(command_buffer, convert(_VideoDecodeInfoKHR, frame_info), fun_ptr)

cmd_begin_video_coding_khr(command_buffer::CommandBuffer, begin_info::VideoBeginCodingInfoKHR, fun_ptr::FunctionPtr) = cmd_begin_video_coding_khr(command_buffer, convert(_VideoBeginCodingInfoKHR, begin_info), fun_ptr)

cmd_control_video_coding_khr(command_buffer::CommandBuffer, coding_control_info::VideoCodingControlInfoKHR, fun_ptr::FunctionPtr) = cmd_control_video_coding_khr(command_buffer, convert(_VideoCodingControlInfoKHR, coding_control_info), fun_ptr)

cmd_end_video_coding_khr(command_buffer::CommandBuffer, end_coding_info::VideoEndCodingInfoKHR, fun_ptr::FunctionPtr) = cmd_end_video_coding_khr(command_buffer, convert(_VideoEndCodingInfoKHR, end_coding_info), fun_ptr)

cmd_encode_video_khr(command_buffer::CommandBuffer, encode_info::VideoEncodeInfoKHR, fun_ptr::FunctionPtr) = cmd_encode_video_khr(command_buffer, convert(_VideoEncodeInfoKHR, encode_info), fun_ptr)

create_device(physical_device::PhysicalDevice, queue_create_infos::AbstractArray{<:DeviceQueueCreateInfo}, enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, enabled_features = C_NULL) = create_device(physical_device, convert(Vector{_DeviceQueueCreateInfo}, queue_create_infos), enabled_layer_names, enabled_extension_names, fun_ptr_create, fun_ptr_destroy; allocator, next, flags, enabled_features)

create_image(device::Device, image_type::ImageType, format::Format, extent::Extent3D, mip_levels::Integer, array_layers::Integer, samples::SampleCountFlag, tiling::ImageTiling, usage::ImageUsageFlag, sharing_mode::SharingMode, queue_family_indices::AbstractArray{<:Integer}, initial_layout::ImageLayout, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_image(device, image_type, format, convert(_Extent3D, extent), mip_levels, array_layers, samples, tiling, usage, sharing_mode, queue_family_indices, initial_layout, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_image_view(device::Device, image::Image, view_type::ImageViewType, format::Format, components::ComponentMapping, subresource_range::ImageSubresourceRange, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_image_view(device, image, view_type, format, convert(_ComponentMapping, components), convert(_ImageSubresourceRange, subresource_range), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_pipeline_layout(device::Device, set_layouts::AbstractArray{<:DescriptorSetLayout}, push_constant_ranges::AbstractArray{<:PushConstantRange}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_pipeline_layout(device, set_layouts, convert(Vector{_PushConstantRange}, push_constant_ranges), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_descriptor_set_layout(device::Device, bindings::AbstractArray{<:DescriptorSetLayoutBinding}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_set_layout(device, convert(Vector{_DescriptorSetLayoutBinding}, bindings), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_descriptor_pool(device::Device, max_sets::Integer, pool_sizes::AbstractArray{<:DescriptorPoolSize}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_pool(device, max_sets, convert(Vector{_DescriptorPoolSize}, pool_sizes), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_render_pass(device::Device, attachments::AbstractArray{<:AttachmentDescription}, subpasses::AbstractArray{<:SubpassDescription}, dependencies::AbstractArray{<:SubpassDependency}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_render_pass(device, convert(Vector{_AttachmentDescription}, attachments), convert(Vector{_SubpassDescription}, subpasses), convert(Vector{_SubpassDependency}, dependencies), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_render_pass_2(device::Device, attachments::AbstractArray{<:AttachmentDescription2}, subpasses::AbstractArray{<:SubpassDescription2}, dependencies::AbstractArray{<:SubpassDependency2}, correlated_view_masks::AbstractArray{<:Integer}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_render_pass_2(device, convert(Vector{_AttachmentDescription2}, attachments), convert(Vector{_SubpassDescription2}, subpasses), convert(Vector{_SubpassDependency2}, dependencies), correlated_view_masks, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_indirect_commands_layout_nv(device::Device, pipeline_bind_point::PipelineBindPoint, tokens::AbstractArray{<:IndirectCommandsLayoutTokenNV}, stream_strides::AbstractArray{<:Integer}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_indirect_commands_layout_nv(device, pipeline_bind_point, convert(Vector{_IndirectCommandsLayoutTokenNV}, tokens), stream_strides, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_descriptor_update_template(device::Device, descriptor_update_entries::AbstractArray{<:DescriptorUpdateTemplateEntry}, template_type::DescriptorUpdateTemplateType, descriptor_set_layout::DescriptorSetLayout, pipeline_bind_point::PipelineBindPoint, pipeline_layout::PipelineLayout, set::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_descriptor_update_template(device, convert(Vector{_DescriptorUpdateTemplateEntry}, descriptor_update_entries), template_type, descriptor_set_layout, pipeline_bind_point, pipeline_layout, set, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

create_sampler_ycbcr_conversion(device::Device, format::Format, ycbcr_model::SamplerYcbcrModelConversion, ycbcr_range::SamplerYcbcrRange, components::ComponentMapping, x_chroma_offset::ChromaLocation, y_chroma_offset::ChromaLocation, chroma_filter::Filter, force_explicit_reconstruction::Bool, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL) = create_sampler_ycbcr_conversion(device, format, ycbcr_model, ycbcr_range, convert(_ComponentMapping, components), x_chroma_offset, y_chroma_offset, chroma_filter, force_explicit_reconstruction, fun_ptr_create, fun_ptr_destroy; allocator, next)

create_acceleration_structure_nv(device::Device, compacted_size::Integer, info::AccelerationStructureInfoNV, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL) = create_acceleration_structure_nv(device, compacted_size, convert(_AccelerationStructureInfoNV, info), fun_ptr_create, fun_ptr_destroy; allocator, next)

create_display_mode_khr(physical_device::PhysicalDevice, display::DisplayKHR, parameters::DisplayModeParametersKHR, fun_ptr_create::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_display_mode_khr(physical_device, display, convert(_DisplayModeParametersKHR, parameters), fun_ptr_create; allocator, next, flags)

create_swapchain_khr(device::Device, surface::SurfaceKHR, min_image_count::Integer, image_format::Format, image_color_space::ColorSpaceKHR, image_extent::Extent2D, image_array_layers::Integer, image_usage::ImageUsageFlag, image_sharing_mode::SharingMode, queue_family_indices::AbstractArray{<:Integer}, pre_transform::SurfaceTransformFlagKHR, composite_alpha::CompositeAlphaFlagKHR, present_mode::PresentModeKHR, clipped::Bool, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, old_swapchain = C_NULL) = create_swapchain_khr(device, surface, min_image_count, image_format, image_color_space, convert(_Extent2D, image_extent), image_array_layers, image_usage, image_sharing_mode, queue_family_indices, pre_transform, composite_alpha, present_mode, clipped, fun_ptr_create, fun_ptr_destroy; allocator, next, flags, old_swapchain)

create_video_session_khr(device::Device, queue_family_index::Integer, video_profile::VideoProfileKHR, picture_format::Format, max_coded_extent::Extent2D, reference_pictures_format::Format, max_reference_pictures_slots_count::Integer, max_reference_pictures_active_count::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = create_video_session_khr(device, queue_family_index, convert(_VideoProfileKHR, video_profile), picture_format, convert(_Extent2D, max_coded_extent), reference_pictures_format, max_reference_pictures_slots_count, max_reference_pictures_active_count, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

Device(physical_device::PhysicalDevice, queue_create_infos::AbstractArray{<:DeviceQueueCreateInfo}, enabled_layer_names::AbstractArray{<:AbstractString}, enabled_extension_names::AbstractArray{<:AbstractString}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, enabled_features = C_NULL) = Device(physical_device, convert(Vector{_DeviceQueueCreateInfo}, queue_create_infos), enabled_layer_names, enabled_extension_names, fun_ptr_create, fun_ptr_destroy; allocator, next, flags, enabled_features)

Image(device::Device, image_type::ImageType, format::Format, extent::Extent3D, mip_levels::Integer, array_layers::Integer, samples::SampleCountFlag, tiling::ImageTiling, usage::ImageUsageFlag, sharing_mode::SharingMode, queue_family_indices::AbstractArray{<:Integer}, initial_layout::ImageLayout, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = Image(device, image_type, format, convert(_Extent3D, extent), mip_levels, array_layers, samples, tiling, usage, sharing_mode, queue_family_indices, initial_layout, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

ImageView(device::Device, image::Image, view_type::ImageViewType, format::Format, components::ComponentMapping, subresource_range::ImageSubresourceRange, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = ImageView(device, image, view_type, format, convert(_ComponentMapping, components), convert(_ImageSubresourceRange, subresource_range), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

PipelineLayout(device::Device, set_layouts::AbstractArray{<:DescriptorSetLayout}, push_constant_ranges::AbstractArray{<:PushConstantRange}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = PipelineLayout(device, set_layouts, convert(Vector{_PushConstantRange}, push_constant_ranges), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

DescriptorSetLayout(device::Device, bindings::AbstractArray{<:DescriptorSetLayoutBinding}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = DescriptorSetLayout(device, convert(Vector{_DescriptorSetLayoutBinding}, bindings), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

DescriptorPool(device::Device, max_sets::Integer, pool_sizes::AbstractArray{<:DescriptorPoolSize}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = DescriptorPool(device, max_sets, convert(Vector{_DescriptorPoolSize}, pool_sizes), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

RenderPass(device::Device, attachments::AbstractArray{<:AttachmentDescription}, subpasses::AbstractArray{<:SubpassDescription}, dependencies::AbstractArray{<:SubpassDependency}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = RenderPass(device, convert(Vector{_AttachmentDescription}, attachments), convert(Vector{_SubpassDescription}, subpasses), convert(Vector{_SubpassDependency}, dependencies), fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

RenderPass(device::Device, attachments::AbstractArray{<:AttachmentDescription2}, subpasses::AbstractArray{<:SubpassDescription2}, dependencies::AbstractArray{<:SubpassDependency2}, correlated_view_masks::AbstractArray{<:Integer}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = RenderPass(device, convert(Vector{_AttachmentDescription2}, attachments), convert(Vector{_SubpassDescription2}, subpasses), convert(Vector{_SubpassDependency2}, dependencies), correlated_view_masks, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

IndirectCommandsLayoutNV(device::Device, pipeline_bind_point::PipelineBindPoint, tokens::AbstractArray{<:IndirectCommandsLayoutTokenNV}, stream_strides::AbstractArray{<:Integer}, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = IndirectCommandsLayoutNV(device, pipeline_bind_point, convert(Vector{_IndirectCommandsLayoutTokenNV}, tokens), stream_strides, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

DescriptorUpdateTemplate(device::Device, descriptor_update_entries::AbstractArray{<:DescriptorUpdateTemplateEntry}, template_type::DescriptorUpdateTemplateType, descriptor_set_layout::DescriptorSetLayout, pipeline_bind_point::PipelineBindPoint, pipeline_layout::PipelineLayout, set::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = DescriptorUpdateTemplate(device, convert(Vector{_DescriptorUpdateTemplateEntry}, descriptor_update_entries), template_type, descriptor_set_layout, pipeline_bind_point, pipeline_layout, set, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)

SamplerYcbcrConversion(device::Device, format::Format, ycbcr_model::SamplerYcbcrModelConversion, ycbcr_range::SamplerYcbcrRange, components::ComponentMapping, x_chroma_offset::ChromaLocation, y_chroma_offset::ChromaLocation, chroma_filter::Filter, force_explicit_reconstruction::Bool, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL) = SamplerYcbcrConversion(device, format, ycbcr_model, ycbcr_range, convert(_ComponentMapping, components), x_chroma_offset, y_chroma_offset, chroma_filter, force_explicit_reconstruction, fun_ptr_create, fun_ptr_destroy; allocator, next)

AccelerationStructureNV(device::Device, compacted_size::Integer, info::AccelerationStructureInfoNV, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL) = AccelerationStructureNV(device, compacted_size, convert(_AccelerationStructureInfoNV, info), fun_ptr_create, fun_ptr_destroy; allocator, next)

DisplayModeKHR(physical_device::PhysicalDevice, display::DisplayKHR, parameters::DisplayModeParametersKHR, fun_ptr_create::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = DisplayModeKHR(physical_device, display, convert(_DisplayModeParametersKHR, parameters), fun_ptr_create; allocator, next, flags)

SwapchainKHR(device::Device, surface::SurfaceKHR, min_image_count::Integer, image_format::Format, image_color_space::ColorSpaceKHR, image_extent::Extent2D, image_array_layers::Integer, image_usage::ImageUsageFlag, image_sharing_mode::SharingMode, queue_family_indices::AbstractArray{<:Integer}, pre_transform::SurfaceTransformFlagKHR, composite_alpha::CompositeAlphaFlagKHR, present_mode::PresentModeKHR, clipped::Bool, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0, old_swapchain = C_NULL) = SwapchainKHR(device, surface, min_image_count, image_format, image_color_space, convert(_Extent2D, image_extent), image_array_layers, image_usage, image_sharing_mode, queue_family_indices, pre_transform, composite_alpha, present_mode, clipped, fun_ptr_create, fun_ptr_destroy; allocator, next, flags, old_swapchain)

VideoSessionKHR(device::Device, queue_family_index::Integer, video_profile::VideoProfileKHR, picture_format::Format, max_coded_extent::Extent2D, reference_pictures_format::Format, max_reference_pictures_slots_count::Integer, max_reference_pictures_active_count::Integer, fun_ptr_create::FunctionPtr, fun_ptr_destroy::FunctionPtr; allocator = C_NULL, next = C_NULL, flags = 0) = VideoSessionKHR(device, queue_family_index, convert(_VideoProfileKHR, video_profile), picture_format, convert(_Extent2D, max_coded_extent), reference_pictures_format, max_reference_pictures_slots_count, max_reference_pictures_active_count, fun_ptr_create, fun_ptr_destroy; allocator, next, flags)



export PhysicalDeviceProvokingVertexFeaturesEXT, PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT, PhysicalDeviceInheritedViewportScissorFeaturesNV, VideoEncodeH264ProfileEXT, VideoEncodeH264EmitPictureParametersEXT, VideoEncodeH264DpbSlotInfoEXT, VideoEncodeH264NaluSliceEXT, VideoEncodeH264VclFrameInfoEXT, VideoEncodeH264SessionParametersAddInfoEXT, VideoEncodeH264SessionParametersCreateInfoEXT, VideoEndCodingInfoKHR, VideoSessionParametersUpdateInfoKHR, VideoDecodeH265DpbSlotInfoEXT, VideoDecodeH265PictureInfoEXT, VideoDecodeH265SessionParametersAddInfoEXT, VideoDecodeH265SessionParametersCreateInfoEXT, VideoDecodeH265ProfileEXT, VideoDecodeH264MvcEXT, VideoDecodeH264DpbSlotInfoEXT, VideoDecodeH264PictureInfoEXT, VideoDecodeH264SessionParametersAddInfoEXT, VideoDecodeH264SessionParametersCreateInfoEXT, PhysicalDeviceSynchronization2FeaturesKHR, MemoryBarrier2KHR, PipelineColorWriteCreateInfoEXT, PhysicalDeviceColorWriteEnableFeaturesEXT, PhysicalDeviceVertexInputDynamicStateFeaturesEXT, PhysicalDeviceMutableDescriptorTypeFeaturesVALVE, AccelerationStructureBuildSizesInfoKHR, PhysicalDeviceFragmentShadingRateEnumsFeaturesNV, PhysicalDeviceShaderTerminateInvocationFeaturesKHR, PhysicalDeviceFragmentShadingRateFeaturesKHR, PhysicalDeviceShaderImageAtomicInt64FeaturesEXT, BufferCopy2KHR, PhysicalDevice4444FormatsFeaturesEXT, PhysicalDevicePortabilitySubsetPropertiesKHR, PhysicalDevicePortabilitySubsetFeaturesKHR, PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR, PhysicalDeviceImageRobustnessFeaturesEXT, PhysicalDeviceRobustness2FeaturesEXT, PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR, PhysicalDeviceDiagnosticsConfigFeaturesNV, PhysicalDeviceExtendedDynamicState2FeaturesEXT, PhysicalDeviceExtendedDynamicStateFeaturesEXT, RayTracingPipelineInterfaceCreateInfoKHR, AccelerationStructureVersionInfoKHR, TransformMatrixKHR, AabbPositionsKHR, AccelerationStructureBuildRangeInfoKHR, AccelerationStructureGeometryInstancesDataKHR, AccelerationStructureGeometryAabbsDataKHR, PhysicalDeviceCustomBorderColorFeaturesEXT, PhysicalDeviceCoherentMemoryFeaturesAMD, PhysicalDeviceVulkan12Features, PhysicalDeviceVulkan11Features, PhysicalDevicePipelineCreationCacheControlFeaturesEXT, PhysicalDeviceLineRasterizationFeaturesEXT, MemoryOpaqueCaptureAddressAllocateInfo, PhysicalDeviceSubgroupSizeControlFeaturesEXT, PhysicalDeviceTexelBufferAlignmentFeaturesEXT, PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT, PhysicalDevicePipelineExecutablePropertiesFeaturesKHR, PhysicalDeviceSeparateDepthStencilLayoutsFeatures, PhysicalDeviceFragmentShaderInterlockFeaturesEXT, PhysicalDeviceShaderSMBuiltinsFeaturesNV, PhysicalDeviceIndexTypeUint8FeaturesEXT, PhysicalDeviceShaderClockFeaturesKHR, PerformanceStreamMarkerInfoINTEL, PerformanceMarkerInfoINTEL, InitializePerformanceApiInfoINTEL, PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL, PhysicalDeviceCoverageReductionModeFeaturesNV, HeadlessSurfaceCreateInfoEXT, PerformanceQuerySubmitInfoKHR, QueryPoolPerformanceCreateInfoKHR, PhysicalDevicePerformanceQueryFeaturesKHR, SurfaceCapabilitiesFullScreenExclusiveEXT, SurfaceFullScreenExclusiveWin32InfoEXT, PresentFrameTokenGGP, PhysicalDeviceYcbcrImageArraysFeaturesEXT, PhysicalDeviceCooperativeMatrixFeaturesNV, PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT, PhysicalDeviceImagelessFramebufferFeatures, BufferDeviceAddressCreateInfoEXT, BufferOpaqueCaptureAddressCreateInfo, PhysicalDeviceBufferDeviceAddressFeaturesEXT, PhysicalDeviceBufferDeviceAddressFeatures, MemoryPriorityAllocateInfoEXT, PhysicalDeviceMemoryPriorityFeaturesEXT, PipelineRasterizationDepthClipStateCreateInfoEXT, PhysicalDeviceDepthClipEnableFeaturesEXT, PhysicalDeviceUniformBufferStandardLayoutFeatures, SurfaceProtectedCapabilitiesKHR, PhysicalDeviceScalarBlockLayoutFeatures, PhysicalDeviceFragmentDensityMap2FeaturesEXT, PhysicalDeviceFragmentDensityMapFeaturesEXT, ImageDrmFormatModifierListCreateInfoEXT, TraceRaysIndirectCommandKHR, StridedDeviceAddressRegionKHR, PhysicalDeviceRayQueryFeaturesKHR, PhysicalDeviceRayTracingPipelineFeaturesKHR, PhysicalDeviceAccelerationStructureFeaturesKHR, DrawMeshTasksIndirectCommandNV, PhysicalDeviceMeshShaderFeaturesNV, CoarseSampleLocationNV, PhysicalDeviceShadingRateImageFeaturesNV, PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV, PhysicalDeviceShaderImageFootprintFeaturesNV, PhysicalDeviceFragmentShaderBarycentricFeaturesNV, PhysicalDeviceComputeShaderDerivativesFeaturesNV, PhysicalDeviceCornerSampledImageFeaturesNV, PhysicalDeviceExclusiveScissorFeaturesNV, PipelineRepresentativeFragmentTestStateCreateInfoNV, PhysicalDeviceRepresentativeFragmentTestFeaturesNV, PipelineRasterizationStateStreamCreateInfoEXT, PhysicalDeviceTransformFeedbackFeaturesEXT, PhysicalDeviceASTCDecodeFeaturesEXT, PhysicalDeviceVertexAttributeDivisorFeaturesEXT, PhysicalDeviceShaderAtomicFloatFeaturesEXT, PhysicalDeviceShaderAtomicInt64Features, PhysicalDeviceVulkanMemoryModelFeatures, PhysicalDeviceConditionalRenderingFeaturesEXT, PhysicalDevice8BitStorageFeatures, ExternalFormatANDROID, CommandBufferInheritanceConditionalRenderingInfoEXT, ImportAndroidHardwareBufferInfoANDROID, VertexInputBindingDivisorDescriptionEXT, PipelineVertexInputDivisorStateCreateInfoEXT, TimelineSemaphoreSubmitInfo, PhysicalDeviceTimelineSemaphoreFeatures, SubpassEndInfo, DescriptorSetVariableDescriptorCountAllocateInfo, PhysicalDeviceDescriptorIndexingFeatures, DeviceDeviceMemoryReportCreateInfoEXT, PhysicalDeviceDeviceMemoryReportFeaturesEXT, DebugUtilsLabelEXT, PhysicalDeviceHostQueryResetFeatures, PhysicalDeviceShaderFloat16Int8Features, PhysicalDeviceShaderDrawParametersFeatures, ValidationCacheCreateInfoEXT, DescriptorPoolInlineUniformBlockCreateInfoEXT, WriteDescriptorSetInlineUniformBlockEXT, PhysicalDeviceInlineUniformBlockFeaturesEXT, PhysicalDeviceBlendOperationAdvancedFeaturesEXT, SampleLocationEXT, PipelineCoverageToColorStateCreateInfoNV, PhysicalDeviceProtectedMemoryFeatures, ProtectedSubmitInfo, PhysicalDeviceSamplerYcbcrConversionFeatures, PhysicalDeviceShaderSubgroupExtendedTypesFeatures, PhysicalDevice16BitStorageFeatures, ViewportWScalingNV, PipelineViewportWScalingStateCreateInfoNV, MetalSurfaceCreateInfoEXT, MacOSSurfaceCreateInfoMVK, IOSSurfaceCreateInfoMVK, PresentTimeGOOGLE, PresentTimesInfoGOOGLE, SwapchainDisplayNativeHdrCreateInfoAMD, XYColorEXT, HdrMetadataEXT, DeviceGroupBindSparseInfo, DeviceGroupSubmitInfo, DeviceGroupCommandBufferBeginInfo, BindBufferMemoryDeviceGroupInfo, RenderPassMultiviewCreateInfo, PhysicalDeviceMultiviewFeatures, ExportFenceWin32HandleInfoKHR, D3D12FenceSubmitInfoKHR, ExportSemaphoreWin32HandleInfoKHR, ExportMemoryWin32HandleInfoKHR, PhysicalDeviceVariablePointersFeatures, ConformanceVersion, SetStateFlagsIndirectCommandNV, BindVertexBufferIndirectCommandNV, BindShaderGroupIndirectCommandNV, PhysicalDevicePrivateDataFeaturesEXT, DevicePrivateDataCreateInfoEXT, PhysicalDeviceDeviceGeneratedCommandsFeaturesNV, ExportMemoryWin32HandleInfoNV, DedicatedAllocationBufferCreateInfoNV, DedicatedAllocationImageCreateInfoNV, DebugMarkerMarkerInfoEXT, ScreenSurfaceCreateInfoQNX, StreamDescriptorSurfaceCreateInfoGGP, ImagePipeSurfaceCreateInfoFUCHSIA, DirectFBSurfaceCreateInfoEXT, XcbSurfaceCreateInfoKHR, XlibSurfaceCreateInfoKHR, Win32SurfaceCreateInfoKHR, WaylandSurfaceCreateInfoKHR, ViSurfaceCreateInfoNN, AndroidSurfaceCreateInfoKHR, DispatchIndirectCommand, DrawIndexedIndirectCommand, DrawIndirectCommand, SemaphoreCreateInfo, PhysicalDeviceFeatures, PhysicalDeviceFeatures2, ClearDepthStencilValue, PipelineTessellationStateCreateInfo, SpecializationMapEntry, SpecializationInfo, BufferCopy, MemoryAllocateInfo, AllocationCallbacks, ApplicationInfo, InstanceCreateInfo, Viewport, CommandBufferInheritanceViewportScissorInfoNV, Extent3D, Extent2D, DisplayModeParametersKHR, DisplayModeCreateInfoKHR, Offset3D, Offset2D, RectLayerKHR, PresentRegionKHR, PresentRegionsKHR, Rect2D, PipelineViewportExclusiveScissorStateCreateInfoNV, DeviceGroupRenderPassBeginInfo, BindImageMemoryDeviceGroupInfo, DisplayPresentInfoKHR, PipelineViewportStateCreateInfo, ClearRect, BaseInStructure, BaseOutStructure, VideoEncodeRateControlInfoKHR, VideoCodingControlInfoKHR, VideoDecodeH264ProfileEXT, VideoProfileKHR, VideoProfilesKHR, VideoQueueFamilyProperties2KHR, EventCreateInfo, PipelineCompilerControlCreateInfoAMD, ShaderModuleCreateInfo, AcquireProfilingLockInfoKHR, DeviceDiagnosticsConfigCreateInfoNV, AccelerationStructureInstanceKHR, DescriptorSetLayoutBindingFlagsCreateInfo, DebugUtilsMessengerCreateInfoEXT, DeviceGroupSwapchainCreateInfoKHR, DeviceGroupPresentInfoKHR, MemoryAllocateFlagsInfo, SwapchainCounterCreateInfoEXT, ExportFenceCreateInfo, PhysicalDeviceExternalFenceInfo, ExportSemaphoreCreateInfo, PhysicalDeviceExternalSemaphoreInfo, ImportMemoryHostPointerInfoEXT, ImportMemoryFdInfoKHR, ImportMemoryZirconHandleInfoFUCHSIA, ImportMemoryWin32HandleInfoKHR, ExportMemoryAllocateInfo, ExternalMemoryBufferCreateInfo, ExternalMemoryImageCreateInfo, PhysicalDeviceExternalImageFormatInfo, PrivateDataSlotCreateInfoEXT, ImportMemoryWin32HandleInfoNV, ExportMemoryAllocateInfoNV, ExternalMemoryImageCreateInfoNV, DebugReportCallbackCreateInfoEXT, CommandBufferInheritanceRenderPassTransformInfoQCOM, CopyCommandTransformInfoQCOM, RenderPassTransformBeginInfoQCOM, PhysicalDeviceFragmentShadingRateEnumsPropertiesNV, SampleLocationsInfoEXT, PipelineSampleLocationsStateCreateInfoEXT, SubpassSampleLocationsEXT, AttachmentSampleLocationsEXT, RenderPassSampleLocationsBeginInfoEXT, PipelineMultisampleStateCreateInfo, CommandPoolCreateInfo, ImagePlaneMemoryRequirementsInfo, BindImagePlaneMemoryInfo, InputAttachmentAspectReference, RenderPassInputAttachmentAspectCreateInfo, ClearAttachment, ImageSubresourceRange, ImageSubresourceLayers, ImageResolve2KHR, BufferImageCopy2KHR, ImageBlit2KHR, ImageCopy2KHR, ImageResolve, BufferImageCopy, ImageBlit, ImageCopy, ImageSubresource, FenceCreateInfo, ImageStencilUsageCreateInfo, ImageViewUsageCreateInfo, PushConstantRange, PhysicalDeviceExternalBufferInfo, SubpassDependency2, SubpassDependency, MemoryBarrier, DeviceQueueInfo2, DeviceQueueCreateInfo, DeviceCreateInfo, PipelineCacheCreateInfo, PipelineRasterizationProvokingVertexStateCreateInfoEXT, PipelineFragmentShadingRateEnumStateCreateInfoNV, PipelineFragmentShadingRateStateCreateInfoKHR, PipelineRasterizationLineStateCreateInfoEXT, PerformanceValueINTEL, PerformanceOverrideInfoINTEL, QueryPoolPerformanceQueryCreateInfoINTEL, PerformanceConfigurationAcquireInfoINTEL, SurfaceFullScreenExclusiveInfoEXT, CooperativeMatrixPropertiesNV, DeviceMemoryOverallocationCreateInfoAMD, RayTracingShaderGroupCreateInfoKHR, RayTracingShaderGroupCreateInfoNV, AccelerationStructureGeometryKHR, CoarseSampleOrderCustomNV, PipelineViewportCoarseSampleOrderStateCreateInfoNV, ShadingRatePaletteNV, PipelineViewportShadingRateImageStateCreateInfoNV, PipelineRasterizationConservativeStateCreateInfoEXT, DeviceQueueGlobalPriorityCreateInfoEXT, PipelineCoverageReductionStateCreateInfoNV, PipelineCoverageModulationStateCreateInfoNV, PipelineColorBlendAdvancedStateCreateInfoEXT, PipelineTessellationDomainOriginStateCreateInfo, SamplerReductionModeCreateInfo, PipelineDiscardRectangleStateCreateInfoEXT, ViewportSwizzleNV, PipelineViewportSwizzleStateCreateInfoNV, DisplayEventInfoEXT, DeviceEventInfoEXT, DisplayPowerInfoEXT, ValidationFeaturesEXT, ValidationFlagsEXT, PipelineRasterizationStateRasterizationOrderAMD, DebugMarkerObjectTagInfoEXT, DebugMarkerObjectNameInfoEXT, CalibratedTimestampInfoEXT, SemaphoreTypeCreateInfo, DebugUtilsObjectTagInfoEXT, DebugUtilsObjectNameInfoEXT, DebugUtilsMessengerCallbackDataEXT, PipelineDynamicStateCreateInfo, SubpassBeginInfo, VideoSessionCreateInfoKHR, VertexInputAttributeDescription2EXT, SamplerCustomBorderColorCreateInfoEXT, FramebufferAttachmentImageInfo, FramebufferAttachmentsCreateInfo, ImageViewASTCDecodeModeEXT, ImageFormatListCreateInfo, VertexInputAttributeDescription, VertexInputBindingDescription2EXT, VertexInputBindingDescription, PipelineVertexInputStateCreateInfo, PipelineColorBlendAttachmentState, PipelineColorBlendStateCreateInfo, PipelineRasterizationStateCreateInfo, StencilOpState, PipelineDepthStencilStateCreateInfo, AccelerationStructureGeometryTrianglesDataKHR, BindIndexBufferIndirectCommandNV, PhysicalDeviceImageDrmFormatModifierInfoEXT, BufferCreateInfo, PipelineInputAssemblyStateCreateInfo, SamplerCreateInfo, QueryPoolCreateInfo, MutableDescriptorTypeListVALVE, MutableDescriptorTypeCreateInfoVALVE, DescriptorUpdateTemplateEntry, DescriptorPoolSize, DescriptorPoolCreateInfo, ComponentMapping, SamplerYcbcrConversionCreateInfo, PhysicalDeviceImageViewImageFormatInfoEXT, PhysicalDeviceSparseImageFormatInfo2, PhysicalDeviceImageFormatInfo2, AttachmentDescriptionStencilLayout, AttachmentReferenceStencilLayout, AttachmentReference2, FragmentShadingRateAttachmentInfoKHR, SubpassDescriptionDepthStencilResolve, SubpassDescription2, AttachmentDescription2, RenderPassCreateInfo2, AttachmentReference, RenderPassFragmentDensityMapCreateInfoEXT, SubpassDescription, AttachmentDescription, RenderPassCreateInfo, ImageCreateInfo, PhysicalDeviceSurfaceInfo2KHR, BindImageMemorySwapchainInfoKHR, ImageSwapchainCreateInfoKHR, SwapchainCreateInfoKHR, DeviceGroupDeviceCreateInfo, DisplayPlaneInfo2KHR, DisplaySurfaceCreateInfoKHR, VideoSessionParametersCreateInfoKHR, AccelerationStructureMemoryRequirementsInfoNV, WriteDescriptorSetAccelerationStructureNV, CopyMemoryToAccelerationStructureInfoKHR, CopyAccelerationStructureToMemoryInfoKHR, CopyAccelerationStructureInfoKHR, AccelerationStructureDeviceAddressInfoKHR, AccelerationStructureBuildGeometryInfoKHR, WriteDescriptorSetAccelerationStructureKHR, ShaderModuleValidationCacheCreateInfoEXT, SamplerYcbcrConversionInfo, RenderPassBeginInfo, CommandBufferInheritanceInfo, CommandBufferBeginInfo, SemaphoreSubmitInfoKHR, SemaphoreSignalInfo, SemaphoreWaitInfo, SemaphoreGetZirconHandleInfoFUCHSIA, ImportSemaphoreZirconHandleInfoFUCHSIA, SemaphoreGetFdInfoKHR, ImportSemaphoreFdInfoKHR, SemaphoreGetWin32HandleInfoKHR, ImportSemaphoreWin32HandleInfoKHR, PresentInfoKHR, AcquireNextImageInfoKHR, FenceGetFdInfoKHR, ImportFenceFdInfoKHR, FenceGetWin32HandleInfoKHR, ImportFenceWin32HandleInfoKHR, CopyDescriptorSet, PipelineLayoutCreateInfo, DescriptorSetAllocateInfo, DescriptorSetLayoutBinding, DescriptorSetLayoutCreateInfo, DescriptorUpdateTemplateCreateInfo, IndirectCommandsLayoutTokenNV, IndirectCommandsLayoutCreateInfoNV, PipelineLibraryCreateInfoKHR, PipelineExecutableInfoKHR, PipelineInfoKHR, GeneratedCommandsMemoryRequirementsInfoNV, PipelineShaderStageCreateInfo, RayTracingPipelineCreateInfoKHR, RayTracingPipelineCreateInfoNV, GraphicsShaderGroupCreateInfoNV, GraphicsPipelineShaderGroupsCreateInfoNV, GraphicsPipelineCreateInfo, ComputePipelineCreateInfo, VideoPictureResourceKHR, VideoReferenceSlotKHR, VideoBeginCodingInfoKHR, ImageViewHandleInfoNVX, RenderPassAttachmentBeginInfo, FramebufferCreateInfo, DescriptorImageInfo, ImageMemoryBarrier2KHR, ResolveImageInfo2KHR, BlitImageInfo2KHR, CopyImageInfo2KHR, ImageSparseMemoryRequirementsInfo2, ImageMemoryRequirementsInfo2, ImageViewCreateInfo, ImageMemoryBarrier, VideoEncodeInfoKHR, VideoDecodeInfoKHR, BufferMemoryBarrier2KHR, DependencyInfoKHR, CopyImageToBufferInfo2KHR, CopyBufferToImageInfo2KHR, CopyBufferInfo2KHR, AccelerationStructureCreateInfoKHR, BufferDeviceAddressInfo, GeometryAABBNV, GeometryTrianglesNV, GeometryDataNV, GeometryNV, AccelerationStructureInfoNV, AccelerationStructureCreateInfoNV, ConditionalRenderingBeginInfoEXT, MemoryDedicatedAllocateInfo, BufferMemoryRequirementsInfo2, IndirectCommandsStreamNV, GeneratedCommandsInfoNV, DedicatedAllocationMemoryAllocateInfoNV, BufferMemoryBarrier, BufferViewCreateInfo, DescriptorBufferInfo, WriteDescriptorSet, CommandBufferAllocateInfo, CommandBufferSubmitInfoKHR, SubmitInfo2KHR, SubmitInfo, VideoBindMemoryKHR, DeviceMemoryOpaqueCaptureAddressInfo, BindAccelerationStructureMemoryInfoNV, MemoryGetAndroidHardwareBufferInfoANDROID, BindImageMemoryInfo, BindBufferMemoryInfo, Win32KeyedMutexAcquireReleaseInfoKHR, MemoryGetFdInfoKHR, MemoryGetWin32HandleInfoKHR, MemoryGetZirconHandleInfoFUCHSIA, Win32KeyedMutexAcquireReleaseInfoNV, SparseImageMemoryBind, SparseImageMemoryBindInfo, SparseMemoryBind, SparseImageOpaqueMemoryBindInfo, SparseBufferMemoryBindInfo, BindSparseInfo, MappedMemoryRange, PipelineCreationFeedbackCreateInfoEXT, ImageDrmFormatModifierExplicitCreateInfoEXT, VideoGetMemoryPropertiesKHR, VideoEncodeH264SessionCreateInfoEXT, VideoEncodeH264CapabilitiesEXT, VideoDecodeH265SessionCreateInfoEXT, VideoDecodeH264SessionCreateInfoEXT
