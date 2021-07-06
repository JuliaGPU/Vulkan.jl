# Functions

## Implicit return values

Functions almost never directly return a value in Vulkan, and usually return either a return code or nothing. This is a limitation of C where only one value can be returned. Instead, they fill pointers with data, and it is your responsibility to initialize them before the call and dereference them afterwards. In Julia, it can be repetitive, requiring a special handling such as

```julia
pDisplay = Ref{VkDisplayKHR}()
code = vkGetRandROutputDisplayEXT(physical_device, dpy_ref, rr_output, pDisplay) # just leave the return code
pDisplay[]

# or, showing what is actually done by the wrapper instead
DisplayKHR(pDisplay[], identity, physical_device)
```

This particular setup is taken care of by the wrapper, so that you only need to do:

```julia
# returns a Result{DisplayKHR,VulkanError}
display = get_rand_r_output_display_ext(physical_device, dpy_ref, rr_output)
```

The `display` variable here is a `Result` type, so you would need to `unwrap` it to get the actual `DisplayKHR` type. To know more about `unwrap` and the `Result` type see the [error handling](@ref error-handling) section.
When there are multiple implicit return values (i.e. multiple pointers being written to), they are returned as a tuple:

```julia
# the function returns a Result{Tuple{UInt, Ptr{Cvoid}},VulkanError}
actual_data_size, data = unwrap(get_pipeline_cache_data(device, pipeline_cache, data_size))
```

## Enumerated arrays

Sometimes, when enumerating objects or properties for example, a function may need to be called twice: a first time for returning the number of elements to be enumerated, then a second time with an initialized array of the right length to be filled with Vulkan objects:

```julia
pPhysicalDeviceCount = Ref{UInt32}(0)

# get the length in pPhysicalDeviceCount
@check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL)

# initialize the array with the returned length
pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])

# fill the array
@check vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices)
```

The relevant enumeration functions are wrapped with this, so that only one call needs to be made, without worrying about creating intermediate arrays:

```julia
# returns a Result{Vector{PhysicalDevice},VulkanError}
physical_devices = enumerate_physical_devices(instance)
```
