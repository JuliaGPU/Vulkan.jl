for (T, msg) in zip([:PhysicalDeviceFeatures, :PhysicalDeviceVulkan11Features, :PhysicalDeviceVulkan12Features, :PhysicalDeviceVulkan13Features], ["", " Vulkan 1.1", " Vulkan 1.2", " Vulkan 1.3"])
    hasnext = T ≠ :PhysicalDeviceFeatures
    fdecl = hasnext ? :($T(features::AbstractArray; next=C_NULL)) : :($T(features::AbstractArray))
    call = hasnext ? :($T(args...; next)) : :($T(args...))
    @eval $fdecl = begin
        names = filter(!in((:s_type, :next)), fieldnames($T))
        diff = setdiff(features, names)
        if length(diff) ≠ 0
            error(string("Invalid physical device", $msg, " features: ", join(diff, ", ")))
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

julia> PhysicalDeviceFeatures(:wide_lines, :sparse_binding)
PhysicalDeviceFeatures(wide_lines, sparse_binding)
```
"""
PhysicalDeviceFeatures(features::Symbol...) = PhysicalDeviceFeatures(collect(features))

"""
Return a `PhysicalDeviceVulkan11Features` object with the provided `features` set to true.

```jldoctest
julia> PhysicalDeviceVulkan11Features(; next = C_NULL)
PhysicalDeviceVulkan11Features(next=Ptr{Nothing}(0x0000000000000000))

julia> PhysicalDeviceVulkan11Features(:multiview, :variable_pointers, next = C_NULL)
PhysicalDeviceVulkan11Features(next=Ptr{Nothing}(0x0000000000000000), multiview, variable_pointers)
```
"""
PhysicalDeviceVulkan11Features(features::Symbol...; next = C_NULL) = PhysicalDeviceVulkan11Features(collect(features); next)

"""
Return a `PhysicalDeviceVulkan12Features` object with the provided `features` set to true.

```jldoctest
julia> PhysicalDeviceVulkan12Features(; next = C_NULL)
PhysicalDeviceVulkan12Features(next=Ptr{Nothing}(0x0000000000000000))

julia> PhysicalDeviceVulkan12Features(:draw_indirect_count, :descriptor_binding_variable_descriptor_count)
PhysicalDeviceVulkan12Features(next=Ptr{Nothing}(0x0000000000000000), draw_indirect_count, descriptor_binding_variable_descriptor_count)
```
"""
PhysicalDeviceVulkan12Features(features::Symbol...; next = C_NULL) = PhysicalDeviceVulkan12Features(collect(features); next)

"""
Return a `PhysicalDeviceVulkan13Features` object with the provided `features` set to true.

```jldoctest
julia> PhysicalDeviceVulkan13Features(; next = C_NULL)
PhysicalDeviceVulkan13Features(next=Ptr{Nothing}(0x0000000000000000))

julia> PhysicalDeviceVulkan13Features(:dynamic_rendering)
PhysicalDeviceVulkan13Features(next=Ptr{Nothing}(0x0000000000000000), dynamic_rendering)
```
"""
PhysicalDeviceVulkan13Features(features::Symbol...; next = C_NULL) = PhysicalDeviceVulkan13Features(collect(features); next)

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

device(device::Device) = device
function device(handle::Handle)
    next = parent(handle)
    isnothing(next) && error("No parent device found")
    device(next)::Device
end
device_or_nothing(device::Device) = device
device_or_nothing(handle::Handle) = device_or_nothing(parent(handle))
device_or_nothing(::Nothing) = nothing
