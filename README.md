# Vulkan

![tests](https://github.com/serenity4/Vulkan.jl/workflows/Run%20tests/badge.svg) [![](https://img.shields.io/badge/docs-stable-blue.svg)](https://serenity4.github.io/Vulkan.jl/stable) [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://serenity4.github.io/Vulkan.jl/dev)

Higher level interface for [VulkanCore.jl](https://github.com/JuliaGPU/VulkanCore.jl). It uses the [Vulkan XML Specification](https://www.khronos.org/registry/vulkan/) to catch common API uses and expose wrappers around them. It leads to improved stability and ease of use, while introducing a relatively low overhead possible. The library is mostly generated programmatically.

This is a work in progress and the current development takes place on branch [serenity4/vulkangen](https://github.com/JuliaGPU/Vulkan.jl/tree/serenity4/vulkangen). This uses a procedural approach that wraps the Vulkan API, taking advantage of its structure and its rigorous specification. Part of the code was inspired from a previous development on the branch [sd/highlevel](https://github.com/JuliaGPU/Vulkan.jl/tree/sd/highlevel).

## Summary

Vulkan is a low-level API that exhibits many patterns than any C library exposes. For example, some functions return error codes as a result, or mutate pointer memory as a way of returning multiple values (what would correspond to Julia `Array`s). The length of array pointers are requested, while directly available as a Julia object. Pointers are the primary objects of interest, while it is not trivial to keep them valid (i.e. have them point to valid memory) in Julia. Their validity is not guaranteed out of the box, which introduces several pitfalls that ultimately lead to crashes. Notably, the API makes a heavy use of structures with pointer fields and structure pointers, which demands a clear knowledge of variable preservation in Julia.

Usually, the patterns mentioned above are not problematic for small libraries, because structures are relatively simple. They however become visible problems in the case of a large API such as Vulkan.

An abstraction layer around [VulkanCore.jl](https://github.com/JuliaGPU/VulkanCore.jl) is generated using the [Vulkan Specification](https://www.khronos.org/registry/vulkan/). This layer automates patterns commonly found as part of the API usage, which are described below. It also provides structures with constructors that guarantee the validity of pointers fields, by bundling the pointed data.

## Improvements

#### Memory management

Data structures need to have additional fields to preserve variables that are in active use by a pointer. However, changing their layout is not possible as it has to match the API's. Any Vulkan structure that may have to be filled from Julia has now two `vks` and `bag` fields. The `vks` field holds the API structure, and the `bag` field contains the dependencies required for the `vks` field to remain valid. When using an API function, the `vks` field is automatically taken as argument.

Handles, represented as `Ptr{Cvoid}` by Vulkan, are wrapped in a mutable structure that allows the registration of its VkDestroy* finalizer. Therefore, finalizing a handle is as simple as calling `Base.finalize(handle)`. However, the order of finalization is not guaranteed in Julia, while a specific order needs to be maintained (i.e. finalizing device objects before the device itself). Therefore, finalization will have to be triggered manually. All the required arguments to VkDestroy* are passed upon creation of the handle, conforming to valid API usage (creating and destroying an object must be done with the same allocator).

For example, let's say we have a `VkInstance` and a `VkDevice`. The device needs to be finalized prior to the instance, initially with `VkDestroyDevice`, before calling `VkDestroyInstance`. The corresponding `Instance` and `Device` structs make it easier by only having to call `Base.finalize.([device, instance])` (note the order of the arguments; putting the instance first would result in a crash).

#### Minor improvements

Structure field types follow a consistent notation through the library. For example, `Cfloat` and `Cint` are just aliases for `Float32` and `Int32`, and have been replaced accordingly.

## Automated patterns

1. Some functions may ask for a pointer object to be filled in by Vulkan. Others may even need to be called first once for filling the number of elements to return in a `Ptr{UInt32}`, then a second time with an initialized array of the right length to be filled with Vulkan objects. Setting up `Ref` and `Array` objects are no longer the responsibility of the programmer.
2. Array variables are passed in as pointers, with a length argument that tells Vulkan how far to jump in memory to recover its elements. Manually specifying the length are no longer necessary, as the length of the underlying object is provided automatically.
3. Version numbers and `Bool` objects were represented as `UInt32`, and `Strings` as `Ptr{UInt8}` or `NTuple{N, UInt8}`. They are now represented correctly as `VersionNumber`, `Bool` and `String` objects.
4. Error codes are checked for automatically, raising a `VulkanError` which holds the corresponding `returncode` field when the code is an error. A warning is issued if the operation is successful, but different than `VkSuccess`.
5. Vulkan handles were created by a vkCreate* or vkAllocate* function, from Vk\*CreateInfo and Vk\*AllocateInfo structs. Constructors were added to the corresponding Handle structs, which avoids having to manually call these creation functions. vkDestroy* functions are also automatically attached as finalizers, see Memory Management for more details.
