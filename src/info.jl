print_info(message, info) = println(join([message, string.(info)...], "\n    "))

function print_info_app()
    print_info("Available instance layers:", enumerate_instance_layer_properties())
    print_info("Available extensions:", enumerate_instance_extension_properties())
end

function print_info_physical_device(app::AppSetup)
    pdevices = enumerate_physical_devices(app)
    print_info("Available devices:", get_physical_device_properties.(pdevices))
end

function print_info_device(physical_device)
    print_info("Available device layers:", enumerate_device_layer_properties(physical_device))
    print_info("Available device extensions:", enumerate_device_extension_properties(physical_device))
end