# Vulkan.jl

Vulkan.jl is a lightweight wrapper around the [Vulkan](https://www.vulkan.org) graphics and compute library. It exposes abstractions over the underlying C interface, primarily geared towards developers looking for a more natural way to work with Vulkan with minimal overhead.

It builds upon the core API provided by [VulkanCore.jl](https://github.com/JuliaGPU/VulkanCore.jl/). Because Vulkan is originally a C specification, interfacing with it requires some knowledge before correctly being used from Julia. This package acts as an abstraction layer, so that you don't need to know how to properly call a C library, while still retaining full functionality. The wrapper is generated directly from the [Vulkan Specification](https://www.khronos.org/registry/vulkan/).

The approach is similar to [VulkanHpp](https://github.com/KhronosGroup/Vulkan-Hpp) for C++, except that the target language is Julia.
