using DataStructures

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

default_debug_callback_c = @cfunction(default_debug_callback, UInt32, (DebugUtilsMessageSeverityFlagBitsEXT, DebugUtilsMessageTypeFlagBitsEXT, Ptr{VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))

# @ccall $default_debug_callback_c(DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT::DebugUtilsMessageSeverityFlagBitsEXT, DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT::DebugUtilsMessageTypeFlagBitsEXT, C_NULL::Ptr{DebugUtilsMessengerCallbackDataEXT}, C_NULL::Ptr{Cvoid})::UInt32
# @ccall $default_debug_callback_c(DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT::DebugUtilsMessageSeverityFlagBitsEXT, UInt32(0)::UInt32, C_NULL::Ptr{DebugUtilsMessengerCallbackDataEXT}, C_NULL::Ptr{Cvoid})::UInt32

function Vulkan.DebugUtilsMessengerEXT(instance::Instance; f::Union{Base.CFunction,Ptr{Cvoid}} = default_debug_callback_c, severity = "info", types = ["general", "validation", "performance"])
    index = findfirst(severity_hierarchy .== severity)
    severity_bits = collect(values(message_severities))[index:end]
    type_bits = [message_types[key] for key in types]
    DebugUtilsMessengerEXT(instance, DebugUtilsMessengerCreateInfoEXT(|(severity_bits...), |(type_bits...), f), function_pointer(instance, "vkCreateDebugUtilsMessengerEXT"), function_pointer(instance, "vkDestroyDebugUtilsMessengerEXT"))
end