#=

# Setting options

To set [Package options](@ref), you can either specify key-value pairs via a `LocalPreferences.toml` file in your environment or by calling `Vulkan.set_preferences!`. Here is an example for setting `LOG_DESTRUCTION` to "true" for debugging purposes:

=#

using Vulkan

Vulkan.set_preferences!("LOG_DESTRUCTION" => "true")
