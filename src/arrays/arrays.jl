
function allocate_memory(device, allocation_info_ref)
    mem_ref = Ref{api.VkDeviceMemory}()
    err = api.vkAllocateMemory(device, allocation_info_ref, C_NULL, mem_ref)
    check(err)
    mem_ref[]
end


function map_buffer(device, buffer::VulkanBuffer)
    data_ref = Ref{Ptr{Void}}(C_NULL)
    alloc_size =  buffer.allocation_info.allocationSize
	err = api.vkMapMemory(device, buffer.mem, 0, alloc_size, 0, data_ref)
    check(err)
    data_ref[]
end
function unmap_buffer(device, buffer::VulkanBuffer)
    api.vkUnmapMemory(device, buffer.mem)
end
function VulkanBuffer{T}(container::T, device, usage)
    println(T)
    !is_referencable(T) && error(
        "A Vulkan buffer needs to be able to get a reference to $T, which it can't.
        Try using an array or a mutable composite Type
    ")
    buffer = CreateBuffer(device, container, usage)

    mem_requirements = get_memory_requirements(device, buffer)
    memtypeindex = get_memory_type(
        device,
        mem_requirements.memoryTypeBits,
        api.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT
    )
    mem_alloc = create(Ref{api.VkMemoryAllocateInfo}, (
        :pNext, C_NULL,
        :memoryTypeIndex, memtypeindex,
        :allocationSize, mem_requirements.size
    ))
    mem = allocate_memory(device, mem_alloc)
    vkbuff = VulkanBuffer{T}(mem, buffer, mem_alloc[], sizeof(container))

    data_ptr = map_buffer(device, vkbuff)
    memcpy(data_ptr, container)
    unmap_buffer(device, vkbuff)

    err = api.vkBindBufferMemory(device, buffer, mem, 0)
    check(err)
    vkbuff
end

"""
Prefix for VkFormat
"""
type2prefix{T<:AbstractFloat}(::Type{T}) = "SFLOAT"
type2prefix{T<:Integer}(::Type{T}) = "SINT"
type2prefix{T<:Unsigned}(::Type{T}) = "UINT"
type2prefix{T<:UFixed}(::Type{T}) = "UNORM"
type2prefix{T<:Fixed}(::Type{T}) = "SNORM"
type2prefix{T<:Union{Colorant, FixedArraytype}}(::Type{T}) = type2prefix(eltype(T))

"""
For VkFormat, we need to specify the size of every component
"""
component_types{T<:FixedArray}(x::Type{T}) = ntuple(i->eltype(T), length(T))
component_types{T}(x::Type{T}) = ntuple(i->fieldtype(T, i), nfields(T))
component_types{T<:Number}(x::Type{T}) = (T,)

"""
VkFormat looks like e.g RxGxBx, with x == size of the element type.
"""
component_string(x) = "RGBA" # RGBA is used for most types, even if they're Vecs or what not
# For color types we know better
function component_string{T<:Colorant}(::Type{T})
    if !(T <: AbstractRGB || (T<:TransparentColor && color_type(T) <: AbstractRGB))
        error("$T not supported. Try any AbstractRGB, or transparent AbstractRGB value")
    end
    string(T.name.name)
end

"""
Takes julia types, mostly immutables, Colorants or FixedSizeArrays and returns
the matching VkFormat symbol, which can be evaled to generate the matchin enum.
"""
function type2vkformatsymbol(T)
    type2vkformatsymbol(component_types(T), component_string(T), type2prefix(T))
end
function type2vkformatsymbol(types::Tuple, component_str, prefix)
    sym = "VK_FORMAT_"
    @assert length(types) <= length(component_str)
    for (c,t) in zip(component_str, types)
        sym *= string(c, sizeof(t)*8)
    end
    sym *= "_"*prefix
    symbol(sym)
end

"""
Takes julia types, mostly immutables, Colorants or FixedSizeArrays and returns
the matching VkFormat enum, needed for buffer/image layout specification.
We use a generated function for this, to avoid eval and inline the correct enum
for every type.
"""
@generated function type2vkformat{T}(x::Type{T})
    sym = type2vkformatsymbol(T)
    :(api.$sym)
end



type VertexArray

end

function setup_binding_description()
    VERTEX_BUFFER_BIND_ID = 0
    bindingDescriptions = create(Vector{api.VkVertexInputBindingDescription}, (
        :binding, VERTEX_BUFFER_BIND_ID,
        :stride, sizeof(Vertex{3, Float32}),
        :inputRate, api.VK_VERTEX_INPUT_RATE_VERTEX
    ))

    # Attribute descriptions
    # Describes memory layout and shader attribute locations
    # Location 0 : Position
    attributeDescriptions = create(Vector{api.VkVertexInputAttributeDescription}, (
            :binding, VERTEX_BUFFER_BIND_ID,
            :location, 0,
            :format, api.VK_FORMAT_R32G32B32_SFLOAT,
            :offset, 0,
        ),(
            :binding, VERTEX_BUFFER_BIND_ID,
            :location, 1,
            :format, api.VK_FORMAT_R32G32B32_SFLOAT,
            :offset, sizeof(Float32) * 3,
        ),(
            :binding, VERTEX_BUFFER_BIND_ID,
            :location, 2,
            :format, api.VK_FORMAT_R32G32B32_SFLOAT,
            :offset, sizeof(Float32) * 6,
        )
    )
    # Location 1 : Color
    # Assign to vertex buffer
    vi = create(Ref{api.VkPipelineVertexInputStateCreateInfo}, (
        :vertexBindingDescriptionCount, length(bindingDescriptions),
        :pVertexBindingDescriptions, bindingDescriptions,
        :vertexAttributeDescriptionCount, length(attributeDescriptions),
        :pVertexAttributeDescriptions, attributeDescriptions,
    ))
end



function Image(device, array::Array{T,N}, usage,
        miplevels=1, arrayLayers=1,
        samples=VK_SAMPLE_COUNT_1_BIT,
        tiling=api.VK_IMAGE_TILING_OPTIMAL
    )
    dims = ntuple(3) do i
        i <= N ? size(array, i) : 1
    end
    image = CreateImage(device, C_NULL, (
        :imageType, VkImageType(N-1),
        :format, type2vkformat(T),
        :extent, api.VkExtent3D(dims...),
        :mipLevels, 1,
        :arrayLayers, 1,
        :samples, samples,
        :tiling, tiling,
        :usage, usage,
        :flags, 0
    ))
    Image{T, N}(ref, size(array))
end
