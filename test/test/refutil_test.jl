using Vulkan
using GeometryTypes, GLAbstraction, FixedSizeArrays, Benchmarks
const api = vk.api
include("refutil.jl")
appname = "test"


function test1()
    create(Ref{api.VkSamplerCreateInfo}, (
        :mipLodBias, 1f0,
        :anisotropyEnable, UInt32(0),
        :maxAnisotropy, 1f0,
        :compareEnable, UInt32(0),
        :compareOp, api.VK_COMPARE_OP_NEVER,
        :minLod, 1f0,
        :maxLod, 1f0,
    ))
end


function test2()
    create(Ref{api.VkSwapchainCreateInfoKHR}, (
        :imageArrayLayers, UInt32(0),
        :queueFamilyIndexCount, UInt32(0),
        :pQueueFamilyIndices, Ptr{UInt32}(C_NULL),
        :clipped, UInt32(0)
    ))
end
print_type(test1())
print_type(test2())
print_type(create(Ref{api.VkApplicationInfo}, ()))

print_type(create(Vector{api.VkSwapchainCreateInfoKHR}, (
        :imageArrayLayers, UInt32(0),
        :queueFamilyIndexCount, UInt32(0),
        :pQueueFamilyIndices, Ptr{UInt32}(C_NULL),
        :clipped, UInt32(0)
    ),(
        :imageArrayLayers, UInt32(0),
        :queueFamilyIndexCount, UInt32(0),
        :pQueueFamilyIndices, Ptr{UInt32}(C_NULL),
        :clipped, UInt32(0)
    )
))
