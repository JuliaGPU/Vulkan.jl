const validation_layer = [
    "VK_LAYER_GOOGLE_threading",

]


function debugg_callback(
        flags::api.VkDebugReportFlagsEXT,
        objType::api.VkDebugReportObjectTypeEXT,
        srcObject::UInt64,
        location::Csize_t,
        msgCode::Int32,
        pLayerPrefix::Ptr{UInt8},
        pMsg::Ptr{UInt8},
        pUserData::Ptr{Void}
    )
    bt = catch_backtrace()
    message = bytestring(pMsg)
    layerprefix = bytestring(pLayerPrefix)
    if (flags & UInt32(api.VK_DEBUG_REPORT_ERROR_BIT_EXT)) != UInt32(false)
        Base.show_backtrace(STDERR, bt)
        error(
            "[", layerprefix, "]
            Code ", msgCode, " : ", message
        )
    else
        if (flags &  UInt32(api.VK_DEBUG_REPORT_WARNING_BIT_EXT)) != UInt32(false)
            Base.show_backtrace(STDOUT, bt)
            warn("[", layerprefix, "] Code ", msgCode, " : ", message)
        end
    end
    return api.VkBool32(false)
end

const debug_callback_fun_ptr = cfunction(
    debugg_callback, api.VkBool32, (
        api.VkDebugReportFlagsEXT,
        api.VkDebugReportObjectTypeEXT,
        UInt64,
        Csize_t,
        Int32,
        Ptr{UInt8},
        Ptr{UInt8},
        Ptr{Void}
    )
)

function setupDebugging(instance::Instance, flags)
    create_debug_callback_ptr = api.vkGetInstanceProcAddr(instance, "vkCreateDebugReportCallbackEXT")

    dbgCreateInfo = create(api.VkDebugReportCallbackCreateInfoEXT, (
        :pfnCallback, debug_callback_fun_ptr,
        :flags, (
            UInt32(api.VK_DEBUG_REPORT_INFORMATION_BIT_EXT) |
            UInt32(api.VK_DEBUG_REPORT_ERROR_BIT_EXT) |
            UInt32(api.VK_DEBUG_REPORT_WARNING_BIT_EXT) |
            UInt32(api.VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT)
        )
    ))

    debugReportCallback = Ref{api.VkDebugReportCallbackEXT}()
    err = ccall(create_debug_callback_ptr, api.VkResult,
        (api.VkInstance, Ptr{api.VkDebugReportCallbackCreateInfoEXT}, Ptr{api.VkAllocationCallbacks}, Ptr{api.VkDebugReportCallbackEXT}),
        instance, dbgCreateInfo, C_NULL, debugReportCallback
    )
    check(err)
    debugReportCallback[]
end

function Instance(appname::AbstractString, validation=true)
    enabledExtensions = [api.VK_KHR_SURFACE_EXTENSION_NAME]
    if validation
        push!(enabledExtensions, api.VK_EXT_DEBUG_REPORT_EXTENSION_NAME)
    end
    @windows ? begin
        push!(enabledExtensions, api.VK_KHR_WIN32_SURFACE_EXTENSION_NAME)
    end : begin
    # todo : linux/android
        push!(enabledExtensions, api.VK_KHR_XCB_SURFACE_EXTENSION_NAME)
    end

    app_info = create(api.VkApplicationInfo, (
        :pApplicationName, appname,
        :pEngineName, appname,
        :apiVersion, api.VK_MAKE_VERSION(1, 0, 4)
    ))
    instance = CreateInstance(C_NULL, (
        :pApplicationInfo, app_info,
        :enabledExtensionCount, length(enabledExtensions),
        :ppEnabledExtensionNames, enabledExtensions,
        :enabledLayerCount, length(validation_layer),
        :ppEnabledLayerNames, validation_layer
    ))
    Instance(instance)
end
