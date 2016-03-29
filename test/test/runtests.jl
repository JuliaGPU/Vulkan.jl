using Vulkan
using GeometryTypes, GLAbstraction, FixedSizeArrays
gc_enable(false)
const api = vk.api
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

#ENV["VK_INSTANCE_LAYERS"]="VK_LAYER_LUNARG_device_limits:VK_LAYER_LUNARG_draw_state:VK_LAYER_LUNARG_image:VK_LAYER_LUNARG_mem_tracker:VK_LAYER_LUNARG_object_tracker:VK_LAYER_LUNARG_param_checker:VK_LAYER_LUNARG_swapchain:VK_LAYER_LUNARG_threading:VK_LAYER_GOOGLE_unique_objects"

immutable Vertex{N,T}
	pos::Point{N,T}
	col::Vec{N,T}
end
immutable Semaphore
    presentComplete::api.VkSemaphore
    renderComplete::api.VkSemaphore
end

width, height = 512, 512
# VulkanBase::VulkanBase
screen, connection = create_screen()
instance = create_instance("test")
device, physical_device, queue, devicememory_properties = get_graphic_device(instance, false)
# Triangle::main
window = create_window(b"hallo", width, height, screen, connection)
swapchain = SwapChain(instance, device, physical_device, window)
#VulkanBase::prepare
setupDebugging(instance, UInt32(api.VK_DEBUG_REPORT_ERROR_BIT_EXT) | UInt32(api.VK_DEBUG_REPORT_WARNING_BIT_EXT))
command_pool = createCommandPool(device, swapchain)
setup_command_buffer = createSetupCommandBuffer(device, command_pool)
setupSwapChain(device, setup_command_buffer, width, height, swapchain)
draw_commandbuffers = create_command_buffers(device, swapchain)
depth_stencil = setupDepthStencil(device, setup_command_buffer, swapchain.depth_format, devicememory_properties)
renderpass = setup_renderpass(swapchain)
pipeline_cache = CreatePipelineCache(device, C_NULL;
    sType = api.VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO
)
framebuffers = setup_framebuffer(swapchain, depth_stencil, renderpass, width, height)
flushSetupCommandBuffer(device, setup_command_buffer, command_pool, queue)
setup_command_buffer = createSetupCommandBuffer(device, command_pool)

# Triangle::prepare()
semaphore = prepareSemaphore(device)

# Setup vertices
# vertices = [
# 	Vertex(Point3f0(0.5f0,  0.5f0, 0.0f0), Vec3f0(1.0f0, 0.0f0, 0.0f0)),
# 	Vertex(Point3f0(-0.5f0,  0.5f0, 0.0f0), Vec3f0(0.0f0, 1.0f0, 0.0f0)),
#     Vertex(Point3f0(0.0f0, -0.5f0, 0.0f0), Vec3f0(0.0f0, 0.0f0, 1.0f0)),
# 	Vertex(Point3f0(-0.5f0, -0.5f0, 0.0f0), Vec3f0(0.0f0, 1.0f0, 1.0f0)),
# ]
# # Setup indices
# indexes = UInt32[0, 1, 2, 2,3,1]
mesh = GLPlainMesh(AABB{Float32}(Vec3f0(-0.5), Vec3f0(1f0)))

verts = Vertex{3, Float32}[Vertex(Point3f0(p[1], p[2], 0f0), Vec3f0(1,0,0)) for p in vertices(mesh)]
indexes = UInt32[]

for face in faces(mesh)
    for f in face
        push!(indexes, f)
    end
end
println(indexes)

vertexbuffer = VulkanBuffer(verts, device, devicememory_properties, api.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT)
indexbuffer = VulkanBuffer(indexes, device, devicememory_properties, api.VK_BUFFER_USAGE_INDEX_BUFFER_BIT)
vertices_vi = setup_binding_description()

ubo = prepareUniformBuffers(device, devicememory_properties)

descriptorset_layout, pipeline_layout = setupDescriptorSetLayout(device)
descriptor_pool = setupDescriptorPool(device)
descriptorSet = setupDescriptorSet(device, descriptor_pool, descriptorset_layout, ubo)
pipeline = preparePipelines(device, pipeline_cache, renderpass, pipeline_layout, vertices_vi)

buildCommandBuffers(
	draw_commandbuffers, framebuffers, swapchain,
	renderpass, width, height, pipeline_layout,
	descriptorSet, pipeline, vertexbuffer, indexbuffer
)

function render(device, swapChain, semaphores, queue, commandbuffer)
    api.vkDeviceWaitIdle(device)
    draw(swapChain, semaphores, queue, commandbuffer)
    api.vkDeviceWaitIdle(device)
end

function draw(swapChain, semaphores, queue, commandbuffer)
    current_buffer_ref = Ref{UInt32}()
    err = acquireNextImage(semaphores.presentComplete, current_buffer_ref, swapchain, device)
    check(err)
    current_buffer = current_buffer_ref[]
    # The submit infor strcuture contains a list of
    # command buffers and semaphores to be submitted to a queue
    # If you want to submit multiple command buffers, pass an array
    semaphore_pres_ref = [semaphores.presentComplete]
    semaphore_render_ref = [semaphores.renderComplete]
    pipelinestage_ref = Ref(UInt32(api.VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT))
    command_buff_ref = [commandbuffer.buffers[current_buffer+1]]
    submitInfo = create_ref(api.VkSubmitInfo,
        sType = api.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        pWaitDstStageMask = pipelinestage_ref,
        # The wait semaphore ensures that the image is presented
        # before we start submitting command buffers agein
        waitSemaphoreCount = 1,
        pWaitSemaphores = semaphore_pres_ref,
        # Submit the currently active command buffer
        commandBufferCount = 1,
        pCommandBuffers = command_buff_ref,
        # The signal semaphore is used during queue presentation
        # to ensure that the image is not rendered before all
        # commands have been submitted
        signalSemaphoreCount = 1,
        pSignalSemaphores = semaphore_render_ref
    )



    # Submit to the graphics queue
    err = api.vkQueueSubmit(queue, 1, submitInfo, api.VK_NULL_HANDLE)
    check(err)

    # Present the current buffer to the swap chain
    # We pass the signal semaphore from the submit info
    # to ensure that the image is not rendered until
    # all commands have been submitted
    queuePresent(queue, current_buffer_ref, semaphores.renderComplete, swapChain);
    current_buffer = current_buffer_ref[]
    # Add a post present image memory barrier
    # This will transform the frame buffer color attachment back
    # to it's initial layout after it has been presented to the
    # windowing system
    # See buildCommandBuffers for the pre present barrier that
    # does the opposite transformation
    postPresentBarrier = create_ref(api.VkImageMemoryBarrier,
        sType = api.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER,
        pNext = C_NULL,
        srcAccessMask = 0,
        dstAccessMask = api.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,
        oldLayout = api.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
        newLayout = api.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
        srcQueueFamilyIndex = api.VK_QUEUE_FAMILY_IGNORED,
        dstQueueFamilyIndex = api.VK_QUEUE_FAMILY_IGNORED,
        subresourceRange =  api.VkImageSubresourceRange(api.VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1),
        image = swapChain.buffers[current_buffer+1].image,
    )

    # Use dedicated command buffer from example base class for submitting the post present barrier
    cmdBufInfo = create_ref(api.VkCommandBufferBeginInfo,
        sType = api.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO
    )
    err = api.vkBeginCommandBuffer(commandbuffer.postpresent, cmdBufInfo)
    check(err)
    # Put post present barrier into command buffer
    api.vkCmdPipelineBarrier(
    	commandbuffer.postpresent,
    	api.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
    	api.VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,
    	0, #VK_FLAGS_NONE,
    	0, C_NULL,
    	0, C_NULL,
    	1, postPresentBarrier
    )

    err = api.vkEndCommandBuffer(commandbuffer.postpresent);
    check(err)
    # Submit to the queue
    commandbuf_ref = [commandbuffer.postpresent]
    submitInfo = [create(api.VkSubmitInfo,
        sType = api.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        commandBufferCount = 1,
        pCommandBuffers = commandbuf_ref,
    )]
    err = api.vkQueueSubmit(queue, 1, submitInfo, api.VK_NULL_HANDLE);
    check(err)
    err = api.vkQueueWaitIdle(queue);
    check(err)
end

quit = false
for i=1:2000
    XCB.xcb_flush(window.connection)
    event_ptr = XCB.xcb_poll_for_event(window.connection)
    if event_ptr != C_NULL
        event = unsafe_load(event_ptr)
        if event.response_type & 0x7f == XCB.XCB_DESTROY_NOTIFY
             quit = true
        end
    end
    render(device, swapchain, semaphore, queue, draw_commandbuffers)
    sleep(0.01)
end
