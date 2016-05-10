using Vulkan
using Base.Test

const api = vk.api

toversion(version::Cuint) = VersionNumber(version >> 22,  (version >> 12) & 0x3ff, version & 0xfff)


count = Ref{Cuint}(0)
# Scan layers
err = api.vkEnumerateInstanceLayerProperties(count, C_NULL)
assert(err == api.VK_SUCCESS)
global_layer_properties = Array(api.VkLayerProperties, count[])
err = api.vkEnumerateInstanceLayerProperties(count, global_layer_properties)
assert(err == api.VK_SUCCESS)

function Base.show(io::IO, lp::api.VkLayerProperties)
	println(io, "Layer Properties: ")
	println(io, "    Layer Name: ", bytestring(filter(x->x!=0, UInt8[lp.layerName...])))
	println(io, "    Spec Version: ", toversion(lp.specVersion))
	println(io, "    Implementation Version: ", toversion(lp.implementationVersion))
	println(io, "    description: ", bytestring(filter(x->x!=0, UInt8[lp.description...])))
end
for elem in global_layer_properties
	println(elem)
end

appname = reinterpret(Int8, b"vulkaninfo")
appname_ptr = Base.unsafe_convert(Ptr{Int8}, appname)


apiversion = api.VK_MAKE_VERSION(1, 0, 3)
app_info = Ref(api.VkApplicationInfo(
    api.VK_STRUCTURE_TYPE_APPLICATION_INFO,
    C_NULL,
    appname_ptr,
    1,
    appname_ptr,
    1,
    apiversion,
))

inst_info = Ref(api.VkInstanceCreateInfo(
    api.VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
    C_NULL,
    UInt32(0),
    Base.unsafe_convert(Ptr{api.VkApplicationInfo}, app_info),
    0,
    C_NULL,
    0,
    C_NULL,
))

instance = Ref{api.VkInstance}(C_NULL)

err = api.vkCreateInstance(inst_info, C_NULL, instance)
println(err)
println(instance)

gpu_count = Ref{Cuint}(0)
err = api.vkEnumeratePhysicalDevices(instance[], gpu_count, C_NULL)
println(err)
devices = Array(api.VkPhysicalDevice, gpu_count[])

err = api.vkEnumeratePhysicalDevices(instance[], gpu_count, devices)

println(err)

deviceprops = Ref{api.VkPhysicalDeviceProperties}()
err = api.vkGetPhysicalDeviceProperties(devices[], deviceprops)

println(err)

function Base.show(io::IO, pdsp::api.VkPhysicalDeviceSparseProperties)
	println(io, "Physical device Sparse Properties: ")
	for name in fieldnames(pdsp)
		println(io, "    ", name, " ", pdsp.(name) == 1)
	end
end
function Base.show(io::IO, pdp::api.VkPhysicalDeviceProperties)
	println(io, "Physical Device Properties: ")
	println(io, "    API Version: ", toversion(pdp.apiVersion))
	println(io, "    Driver Version: ", toversion(pdp.driverVersion))

	println(io, "    Vendor ID ", pdp.vendorID)
	println(io, "    Device ID: ", pdp.deviceID)
	println(io, "    Device Type: ", pdp.deviceType)
	println(io, "    Device Name: ", bytestring(filter(x->x!=0, UInt8[pdp.deviceName...])))
	println(io, "    Pipeline Cache UUID: ", pdp.pipelineCacheUUID)
	println(io, "    Limits: ", pdp.limits)
	println(io, "    Sparse Properties: \n    ", pdp.sparseProperties)
end

limitshow(x::Cuint) = Int(x)
limitshow(x::NTuple) = "<"*join(map(limitshow, x), " ")*">"
limitshow(x) = x

function Base.show(io::IO, pdl::api.VkPhysicalDeviceLimits)
	println(io, "Physical Device Limits: ")
	for name in fieldnames(pdl)
		println(io, "    ", name, " ", limitshow(pdl.(name)))
	end
end



println(deviceprops[])
queue_count = Ref{Cuint}(0)

api.vkGetPhysicalDeviceQueueFamilyProperties(devices[], queue_count, C_NULL)
queueprops = Array(api.VkQueueFamilyProperties, queue_count[])
println(queue_count[])
api.vkGetPhysicalDeviceQueueFamilyProperties(devices[], queue_count, queueprops)
println(queueprops)

memprops = Ref{api.VkPhysicalDeviceMemoryProperties}()
api.vkGetPhysicalDeviceMemoryProperties(devices[], memprops)

println(memprops[])
devicefeatures = Ref{api.VkPhysicalDeviceFeatures}()
api.vkGetPhysicalDeviceFeatures(devices[], devicefeatures)

function Base.show(io::IO, df::api.VkPhysicalDeviceFeatures)
	println(io, "Physical device features: ")
	for name in fieldnames(df)
		println(io, "    ", name, ": ", df.(name) != 1 ? "un" : "", "supported")
	end
end
println(devicefeatures[])
