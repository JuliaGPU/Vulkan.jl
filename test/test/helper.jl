using Vulkan


"""
Convenience constructor function for `VkAndroidSurfaceKHR`.
Instead of passing a reference to `VkAndroidSurfaceKHR`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateAndroidSurfaceKHR`.
"""
function CreateAndroidSurfaceKHR(instance, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkAndroidSurfaceKHR}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkAndroidSurfaceCreateInfoKHR, create_info_args)
    err = api.vkCreateAndroidSurfaceKHR(instance, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkBuffer`.
Instead of passing a reference to `VkBuffer`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateBuffer`.
"""
function CreateBuffer(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkBuffer}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkBufferCreateInfo, create_info_args)
    err = api.vkCreateBuffer(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkBufferView`.
Instead of passing a reference to `VkBufferView`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateBufferView`.
"""
function CreateBufferView(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkBufferView}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkBufferViewCreateInfo, create_info_args)
    err = api.vkCreateBufferView(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkCommandPool`.
Instead of passing a reference to `VkCommandPool`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateCommandPool`.
"""
function CreateCommandPool(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkCommandPool}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkCommandPoolCreateInfo, create_info_args)
    err = api.vkCreateCommandPool(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkComputePipelines`.
Instead of passing a reference to `VkComputePipelines`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateComputePipelines`.
"""
function CreateComputePipelines(device, pipelineCache, createInfoCount, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkComputePipelines}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkComputePipelineCreateInfo, create_info_args)
    err = api.vkCreateComputePipelines(device, pipelineCache, createInfoCount, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkDebugReportCallbackEXT`.
Instead of passing a reference to `VkDebugReportCallbackEXT`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateDebugReportCallbackEXT`.
"""
function CreateDebugReportCallbackEXT(instance, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkDebugReportCallbackEXT}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkDebugReportCallbackCreateInfoEXT, create_info_args)
    err = api.vkCreateDebugReportCallbackEXT(instance, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkDescriptorPool`.
Instead of passing a reference to `VkDescriptorPool`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateDescriptorPool`.
"""
function CreateDescriptorPool(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkDescriptorPool}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkDescriptorPoolCreateInfo, create_info_args)
    err = api.vkCreateDescriptorPool(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkDescriptorSetLayout`.
Instead of passing a reference to `VkDescriptorSetLayout`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateDescriptorSetLayout`.
"""
function CreateDescriptorSetLayout(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkDescriptorSetLayout}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkDescriptorSetLayoutCreateInfo, create_info_args)
    err = api.vkCreateDescriptorSetLayout(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkDevice`.
Instead of passing a reference to `VkDevice`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateDevice`.
"""
function CreateDevice(physicalDevice, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkDevice}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkDeviceCreateInfo, create_info_args)
    err = api.vkCreateDevice(physicalDevice, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkDisplayModeKHR`.
Instead of passing a reference to `VkDisplayModeKHR`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateDisplayModeKHR`.
"""
function CreateDisplayModeKHR(physicalDevice, display, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkDisplayModeKHR}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkDisplayModeCreateInfoKHR, create_info_args)
    err = api.vkCreateDisplayModeKHR(physicalDevice, display, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkEvent`.
Instead of passing a reference to `VkEvent`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateEvent`.
"""
function CreateEvent(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkEvent}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkEventCreateInfo, create_info_args)
    err = api.vkCreateEvent(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkFence`.
Instead of passing a reference to `VkFence`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateFence`.
"""
function CreateFence(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkFence}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkFenceCreateInfo, create_info_args)
    err = api.vkCreateFence(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkFramebuffer`.
Instead of passing a reference to `VkFramebuffer`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateFramebuffer`.
"""
function CreateFramebuffer(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkFramebuffer}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkFramebufferCreateInfo, create_info_args)
    err = api.vkCreateFramebuffer(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkGraphicsPipelines`.
Instead of passing a reference to `VkGraphicsPipelines`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateGraphicsPipelines`.
"""
function CreateGraphicsPipelines(device, pipelineCache, createInfoCount, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkGraphicsPipelines}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkGraphicsPipelineCreateInfo, create_info_args)
    err = api.vkCreateGraphicsPipelines(device, pipelineCache, createInfoCount, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkImage`.
Instead of passing a reference to `VkImage`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateImage`.
"""
function CreateImage(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkImage}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkImageCreateInfo, create_info_args)
    err = api.vkCreateImage(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkImageView`.
Instead of passing a reference to `VkImageView`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateImageView`.
"""
function CreateImageView(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkImageView}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkImageViewCreateInfo, create_info_args)
    err = api.vkCreateImageView(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkInstance`.
Instead of passing a reference to `VkInstance`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateInstance`.
"""
function CreateInstance(pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkInstance}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkInstanceCreateInfo, create_info_args)
    err = api.vkCreateInstance(create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkMirSurfaceKHR`.
Instead of passing a reference to `VkMirSurfaceKHR`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateMirSurfaceKHR`.
"""
function CreateMirSurfaceKHR(instance, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkMirSurfaceKHR}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkMirSurfaceCreateInfoKHR, create_info_args)
    err = api.vkCreateMirSurfaceKHR(instance, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkPipelineCache`.
Instead of passing a reference to `VkPipelineCache`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreatePipelineCache`.
"""
function CreatePipelineCache(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkPipelineCache}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkPipelineCacheCreateInfo, create_info_args)
    err = api.vkCreatePipelineCache(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkPipelineLayout`.
Instead of passing a reference to `VkPipelineLayout`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreatePipelineLayout`.
"""
function CreatePipelineLayout(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkPipelineLayout}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkPipelineLayoutCreateInfo, create_info_args)
    err = api.vkCreatePipelineLayout(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkQueryPool`.
Instead of passing a reference to `VkQueryPool`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateQueryPool`.
"""
function CreateQueryPool(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkQueryPool}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkQueryPoolCreateInfo, create_info_args)
    err = api.vkCreateQueryPool(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkRenderPass`.
Instead of passing a reference to `VkRenderPass`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateRenderPass`.
"""
function CreateRenderPass(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkRenderPass}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkRenderPassCreateInfo, create_info_args)
    err = api.vkCreateRenderPass(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkSampler`.
Instead of passing a reference to `VkSampler`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateSampler`.
"""
function CreateSampler(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkSampler}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkSamplerCreateInfo, create_info_args)
    err = api.vkCreateSampler(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkSemaphore`.
Instead of passing a reference to `VkSemaphore`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateSemaphore`.
"""
function CreateSemaphore(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkSemaphore}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkSemaphoreCreateInfo, create_info_args)
    err = api.vkCreateSemaphore(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkShaderModule`.
Instead of passing a reference to `VkShaderModule`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateShaderModule`.
"""
function CreateShaderModule(device, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkShaderModule}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkShaderModuleCreateInfo, create_info_args)
    err = api.vkCreateShaderModule(device, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkSharedSwapchainsKHR`.
Instead of passing a reference to `VkSharedSwapchainsKHR`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateSharedSwapchainsKHR`.
"""
function CreateSharedSwapchainsKHR(device, swapchainCount, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkSharedSwapchainsKHR}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkSwapchainCreateInfoKHR, create_info_args)
    err = api.vkCreateSharedSwapchainsKHR(device, swapchainCount, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkWaylandSurfaceKHR`.
Instead of passing a reference to `VkWaylandSurfaceKHR`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateWaylandSurfaceKHR`.
"""
function CreateWaylandSurfaceKHR(instance, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkWaylandSurfaceKHR}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkWaylandSurfaceCreateInfoKHR, create_info_args)
    err = api.vkCreateWaylandSurfaceKHR(instance, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkWin32SurfaceKHR`.
Instead of passing a reference to `VkWin32SurfaceKHR`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateWin32SurfaceKHR`.
"""
function CreateWin32SurfaceKHR(instance, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkWin32SurfaceKHR}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkWin32SurfaceCreateInfoKHR, create_info_args)
    err = api.vkCreateWin32SurfaceKHR(instance, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkXcbSurfaceKHR`.
Instead of passing a reference to `VkXcbSurfaceKHR`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateXcbSurfaceKHR`.
"""
function CreateXcbSurfaceKHR(instance, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkXcbSurfaceKHR}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkXcbSurfaceCreateInfoKHR, create_info_args)
    err = api.vkCreateXcbSurfaceKHR(instance, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Convenience constructor function for `VkXlibSurfaceKHR`.
Instead of passing a reference to `VkXlibSurfaceKHR`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `vkCreateXlibSurfaceKHR`.
"""
function CreateXlibSurfaceKHR(instance, pAllocator, create_info_args::Tuple)
    instance_ptr = Ref{api.VkXlibSurfaceKHR}(api.VK_NULL_HANDLE)
    create_info = create(Vulkan.api.VkXlibSurfaceCreateInfoKHR, create_info_args)
    err = api.vkCreateXlibSurfaceKHR(instance, create_info, pAllocator, instance_ptr)
    check(err)
    instance_ptr[]
end

"""
Julian function for `vkCmdBeginQuery`.
For further documentation please refer to the documentation of `vkCmdBeginQuery`.
"""
function begin_query(commandbuffer::CommandBuffer, querypool, query, flags)
    api.vkCmdBeginQuery(commandBuffer, queryPool, query, flags)
end

"""
Julian function for `vkCmdBeginRenderPass`.
For further documentation please refer to the documentation of `vkCmdBeginRenderPass`.
"""
function begin_render_pass(commandbuffer::CommandBuffer, prenderpassbegin, contents)
    api.vkCmdBeginRenderPass(commandBuffer, pRenderPassBegin, contents)
end

"""
Julian function for `vkCmdBindDescriptorSets`.
For further documentation please refer to the documentation of `vkCmdBindDescriptorSets`.
"""
function bind_descriptor_sets(commandbuffer::CommandBuffer, pipelinebindpoint, layout, firstset, descriptorsetcount, pdescriptorsets, dynamicoffsetcount, pdynamicoffsets)
    api.vkCmdBindDescriptorSets(commandBuffer, pipelineBindPoint, layout, firstSet, descriptorSetCount, pDescriptorSets, dynamicOffsetCount, pDynamicOffsets)
end

"""
Julian function for `vkCmdBindIndexBuffer`.
For further documentation please refer to the documentation of `vkCmdBindIndexBuffer`.
"""
function bind_index_buffer(commandbuffer::CommandBuffer, buffer, offset, indextype)
    api.vkCmdBindIndexBuffer(commandBuffer, buffer, offset, indexType)
end

"""
Julian function for `vkCmdBindPipeline`.
For further documentation please refer to the documentation of `vkCmdBindPipeline`.
"""
function bind_pipeline(commandbuffer::CommandBuffer, pipelinebindpoint, pipeline)
    api.vkCmdBindPipeline(commandBuffer, pipelineBindPoint, pipeline)
end

"""
Julian function for `vkCmdBindVertexBuffers`.
For further documentation please refer to the documentation of `vkCmdBindVertexBuffers`.
"""
function bind_vertex_buffers(commandbuffer::CommandBuffer, firstbinding, bindingcount, pbuffers, poffsets)
    api.vkCmdBindVertexBuffers(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets)
end

"""
Julian function for `vkCmdBlitImage`.
For further documentation please refer to the documentation of `vkCmdBlitImage`.
"""
function blit_image(commandbuffer::CommandBuffer, srcimage, srcimagelayout, dstimage, dstimagelayout, regioncount, pregions, filter)
    api.vkCmdBlitImage(commandBuffer, srcImage, srcImageLayout, dstImage, dstImageLayout, regionCount, pRegions, filter)
end

"""
Julian function for `vkCmdClearAttachments`.
For further documentation please refer to the documentation of `vkCmdClearAttachments`.
"""
function clear_attachments(commandbuffer::CommandBuffer, attachmentcount, pattachments, rectcount, prects)
    api.vkCmdClearAttachments(commandBuffer, attachmentCount, pAttachments, rectCount, pRects)
end

"""
Julian function for `vkCmdClearColorImage`.
For further documentation please refer to the documentation of `vkCmdClearColorImage`.
"""
function clear_color_image(commandbuffer::CommandBuffer, image, imagelayout, pcolor, rangecount, pranges)
    api.vkCmdClearColorImage(commandBuffer, image, imageLayout, pColor, rangeCount, pRanges)
end

"""
Julian function for `vkCmdClearDepthStencilImage`.
For further documentation please refer to the documentation of `vkCmdClearDepthStencilImage`.
"""
function clear_depth_stencil_image(commandbuffer::CommandBuffer, image, imagelayout, pdepthstencil, rangecount, pranges)
    api.vkCmdClearDepthStencilImage(commandBuffer, image, imageLayout, pDepthStencil, rangeCount, pRanges)
end

"""
Julian function for `vkCmdCopyBuffer`.
For further documentation please refer to the documentation of `vkCmdCopyBuffer`.
"""
function copy_buffer(commandbuffer::CommandBuffer, srcbuffer, dstbuffer, regioncount, pregions)
    api.vkCmdCopyBuffer(commandBuffer, srcBuffer, dstBuffer, regionCount, pRegions)
end

"""
Julian function for `vkCmdCopyBufferToImage`.
For further documentation please refer to the documentation of `vkCmdCopyBufferToImage`.
"""
function copy_buffer_to_image(commandbuffer::CommandBuffer, srcbuffer, dstimage, dstimagelayout, regioncount, pregions)
    api.vkCmdCopyBufferToImage(commandBuffer, srcBuffer, dstImage, dstImageLayout, regionCount, pRegions)
end

"""
Julian function for `vkCmdCopyImage`.
For further documentation please refer to the documentation of `vkCmdCopyImage`.
"""
function copy_image(commandbuffer::CommandBuffer, srcimage, srcimagelayout, dstimage, dstimagelayout, regioncount, pregions)
    api.vkCmdCopyImage(commandBuffer, srcImage, srcImageLayout, dstImage, dstImageLayout, regionCount, pRegions)
end

"""
Julian function for `vkCmdCopyImageToBuffer`.
For further documentation please refer to the documentation of `vkCmdCopyImageToBuffer`.
"""
function copy_image_to_buffer(commandbuffer::CommandBuffer, srcimage, srcimagelayout, dstbuffer, regioncount, pregions)
    api.vkCmdCopyImageToBuffer(commandBuffer, srcImage, srcImageLayout, dstBuffer, regionCount, pRegions)
end

"""
Julian function for `vkCmdCopyQueryPoolResults`.
For further documentation please refer to the documentation of `vkCmdCopyQueryPoolResults`.
"""
function copy_query_pool_results(commandbuffer::CommandBuffer, querypool, firstquery, querycount, dstbuffer, dstoffset, stride, flags)
    api.vkCmdCopyQueryPoolResults(commandBuffer, queryPool, firstQuery, queryCount, dstBuffer, dstOffset, stride, flags)
end

"""
Julian function for `vkCmdDispatch`.
For further documentation please refer to the documentation of `vkCmdDispatch`.
"""
function dispatch(commandbuffer::CommandBuffer, x, y, z)
    api.vkCmdDispatch(commandBuffer, x, y, z)
end

"""
Julian function for `vkCmdDispatchIndirect`.
For further documentation please refer to the documentation of `vkCmdDispatchIndirect`.
"""
function dispatch_indirect(commandbuffer::CommandBuffer, buffer, offset)
    api.vkCmdDispatchIndirect(commandBuffer, buffer, offset)
end

"""
Julian function for `vkCmdDraw`.
For further documentation please refer to the documentation of `vkCmdDraw`.
"""
function draw(commandbuffer::CommandBuffer, vertexcount, instancecount, firstvertex, firstinstance)
    api.vkCmdDraw(commandBuffer, vertexCount, instanceCount, firstVertex, firstInstance)
end

"""
Julian function for `vkCmdDrawIndexed`.
For further documentation please refer to the documentation of `vkCmdDrawIndexed`.
"""
function draw_indexed(commandbuffer::CommandBuffer, indexcount, instancecount, firstindex, vertexoffset, firstinstance)
    api.vkCmdDrawIndexed(commandBuffer, indexCount, instanceCount, firstIndex, vertexOffset, firstInstance)
end

"""
Julian function for `vkCmdDrawIndexedIndirect`.
For further documentation please refer to the documentation of `vkCmdDrawIndexedIndirect`.
"""
function draw_indexed_indirect(commandbuffer::CommandBuffer, buffer, offset, drawcount, stride)
    api.vkCmdDrawIndexedIndirect(commandBuffer, buffer, offset, drawCount, stride)
end

"""
Julian function for `vkCmdDrawIndirect`.
For further documentation please refer to the documentation of `vkCmdDrawIndirect`.
"""
function draw_indirect(commandbuffer::CommandBuffer, buffer, offset, drawcount, stride)
    api.vkCmdDrawIndirect(commandBuffer, buffer, offset, drawCount, stride)
end

"""
Julian function for `vkCmdEndQuery`.
For further documentation please refer to the documentation of `vkCmdEndQuery`.
"""
function end_query(commandbuffer::CommandBuffer, querypool, query)
    api.vkCmdEndQuery(commandBuffer, queryPool, query)
end

"""
Julian function for `vkCmdEndRenderPass`.
For further documentation please refer to the documentation of `vkCmdEndRenderPass`.
"""
function end_render_pass(commandbuffer::CommandBuffer)
    api.vkCmdEndRenderPass(commandBuffer)
end

"""
Julian function for `vkCmdExecuteCommands`.
For further documentation please refer to the documentation of `vkCmdExecuteCommands`.
"""
function execute_commands(commandbuffer::CommandBuffer, commandbuffercount, pcommandbuffers)
    api.vkCmdExecuteCommands(commandBuffer, commandBufferCount, pCommandBuffers)
end

"""
Julian function for `vkCmdFillBuffer`.
For further documentation please refer to the documentation of `vkCmdFillBuffer`.
"""
function fill_buffer(commandbuffer::CommandBuffer, dstbuffer, dstoffset, size, data)
    api.vkCmdFillBuffer(commandBuffer, dstBuffer, dstOffset, size, data)
end

"""
Julian function for `vkCmdNextSubpass`.
For further documentation please refer to the documentation of `vkCmdNextSubpass`.
"""
function next_subpass(commandbuffer::CommandBuffer, contents)
    api.vkCmdNextSubpass(commandBuffer, contents)
end

"""
Julian function for `vkCmdPipelineBarrier`.
For further documentation please refer to the documentation of `vkCmdPipelineBarrier`.
"""
function pipeline_barrier(commandbuffer::CommandBuffer, srcstagemask, dststagemask, dependencyflags, memorybarriercount, pmemorybarriers, buffermemorybarriercount, pbuffermemorybarriers, imagememorybarriercount, pimagememorybarriers)
    api.vkCmdPipelineBarrier(commandBuffer, srcStageMask, dstStageMask, dependencyFlags, memoryBarrierCount, pMemoryBarriers, bufferMemoryBarrierCount, pBufferMemoryBarriers, imageMemoryBarrierCount, pImageMemoryBarriers)
end

"""
Julian function for `vkCmdPushConstants`.
For further documentation please refer to the documentation of `vkCmdPushConstants`.
"""
function push_constants(commandbuffer::CommandBuffer, layout, stageflags, offset, size, pvalues)
    api.vkCmdPushConstants(commandBuffer, layout, stageFlags, offset, size, pValues)
end

"""
Julian function for `vkCmdResetEvent`.
For further documentation please refer to the documentation of `vkCmdResetEvent`.
"""
function reset_event(commandbuffer::CommandBuffer, event, stagemask)
    api.vkCmdResetEvent(commandBuffer, event, stageMask)
end

"""
Julian function for `vkCmdResetQueryPool`.
For further documentation please refer to the documentation of `vkCmdResetQueryPool`.
"""
function reset_query_pool(commandbuffer::CommandBuffer, querypool, firstquery, querycount)
    api.vkCmdResetQueryPool(commandBuffer, queryPool, firstQuery, queryCount)
end

"""
Julian function for `vkCmdResolveImage`.
For further documentation please refer to the documentation of `vkCmdResolveImage`.
"""
function resolve_image(commandbuffer::CommandBuffer, srcimage, srcimagelayout, dstimage, dstimagelayout, regioncount, pregions)
    api.vkCmdResolveImage(commandBuffer, srcImage, srcImageLayout, dstImage, dstImageLayout, regionCount, pRegions)
end

"""
Julian function for `vkCmdSetBlendConstants`.
For further documentation please refer to the documentation of `vkCmdSetBlendConstants`.
"""
function set_blend_constants(commandbuffer::CommandBuffer, blendconstants)
    api.vkCmdSetBlendConstants(commandBuffer, blendConstants)
end

"""
Julian function for `vkCmdSetDepthBias`.
For further documentation please refer to the documentation of `vkCmdSetDepthBias`.
"""
function set_depth_bias(commandbuffer::CommandBuffer, depthbiasconstantfactor, depthbiasclamp, depthbiasslopefactor)
    api.vkCmdSetDepthBias(commandBuffer, depthBiasConstantFactor, depthBiasClamp, depthBiasSlopeFactor)
end

"""
Julian function for `vkCmdSetDepthBounds`.
For further documentation please refer to the documentation of `vkCmdSetDepthBounds`.
"""
function set_depth_bounds(commandbuffer::CommandBuffer, mindepthbounds, maxdepthbounds)
    api.vkCmdSetDepthBounds(commandBuffer, minDepthBounds, maxDepthBounds)
end

"""
Julian function for `vkCmdSetEvent`.
For further documentation please refer to the documentation of `vkCmdSetEvent`.
"""
function set_event(commandbuffer::CommandBuffer, event, stagemask)
    api.vkCmdSetEvent(commandBuffer, event, stageMask)
end

"""
Julian function for `vkCmdSetLineWidth`.
For further documentation please refer to the documentation of `vkCmdSetLineWidth`.
"""
function set_line_width(commandbuffer::CommandBuffer, linewidth)
    api.vkCmdSetLineWidth(commandBuffer, lineWidth)
end

"""
Julian function for `vkCmdSetScissor`.
For further documentation please refer to the documentation of `vkCmdSetScissor`.
"""
function set_scissor(commandbuffer::CommandBuffer, firstscissor, scissorcount, pscissors)
    api.vkCmdSetScissor(commandBuffer, firstScissor, scissorCount, pScissors)
end

"""
Julian function for `vkCmdSetStencilCompareMask`.
For further documentation please refer to the documentation of `vkCmdSetStencilCompareMask`.
"""
function set_stencil_compare_mask(commandbuffer::CommandBuffer, facemask, comparemask)
    api.vkCmdSetStencilCompareMask(commandBuffer, faceMask, compareMask)
end

"""
Julian function for `vkCmdSetStencilReference`.
For further documentation please refer to the documentation of `vkCmdSetStencilReference`.
"""
function set_stencil_reference(commandbuffer::CommandBuffer, facemask, reference)
    api.vkCmdSetStencilReference(commandBuffer, faceMask, reference)
end

"""
Julian function for `vkCmdSetStencilWriteMask`.
For further documentation please refer to the documentation of `vkCmdSetStencilWriteMask`.
"""
function set_stencil_write_mask(commandbuffer::CommandBuffer, facemask, writemask)
    api.vkCmdSetStencilWriteMask(commandBuffer, faceMask, writeMask)
end

"""
Julian function for `vkCmdSetViewport`.
For further documentation please refer to the documentation of `vkCmdSetViewport`.
"""
function set_viewport(commandbuffer::CommandBuffer, firstviewport, viewportcount, pviewports)
    api.vkCmdSetViewport(commandBuffer, firstViewport, viewportCount, pViewports)
end

"""
Julian function for `vkCmdUpdateBuffer`.
For further documentation please refer to the documentation of `vkCmdUpdateBuffer`.
"""
function update_buffer(commandbuffer::CommandBuffer, dstbuffer, dstoffset, datasize, pdata)
    api.vkCmdUpdateBuffer(commandBuffer, dstBuffer, dstOffset, dataSize, pData)
end

"""
Julian function for `vkCmdWaitEvents`.
For further documentation please refer to the documentation of `vkCmdWaitEvents`.
"""
function wait_events(commandbuffer::CommandBuffer, eventcount, pevents, srcstagemask, dststagemask, memorybarriercount, pmemorybarriers, buffermemorybarriercount, pbuffermemorybarriers, imagememorybarriercount, pimagememorybarriers)
    api.vkCmdWaitEvents(commandBuffer, eventCount, pEvents, srcStageMask, dstStageMask, memoryBarrierCount, pMemoryBarriers, bufferMemoryBarrierCount, pBufferMemoryBarriers, imageMemoryBarrierCount, pImageMemoryBarriers)
end

"""
Julian function for `vkCmdWriteTimestamp`.
For further documentation please refer to the documentation of `vkCmdWriteTimestamp`.
"""
function write_timestamp(commandbuffer::CommandBuffer, pipelinestage, querypool, query)
    api.vkCmdWriteTimestamp(commandBuffer, pipelineStage, queryPool, query)
end

