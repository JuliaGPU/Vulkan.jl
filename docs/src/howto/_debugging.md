```@meta
EditURL = "<unknown>/docs/src/howto/debugging.jl"
```

# Debugging

````@example debugging
using SwiftShader_jll # hide
using Vulkan
@set_driver :SwiftShader # hide

const debug_callback_c = @cfunction(default_debug_callback, UInt32, (DebugUtilsMessageSeverityFlagEXT, DebugUtilsMessageTypeFlagEXT, Ptr{vk.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))

create_info = DebugUtilsMessengerCreateInfoEXT(
    |(Vulkan.message_severities...),
    |(
        DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT,
        DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
        DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT
    ),
    debug_callback_c,
)

instance = Instance(["VK_LAYER_KHRONOS_validation"], ["VK_EXT_debug_utils"]; next=create_info)

messenger = unwrap(create_debug_utils_messenger_ext(instance, create_info))
````

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

