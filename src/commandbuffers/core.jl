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
