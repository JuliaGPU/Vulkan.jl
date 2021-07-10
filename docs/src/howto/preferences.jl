#=

# Setting preferences

To set the [preferences](@ref Preferences) `LOG_DESTRUCTION` to "true" for debugging, you can do it either by having a `LocalPreferences.toml` in your environment or by calling `Vulkan.set_preferences!`:

=#

using Vulkan

Vulkan.set_preferences!("LOG_DESTRUCTION" => "true")
