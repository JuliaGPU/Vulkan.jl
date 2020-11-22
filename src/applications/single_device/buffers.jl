function add_framebuffers!(app::VulkanApplication, ::Target{SwapchainKHR})
    framebuffer_cis = FramebufferCreateInfo.(app.render_pass, [[view] for view ∈ app.swapchain.image_views], app.swapchain.extent.vks.width, app.swapchain.extent.vks.height, 1)
    framebuffers = Framebuffer.(app.device, framebuffer_cis)
    add_framebuffers!(app, framebuffers)
end

add_framebuffers!(app::VulkanApplication, framebuffers::Vector{Framebuffer}) = app.framebuffers = framebuffers

function add_buffer!(app::VulkanApplication, data, symbol; from_pool=:a, usage=nothing)
    device = app.device
    buffer_size = sizeof(data)
    buffer_src = BufferSetup(device, buffer_size, BUFFER_USAGE_TRANSFER_SRC_BIT, |(MEMORY_PROPERTY_HOST_VISIBLE_BIT, MEMORY_PROPERTY_HOST_COHERENT_BIT))
    buffer_dst = BufferSetup(device, buffer_size, (isnothing(usage) ? BUFFER_USAGE_TRANSFER_DST_BIT : |(BUFFER_USAGE_TRANSFER_DST_BIT, usage)), MEMORY_PROPERTY_DEVICE_LOCAL_BIT)
    app.buffers[symbol] = buffer_dst
    copyto!(buffer_src, data, device)
    copyto!(buffer_dst, buffer_src, buffer_size, device, app.command_pools[from_pool])
    finalize(buffer_src)
end

add_vertex_buffer!(app::VulkanApplication, vertices; buffer_symbol=:vertex) = add_buffer!(app, vertices, buffer_symbol, usage=BUFFER_USAGE_VERTEX_BUFFER_BIT)
add_index_buffer!(app::VulkanApplication, indices; buffer_symbol=:index) = add_buffer!(app, convert(Array{Int32}, indices), buffer_symbol, usage=BUFFER_USAGE_INDEX_BUFFER_BIT)
