create_descriptor_pool!(app, max_size, pool_sizes, symbol) = app.descriptor_pools[symbol] = DescriptorPool(app.device, DescriptorPoolCreateInfo(max_size, pool_sizes))
