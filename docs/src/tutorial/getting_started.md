# Getting started

## Overview

Several features are exposed which aim at simplifying the use of the Vulkan API from Julia. Some features are configurable through [Preferences.jl](https://github.com/JuliaPackaging/Preferences.jl); see [the corresponding section](@ref Preferences) for the list of available options.

This library offers [types](@ref Vulkan-types) and [functions](@ref Vulkan-functions) that are intended as a replacement for their C-like counterparts. There are [two levels of wrapping](@ref Structures) for structures, although the minimalistic wrappers should be used only where there is a noticable performance impact. Functions have methods defined for both. [Error handling](@ref error-handling) is exposed through [ResultTypes.jl](https://github.com/iamed2/ResultTypes.jl) to provide a more robust and user-friendly way of managing error return codes.

Finally, functions and structures have docstrings with information extracted from the XML specification, with links to the original Vulkan documentation, information on required extensions, return codes and more. You can access them easily through the built-in help in the REPL: for example, `?InstanceCreateInfo` will print you information regarding the `InstanceCreateInfo` structure. See the full documentation [here](@ref Vulkan.jl-API).

## Installation

This package can be installed through the registry with

```repl
]add Vulkan
```

Make sure that you have a decently recent Vulkan driver installed.

## Preferences

Certain features of this library are configurable via [Preferences.jl](https://github.com/JuliaPackaging/Preferences.jl).

!!! warning
    Preferences require running at least Julia 1.6. For earlier versions, these options are not customizable, and will have their default values.

|    Preference     |              Description              |  Default  |
|:-----------------:|:-------------------------------------:|:---------:|
| `LOG_DESTRUCTION` | Log the destruction of Vulkan handles | `"false"` |
| `USE_DISPATCH_TABLE` | Retrieve and store function pointers in a dispatch table to speed up API calls and facilitate the use of extensions | `"true"` |
