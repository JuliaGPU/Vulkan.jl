"""
Return a `PhysicalDeviceFeatures` object with the fields present in `features` set to true.

```jldoctest
julia> PhysicalDeviceFeatures([])
PhysicalDeviceFeatures()

julia> PhysicalDeviceFeatures([:wideLines, :sparseBinding])
PhysicalDeviceFeatures(wideLines, sparseBinding)
```
"""
function PhysicalDeviceFeatures(features::AbstractArray)
    names = fieldnames(VkPhysicalDeviceFeatures)
    diff = setdiff(collect(features), names)
    if length(diff) > 0
        error("Invalid physical device features: $(join(diff, ", "))")
    end
    args = map(in(features), names)
    PhysicalDeviceFeatures(args...)
end

PhysicalDeviceFeatures(features::Symbol...) = PhysicalDeviceFeatures(collect(features))

"""
Find a queue index (starting at 0) from `physical_device` which matches the provided `queue_capabilities`.

```jldoctest
julia> find_queue_index(physical_device, QUEUE_COMPUTE_BIT & QUEUE_GRAPHICS_BIT)
0
```
"""
function find_queue_index(physical_device::PhysicalDevice, queue_capabilities::QueueFlag)
    queue_family_properties = get_physical_device_queue_family_properties(physical_device)
    index = findfirst(x -> includes_bits(x.queue_flags, queue_capabilities), queue_family_properties)
    if isnothing(index)
        error("No queue with the desired capabilities could be found.")
    end
    index - 1
end
