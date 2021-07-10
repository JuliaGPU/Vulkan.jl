```@setup tutorial
using SwiftShader_jll
using Vulkan
@set_driver :SwiftShader
```

# In-deoth tutorial

This objective of this in-depth tutorial is to introduce the reader to the functionality of this library and reach a level of familiarity sufficient for building more complex applications.

This tutorial is *not* intended as a replacement for a Vulkan tutorial. In particular, it is assumed that the reader has a basic understanding of Vulkan. If you are new to Vulkan, feel free to follow the [official Vulkan tutorial](https://vulkan-tutorial.com/) along with this one. The Vulkan tutorial will teach you the concepts behind Vulkan, and this tutorial how to use the API it *from Julia*.
A lot of resources are available online for learning about Vulkan, such as the [Vulkan Guide](https://github.com/KhronosGroup/Vulkan-Guide) by the Khronos Group. You can find a more detailed list [here](https://www.vulkan.org/learn).

## Initialization

The entry point of any Vulkan application is an `Instance`, so we will create one. You could create one directly with

```@example main
using Vulkan

instance = Instance(
    [], # no layers
    [], # no extensions
)
```

This simple call does a few things under the hood:
- it creates an `InstanceCreateInfo` with the provided arguments
- it calls `create_instance` with the create info, which in turn:
  - calls the API constructor `vkCreateInstance`
  - checks if an error occured; if so, return a `ResultTypes.Result` type wrapping an error
  - registers a finalizer to a newly created `Instance` that will call `destroy_instance` (forwarding to `vkDestroyInstance`) when the instance is garbage-collected
- unwraps the result of `create_instance`, which is assumed to be a success code (otherwise an exception is thrown).

Note that this little abstraction does not induce any loss of functionality. Indeed, the `Instance` constructor has a few keyword arguments not mentioned above, which provides default values.

We will use validation layers and the extension `VK_EXT_debug_utils` that will allow logging from Vulkan. We will also provide an `ApplicationInfo` parameter:

```julia
instance = Instance(
    ["VK_LAYER_KHRONOS_validation"],
    ["VK_EXT_debug_utils"];
    application_info = ApplicationInfo(
        v"0.0.1", # application version
        v"0.0.1", # engine version
        v"1.2"; # requested API version
        application_name="Demo",
        engine_name="DemoEngine",
    ),
)
```

```@setup tutorial
const instance = Instance([], ["VK_EXT_debug_utils"]; application_info=ApplicationInfo(v"0.0.1", v"0.0.1", v"1.2"))
```

The application and engine versions don't matter here, but must be provided regardless. We request the version 1.2 of the Vulkan API (ensure you have a driver compatible with the 1.2 version first), which is the latest minor version. Application and engine names won't matter either, but we provide them for demonstration purposes.

Note that we pass in arrays, version numbers and strings; but the C API does not know anything about Julia types. Fortunately, these conversions are taken care of by the wrapper, so that we don't need to provide pointers for arrays and strings nor integers that act as version numbers.

We now setup a debug messenger that we'll use for logging. Its function is to process messages sent by the Vulkan API. We could use the default debug callback provided by Vulkan.jl, namely [`default_debug_callback`](@ref); but instead we will implement our own callback for educational purposes. We'll just define a function that prints whatever message is received from Vulkan.

We won't just `println`, because it does context-switching which is not allowed in finalizers (and the callback may be called in a finalizer, notably when `vkDestroy...` is called). We can use `jl_safe_printf` which does not go through the Julia task system to safely print messages. The data that will arrive from Vulkan will be a `Ptr{core.VkDebugUtilsMessengerCallbackDataEXT}`

```@example tutorial
function debug_callback(severity, type, p_data, p_user_data)
    p_data ≠ C_NULL || return UInt32(0) # don't print if there's no message
    data = unsafe_load(p_data)
    msg = unsafe_string(data.pMessage)
    ccall(:jl_safe_printf, Cstring, (Cstring,), string(msg, '\n'))
    return UInt32(0)
end
```

Because we are passing a callback to Vulkan as a function pointer, we need to convert it to a function pointer using `@cfunction`:

```@example tutorial
const debug_callback_c = @cfunction(
    default_debug_callback,
    UInt32,
    (
        DebugUtilsMessageSeverityFlagEXT,
        DebugUtilsMessageTypeFlagEXT,
        Ptr{core.VkDebugUtilsMessengerCallbackDataEXT},
        Ptr{Cvoid},
    )
)
```

!!! warning
    If you intend to do this inside a module that will be precompiled, you must create the function pointer in the `__init__()` stage:
    ```julia
    const debug_callback_c = Ref{Ptr{Cvoid}}()
    function __init__()
        debug_callback_c[] = @cfunction(...) # the expression above
    end
    ```
    This is because function pointers are only valid in a given runtime environment, so you need to get it at runtime (and *not* compile time).

Note that the signature uses pointers and structures from VulkanCore.jl (accessible through the exported `core` alias). This is because we currently don't generate wrappers for defining function pointers. The flag types are still wrapper types, because the wrapped versions share the same binary representation as the core types. To create the debug messenger for all message types and severities, we can do

```@example tutorial
debug_messenger = DebugUtilsMessengerEXT(
    instance,
    DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT, # minimum severity level
    |(
        DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT,
        DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
        DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT,
    ),
    debug_callback_c,
)
```

!!! note
    `DebugUtilsMessengerEXT` is an extension-defined handle. Any extension function such as `vkCreateDebugUtilsMessengerEXT` and `vkDestroyDebugUtilsMessengerEXT` (called in the constructor and finalizer respectively) must be called using a function pointer. This detail is abstracted away with the wrapper, as function pointers for functions are automatically retrieved as needed and stored in a thread-safe global dispatch table. See more in the [Dispatch](@ref) section.

We can now enumerate and pick a physical device that we will use for this tutorial.
