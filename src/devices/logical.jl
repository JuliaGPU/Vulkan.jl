function Base.show(io::IO, dev::Device)
    println(io, "Device at ", dev.handle)
    ext = isempty(dev.info.enabled_extension_names) ? "no extensions" : "extensions: " * join(dev.info.enabled_extension_names, ", ")
    queues = isnothing(dev.info.queue_create_infos) ? "    ↪ no queues" : join("queue " .* string.(1:length(dev.info.queue_create_infos)) .* " ⟶ " .* string.(dev.info.queue_create_infos), "    ↪ ")
    println(io, "    ↪ ", ext)
    print(io, "    ↪ ", queues)
end

Base.string(dqci::DeviceQueueCreateInfo) = "family index: $(dqci.queue_family_index), priorities: $(dqci.queue_priorities)"