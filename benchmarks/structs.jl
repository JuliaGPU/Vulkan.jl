using Vulkan
using BenchmarkTools

# Benchmarks:
# - Creation of minimalist create info structs:
#   - directly
#   - from the high-level struct passed as a literal
#   - via a conversion from an existing high-level struct
# - Creation of high-level structs

println("InstanceCreateInfo")
@btime _InstanceCreateInfo([], []; application_info = _ApplicationInfo(v"1.0", v"1.5", v"1.2"; application_name="MyApp", engine_name="MyEngine"))
@btime _InstanceCreateInfo(InstanceCreateInfo([], []; application_info = ApplicationInfo(v"1.0", v"1.5", v"1.2"; application_name="MyApp", engine_name="MyEngine")))
ci = InstanceCreateInfo([], []; application_info = ApplicationInfo(v"1.0", v"1.5", v"1.2"; application_name="MyApp", engine_name="MyEngine"))
@btime _InstanceCreateInfo($ci)
@btime InstanceCreateInfo([], []; application_info = ApplicationInfo(v"1.0", v"1.5", v"1.2"; application_name="MyApp", engine_name="MyEngine"))

println("DescriptorPoolCreateInfo")
@btime _DescriptorPoolCreateInfo(3, _DescriptorPoolSize.([DESCRIPTOR_TYPE_SAMPLER, DESCRIPTOR_TYPE_STORAGE_BUFFER], [4, 6]))
@btime _DescriptorPoolCreateInfo(DescriptorPoolCreateInfo(3, DescriptorPoolSize.([DESCRIPTOR_TYPE_SAMPLER, DESCRIPTOR_TYPE_STORAGE_BUFFER], [4, 6])))
ci = DescriptorPoolCreateInfo(3, DescriptorPoolSize.([DESCRIPTOR_TYPE_SAMPLER, DESCRIPTOR_TYPE_STORAGE_BUFFER], [4, 6]))
@btime _DescriptorPoolCreateInfo($dp)
@btime DescriptorPoolCreateInfo(3, DescriptorPoolSize.([DESCRIPTOR_TYPE_SAMPLER, DESCRIPTOR_TYPE_STORAGE_BUFFER], [4, 6]))

println("DeviceCreateInfo")
@btime _DeviceCreateInfo([_DeviceQueueCreateInfo(find_queue_family(pdevice, QUEUE_GRAPHICS_BIT & QUEUE_COMPUTE_BIT), [1.0])], [], [])
@btime _DeviceCreateInfo(DeviceCreateInfo([DeviceQueueCreateInfo(find_queue_family(pdevice, QUEUE_GRAPHICS_BIT & QUEUE_COMPUTE_BIT), [1.0])], [], []))
ci = DeviceCreateInfo([DeviceQueueCreateInfo(find_queue_family(pdevice, QUEUE_GRAPHICS_BIT & QUEUE_COMPUTE_BIT), [1.0])], [], [])
@btime _DeviceCreateInfo($ci)
@btime DeviceCreateInfo([DeviceQueueCreateInfo(find_queue_family(pdevice, QUEUE_GRAPHICS_BIT & QUEUE_COMPUTE_BIT), [1.0])], [], [])
