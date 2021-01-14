function physical_device_features(features::AbstractArray)
    names = fieldnames(VkPhysicalDeviceFeatures)
    diff = setdiff(collect(features), names)
    if length(diff) > 0
        error("Invalid physical device features: $(join(diff, ", "))")
    end
    args = map(in(features), names)
    PhysicalDeviceFeatures(args...)
end

physical_device_features(features...) = physical_device_features(collect(features))

function find_queue_index(physical_device::PhysicalDevice, queue_capabilities)
    queue_family_properties = get_physical_device_queue_family_properties(physical_device)
    index = findfirst(x -> includes_bits(x.queue_flags, queue_capabilities), queue_family_properties)
    if isnothing(index)
        error("No queue with the desired capabilities could be found.")
    end
    index
end

includes_bits(mask, bits) = Bool(mask & bits == bits)
includes_bits(bits) = Base.Fix2(includes_bits, bits)
