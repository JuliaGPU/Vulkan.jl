"""
there are lots of pointer types to wrap. We introduce an abstract type for this
to share some functionality
"""
abstract VulkanPointerWrapper

Base.cconvert(::Type{Ptr{Void}}, x::VulkanPointerWrapper) = x
function Base.unsafe_convert(::Type{Ptr{Void}}, x::VulkanPointerWrapper)
    if x.ref == C_NULL
        error("$x is NULL")
    end
    x.ref
end

#TODO finalize

type PhysicalDevice <: VulkanPointerWrapper
    ref::api.VkPhysicalDevice
    memory_properties::api.VkPhysicalDeviceMemoryProperties
end

type Device <: VulkanPointerWrapper
    ref::api.VkDevice
    physical_device::PhysicalDevice
end

type Instance <: VulkanPointerWrapper
    ref::api.VkInstance
end


@enum CommandBufferState RECORDING READY_FOR_SUBMIT RESETTED
type CommandBuffer <: VulkanPointerWrapper
    ref::api.VkCommandBuffer
    state::CommandBufferState
    commandpool
end


# Array types

abstract GPUArray{T, N} <: DenseArray{T, N}

abstract VulkanArray{T, N} <: GPUArray{T, N}


"""
Linear data for use on the device.
"""
type VulkanBuffer{T} <: VulkanArray{T, 1}
    ref::::api.VkBuffer
    mem::api.VkDeviceMemory
    allocation_info::api.VkMemoryAllocateInfo
    dimension::Tuple{Int}
end
"""
Texture data (including dimensions & format) for use on the device.
"""
type VulkanImage{T, N} <: VulkanArray{T, N}
    ref::VkImage
    mem::VkDeviceMemory
    dimension::NTuple{N, Int}
end

"""
 A collection of state required for a shader to sample textures (format, filtering etc).
"""
type Sampler
    ref::VkSampler
end

"""
A queue onto which you submit commands that the GPU reads and executes (asynchronously).
"""
type Queue
    ref::VkQueue
end

"""
A GPU-GPU synchronization object.
"""
type Semaphore
    ref::VkSemaphore
end

"""
A GPU-CPU synchronization object.
"""
type Fence
    ref::VkFence
end

"""
A compiled collection of GPU state setting commands, shaders and other such data. (Almost) everything the GPU needs to get ready for rendering/compute work.
"""
type Pipeline
    ref::VkPipeline
end

"""
A cache used by the pipeline compilation process. It is used to avoid unnecessary recompilations and can be saved and restored to and from disk to speed up subsequent compilations (for instance, in subsequent runs of the application).
"""
type PipelineCache
    ref::VkPipelineCache
end

"""
Swapchain : A "ring buffer" of images offered by the platform's presentation engine
(desktop compositors etc) on which the application can render and then submit for presentation.
"""
type SwapChain <: VulkanPointerWrapper
    ref::Ref{api.VkSwapchainKHR}
    surface
    buffers
    images
    color_format
    color_space
    depth_format
    queue_node_index
    function SwapChain()
        new(Ref{api.VkSwapchainKHR}(api.VK_NULL_HANDLE))
    end
    function SwapChain(buffers, images, color_format, color_space, swapchain)
        new(buffers, images, color_format, color_space, swapchain)
    end
end

"""
Pool : A fast memory allocator specifically designed for objects of some specific type (descriptors, command buffers etc).
"""
abstract Pool
