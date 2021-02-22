function Base.show(io::IO, pdp::PhysicalDeviceProperties)
    print(io, pdp.device_name, " - ", pdp.device_type, " (driver: ", pdp.driver_version, ", supported Vulkan API: ", pdp.api_version, ")")
end

Base.show(io::IO, x::PhysicalDeviceMemoryProperties) = print(io, "PhysicalDeviceMemoryProperties($(x.memory_types[1:x.memory_type_count]), $(x.memory_heaps[1:x.memory_heap_count]))")

function Base.show(io::IO, features::PhysicalDeviceFeatures)
    fields = fieldnames(typeof(features.vks))
    vals = Bool.(getproperty.(Ref(features.vks), fields))
    print(io, "PhysicalDeviceFeatures(", join(getindex(fields, findall(vals)), ", "), ')')
end

print_info(message, info) = println(join([message, string.(info)...], "\n    "))

function print_app_info()
    print_info("Available instance layers:", enumerate_instance_layer_properties())
    print_info("Available extensions:", enumerate_instance_extension_properties())
end

function print_devices(instance::Instance)
    pdevices = print_available_devices(instance)
    print_device_info.(pdevices)
end

function print_available_devices(instance::Instance)
    pdevices = enumerate_physical_devices(instance)
    print_info("Available devices:", get_physical_device_properties.(pdevices))
    pdevices
end

function print_device_info(physical_device)
    print_info("Available device layers:", enumerate_device_layer_properties(physical_device))
    print_info("Available device extensions:", enumerate_device_extension_properties(physical_device))
end
