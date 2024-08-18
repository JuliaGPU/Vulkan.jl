function set_debug_name(handle::Handle, name)
  device = device_or_nothing(handle)
  isnothing(device) && error("No parent device found for $handle; you must provide the device explicitly as first argument")
  set_debug_name(device::Device, handle, name)
end
set_debug_name(device::Device, handle::Handle, name::Symbol) = set_debug_name(device, handle, string(name))
function set_debug_name(device::Device, handle::Handle, name::String)
  object_type = ObjectType(handle)
  address = UInt64(convert(Ptr{Cvoid}, handle))
  info = DebugUtilsObjectNameInfoEXT(object_type, address; object_name = name)
  set_debug_utils_object_name_ext(device, info)
end

ObjectType(::Handle) = OBJECT_TYPE_UNKNOWN
ObjectType(::Instance) = OBJECT_TYPE_INSTANCE
ObjectType(::PhysicalDevice) = OBJECT_TYPE_PHYSICAL_DEVICE
ObjectType(::Device) = OBJECT_TYPE_DEVICE
ObjectType(::Queue) = OBJECT_TYPE_QUEUE
ObjectType(::Semaphore) = OBJECT_TYPE_SEMAPHORE
ObjectType(::CommandBuffer) = OBJECT_TYPE_COMMAND_BUFFER
ObjectType(::Fence) = OBJECT_TYPE_FENCE
ObjectType(::DeviceMemory) = OBJECT_TYPE_DEVICE_MEMORY
ObjectType(::Buffer) = OBJECT_TYPE_BUFFER
ObjectType(::Image) = OBJECT_TYPE_IMAGE
ObjectType(::Event) = OBJECT_TYPE_EVENT
ObjectType(::QueryPool) = OBJECT_TYPE_QUERY_POOL
ObjectType(::BufferView) = OBJECT_TYPE_BUFFER_VIEW
ObjectType(::ImageView) = OBJECT_TYPE_IMAGE_VIEW
ObjectType(::ShaderModule) = OBJECT_TYPE_SHADER_MODULE
ObjectType(::PipelineCache) = OBJECT_TYPE_PIPELINE_CACHE
ObjectType(::PipelineLayout) = OBJECT_TYPE_PIPELINE_LAYOUT
ObjectType(::RenderPass) = OBJECT_TYPE_RENDER_PASS
ObjectType(::Pipeline) = OBJECT_TYPE_PIPELINE
ObjectType(::DescriptorSetLayout) = OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT
ObjectType(::Sampler) = OBJECT_TYPE_SAMPLER
ObjectType(::DescriptorPool) = OBJECT_TYPE_DESCRIPTOR_POOL
ObjectType(::DescriptorSet) = OBJECT_TYPE_DESCRIPTOR_SET
ObjectType(::Framebuffer) = OBJECT_TYPE_FRAMEBUFFER
ObjectType(::CommandPool) = OBJECT_TYPE_COMMAND_POOL
ObjectType(::SamplerYcbcrConversion) = OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION
ObjectType(::DescriptorUpdateTemplate) = OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE
ObjectType(::PrivateDataSlot) = OBJECT_TYPE_PRIVATE_DATA_SLOT
ObjectType(::SurfaceKHR) = OBJECT_TYPE_SURFACE_KHR
ObjectType(::SwapchainKHR) = OBJECT_TYPE_SWAPCHAIN_KHR
ObjectType(::DisplayKHR) = OBJECT_TYPE_DISPLAY_KHR
ObjectType(::DisplayModeKHR) = OBJECT_TYPE_DISPLAY_MODE_KHR
ObjectType(::DebugReportCallbackEXT) = OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT
ObjectType(::CuModuleNVX) = OBJECT_TYPE_CU_MODULE_NVX
ObjectType(::CuFunctionNVX) = OBJECT_TYPE_CU_FUNCTION_NVX
ObjectType(::DebugUtilsMessengerEXT) = OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT
ObjectType(::AccelerationStructureKHR) = OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR
ObjectType(::ValidationCacheEXT) = OBJECT_TYPE_VALIDATION_CACHE_EXT
ObjectType(::AccelerationStructureNV) = OBJECT_TYPE_ACCELERATION_STRUCTURE_NV
ObjectType(::PerformanceConfigurationINTEL) = OBJECT_TYPE_PERFORMANCE_CONFIGURATION_INTEL
ObjectType(::DeferredOperationKHR) = OBJECT_TYPE_DEFERRED_OPERATION_KHR
ObjectType(::IndirectCommandsLayoutNV) = OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV

# These don't have wrappers defined yet.
# ObjectType(::) = OBJECT_TYPE_VIDEO_SESSION_KHR
# ObjectType(::) = OBJECT_TYPE_VIDEO_SESSION_PARAMETERS_KHR
# ObjectType(::) = OBJECT_TYPE_BUFFER_COLLECTION_FUCHSIA
