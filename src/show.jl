function Base.show(io::IO, pdp::PhysicalDeviceProperties)
    print(io, pdp.device_name, " - ", pdp.device_type, " (driver: ", pdp.driver_version, ", supported Vulkan API: ", pdp.api_version, ")")
end

Base.show(io::IO, x::PhysicalDeviceMemoryProperties) = print(io, "PhysicalDeviceMemoryProperties($(x.memory_types[1:x.memory_type_count]), $(x.memory_heaps[1:x.memory_heap_count]))")

const PhysicalDeviceVulkanFeatures_T = Union{PhysicalDeviceVulkan11Features,PhysicalDeviceVulkan12Features,PhysicalDeviceVulkan13Features}

function Base.show(io::IO, features::T) where {T<:Union{PhysicalDeviceFeatures,PhysicalDeviceVulkanFeatures_T}}
    fnames = fieldnames(typeof(features))
    fields = filter(!in((:s_type, :next)), fnames)
    vals = Bool.(getproperty.(Ref(features), fields))
    print(io, nameof(T), '(')
    idxs = findall(vals)
    if features isa PhysicalDeviceVulkanFeatures_T
        print(io, "next=", features.next)
        !isempty(idxs) && print(io, ", ")
    end
    print(io, join(getindex(fields, idxs), ", "), ')')
end
