# Troubleshooting

Here we list common errors that can be encountered, with common solutions.

##### ERROR\_LAYER\_NOT\_PRESENT

Most layers are not bundled with the default Vulkan driver. For example, the validation layer `VK_LAYER_KHRONOS_validation` should be installed from [their Github Page](https://github.com/KhronosGroup/Vulkan-ValidationLayers). This specific layer should hopefully be integrated in the artifact system in the future, but other layers may be vendor-dependent, and therefore it is the responsibility of the user to install them before hand.

##### ['GLIBCXX\_X.X.XX' not found](@id libstdc)

The interfaced C++ code may require a `libstdc++` more recent than the one found on some Julia binaries. A workaround is to build Julia from source, with an up to date `libstdc++` on the system, as indicated in [this issue on Discourse](https://discourse.julialang.org/t/glibcxx-3-4-26-not-found-in-rcall/29113/10).

Notably, the loader, drivers and validation layers might all have different C++ version requirements. The more recent any of these components are, the more likely they are to require a recent `libstdc++` version.

##### Internal API errors

If you encounter the error `INITIALIZATION_FAILED` or similar errors with Julia, which you do not encounter with other languages (e.g. C/C++) or with your system Vulkan utilities, then it may be due to `libstdc++` version requirements (see [this tip](@ref libstdc)).

If the bug is encountered in a function from the loader (e.g. via a function that operates on an `Instance`, and not a `Device`), and you use the official [Vulkan-Loader](https://github.com/KhronosGroup/Vulkan-Loader) you can turn on logging via setting the environment variable `VK_LOADER_DEBUG=all`. This should help you understand the cause (see [Debug environment variables](https://github.com/KhronosGroup/Vulkan-Loader/blob/master/docs/LoaderInterfaceArchitecture.md#table-of-debug-environment-variables=) for more options).

##### 0-based vs 1-based indexing

Vulkan uses a 0-based indexing system, so be careful whenever an index is returned from or requested for a Vulkan function.
