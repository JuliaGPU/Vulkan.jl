
# we allow types as buffers, so eltype is a bit weird
Base.eltype{T}(v::VulkanBuffer{T}) = T
Base.eltype{T<:Array}(v::VulkanBuffer{T}) = eltype(T)

Base.length{T}(v::VulkanBuffer{T}) = div(v.size, sizeof(eltype(v)))
eltype_length(x) = 1
eltype_length{F<:FixedArray}(x::Type{F}) = length(F)
flattened_length{T}(v::VulkanBuffer{T}) = length(v) * eltype_length(eltype(v))


function get_descriptor(v::VulkanBuffer, offset=0, range=v.size)
    descriptor = create(Vector{api.VkDescriptorBufferInfo}, (
        :buffer, v.buffer,
        :offset, offset,
        :range , range
    ))
end
