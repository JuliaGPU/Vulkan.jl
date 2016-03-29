using Vulkan
using GeometryTypes, GLAbstraction, FixedSizeArrays, GLFW

const api = vk.api
include("types.jl")
include("refutil.jl")
include("helper.jl")
include("windowing.jl")
include("arrays.jl")
include("instance.jl")
include("device.jl")
include("swapchain.jl")

include("pipeline.jl")
include("descriptor.jl")
include("renderpass.jl")
include("commandbuffers.jl")


immutable Vertex{N,T}
    pos::Point{N,T}
    normal::Normal{N,T}
    col::Vec{N,T}
end
type Camera
    projection::Mat4f0
    model::Mat4f0
    normal::Mat4f0
    view::Mat4f0
    ligthtpos::Vec3f0
end
immutable Semaphore
    presentComplete::api.VkSemaphore
    renderComplete::api.VkSemaphore
end

width, height = 512, 512
# VulkanBase::VulkanBase
instance = Instance("test")
device, physical_device, queue, devicememory_properties = get_graphic_device(instance, false)
# Triangle::main
window = create_window("test", width, height)
swapchain = SwapChain(instance, device, physical_device, window)
#VulkanBase::prepare
setupDebugging(instance, UInt32(api.VK_DEBUG_REPORT_ERROR_BIT_EXT) | UInt32(api.VK_DEBUG_REPORT_WARNING_BIT_EXT))
command_pool = createCommandPool(device, swapchain)
setup_command_buffer = createSetupCommandBuffer(device, command_pool)
setupSwapChain(device, setup_command_buffer, width, height, swapchain)
draw_commandbuffers = create_command_buffers(device, swapchain, command_pool)
depth_stencil = setupDepthStencil(device, setup_command_buffer, swapchain.depth_format, devicememory_properties)
renderpass = setup_renderpass(swapchain)
pipeline_cache = CreatePipelineCache(device, C_NULL, ())
framebuffers = setup_framebuffer(swapchain, depth_stencil, renderpass, width, height)
flushSetupCommandBuffer(device, setup_command_buffer, command_pool, queue)
setup_command_buffer = createSetupCommandBuffer(device, command_pool)

# Triangle::prepare()
semaphore = prepareSemaphore(device)

using GLVisualize
mesh = loadasset("cat.obj")

verts = Vertex{3, Float32}[Vertex(p, n, Vec3f0(0.99)) for (p,n) in zip(vertices(mesh), normals(mesh))]
indexes = faces(mesh)

vertexbuffer = VulkanBuffer(verts, device, api.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT)
indexbuffer = VulkanBuffer(indexes, device, api.VK_BUFFER_USAGE_INDEX_BUFFER_BIT)
vertices_vi = setup_binding_description()


# Prepare and initialize uniform buffer containing shader uniforms
# Vertex shader uniform buffer block
view = lookat(Vec3f0(2.5), Vec3f0(0), Vec3f0(0,1,0))
camera = Camera(
    perspectiveprojection(41f0, 1f0, 1f0, 256f0),
    eye(Mat4f0),
    eye(Mat4f0),
    #inv(transpose(view)),
    view,
    Vec3f0(0.0f0, 0.0f0, 2.5f0)
)
# Create a new buffer
ubo = VulkanBuffer(camera, device, api.VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT)

descriptorset_layout, pipeline_layout = setupDescriptorSetLayout(device)
descriptor_pool = setupDescriptorPool(device)
descriptorSet = setupDescriptorSet(device, descriptor_pool, descriptorset_layout, ubo)
pipeline = preparePipelines(device, pipeline_cache, renderpass, pipeline_layout, vertices_vi)

buildCommandBuffers(
	draw_commandbuffers, framebuffers, swapchain,
	renderpass, width, height, pipeline_layout,
	descriptorSet, pipeline, vertexbuffer, indexbuffer
)

function render(device, swapchain, semaphores, queue, commandbuffer)
    api.vkDeviceWaitIdle(device)
    draw(swapchain, semaphores, queue, commandbuffer)
    api.vkDeviceWaitIdle(device)
end
function submitPostPresentBarrier(queue, postPresentCmdBuffer, image)
    cmdBufInfo = create(api.VkCommandBufferBeginInfo, ())

    err = api.vkBeginCommandBuffer(postPresentCmdBuffer, cmdBufInfo)
    check(err)

    postPresentBarrier = create(api.VkImageMemoryBarrier, (
        :srcAccessMask, 0,
        :dstAccessMask, api.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,
        :oldLayout, api.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
        :newLayout, api.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
        :srcQueueFamilyIndex, api.VK_QUEUE_FAMILY_IGNORED,
        :dstQueueFamilyIndex, api.VK_QUEUE_FAMILY_IGNORED,
        :subresourceRange, api.VkImageSubresourceRange(api.VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1),
        :image, image
    ))

    api.vkCmdPipelineBarrier(
        postPresentCmdBuffer,
        api.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
        api.VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,
        0, #api.VK_FLAGS_NONE,
        0, C_NULL, # No memory barriers,
        0, C_NULL, # No buffer barriers,
        1, postPresentBarrier
    )

    err = api.vkEndCommandBuffer(postPresentCmdBuffer)
    check(err)
    cmd_ref = [postPresentCmdBuffer.ref]
    submit_info = create(api.VkSubmitInfo, (
        :commandBufferCount, 1,
        :pCommandBuffers, cmd_ref
    ))
    err = api.vkQueueSubmit(queue, 1, submit_info, api.VK_NULL_HANDLE)
    check(err)
end

function submitPrePresentBarrier(queue, prePresentCmdBuffer, image)
    cmdBufInfo = create(api.VkCommandBufferBeginInfo, ())
    err = api.vkBeginCommandBuffer(prePresentCmdBuffer, cmdBufInfo);
    check(err)

    prePresentBarrier = create(api.VkImageMemoryBarrier, (
        :srcAccessMask, api.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,
        :dstAccessMask, 0,
        :oldLayout, api.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
        :newLayout, api.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
        :srcQueueFamilyIndex, api.VK_QUEUE_FAMILY_IGNORED,
        :dstQueueFamilyIndex, api.VK_QUEUE_FAMILY_IGNORED,
        :subresourceRange, api.VkImageSubresourceRange(api.VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1),
        :image, image
    ))

    api.vkCmdPipelineBarrier(
        prePresentCmdBuffer,
        api.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
        api.VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,
        0, #api.VK_FLAGS_NONE,
        0, C_NULL, # No memory barriers,
        0, C_NULL, # No buffer barriers,
        1, prePresentBarrier
    );

    err = api.vkEndCommandBuffer(prePresentCmdBuffer);
    check(err)
    cmd_arr = [prePresentCmdBuffer.ref]
    submit_info = create(api.VkSubmitInfo, (
        :commandBufferCount, 1,
        :pCommandBuffers, cmd_arr
    ))

    err = api.vkQueueSubmit(queue, 1, submit_info, api.VK_NULL_HANDLE);
    check(err)
end

function draw(swapchain, semaphores, queue, commandbuffer)
    current_buffer_ref = Ref{UInt32}()
    err = acquireNextImage(semaphores.presentComplete, current_buffer_ref, swapchain, device)
    current_buffer = current_buffer_ref[]
    check(err)
    submitPostPresentBarrier(
        queue,
        commandbuffer.postpresent,
        swapchain.buffers[current_buffer+1].image
    )

    cmd_arr = [commandbuffer.buffers[current_buffer+1].ref]
    pc_arr = [semaphores.presentComplete]
    rc_arr = [semaphores.renderComplete]
    pipeline_stages_ref = Ref(UInt32(api.VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT))
    submit_info = create(api.VkSubmitInfo, (
        :pWaitDstStageMask, pipeline_stages_ref,
        :waitSemaphoreCount, 1,
        :pWaitSemaphores, pc_arr,
        :signalSemaphoreCount, 1,
        :pSignalSemaphores, rc_arr,
        :commandBufferCount, 1,
        :pCommandBuffers, cmd_arr
    ))

	err = api.vkQueueSubmit(queue, 1, submit_info, api.VK_NULL_HANDLE)
	check(err)

    submitPrePresentBarrier(
        queue,
        commandbuffer.prepresent,
        swapchain.buffers[current_buffer+1].image
    )

    # Present the current buffer to the swap chain
    # We pass the signal semaphore from the submit info
    # to ensure that the image is not rendered until
    # all commands have been submitted
    present(queue, current_buffer_ref, semaphores.renderComplete, swapchain)
    current_buffer = current_buffer_ref[]

    err = api.vkQueueWaitIdle(queue);
    check(err)
end

function pollevents()
    GLFW.PollEvents()
end
function Base.isopen(window::GLFW.Window)
    !GLFW.WindowShouldClose(window)
end

while isopen(window)
    render(device, swapchain, semaphore, queue, draw_commandbuffers)
    pollevents()
end
