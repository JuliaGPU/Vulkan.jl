# Vulkan.jl

This package wraps the [Vulkan](https://www.khronos.org/vulkan/) library and exposes high-level abstractions. It ranges from convenience abstractions that ease the manipulation of the API to opinionated abstractions with loss of functionality geared towards common uses.

It builds upon the core API provided by the [VulkanCore.jl](https://github.com/JuliaGPU/VulkanCore.jl/) package. Because Vulkan is originally a C library, it requires some knowledge to be correctly used from Julia. An abstraction layer was generated to avoid having to know anything about how C works, while still retaining the full functionality of the original library with minimal overhead. The wrapper generation relies on the [Vulkan Specification](https://www.khronos.org/registry/vulkan/). This layer automates patterns commonly found as part of the API usage.

```@contents
Pages = ["intro.md", "api.md", "utility.md", "troubleshooting.md"]
```
