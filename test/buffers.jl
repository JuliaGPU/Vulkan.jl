command_pool = CommandPool(device, 0)
buffer = first(unwrap(allocate_command_buffers(device, CommandBufferAllocateInfo(command_pool, VK_COMMAND_BUFFER_LEVEL_PRIMARY, 1))))
