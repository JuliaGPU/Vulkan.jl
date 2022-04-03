#=

# Package options

Certain features of this library are configurable via [Preferences.jl](https://github.com/JuliaPackaging/Preferences.jl).


|    Preference     |              Description              |  Default  |
|:-----------------:|:-------------------------------------:|:---------:|
| `LOG_DESTRUCTION` | Log the destruction of Vulkan handles | `"false"` |
| `USE_DISPATCH_TABLE` | Retrieve and store function pointers in a [dispatch table](@ref Dispatch) to speed up API calls and facilitate the use of extensions | `"true"` |

## Destruction logging

To debug the reference counting mechanism used through finalizers for handle destruction, it is possible to print when a finalizer is run and the resulting effect (freeing the object, or simply decrementing a reference counter). To enable this, set the preference `LOG_DESTRUCTION` to `"true"`.

=#
