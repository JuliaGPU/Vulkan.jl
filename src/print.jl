indent = 4

property(x) = "    ↪ " * x
join_args(x) = join(x, ", ")
extension_property(x) = property(isempty(x) ? "no extensions" : "extensions: $(join_args(x))")
layer_property(x) = property(isempty(x) ? "no layers" : "layers: $(join_args(x))")

function Base.show(io::IO, inst::Instance)
    println(io, "Instance at $(inst.handle)")
end

function Base.show(io::IO, inst_info::InstanceCreateInfo)
    println(io, layer_property(inst_info.bag.enabled_layer_names))
    print(io, extension_property(inst_info.bag.enabled_extension_names))
end

function Base.show(io::IO, pdp::PhysicalDeviceProperties)
    print(io, pdp.device_name, " - ", pdp.device_type, " (driver: ", pdp.driver_version, ", supported Vulkan API: ", pdp.api_version, ")")
end

function Base.show(io::IO, dev::Device)
    println(io, "Device at ", dev.handle)
end

function Base.show(io::IO, dev_info::DeviceCreateInfo)
    ext = isempty(dev_info.enabled_extension_names) ? "no extensions" : "extensions: " * join(dev_info.enabled_extension_names, ", ")
    queues = isnothing(dev_info.queue_create_infos) ? property("no queues") : join("queue " .* string.(1:length(dev_info.queue_create_infos)) .* " ⟶ " .* string.(dev_info.queue_create_infos), property(""))
    println(io, extension_property(dev_info.enabled_extension_names))
    print(io, property(queues))
end

Base.string(dqci::DeviceQueueCreateInfo) = "family index: $(dqci.queue_family_index), priorities: $(dqci.queue_priorities)"

Base.show(io::IO, x::VkMemoryType) = print(io, "VkMemoryType(heap_index=$(x.heapIndex), flags=$(x.propertyFlags))")
Base.show(io::IO, x::VkMemoryHeap) = print(io, "VkMemoryHeap(size=$(x.size) bytes, flags=$(x.flags))")
Base.show(io::IO, x::PhysicalDeviceMemoryProperties) = print(io, "PhysicalDeviceMemoryProperties($(x.memory_types[1:x.memory_type_count]), $(x.memory_heaps[1:x.memory_heap_count]))")
