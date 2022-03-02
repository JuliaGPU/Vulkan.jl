
#=

# Debugging applications

## Debug API usage with validation layers

When a Vulkan application crashes, it can be due to a wrong API usage. Validation layers (provided by Khronos) can be enabled which check all API calls to make sure their invocation and execution is in accordance with the Vulkan specification.
The validation layers are typically used with a debug callback, which prints out messages reported by the validation layers.

First, let's create an instance with the validations layers and the `VK_EXT_debug_utils` extension enabled:

```julia
using Vulkan

instance = Instance(["VK_LAYER_KHRONOS_validation"], ["VK_EXT_debug_utils"])
```

Then, we will define a C function to be called when messages are received. We use the [`default_debug_callback`](@ref) provided by the Vulkan.jl:

```julia
const debug_callback_c = @cfunction(default_debug_callback, UInt32, (DebugUtilsMessageSeverityFlagEXT, DebugUtilsMessageTypeFlagEXT, Ptr{VkCore.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))
```

You need then need to define which message types and logging levels you want to include. Note that only setting e.g. `DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT` will not enable you the other levels, you need to set them all explicitly.

```julia
# Include all severity messages. You can usually leave out the verbose and info severities for less noise in the output.
message_severity = |(
    DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT,
)

# Include all message types.
message_type = |(
    DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT,
    DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
    DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT,
)
```

You can now create your debug callback:

```julia
messenger = DebugUtilsMessengerEXT(instance, message_severity, message_type, debug_callback_c)
```

However, make sure that the messenger stays alive as long as it is used. You should typically put it in a config next to the `instance` (for scripts, a global variable works as well).

!!! tip
    To debug the initialization of the instance itself, you can create the DebugUtilsMessengerEXTCreateInfo manually and include it in the `next` parameter of the `Instance`:
    ```julia
    create_info = DebugUtilsMessengerCreateInfoEXT(message_severity, message_type, debug_callback_c)
    instance = Instance(["VK_LAYER_KHRONOS_validation"], ["VK_EXT_debug_utils"]; next = create_info)
    messenger = unwrap(create_debug_utils_messenger_ext(instance, create_info))
    ```

=#
