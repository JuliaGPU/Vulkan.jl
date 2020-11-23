function add_framebuffers!(app::VulkanApplication, ::Target{SwapchainKHR})
    framebuffer_cis = FramebufferCreateInfo.(app.render_pass, [[view] for view ∈ app.swapchain.image_views], app.swapchain.extent.vks.width, app.swapchain.extent.vks.height, 1)
    framebuffers = Framebuffer.(app.device, framebuffer_cis)
    add_framebuffers!(app, framebuffers)
end

add_framebuffers!(app::VulkanApplication, framebuffers::Vector{Framebuffer}) = app.framebuffers = framebuffers

function add_buffer!(app::VulkanApplication, symbol; size=nothing, from_pool=nothing, usage=nothing, device_local=false, fill_with=nothing)
    fill = !isnothing(fill_with)

    if !fill
        @assert !isnothing(size) "Buffer size must be provided."
    else
        isnothing(size) ? size = sizeof(fill_with) : nothing
    end

    if device_local && fill
        @assert !isnothing(from_pool) "A command pool must be provided to fill a device local buffer. Available pools are $(collect(keys(app.command_pools)))."
        command_pool = app.command_pools[from_pool]
    else
        command_pool = nothing
    end

    buffer = BufferSetup(app.device, size; usage, device_local)

    if fill
        fill!(buffer, fill_with, app.device; command_pool)
    end

    app.buffers[symbol] = buffer
end

add_vertex_buffer!(app::VulkanApplication, vertices; buffer_symbol=:vertex, kwargs...) = add_buffer!(app, buffer_symbol; usage=BUFFER_USAGE_VERTEX_BUFFER_BIT, fill_with=vertices, kwargs...)
add_index_buffer!(app::VulkanApplication, indices; buffer_symbol=:index, kwargs...) = add_buffer!(app, buffer_symbol; usage=BUFFER_USAGE_INDEX_BUFFER_BIT, fill_with=convert(Array{Int32}, indices), kwargs...)
add_uniform_buffer!(app::VulkanApplication, size, buffer_symbol; kwargs...) = add_buffer!(app, buffer_symbol; size, usage=BUFFER_USAGE_UNIFORM_BUFFER_BIT, kwargs...)
