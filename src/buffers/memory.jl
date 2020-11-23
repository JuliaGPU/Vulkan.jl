function find_memory_type(physical_device, type_flag, properties)
    flagbits = convert(VkMemoryPropertyFlagBits, properties)
    mem_props = get_physical_device_memory_properties(physical_device)
    indices = findall(x -> (x.propertyFlags & flagbits) == flagbits, mem_props.memory_types[1:mem_props.memory_type_count]) .- 1
    indices[findfirst(i -> type_flag & 1 << i ≠ 0, indices)]
end

Base.show(io::IO, x::VkMemoryType) = print(io, "VkMemoryType(heap_index=$(x.heapIndex), flags=$(x.propertyFlags))")
Base.show(io::IO, x::VkMemoryHeap) = print(io, "VkMemoryHeap(size=$(x.size) bytes, flags=$(x.flags))")

abstract type MemoryProperty end

struct DeviceLocal <: MemoryProperty end
struct HostCoherent <: MemoryProperty end
struct HostVisible <: MemoryProperty end
struct HostCached <: MemoryProperty end

Base.convert(::Type{VkMemoryPropertyFlagBits}, ::DeviceLocal) = VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT
Base.convert(::Type{VkMemoryPropertyFlagBits}, ::HostCoherent) = VK_MEMORY_PROPERTY_HOST_COHERENT_BIT
Base.convert(::Type{VkMemoryPropertyFlagBits}, ::HostVisible) = VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT
Base.convert(::Type{VkMemoryPropertyFlagBits}, ::HostCached) = VK_MEMORY_PROPERTY_HOST_CACHED_BIT
Base.convert(T::Type{VkMemoryPropertyFlagBits}, x::AbstractVector{<:MemoryProperty}) = |(0, Base.convert.(T, x)...)
