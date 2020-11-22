create_command_pool!(app, symbol) = app.command_pools[symbol] = CommandPool(app.device, CommandPoolCreateInfo(0, flags=COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT))
