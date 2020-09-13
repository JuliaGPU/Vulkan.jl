indent = 4

property(x) = "    ↪ " * x
join_args(x) = join(x, ", ")
extension_property(x) = property(isempty(x) ? "no extensions" : "extensions: $(join_args(x))")
layer_property(x) = property(isempty(x) ? "no layers" : "layers: $(join_args(x))")

function Base.show(io::IO, inst::Instance)
    println(io, "Instance at $(inst.handle)")
    println(io, layer_property(inst.info.enabled_layer_names))
    print(io, extension_property(inst.info.enabled_extension_names))
end

function Base.show(io::IO, pdp::PhysicalDeviceProperties)
    print(io, pdp.device_name, " - ", pdp.device_type, " (driver: ", pdp.driver_version, ", supported Vulkan API: ", pdp.api_version, ")")
end

function Base.show(io::IO, dev::Device)
    println(io, "Device at ", dev.handle)
    ext = isempty(dev.info.enabled_extension_names) ? "no extensions" : "extensions: " * join(dev.info.enabled_extension_names, ", ")
    queues = isnothing(dev.info.queue_create_infos) ? property("no queues") : join("queue " .* string.(1:length(dev.info.queue_create_infos)) .* " ⟶ " .* string.(dev.info.queue_create_infos), property(""))
    println(io, extension_property(dev.info.enabled_extension_names))
    print(io, property(queues))
end

Base.string(dqci::DeviceQueueCreateInfo) = "family index: $(dqci.queue_family_index), priorities: $(dqci.queue_priorities)"