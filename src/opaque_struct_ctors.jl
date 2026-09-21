# What VulkanCore's *opaque* structs need from this side.
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
# A struct containing a union or a bitfield instead becomes an opaque blob with
# pointer accessors and one explicitly typed constructor:
#
#     struct VkRenderingAttachmentInfo
#         data::NTuple{72, UInt8}
#     end
#     function VkRenderingAttachmentInfo(sType::VkStructureType, ...,
#                                        imageView::VkImageView, ...)
#
# Julia does not convert arguments to make a method match, so passing the
# high-level types is a hard MethodError even though every conversion exists —
# `Vulkan.ImageLayout` is not `VkImageLayout`, it just converts to one.
#
# CONSTRUCTING one is handled in the generator, which converts each member to its
# raw type at the construction site (`vk_ctor_call` in
# `generator/src/wrap/structs.jl`). What is left here is the same shape failing
# on the way OUT, which the generator cannot reach.

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
