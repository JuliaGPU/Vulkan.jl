
function CommandBuffer(device, commandpool;
        level=api.VK_COMMAND_BUFFER_LEVEL_PRIMARY
    )

    commandbuffer_arr = Array(api.VkCommandBuffer, 1)
    allocation_info = create(api.VkCommandBufferAllocateInfo, (
        :commandPool, commandpool,
        :level, api.VK_COMMAND_BUFFER_LEVEL_PRIMARY,
        :commandBufferCount, 1
    ))

    err = api.vkAllocateCommandBuffers(device, allocation_info, commandbuffer_arr)
    check(err)
    CommandBuffer(commandbuffer_arr[], RESETTED, commandpool)
end
"""
Begin Recording, execute `f(cb)` and end recording aftewards.
"""
function record!(f::Function, cb::CommandBuffer)
    record!(cb)
    f(cb)
    end_recording!(cb)
end
"""
Sets commandbuffer into recording state
"""
function record!(
        cb::CommandBuffer,
        begin_info=create(api.VkCommandBufferBeginInfo, ())
    )
    cb.state != RESETTED && error("CommandBuffer state must be RESETTED to start recording. State found: $(cb.state)")
    err = api.vkBeginCommandBuffer(cb, begin_info)
    check(err)
    cb.state = RECORDING
    nothing
end
"""
Sets commandbuffer into ended recording state.
It's now ready to be submitted
"""
function end_recording!(cb::CommandBuffer)
    cb.state != RECORDING && error("CommandBuffer state must be RECORDING to end recording. State found: $(cb.state)")
    api.vkBeginCommandBuffer(cb)
    cb.state = READY_FOR_SUBMIT
    nothing
end

"""
Resets the commandbuffer and readys it for calling `record!`.
"""
function reset!(cb::CommandBuffer, flag::api.VkFlags)
    api.vkResetCommandBuffer(cb, flag)
    cb.state = RESETTED
    nothing
end

function createCommandPool(device, swapchain)
    CreateCommandPool(device, C_NULL, (
        :queueFamilyIndex, swapchain.queue_node_index,
        :flags, api.VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT
    ))
end

function createSetupCommandBuffer(device, command_pool)
    setup_cb = CommandBuffer(device, command_pool)
    # todo : Command buffer is also started here, better put somewhere else
    # todo : Check if necessaray at all...
    record!(setup_cb)
    setup_cb
end



type DrawCommandBuffer
    buffers
    prepresent
    postpresent
end


function create_command_buffers(device, swapchain, command_pool)
    # Create one command buffer per frame buffer
    # in the swap chain
    # Command buffers store a reference to the
    # frame buffer inside their render pass info
    # so for static usage withouth having to rebuild
    # them each frame, we use one per frame buffer
    draw_command_buffers = [CommandBuffer(device, command_pool) for i=1:image_count(swapchain)]

    # Command buffers for submitting present barriers
    # Pre present
    prePresentCmdBuffer = CommandBuffer(device, command_pool)
    # Post present
    postPresentCmdBuffer = CommandBuffer(device, command_pool)
    DrawCommandBuffer(draw_command_buffers, prePresentCmdBuffer, postPresentCmdBuffer)
end


function RenderPassBeginInfo(renderPass, framebuffer,renderArea, clearcolor, depthclear)
    api.VkRenderPassBeginInfo(
        api.VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO,
        C_NULL,
        renderPass,# :: VkRenderPass
        framebuffer,# :: VkFramebuffer
        renderArea,# :: VkRect2D
        clearValueCount,# :: UInt32
        pClearValues # :: Ptr{VkClearValue}
    )
end

"""
 Build separate command buffers for every framebuffer image
 Unlike in OpenGL all rendering commands are recorded once
 into command buffers that are then resubmitted to the queue
"""
function buildCommandBuffers(
        draw_command_buffers, frameBuffers, swapchain,
        renderPass, width, height, pipelineLayout,
        descriptorSet, pipelines, vertices, indices
    )
    cmdBufInfo = Ref(api.VkCommandBufferBeginInfo(
    api.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        C_NULL,
        0,
        C_NULL
    ))

    global clearValues = Float32[0.025f0, 0.025f0, 0.025f0, 1.0f0, 1f0, 0f0]
    clear_value_ref = Ptr{api.VkClearValue}(Base.unsafe_convert(Ptr{Float32}, clearValues))
    renderPassBeginInfo = create(api.VkRenderPassBeginInfo, (
        :renderPass, renderPass,
        :renderArea, api.VkRect2D(
            api.VkOffset2D(0, 0),
            api.VkExtent2D(width, height)
        ),
        :clearValueCount, 2,
        :pClearValues, clear_value_ref
    ))

    cmd_buffers = draw_command_buffers.buffers
    for i=1:length(cmd_buffers)
        # Set target frame buffer
        renderPassBeginInfo[:framebuffer] = frameBuffers[i]

        err = api.vkBeginCommandBuffer(cmd_buffers[i], cmdBufInfo)
        check(err)

        api.vkCmdBeginRenderPass(cmd_buffers[i], renderPassBeginInfo, api.VK_SUBPASS_CONTENTS_INLINE)

        # Update dynamic viewport state
        viewports = create(Vector{api.VkViewport}, (
            :height, height,
            :width, width,
            :minDepth, 0.0f0,
            :maxDepth, 1.0f0
        ))

        api.vkCmdSetViewport(cmd_buffers[i], 0, 1, viewports)

        # Update dynamic scissor state
        scissors = create(Vector{api.VkRect2D}, (
            :extent, api.VkExtent2D(width, height),
            :offset, api.VkOffset2D(0,0)
        ))

        api.vkCmdSetScissor(cmd_buffers[i], 0, 1, scissors)
        descriptorset_ref = [descriptorSet]
        # Bind descriptor sets describing shader binding points
        api.vkCmdBindDescriptorSets(cmd_buffers[i], api.VK_PIPELINE_BIND_POINT_GRAPHICS, pipelineLayout, 0, 1, descriptorset_ref, 0, C_NULL)

        # Bind the rendering pipeline (including the shaders)
        api.vkCmdBindPipeline(cmd_buffers[i], api.VK_PIPELINE_BIND_POINT_GRAPHICS, pipelines)

        # Bind triangle vertices
        offsets = [api.VkDeviceSize(0)]
        VERTEX_BUFFER_BIND_ID = 0
        buffers = [vertices.buffer]
        api.vkCmdBindVertexBuffers(cmd_buffers[i], VERTEX_BUFFER_BIND_ID, 1, buffers, offsets)

        # Bind triangle indices
        api.vkCmdBindIndexBuffer(cmd_buffers[i], indices.buffer, 0, api.VK_INDEX_TYPE_UINT32)

        # Draw indexed triangle
        api.vkCmdDrawIndexed(cmd_buffers[i], flat_length(indices), 1, 0, 0, 1)

        api.vkCmdEndRenderPass(cmd_buffers[i])

        # Add a present memory barrier to the end of the command buffer
        # This will transform the frame buffer color attachment to a
        # new layout for presenting it to the windowing system integration
        prePresentBarrier = create(api.VkImageMemoryBarrier, (
            :sType, api.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER,
            :srcAccessMask, api.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,
            :dstAccessMask, 0,
            :oldLayout, api.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
            :newLayout, api.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
            :srcQueueFamilyIndex, api.VK_QUEUE_FAMILY_IGNORED,
            :dstQueueFamilyIndex, api.VK_QUEUE_FAMILY_IGNORED,
            :subresourceRange, api.VkImageSubresourceRange(api.VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1),
            :image, swapchain.buffers[i].image
        ))

        api.vkCmdPipelineBarrier(
            cmd_buffers[i],
            api.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
            api.VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,
            0, #VK_FLAGS_NONE
            0, C_NULL,
            0, C_NULL,
            1, prePresentBarrier
        )
        err = api.vkEndCommandBuffer(cmd_buffers[i])
        check(err)
    end
end


function flushSetupCommandBuffer(device, setup_command_buffer, command_pool, queue)
    if (setup_command_buffer == api.VK_NULL_HANDLE)
        return nothing
    end
    err = api.vkEndCommandBuffer(setup_command_buffer)
    check(err)
    buffer_ref = [setup_command_buffer.ref]
    submitInfo = create(api.VkSubmitInfo, (
        :waitSemaphoreCount, 0,
        :pWaitDstStageMask, 0,
        :commandBufferCount, 1,
        :pCommandBuffers, buffer_ref,
        :signalSemaphoreCount, 0
    ))

    err = api.vkQueueSubmit(queue, 1, submitInfo, api.VK_NULL_HANDLE)
    check(err)
    err = api.vkQueueWaitIdle(queue)
    check(err)

    api.vkFreeCommandBuffers(device, command_pool, 1, buffer_ref)
    nothing
end


"""Create synchronzation semaphores"""
function prepareSemaphore(device)
    # This semaphore ensures that the image is complete
    # before starting to submit again
    presentComplete = CreateSemaphore(device, C_NULL, ())
    renderComplete = CreateSemaphore(device, C_NULL, ())

    # This semaphore ensures that all commands submitted
    # have been finished before submitting the image to the queue
    Semaphore(presentComplete, renderComplete)
end
