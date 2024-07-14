# Utility

Here we describe some tools that can assist the development of Vulkan applications.

Feel free to check out the official [Vulkan website](https://www.vulkan.org/) for a more complete list of resources.

## External tools

### NVIDIA Nsight Systems

[NVIDIA Nsight Systems](https://developer.nvidia.com/nsight-systems) is a tool developed by NVIDIA to profile applications, showing both CPU and GPU usage. It can be very useful for analyzing the balance between CPU and GPU usage, as well as troubleshoot general performance bottlenecks. However, it only outputs high-level information regarding GPU tasks. Therefore, to catch GPU bottlenecks in a fine-grained manner (such as inside shaders) one should instead use a dedicated profiler such as [Nsight Graphics](@ref nsight-graphics).

### [NVIDIA Nsight Graphics](@id nsight-graphics)

[Nsight Graphics](https://developer.nvidia.com/nsight-graphics) dives deeper into the execution details of an application and provides detailed information regarding graphics pipelines, shaders and so on. This is a tool of choice to consider for NVIDIA GPUs once the GPU is identified as a bottleneck with Nsight Systems.

### RenderDoc

[RenderDoc](https://renderdoc.org/) plays a similar role to Nsight Graphics for a wider range of GPUs. It is open-source and community-maintained.

*RenderDoc is not supported with Vulkan.jl; see [this issue](https://github.com/JuliaGPU/Vulkan.jl/issues/53) for more details on the matter.*

### CPU implementation of Vulkan

#### SwiftShader

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

#### Lavapipe

[Lavapipe](https://docs.mesa3d.org/drivers/llvmpipe.html) is another CPU implementation of Vulkan, developed by Mesa as part of its Gallium stack.

This one was deemed to be too much of a hassle to setup with the Artifact system; instead, the [julia-lavapipe](https://github.com/marketplace/actions/julia-lavapipe) action was added for GitHub Actions for use in CI using `apt` to install the driver. At the time of writing, this action only supports Linux runners with the latest Ubuntu version, but contributions are encouraged to provide support for other platforms and setups.

If you want to take on the task of adding Lavapipe to Yggdrasil, that would be greatly appreciated and would result in a more convenient setup than a GitHub Action, but do expect a big rabbit hole.
