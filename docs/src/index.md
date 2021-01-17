# Vulkan.jl

Vulkan.jl is a lightweight wrapper around the [Vulkan](https://www.khronos.org/vulkan/) library. It exposes abstractions over the underlying C interface, primarily geared towards developers looking for a more natural way to work with Vulkan with minimal overhead.

It builds upon the core API provided by [VulkanCore.jl](https://github.com/JuliaGPU/VulkanCore.jl/). Because Vulkan is originally a C specification, interfacing with it requires some knowledge before correctly being used from Julia. This abstraction layer was generated to avoid having to know anything about how to wrap a C library from Julia, while still retaining the full functionality of the original library. The wrapper is generated directly from the [Vulkan Specification](https://www.khronos.org/registry/vulkan/).

This is a very similar approach to that taken by [VulkanHpp](https://github.com/KhronosGroup/Vulkan-Hpp), except that the target language is Julia and not C++.

```@contents
Pages = ["intro.md", "features.md", "api.md", "utility.md", "troubleshooting.md"]
```
