
const severity_hierarchy = ["debug", "info", "warn", "error"]

const message_severities = OrderedDict(
    "debug" => DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT,
    "info" => DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT,
    "warn" => DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT,
    "error" => DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT,
)

const message_types = OrderedDict(
    "general" => DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT,
    "validation" => DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
    "performance" => DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT,
)

reverse_dict(dict) = OrderedDict(v => k for (k, v) ∈ dict)
const message_types_r = reverse_dict(message_types)
const message_severities_r = reverse_dict(message_severities)

"""
    @vk_log VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT str

Converts a Vulkan log to a Julia log
"""
macro vk_log(message_severity, str)
    quote
        if $(esc(message_severity)) == DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT
            @debug($(esc(str)))
        elseif $(esc(message_severity)) == DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT
            @info($(esc(str)))
        elseif $(esc(message_severity)) == DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT
            @warn($(esc(str)))
        elseif $(esc(message_severity)) == DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT
            @error($(esc(str)))
        else
            throw(ArgumentError("Unknown logging type " * $(esc(message_severity))))
        end
    end
end

function default_debug_callback(message_severity, message_type, callback_data_ptr, user_data_ptr)
    callback_data_ptr == C_NULL && return UInt32(0)
    callback_data = unsafe_load(callback_data_ptr)
    message = unsafe_string(callback_data.pMessage)
    id_name = unsafe_string(callback_data.pMessageIdName)
    if !startswith(message, "Device Extension: VK")
        @vk_log message_severity "$(uppercase(message_types_r[message_type])) ($id_name): $message"
    end
    UInt32(0)
end

"""
Register a user callback and return the corresponding messenger.

A default named `default_debug_callback` can be converted to a function pointer to use as a callback.

!!! warning
    `callback` must be a function pointer of type `Ptr{Nothing}` obtained from a `callback_f` function as follows:  
    `callback = @cfunction(callback_f, UInt32, (DebugUtilsMessageSeverityFlagBitsEXT, DebugUtilsMessageTypeFlagBitsEXT, Ptr{VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))`  
    with `callback_f` a Julia function with the signature matching the `@cfunction` call.
"""
function DebugUtilsMessengerEXT(instance::Instance, callback::Ptr{Nothing}; severity = "info", types = ["general", "validation", "performance"])
    index = findfirst(severity_hierarchy .== severity)
    severity_bits = collect(values(message_severities))[index:end]
    type_bits = [message_types[key] for key in types]
    DebugUtilsMessengerEXT(instance, DebugUtilsMessengerCreateInfoEXT(|(severity_bits...), |(type_bits...), callback), function_pointer(instance, "vkCreateDebugUtilsMessengerEXT"), function_pointer(instance, "vkDestroyDebugUtilsMessengerEXT"))
end
