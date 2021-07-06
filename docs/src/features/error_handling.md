```@setup main
using SwiftShader_jll
using Vulkan
@set_driver :SwiftShader
```

# [Error handling](@id error-handling)

Error handling is achieved via [ResultTypes.jl](https://github.com/iamed2/ResultTypes.jl) to avoid the large overhead incurred by `try`/`catch` blocks. All functions that need to perform an operation that returns a `VkResult` are wrapped into a `Result`, which contains a [`VulkanError`](@ref) if a non-success code is encountered. Custom error handling can be performed using the following pattern

```@example main
res = create_instance(InstanceCreateInfo([], []))
if iserror(res) # handle the error
    err = unwrap_error(res)
    if err.code == VK_ERROR_INCOMPATIBLE_DRIVER
        error("No driver compatible with the requested API version could be found.
                Please make sure that a driver supporting Vulkan is installed, and
                that it is up to date with the requested version.")
    else
        throw(err)
    end
else # get the instance
    unwrap(res)
end
```

Note that calling `unwrap` directly on the result will throw any contained `VulkanError` if there is one. So, if you just want to throw an exception when encountering an error, you can do

```@example main
unwrap(create_instance(InstanceCreateInfo([], [])))
```

Because it may be tedious to unwrap everything by hand and explicitly set the create info structures, [convenience constructors](@ref expose-create-info-args) are defined for handle types so that you can just do

```@example main
Instance([], [])
```

However, note that exceptions are thrown whenever the result is an error with this shorter approach.

For more details on the `Result` type and how to handle it, please consult the [ResultTypes documentation](https://iamed2.github.io/ResultTypes.jl/stable/).
