```@meta
EditURL = "<unknown>/docs/src/howto/preferences.jl"
```

# Setting preferences

To set the [preferences](@ref Preferences) `LOG_DESTRUCTION` to "true" for debugging, you can do it either by having a `LocalPreferences.toml` in your environment or by calling `Vulkan.set_preferences!`:

````@example preferences
using Vulkan

Vulkan.set_preferences!("LOG_DESTRUCTION" => "true")
````

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

