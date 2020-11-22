function find_memory_type(physical_device, type_flag, flagbits)
    mem_props = get_physical_device_memory_properties(physical_device)
    indices = findall(x -> (x.propertyFlags & flagbits) == flagbits, mem_props.memory_types[1:mem_props.memory_type_count]) .- 1
    indices[findfirst(i -> type_flag & 1 << i ≠ 0, indices)]
end

Base.show(io::IO, x::VkMemoryType) = print(io, "VkMemoryType(heap_index=$(x.heapIndex), flags=$(x.propertyFlags))")
Base.show(io::IO, x::VkMemoryHeap) = print(io, "VkMemoryHeap(size=$(x.size) bytes, flags=$(x.flags))")
