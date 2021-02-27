const severity_hierarchy = ["debug", "info", "warn", "error"]

const message_severities = [
    DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT,
]

const message_types = Dict(
    "general" => DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT,
    "validation" => DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
    "performance" => DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT,
)

const message_types_r = reverse_dict(message_types)

function vk_log(message_severity, str)
    log = @match message_severity begin
        &DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT => "\e[34;1;1m[ Debug"
        &DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT => "\e[36;1;1m[ Info"
        &DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT => "\e[33;1;1m[ Warning"
        &DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT => "\e[31;1;1m[ Error"
        _ => error("Unknown message severity $message_severity")
    end
    ccall(:jl_safe_printf, Cvoid, (Cstring,), string(log, ": \e[m", str, '\n'))
end

function default_debug_callback(message_severity, message_type, callback_data_ptr, user_data_ptr)
    callback_data_ptr == C_NULL && return UInt32(0)
    callback_data = unsafe_load(callback_data_ptr)
    message = unsafe_string(callback_data.pMessage)
    message_severity = DebugUtilsMessageSeverityFlagEXT(UInt32(message_severity))
    message_type = DebugUtilsMessageTypeFlagEXT(UInt32(message_type))
    if !startswith(message, "Device Extension: VK")
        id_name = unsafe_string(callback_data.pMessageIdName)
        vk_log(message_severity, "$(uppercase(message_types_r[message_type])) ($id_name): $message")
    end
    UInt32(0)
end

"""
Register a user callback and return the corresponding messenger.

A default named `default_debug_callback` can be converted to a function pointer to use as a callback.

!!! warning
    `callback` must be a function pointer of type `Ptr{Nothing}` obtained from a `callback_f` function as follows:  
    `callback = @cfunction(callback_f, UInt32, (VkDebugUtilsMessageSeverityFlagBitsEXT, VkDebugUtilsMessageTypeFlagBitsEXT, Ptr{vk.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))`  
    with `callback_f` a Julia function with a signature matching the `@cfunction` call.
"""
function DebugUtilsMessengerEXT(instance::Instance, callback::Ptr{Nothing}; severity = "info", types = ["general", "validation", "performance"])
    index = findfirst(severity_hierarchy .== severity)
    severity_bits = message_severities[index:end]
    type_bits = [message_types[key] for key in types]
    DebugUtilsMessengerEXT(instance, |(severity_bits...), |(type_bits...), callback, function_pointer(instance, "vkCreateDebugUtilsMessengerEXT"), function_pointer(instance, "vkDestroyDebugUtilsMessengerEXT"))
end
