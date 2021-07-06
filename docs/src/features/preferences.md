# [Preferences](@id preferences)

Some of the above features may have configurable options that can be set via [Preferences.jl](https://github.com/JuliaPackaging/Preferences.jl).

!!! warning
    Preferences require running at least Julia 1.6. For earlier versions, these options are not customizable, and will have their default values.

|    Preference     |              Description              |  Default  |
|:-----------------:|:-------------------------------------:|:---------:|
| `LOG_DESTRUCTION` | Log the destruction of Vulkan handles | `"false"` |
