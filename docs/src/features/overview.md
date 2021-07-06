```@setup main
using SwiftShader_jll
using Vulkan
@set_driver :SwiftShader
```

# Features

This wrapper exposes several features aimed at simplifying the use of the Vulkan API from Julia. Some features are configurable through the [Preferences.jl](https://github.com/JuliaPackaging/Preferences.jl) package, see [the corresponding section](@ref preferences) for a list of available options.

## [High-level and minimalistic types](@id types)

Vulkan.jl defines high-level structures that are easier to work with, replacing C types by Julian types. The user will almost never need to worry about pointers, and will be able to use types such as Julia arrays, strings and version numbers.

However, these high-level structures incur some overhead. It will not matter in non performance-critical sections, but may be a limitation in tight loops. Therefore, lower-level, minimalistic types are available, which only carry the smallest possible amount of information needed to use the API. The major drawback is a lack of introspection, since these minimalistic structures carry C types; fortunately, you won't need to compute pointers yourself to create them, because constructors are generated that automate this process for you in a safe manner.

There is a final family of Vulkan types that you may encounter. Those are the barebones VulkanCore.jl types, which you won't have to worry about in all cases *except when you need to pass functions to the API*. In this case, inputs will not be automatically converted for you, and you will have to define the appropriate signature before obtaining function pointers with `Base.@cfunction`. You can access these types from the (exported) module `Vulkan.core`.

To summarize:

- High-level structs:
  - should be used most of the time.
  - store values in a way that makes it easy to retrieve them later.
  - incur a small overhead, which may be a concern in some performance-critical sections.

- Low-level structs:
  - offer performance advantages over high-level structs.
  - may be preferred in performance-critical sections.
  - are not meant for introspection capabilities.
  - are not defined for structures not needed by the API.

- VulkanCore structs:
  - should never be used directly, except as argument types for functions intended to be passed to the API.

In general, high-level and low-level structs can be used interchangeably as function arguments to constructors or API functions, at the condition that they are not mixed together.

Using either high-level or low-level structs should be a performance matter, and as such it is encouraged to profile applications before using low-level structs all: they are faster, but can require additional bookkeeping due to a lack of introspection.

Typically, it is easier to use high-level types for create info arguments to handles that are created at a low frequency; this includes `Instance`, `Device` or `SwapchainKHR` handles for example. Their create info structures may contain precious information that needs to be accessed by the application, e.g. to make sure that image formats in a render pass comply with the swapchain image format, or to check instance or device extensions before using extension functionality.

API functions and structures accept either low-level structs or high-level structs. For commands with low-level structs, you currently need to provide typed arrays (i.e. not `[]` which are of type `Vector{Any}`).

In general:
- High-level structs are returned from functions with high-level arguments.
- Low-level structs are returned from functions with low-level arguments.

The only exception currently is for functions that would have the same low-level/high-level argument types, for which only one version is available that returns values in low-level types.
