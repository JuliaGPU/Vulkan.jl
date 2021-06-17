using Logging

# from https://discourse.julialang.org/t/task-switch-not-allowed-from-inside-staged-nor-pure-functions/20488/9
# define safe loggers for use in generated functions (where task switches are not allowed)
for level in [:debug, :info, :warn, :error]
    @eval begin
        macro $(Symbol("safe_$level"))(ex...)
            macrocall = :(@placeholder $(ex...))
            # NOTE: `@placeholder` in order to avoid hard-coding @__LINE__ etc
            macrocall.args[1] = Symbol($"@$level")
            quote
                old_logger = global_logger()
                global_logger(Logging.ConsoleLogger(Core.stderr, old_logger.min_level))
                ret = $(esc(macrocall))
                global_logger(old_logger)
                ret
            end
        end
    end
end

const message_severities = [
    DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT,
    DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT,
]

"""
Default callback for debugging with [`DebugUtilsMessengerEXT`](@ref).
"""
function default_debug_callback(message_severity, message_type, callback_data_ptr, user_data_ptr)
    callback_data_ptr == C_NULL && return UInt32(0)
    callback_data = unsafe_load(callback_data_ptr)
    message = unsafe_string(callback_data.pMessage)

    # ignore messages about available device extensions
    if !startswith(message, "Device Extension: VK")
        id_name = unsafe_string(callback_data.pMessageIdName)
        msg_type = @match message_type begin
            &DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT => "General"
            &DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT => "Validation"
            &DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT => "Performance"
            _ => error("Unknown message type $message_type")
        end
        log = string("$msg_type ($id_name): $message")
        @match message_severity begin
            &DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT => @safe_debug log
            &DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT => @safe_info log
            &DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT => @safe_warn log
            &DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT => @safe_error log
            _ => error("Unknown message severity $message_severity")
        end
    end
    UInt32(0)
end

"""
Register a user-defined callback and return the corresponding messenger.
All the levels from `min_severity` will be included. Note that this controls only what messages are sent to the callback. The logging function may use logging macros such as `@info` or `@error` to easily filter logs through the Julia logging system.

A default function [`default_debug_callback`](@ref) can be converted to a function pointer to use as a callback.

!!! warning
    `callback` must be a function pointer of type `Ptr{Nothing}` obtained from a `callback_f` function as follows:  
    `callback = @cfunction(callback_f, UInt32, (DebugUtilsMessageSeverityFlagBitsEXT, DebugUtilsMessageTypeFlagBitsEXT, Ptr{vk.VkDebugUtilsMessengerCallbackDataEXT}, Ptr{Cvoid}))`  
    with `callback_f` a Julia function with a signature matching the `@cfunction` call.
"""
function DebugUtilsMessengerEXT(
    instance::Instance,
    callback::Ptr{Nothing};
    min_severity = DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT,
    types = DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT | DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT | DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT
    )
    index = findfirst(==(min_severity), message_severities)
    severity_bits = message_severities[index:end]
    DebugUtilsMessengerEXT(instance, |(severity_bits...), |(types...), callback, function_pointer(instance, "vkCreateDebugUtilsMessengerEXT"), function_pointer(instance, "vkDestroyDebugUtilsMessengerEXT"))
end
