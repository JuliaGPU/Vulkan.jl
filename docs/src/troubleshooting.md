# Troubleshooting

There can be many kinds of errors when developing a Vulkan application, which can sometimes be difficult to troubleshoot.

If you identified an error happening in the Vulkan driver, or in any other C library, you can troubleshoot whether it has anything to do with Julia by doing the following:
- Executing a system utility that uses the library (driver, loader, extension dependency...) in question. If no errors happen, you can try the next step.
- If you have the courage, you can write a MWE in Julia and then translate that to C or any other low-level language.

Here we list common errors and potential solutions. If you encounter a new error, or found a new solution to an error already listed, feel free to submit a pull request to improve this section.

## ERROR\_LAYER\_NOT\_PRESENT

Most layers are not bundled with the default Vulkan driver. For example, the validation layer `VK_LAYER_KHRONOS_validation` should be installed from [their Github Page](https://github.com/KhronosGroup/Vulkan-ValidationLayers) or via your package manager. This specific layer should hopefully be integrated in the artifact system in the future, but other layers may be vendor-dependent, and therefore it is the responsibility of the user to install them before hand.

Note that any layer that fails to load is simply ignored, and may be reported as not present (in particular this can be triggered by ['GLIBCXX\_X.X.XX' not found](@ref libstdc)).

You can troubleshoot this further with instance creation debugging enabled; for this, simply pass in a [`DebugUtilsMessengerCreateInfoEXT`](@ref) as a `next` member of your [`InstanceCreateInfo`](@ref) (make sure to enable all message types and severities for complete information).

## ['GLIBCXX\_X.X.XX' not found](@id libstdc)

The interfaced C++ code may require a `libstdc++` more recent than the one found on some Julia binaries. Notably, the loader, drivers and validation layers might all have different C++ version requirements. The more recent any of these components are, the more likely they are to require a recent `libstdc++` version.

The solution is to make sure Julia uses an up-to-date `libstdc++` library (e.g. the one installed on your system), as indicated in [this issue](https://github.com/JuliaGL/GLFW.jl/issues/198). On Linux, this can be achieved by setting the `LD_PRELOAD` environment variable when launching Julia (make sure to point to your `libstdc++` on your system):

```bash
LD_PRELOAD=/usr/lib/libstdc++.so.6 julia
```

If using VSCode, you can set it for the integrated terminal (e.g. `terminal.integrated.env.linux` on Linux) such that the REPL always starts with this environment variable.

## Internal API errors

If you encounter the error `INITIALIZATION_FAILED` or similar errors with Julia, which you do not encounter with other languages (e.g. C/C++) or with your system Vulkan utilities, then it may be due to `libstdc++` version requirements (see [this tip](@ref libstdc)).

If the bug is encountered in a function from the loader (e.g. via a function that operates on an `Instance`, and not a `Device`), and you use the official [Vulkan-Loader](https://github.com/KhronosGroup/Vulkan-Loader) you can turn on logging via setting the environment variable `VK_LOADER_DEBUG=all`. This should help you understand the cause (see [Debug environment variables](https://github.com/KhronosGroup/Vulkan-Loader/blob/master/docs/LoaderInterfaceArchitecture.md#table-of-debug-environment-variables=) for more options).

## 0-based vs 1-based indexing

Vulkan uses a 0-based indexing system, so be careful whenever an index is returned from or requested for a Vulkan function.

## Crash in extension depending on an external C library

There have been cases where the relevant C libraries must be loaded (`dlopen`ed) before the instance or device with the relevant extension is used. For example, [XCB.jl](https://github.com/JuliaGL/XCB.jl) uses its own `libxcb` via `Xorg_libxcb_jll`, and this library is automatically `dlopen`ed when loading XCB (because in turn it loads `Xorg_libxcb_jll` which does the `dlopen` during `__init__()`). When loading XCB only after an instance with the extension `VK_KHR_xcb_surface` was created, trying to retrieve basic information (e.g. via `get_physical_device_surface_capabilities_khr`) caused a segmentation fault.

If may be expected that this happens with any package that relies on a C library using the [artifact system](https://pkgdocs.julialang.org/v1/artifacts/), and that is required by a Vulkan extension. In this case, always make sure you load the package before setting up your instance(s) and device(s).

In general, make sure you know where any relevant external libraries come from.
