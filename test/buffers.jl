command_pool = CommandPool(device, 0)
cbuffer = first(unwrap(allocate_command_buffers(device, CommandBufferAllocateInfo(command_pool, COMMAND_BUFFER_LEVEL_PRIMARY, 1))))
@test cbuffer isa CommandBuffer

buffer = Buffer(device, 100, BUFFER_USAGE_TRANSFER_DST_BIT, SHARING_MODE_EXCLUSIVE, [])
@test buffer isa Buffer
@test get_buffer_memory_requirements_2_khr ≠ get_buffer_memory_requirements_2
