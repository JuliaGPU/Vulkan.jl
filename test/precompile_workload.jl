struct PrecompilationError
  msg::String
end

Base.showerror(io::IO, err::PrecompilationError) = print(io, "PrecompilationError: ", err.msg)

function precompile_workload()
  # Only run Vulkan commands if a Vulkan library is found.
  libname = Libdl.find_library(VkCore.libvulkan)
  !isempty(libname) || throw(PrecompilationError("No Vulkan library named $(VkCore.libvulkan) in the library path."))

  # This is run before initializing Vulkan.
  # VkCore.libvulkan_handle[] = Libdl.dlopen(libname)

  !isdefined(global_dispatcher, 1) && (global_dispatcher[] = APIDispatcher())
  fill_dispatch_table()

  loader_version = unwrap(enumerate_instance_version())
  loader_version ≥ v"1.1" || throw(PrecompilationError("The Vulkan loader version is unsupported ($loader_version): a version of 1.1 or higher is required."))
  layers = []
  exts = []

  for layer in unwrap(enumerate_instance_layer_properties())
    layer.layer_name == "VK_LAYER_KHRONOS_validation" && layer.spec_version ≥ v"1.3" && push!(layers, layer.layer_name)
  end

  ext_props = unwrap(enumerate_instance_extension_properties())
  next = C_NULL
  if !isnothing(findfirst(x -> x.extension_name == "VK_EXT_debug_utils", ext_props))
    push!(exts, "VK_EXT_debug_utils")
    debug_callback = @cfunction(
      Vk.default_debug_callback,
      UInt32,
      (DebugUtilsMessageSeverityFlagEXT, DebugUtilsMessageTypeFlagEXT, Ptr{VkCore.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid})
    )
    messenger_create_info = DebugUtilsMessengerCreateInfoEXT(
      DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT,
      DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT | DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
      debug_callback,
    )
    next = messenger_create_info
  end

  instance = Instance(layers, exts; application_info = ApplicationInfo(v"0.1", v"0.1", v"1.3"), next)
  messenger = DebugUtilsMessengerEXT(instance, messenger_create_info)

  pdevices = unwrap(enumerate_physical_devices(instance))
  physical_device = nothing
  isempty(pdevices) && throw(PrecompilationError("No physical devices found which support Vulkan."))
  @debug "Physical devices: "
  for pdevice in pdevices
    props = unwrap(get_physical_device_properties(pdevice))
    @debug sprint(show, MIME"text/plain"(), props)
    props.api_version ≥ v"1.3" && (physical_device = pdevice)
  end
  !isnothing(physical_device) || throw(PrecompilationError("No physical device was found which supports Vulkan 1.3 or higher."))

  queue_props = get_physical_device_queue_family_properties(physical_device)
  queue_family_index = findfirst(x -> (QUEUE_COMPUTE_BIT | QUEUE_GRAPHICS_BIT) in x.queue_flags, queue_props)
  !isnothing(queue_family_index) || throw(PrecompilationError("No queue found which supports graphics and compute operations."))
  queue_family_index -= 1 # 0-based indexing
  device = Device(physical_device, [DeviceQueueCreateInfo(queue_family_index, [1.0])], [], [])
  queue = get_device_queue(device, queue_family_index, 0)
  command_pool = CommandPool(device, queue_family_index)
  compute_workload(device, queue, command_pool)
  true
end

function compute_workload(device, queue, command_pool)
  data_items = 100
  data_size = sizeof(Float32) * data_items

  buffer = Buffer(
    device,
    data_size,
    BUFFER_USAGE_STORAGE_BUFFER_BIT,
    SHARING_MODE_EXCLUSIVE,
    [0], # queue family index, ignored because sharing mode is not concurrent
  )
  buffer_reqs = get_buffer_memory_requirements(device, buffer)
  memory_props = get_physical_device_memory_properties(device.physical_device)
  candidate_indices = findall(i -> buffer_reqs.memory_type_bits & (1 << (i - 1)) ≠ 0, 1:memory_props.memory_type_count)
  isempty(candidate_indices) && throw(PrecompilationError("No buffer memory available."))
  memory_type = findfirst(i -> (MEMORY_PROPERTY_HOST_VISIBLE_BIT | MEMORY_PROPERTY_HOST_COHERENT_BIT) in memory_props.memory_types[i].property_flags, candidate_indices)
  isnothing(memory_type) && throw(PrecompilationError("No host-visible and host-coherent buffer memory available."))
  memory_type = candidate_indices[memory_type] - 1
  mem = DeviceMemory(device, buffer_reqs.size, memory_type)

  unwrap(bind_buffer_memory(device, buffer, mem, 0 #= offset =#))

  memptr = unwrap(map_memory(device, mem, 0 #= offset =#, data_size))
  data = unsafe_wrap(Vector{Float32}, convert(Ptr{Float32}, memptr), data_items, own = false)
  data .= 0

  unwrap(flush_mapped_memory_ranges(device, [MappedMemoryRange(mem, 0 #= offset =#, data_size)]))

  shader_bcode = reinterpret(UInt32, read(joinpath(@__DIR__, "precompile_compute.spv")))
  shader = ShaderModule(device, sizeof(UInt32) * length(shader_bcode), shader_bcode)

  descriptor_set_layout = DescriptorSetLayout(
    device,
    [
      DescriptorSetLayoutBinding(
        0, # binding
        DESCRIPTOR_TYPE_STORAGE_BUFFER,
        SHADER_STAGE_COMPUTE_BIT;
        descriptor_count = 1,
      ),
    ],
  )

  pipeline_layout = PipelineLayout(
    device,
    [descriptor_set_layout],
    [PushConstantRange(SHADER_STAGE_COMPUTE_BIT, 0 #= offset =#, 8 #= size =#)],
  )

  local_size_x = UInt32(4)
  spec_consts = [local_size_x]

  pipeline_info = ComputePipelineCreateInfo(
    PipelineShaderStageCreateInfo(
      SHADER_STAGE_COMPUTE_BIT,
      shader,
      "main", # this needs to match the function name in the shader
      specialization_info = SpecializationInfo(
        [SpecializationMapEntry(0 #= id =#, 0 #= offset =#, 4 #= size =#)],
        UInt(sizeof(spec_consts)),
        Ptr{Nothing}(pointer(spec_consts)),
      ),
    ),
    pipeline_layout,
    -1,
  )
  (pipeline, _...), _ = unwrap(create_compute_pipelines(device, [pipeline_info]))

  descriptor_pool = DescriptorPool(device, 1 #= pool size =#, [DescriptorPoolSize(DESCRIPTOR_TYPE_STORAGE_BUFFER, 1)]; flags = DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT)
  dset, _... = unwrap(allocate_descriptor_sets(device, DescriptorSetAllocateInfo(descriptor_pool, [descriptor_set_layout])))
  update_descriptor_sets(
    device,
    [
      WriteDescriptorSet(
        dset,
        0, # binding
        0, # array element
        DESCRIPTOR_TYPE_STORAGE_BUFFER,
        [],
        [DescriptorBufferInfo(buffer, 0 #= offset =#, data_size)],
        [],
      ),
    ],
    [],
  )

  command_buffer, _... = unwrap(
    allocate_command_buffers(
      device,
      CommandBufferAllocateInfo(command_pool, COMMAND_BUFFER_LEVEL_PRIMARY, 1),
    ),
  )
  begin_command_buffer(
    command_buffer,
    CommandBufferBeginInfo(flags = COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT),
  )
  cmd_bind_pipeline(command_buffer, PIPELINE_BIND_POINT_COMPUTE, pipeline)
  push_constants = [(Float32(1.234), UInt32(data_items))]
  cmd_push_constants(
    command_buffer,
    pipeline_layout,
    SHADER_STAGE_COMPUTE_BIT,
    0, # offset
    sizeof(push_constants), # size
    Ptr{Nothing}(pointer(push_constants)),
  )
  cmd_bind_descriptor_sets(command_buffer, PIPELINE_BIND_POINT_COMPUTE, pipeline_layout, 0 #= first set =#, [dset], [])
  cmd_dispatch(command_buffer, div(data_items, local_size_x, RoundUp), 1 #= group count y =#, 1 #= group count z =#)
  end_command_buffer(command_buffer)

  unwrap(queue_submit(queue, [SubmitInfo([], [], [command_buffer], [])]))

  GC.@preserve buffer descriptor_set_layout pipeline_layout spec_consts pipeline push_constants begin
    unwrap(queue_wait_idle(queue))
  end

  free_command_buffers(device, command_pool, [command_buffer])
  free_descriptor_sets(device, descriptor_pool, [dset])

  unwrap(invalidate_mapped_memory_ranges(device, [MappedMemoryRange(mem, 0 #= offset =#, data_size)]))
end
