#=

# [Error handling](@id error-handling)

Error handling is achieved via [ResultTypes.jl](https://github.com/iamed2/ResultTypes.jl) to avoid the large overhead introduced with `try`/`catch` blocks. All functions that need to perform an operation that returns a `VkResult` are wrapped into a `ResultTypes.Result` (distinct from `Vulkan.Result` which is the wrapped version of `VkResult`), which contains a [`VulkanError`](@ref) if a non-success code is encountered. Custom error handling can be performed using the following pattern

=#

using Vulkan

res = create_instance([], [])
if iserror(res) # handle the error
    err = unwrap_error(res)
    if err.code == ERROR_INCOMPATIBLE_DRIVER
        error(
            """
            No driver compatible with the requested API version could be found.
            Please make sure that a driver supporting Vulkan is installed, and
            that it is up to date with the requested version.
            """
        )
    elseif err.code == ERROR_LAYER_NOT_PRESENT
        error("One or more layers could not be found")
    else
        throw(err)
    end
else # get the instance
    unwrap(res)
end

# Note that calling `unwrap` directly on the result will throw any contained `VulkanError` if there is one. So, if you just want to throw an exception when encountering an error, you can do

unwrap(create_instance([], []))

# Because it may be tedious to unwrap everything by hand and explicitly set the create info structures, [convenience constructors](@ref expose-create-info-args) are defined for handle types so that you can just do

Instance([], [])

#=

However, note that exceptions are thrown whenever the result is an error with this shorter approach.

Furthermore, all functions that may return non-success (but non-error) codes return a `Vulkan.Result` type along with any other returned value, since the return code may still be of interest.

For more details on the `ResultTypes.Result` type and how to handle it, please consult the [ResultTypes.jl documentation](https://iamed2.github.io/ResultTypes.jl/stable/).

=#
