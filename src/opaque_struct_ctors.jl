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


# ── Setting properties on an opaque struct ───────────────────────────────────
#
# The same shape breaks in a second, quieter way. `propertynames` for a blob
# struct lists the LOGICAL fields (`sType`, `pNext`, `name`, `value`, …) while
# `fieldnames` is the single `data`. `ConstructionBase.setproperties` refuses any
# type whose `propertynames` is overloaded — deliberately, since it cannot know
# the mapping — and throws
#
#     The `VkPipelineExecutableStatisticKHR` type defines custom properties …
#     Please define `ConstructionBase.setproperties(…)` to set its properties.
#
# `prewrap/pointers.jl`'s `_initialize_core` sets `sType`/`pNext` through exactly
# that call, so EVERY api returning one of these was unreachable: the wrapper
# threw before it ever reached the driver.
#
# Found through `get_pipeline_executable_statistics_khr`, where it presented as
# "AMD reports no pipeline statistics". RADV in fact returns twenty statistics
# per pipeline — VGPRs, spills, LDS, scratch, subgroups per SIMD — and the
# failure was entirely on this side, on every vendor.
#
# Unlike the constructors above this needs no per-struct knowledge, so it is
# generated for every blob-shaped struct rather than for the ones that happen to
# be used today: a struct that grows a union in a later Vulkan header would
# otherwise reintroduce the same silent unreachability.

"""
    _blob_setproperties(obj, patch) -> obj

`setproperties` for a struct with no Julia fields to set: copy the blob, store
each patched property at the byte offset its generated accessor computes, and
read the value back.
"""
function _blob_setproperties(obj::T, patch::NamedTuple) where {T}
    ref = Ref(obj)
    GC.@preserve ref begin
        p = Base.unsafe_convert(Ptr{T}, ref)
        for (k, v) in pairs(patch)
            fp = getproperty(p, k)
            unsafe_store!(fp, convert(eltype(fp), v))
        end
    end
    return ref[]
end

# Deduplicated by TYPE, not by name: `names(...; all = true)` reaches several of
# these under an alias as well as their own name, and defining the same method
# twice is a hard error during precompilation ("Method overwriting is not
# permitted"), not a warning.
let seen = Set{DataType}()
    for name in names(VulkanCore.LibVulkan; all = true)
        isdefined(VulkanCore.LibVulkan, name) || continue
        T = getfield(VulkanCore.LibVulkan, name)
        T isa DataType && isstructtype(T) || continue
        fieldnames(T) == (:data,) || continue
        fieldtype(T, :data) <: NTuple{N,UInt8} where {N} || continue
        T in seen && continue
        push!(seen, T)
        @eval ConstructionBase.setproperties(obj::$T, patch::NamedTuple) =
            _blob_setproperties(obj, patch)
    end
end
