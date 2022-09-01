# Getting started

## Overview

This library offers [wrapper types](@ref Wrapper-types) and [wrapper functions](@ref Wrapper-functions) that are intended as a replacement for their C-like counterparts. There are two levels of wrapping, but you should focus on high-level wrappers and only drop down to intermediate wrappers if you find it necessary for performance. [Error handling](@ref Error-handling) is exposed through [ResultTypes.jl](https://github.com/iamed2/ResultTypes.jl) to provide a more robust and user-friendly way of managing error return codes.

Finally, functions and structures have docstrings with information extracted from the XML specification, with links to the original Vulkan documentation, information on required extensions, return codes and more. You can access them easily through the built-in help in the REPL: for example, `?InstanceCreateInfo` will print you information regarding the `InstanceCreateInfo` structure. See the full documentation [here](@ref Vulkan.jl-API).

## Installation

This package can be installed through the registry with

```julia-repl
julia> ]add Vulkan
```

Make sure that you have a decently recent Vulkan driver installed.
