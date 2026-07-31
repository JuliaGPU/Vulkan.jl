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

# ── setproperties on an opaque struct ────────────────────────────────────────
#
# The same union-blob shape breaks the *other* direction too. `_initialize_core`
# builds an empty struct and patches `sType`/`pNext` into it with
# `ConstructionBase.setproperties`, which refuses outright:
#
#     The `VkPipelineExecutableStatisticKHR` type defines custom properties:
#     it has `propertynames` overloaded.
#
# It is right to refuse — its only field is `data::NTuple{544,UInt8}`, so a
# field-wise rebuild would write the patch into the wrong bytes. But the struct
# does know where its fields live: Clang.jl emits `setproperty!` on a
# `Ptr{T}` with the correct offsets. Writing through a `Ref` uses exactly those.
#
# Without this, every `get_pipeline_executable_statistics_khr` call fails before
# it returns anything — which is how a driver's register and spill counts became
# unreachable, and with them any check on whether a requested workgroup size can
# actually run (see `Lava.checked_workgroup`).
function ConstructionBase.setproperties(
        x::VulkanCore.LibVulkan.VkPipelineExecutableStatisticKHR, patch::NamedTuple)
    ref = Ref(x)
    GC.@preserve ref begin
        ptr = Base.unsafe_convert(Ptr{typeof(x)}, ref)
        for (k, v) in pairs(patch)
            setproperty!(ptr, k, v)
        end
    end
    return ref[]
end
