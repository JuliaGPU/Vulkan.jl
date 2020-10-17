function GraphicsPipelineCreateInfo(ps::PipelineSetup, render_pass, viewport_state)
    s = ps.stages
    @unpack vertex_input_state, input_assembly_state, color_blend_state, multisample_state, dynamic_state = s
    GraphicsPipelineCreateInfo(s.shaders, s.rasterization, ps.layout, render_pass, 0, 0; vertex_input_state, input_assembly_state, color_blend_state, viewport_state, multisample_state, dynamic_state)
end

PipelineViewportStateCreateInfo(app::VulkanApplication) = PipelineViewportStateCreateInfo(viewports=[app.viewport.viewport], scissors=[app.viewport.scissor])
create_pipeline!(ps::PipelineSetup, device, render_pass, viewport_state) = setproperty!(ps, :handle, first(Pipeline(device, [GraphicsPipelineCreateInfo(ps, render_pass, viewport_state)])))
create_pipeline!(ps::PipelineSetup, app::VulkanApplication) = create_pipeline!(ps, app.device, app.render_pass, PipelineViewportStateCreateInfo(app))
create_pipelines!(device, render_pass, viewport_state, pss::PipelineSetup...) = setproperty!.(pss, :handle, Pipeline(GraphicsPipelineCreateInfo.(pss, render_pass, viewport_state)))


function recreate_pipeline!(ps::PipelineSetup, app)
    finalize(ps.handle)
    create_pipeline!(ps, app)
end

function Base.copyto!(dest::BufferSetup, src, device::DeviceSetup; size=WHOLE_SIZE)
    ptr_ref = Ref{Ptr{Cvoid}}()
    #TODO: Make a Ref{Ptr{Cvoid}} rather than Ref{Cvoid} for ppData inside wrapped_api.jl
    @check vkMapMemory(device, dest.memory, 0, size, 0, ptr_ref)
    ptr_deref = ptr_ref[]
    GC.@preserve src unsafe_copyto!(reinterpret(Ptr{eltype(src)}, ptr_deref), pointer(src), length(src))
    unmap_memory(device, dest.memory)
end

function Base.copyto!(dest::BufferSetup, src::BufferSetup, size, device::DeviceSetup, command_pool)
    cmd_buffer = first(CommandBuffer(device, CommandBufferAllocateInfo(command_pool, COMMAND_BUFFER_LEVEL_PRIMARY, 1)))
    begin_command_buffer(cmd_buffer, CommandBufferBeginInfo(flags=COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT))
    cmd_copy_buffer(cmd_buffer, src, dest, [BufferCopy(0, 0, size)])
    end_command_buffer(cmd_buffer)
    queue_submit(device.queues.graphics, [SubmitInfo([], [], [cmd_buffer], [])])
    queue_wait_idle(device.queues.graphics)
    free_command_buffers(device, command_pool, [cmd_buffer])
end