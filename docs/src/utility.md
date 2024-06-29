# Utility

Here we describe some tools that can assist the development of Vulkan applications.

Feel free to check out the official [Vulkan website](https://www.vulkan.org/) for a more complete list of resources.

## External tools

### NVIDIA Nsight Systems

[NVIDIA Nsight Systems](https://developer.nvidia.com/nsight-systems) is a tool developed by NVIDIA to profile applications, showing both CPU and GPU usage. It can be very useful for analyzing the balance between CPU and GPU usage, as well as troubleshoot general performance bottlenecks. However, it only outputs high-level information regarding GPU tasks. Therefore, to catch GPU bottlenecks on a low-level (such as inside shaders) one should instead use a dedicated profiler such as [Nsight Graphics](@ref nsight-graphics) or [Renderdoc](@ref renderdoc).

### [NVIDIA Nsight Graphics](@id nsight-graphics)

[Nsight Graphics](https://developer.nvidia.com/nsight-graphics) dives deeper into the execution details of an application and provides detailed information regarding graphics pipelines, shaders and so on. This is a tool of choice to consider for NVIDIA GPUs once the GPU is identified as a bottleneck with Nsight Systems.

### [Renderdoc](@id renderdoc)

[Renderdoc](https://renderdoc.org/) plays a similar role to Nsight Graphics for a wider range of GPUs. It is open-source and community-maintained.

!!! warning
    It is not yet known whether RenderDoc is supported with Vulkan.jl, due to the requirement of [going through the UI](https://github.com/baldurk/renderdoc/issues/3301#issuecomment-2090985133) and providing an executable to enable it. In our case, we have a language runtime executable (`julia`) that loads Vulkan dynamically, and not a compiled executable linked to Vulkan; this difference *might* prevent Vulkan.jl from working with RenderDoc. You are encouraged to follow [this issue](https://github.com/JuliaGPU/Vulkan.jl/issues/53) for more information. Feel free to share your experience there with RenderDoc to help clarify any potential issue.

### CPU implementation of Vulkan

[SwiftShader](https://github.com/google/swiftshader) is a CPU implementation of Vulkan primarily designed to extend the portability of Vulkan applications. It can be used wherever there is a lack of proper driver support, including public continuous integration services. This allows for example to evaluate code when generating a documentation in CI with [Documenter.jl](https://github.com/JuliaDocs/Documenter.jl), like this one.

SwiftShader is available as a JLL package. You can add it with

```julia-repl
julia> ]add SwiftShader_jll
```

A convenience macro is implemented in Vulkan, so you can quickly use SwiftShader with

```@example
using SwiftShader_jll
using Vulkan
set_driver(:SwiftShader)
```

which will tell the Vulkan Loader to use the SwiftShader Installable Client Driver.
