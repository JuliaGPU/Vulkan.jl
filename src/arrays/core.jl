
# we allow types as buffers, so eltype is a bit weird
eltype{T}(v::Buffer{T}) = T
eltype{T<:Array}(v::Buffer{T}) = eltype(T)

length{T}(v::Buffer{T}) = div(v.size, sizeof(eltype(v)))
eltype_length(x) = 1
eltype_length{F<:FixedArray}(x::Type{F}) = length(F)
flattened_length{T}(v::Buffer{T}) = length(v) * eltype_length(eltype(v))


function get_descriptor(v::Buffer, offset=0, range=v.size)
    descriptor = create(Vector{api.VkDescriptorBufferInfo}, (
        :buffer, v.buffer,
        :offset, offset,
        :range , range
    ))
end


function map_buffer(device, buffer::Buffer)
    data_ref = Ref{Ptr{Void}}(C_NULL)
    alloc_size = buffer.allocation_info.allocationSize
	err = api.vkMapMemory(device, buffer.mem, 0, alloc_size, 0, data_ref)
    check(err)
    data_ref[]
end

function unmap_buffer(device, buffer::Buffer)
    api.vkUnmapMemory(device, buffer.mem)
end
