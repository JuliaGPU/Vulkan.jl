for (T, msg) in zip([:PhysicalDeviceFeatures, :PhysicalDeviceVulkan11Features, :PhysicalDeviceVulkan12Features], ["physical device", "physical device Vulkan 1.1", "physical device Vulkan 1.2"])
    VkT = Symbol(:Vk, T)
    hasnext = T ≠ :PhysicalDeviceFeatures
    fdecl = hasnext ? :($T(features::AbstractArray; next=C_NULL)) : :($T(features::AbstractArray))
    call = hasnext ? :($T(args...; next)) : :($T(args...))
    @eval $fdecl = begin
        names = filter(!in((:sType, :pNext)), fieldnames($VkT))
        diff = setdiff(features, names)
        if length(diff) ≠ 0
            error(string("Invalid ", $msg, " features: ", join(diff, ", ")))
        end
        args = map(in(features), names)
        $call
    end
end

"""
Return a `PhysicalDeviceFeatures` object with the provided `features` set to true.

```jldoctest
julia> PhysicalDeviceFeatures()
PhysicalDeviceFeatures()

julia> PhysicalDeviceFeatures(:wideLines, :sparseBinding)
PhysicalDeviceFeatures(wideLines, sparseBinding)
```
"""
PhysicalDeviceFeatures(features::Symbol...) = PhysicalDeviceFeatures(collect(features))

"""
Return a `PhysicalDeviceVulkan11Features` object with the provided `features` set to true.

```jldoctest
julia> PhysicalDeviceVulkan11Features(; next = C_NULL)
PhysicalDeviceVulkan11Features(next=Ptr{Nothing} @0x0000000000000000)

julia> PhysicalDeviceVulkan11Features(:multiview, :variablePointers, next = C_NULL)
PhysicalDeviceVulkan11Features(next=Ptr{Nothing} @0x0000000000000000, multiview, variablePointers)
```
"""
PhysicalDeviceVulkan11Features(features::Symbol...; next = C_NULL) = PhysicalDeviceVulkan11Features(collect(features); next)

"""
Return a `PhysicalDeviceVulkan12Features` object with the provided `features` set to true.

```jldoctest
julia> PhysicalDeviceVulkan12Features(; next = C_NULL)
PhysicalDeviceVulkan12Features(next=Ptr{Nothing} @0x0000000000000000)

julia> PhysicalDeviceVulkan12Features(:drawIndirectCount, :descriptorBindingVariableDescriptorCount)
PhysicalDeviceVulkan12Features(next=Ptr{Nothing} @0x0000000000000000, drawIndirectCount, descriptorBindingVariableDescriptorCount)
```
"""
PhysicalDeviceVulkan12Features(features::Symbol...; next = C_NULL) = PhysicalDeviceVulkan12Features(collect(features); next)

"""
Find a queue index (starting at 0) from `physical_device` which matches the provided `queue_capabilities`.

```jldoctest
julia> find_queue_family(physical_device, QUEUE_COMPUTE_BIT & QUEUE_GRAPHICS_BIT)
0
```
"""
function find_queue_family(physical_device::PhysicalDevice, queue_capabilities::QueueFlag)
    qf_props = get_physical_device_queue_family_properties(physical_device)
    index = findfirst(x -> queue_capabilities in x.queue_flags, qf_props)
    if isnothing(index)
        error("No queue with the desired capabilities could be found.")
    end
    index - 1
end
