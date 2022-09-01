#=

# Error handling

Error handling is achieved via a Rust-like mechanism through [ResultTypes.jl](https://github.com/iamed2/ResultTypes.jl). All Vulkan API functions that return a Vulkan [result code](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/VkResult.html) are wrapped into a `ResultTypes.Result`, which holds either the result or a [`VulkanError`](@ref) if a non-zero status code is encountered. Note that `ResultTypes.Result` is distinct from `Vulkan.Result` which is the wrapped version of `VkResult`. Errors can be manually handled with the following pattern

=#

using Vulkan

res = create_instance(["VK_LAYER_KHRONOS_validation"], [])
if iserror(res)
    err = unwrap_error(res)
    if err.code == ERROR_INCOMPATIBLE_DRIVER
        error("""
              No driver compatible with the requested API version could be found.
              Please make sure that a driver supporting Vulkan is installed, and
              that it is up to date with the requested version.
              """)
    elseif err.code == ERROR_LAYER_NOT_PRESENT
        @warn "Validation layers not available."
        create_instance([], [])
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
