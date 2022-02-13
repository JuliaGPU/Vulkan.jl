# # Debugging

using SwiftShader_jll # hide
using Vulkan
@set_driver :SwiftShader # hide

const debug_callback_c = @cfunction(default_debug_callback, UInt32, (DebugUtilsMessageSeverityFlagEXT, DebugUtilsMessageTypeFlagEXT, Ptr{VkCore.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))

create_info = DebugUtilsMessengerCreateInfoEXT(
    |(Vulkan.message_severities...),
    |(
        DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT,
        DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
        DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT
    ),
    debug_callback_c,
)

#=

If you have the `VK_EXT_debug_utils` enabled, you can then create an instance and a debug messenger with

```julia

instance = Instance(["VK_LAYER_KHRONOS_validation"], ["VK_EXT_debug_utils"]; next=create_info)

messenger = unwrap(create_debug_utils_messenger_ext(instance, create_info))

```

=#
