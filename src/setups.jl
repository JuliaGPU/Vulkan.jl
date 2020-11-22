"""
High-level abstraction bundling dependent Vulkan components together.

While handles are primordial for executing Vulkan API calls, they usually involve a lot more information that is intrinsically linked with the handle itself. A setup wraps a `Handle` by gathering the information that is required for a given piece of the application to work. For a logical device, that would include the physical device and the device itself (as a `Handle`), as well as its queues, semaphores and fences. A swapchain is also bound to a `Handle`, covers a certain extent of a surface and possesses images. When performing API calls, since a `Setup` object is bound to a handle, there is no need to specify the handle manually. The `Setup` object will automatically be converted to its handle when such call is performed.
"""
abstract type Setup end

# to avoid having to specify the handle every time an API call is made
Base.cconvert(T::Type{<:Ptr}, x::Setup) = x.handle
Base.convert(T::Type{<:Handle}, x::Setup) = x.handle
Base.broadcastable(x::Setup) = Ref(x)

include("setups/instance.jl")
include("setups/devices.jl")
include("setups/surface.jl")
include("setups/swapchain.jl")
include("setups/buffers.jl")
include("setups/pipelines.jl")

function create_render_pass(device, color_attachment)
    color_attachment_ref = AttachmentReference(0, IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL)
    subpass = SubpassDescription(PIPELINE_BIND_POINT_GRAPHICS, [], [color_attachment_ref], [])
    RenderPass(device, RenderPassCreateInfo([color_attachment], [subpass], [SubpassDependency(SUBPASS_EXTERNAL, 0, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT; src_access_mask=0, dst_access_mask=ACCESS_COLOR_ATTACHMENT_WRITE_BIT)]))
end
