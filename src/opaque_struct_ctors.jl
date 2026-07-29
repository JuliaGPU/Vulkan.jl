# Permissive constructors for VulkanCore's *opaque* structs.
#
# Clang.jl emits a struct one of two ways. Most become field-wise:
#
#     struct VkImageViewCreateInfo
#         sType::VkStructureType
#         image::VkImage
#         ...
#     end
#
# and Julia converts each argument at construction, so the generated wrapper can
# hand them a high-level `Image` / `ImageLayout` and the `convert` methods this
# package defines do the rest.
#
# A struct containing a union (here `VkClearValue`) instead becomes an opaque
# blob with pointer accessors and one explicitly typed constructor:
#
#     struct VkRenderingAttachmentInfo
#         data::NTuple{72, UInt8}
#     end
#     function VkRenderingAttachmentInfo(sType::VkStructureType, ...,
#                                        imageView::VkImageView, ...)
#
# Julia does not convert arguments to make a method match, so passing the
# high-level types is a hard MethodError even though every conversion exists —
# `Vulkan.ImageLayout` is not `VkImageLayout`, it just converts to one. The
# generated `_RenderingAttachmentInfo` passes them straight through, so every
# dynamic-rendering call fails at construction.
#
# The methods below take the arguments untyped and convert explicitly, then
# delegate to the strict constructor. They are additive: when the arguments are
# already raw, the strict method is the better match and is chosen directly.
#
# The general fix belongs in the wrapper generator — emitting
# `convert(<field type>, arg)` around every field would be correct for opaque and
# a no-op for field-wise structs — but that needs per-field raw types threaded
# through `wrap/structs.jl`. Until then this covers the structs that are actually
# constructed; a MethodError naming a `Vk*` constructor with high-level argument
# types is another one, and belongs here.

const VkRenderingAttachmentInfo = VulkanCore.LibVulkan.VkRenderingAttachmentInfo

function VulkanCore.LibVulkan.VkRenderingAttachmentInfo(
        sType, pNext, imageView, imageLayout, resolveMode,
        resolveImageView, resolveImageLayout, loadOp, storeOp, clearValue)
    VulkanCore.LibVulkan.VkRenderingAttachmentInfo(
        convert(VulkanCore.LibVulkan.VkStructureType, sType),
        convert(Ptr{Cvoid}, pNext),
        convert(VulkanCore.LibVulkan.VkImageView, imageView),
        convert(VulkanCore.LibVulkan.VkImageLayout, imageLayout),
        convert(VulkanCore.LibVulkan.VkResolveModeFlagBits, resolveMode),
        convert(VulkanCore.LibVulkan.VkImageView, resolveImageView),
        convert(VulkanCore.LibVulkan.VkImageLayout, resolveImageLayout),
        convert(VulkanCore.LibVulkan.VkAttachmentLoadOp, loadOp),
        convert(VulkanCore.LibVulkan.VkAttachmentStoreOp, storeOp),
        convert(VulkanCore.LibVulkan.VkClearValue, clearValue),
    )
end
