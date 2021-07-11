```@meta
EditURL = "<unknown>/docs/src/tutorial/dispatch.jl"
```

# Dispatch

Some API functions cannot be called directly from the Vulkan library. In particular, extension functions *must* be called through a pointer obtained via API commands. In addition, most functions can be made faster by calling directly into their function pointer, instead of going through the loader trampoline which resolves the function pointer every time.

To circumvent that, we provide a handy way for retrieving and calling into function pointers, as well as a thread-safe global dispatch table that can automate this work for you.

## Retrieving function pointers

API Function pointers can be obtained with the [`function_pointer`](@ref) function, using the API function name.

````@example dispatch
using SwiftShader_jll # hide
using Vulkan
@set_driver :SwiftShader # hide

const instance = Instance([], [])
const device = Device(
    first(unwrap(enumerate_physical_devices(instance))), [DeviceQueueCreateInfo(0, [1.])],
    [],
    [],
)
````

```@repl dispatch
function_pointer("vkCreateInstance")
function_pointer(instance, "vkDestroyInstance")
function_pointer(device, "vkCreateFence")
```

It is essentially a wrapper around `get_instance_proc_addr` and `get_device_proc_addr`, leveraging multiple dispatch to make it more intuitive to use.

## Providing function pointers

Every wrapper function or handle constructor has a signature which accepts the standard function arguments plus a function pointer to call into. For example, instead of doing

````@example dispatch
foreach(println, unwrap(enumerate_instance_layer_properties()))
````

you can do

````@example dispatch
fptr = function_pointer("vkEnumerateInstanceLayerProperties")
foreach(println, unwrap(enumerate_instance_layer_properties(fptr)))
````

In the case of a handle constructor which calls both a creation and a destruction function, there is an argument for each corresponding function pointer:

````@example dispatch
fptr_create = function_pointer(device, "vkCreateFence")
fptr_destroy = function_pointer(device, "vkDestroyFence")
Fence(device, fptr_create, fptr_destroy)
````

## Automatic dispatch

Querying and retrieving function pointers every time results in a lot of boilerplate code. To remedy this, we provide a thread-safe global dispatch table. Upon every API call, it will call the function pointer directly, and will automatically retrieve it if necessary. It has one dispatch table per device, so that multiple devices can be used at the same time.

This feature can be disabled by setting the [preference](@ref Preferences) `USE_DISPATCH_TABLE` to `"false"`.

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

