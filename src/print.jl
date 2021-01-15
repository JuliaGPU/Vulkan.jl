function Base.show(io::IO, pdp::PhysicalDeviceProperties)
    print(io, pdp.device_name, " - ", pdp.device_type, " (driver: ", pdp.driver_version, ", supported Vulkan API: ", pdp.api_version, ")")
end

Base.show(io::IO, x::PhysicalDeviceMemoryProperties) = print(io, "PhysicalDeviceMemoryProperties($(x.memory_types[1:x.memory_type_count]), $(x.memory_heaps[1:x.memory_heap_count]))")

function Base.show(io::IO, features::PhysicalDeviceFeatures)
    fields = fieldnames(typeof(features.vks))
    vals = Bool.(getproperty.(Ref(features.vks), fields))
    print(io, "PhysicalDeviceFeatures(", join(getindex(fields, findall(vals)), ", "), ')')
end
