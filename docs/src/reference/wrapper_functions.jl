#=

# Wrapper functions

Functions in C behave differently that in Julia. In particular, they can't return multiple values and mutate pointer memory instead. Other patterns emerge from the use of pointers with a separately-provided length, where a length/size parameter can be queried, so that you build a pointer with the right size, and pass it in to the API to be filled with data.
All these patterns were automated, so that wrapper functions feel a lot more natural and straightforward for Julia users than the API functions.

## Implicit return values

Functions almost never directly return a value in Vulkan, and usually return either a return code or nothing. This is a limitation of C where only one value can be returned. Instead, they fill pointers with data, and it is your responsibility to initialize them before the call and dereference them afterwards. Here is an example:

=#

using Vulkan
using Vulkan.VkCore

function example_create_instance()
    instance_ref = Ref{VkInstance}()
    ## we'll cheat a bit for the create info
    code = vkCreateInstance(
        InstanceCreateInfo([], []), # create info
        C_NULL,                     # allocator
        instance_ref,
    )

    @assert code == VK_SUCCESS

    instance_ref[]
end

example_create_instance()

#=

We did not create a `VkInstanceCreateInfo` to stay concise. Note that the create info structure can be used as is by the `vkCreateInstance`, even if it is a wrapper. Indeed, it implements `Base.cconvert` and `Base.unsafe_convert` to automatically interface with the C API.

All this setup code is now automated by the wrapper:

=#

instance = unwrap(create_instance(InstanceCreateInfo([], []); allocator = C_NULL))

#=

Note that the `create_instance` wrapper returns a `ResultTypes.Result` type, so the result must be unwrapped to be used. To know more about `unwrap` and the `Result` type see the [Error handling](@ref Error-handling) section.

When there are multiple implicit return values (i.e. multiple pointers being written to), they are returned as a tuple:

```julia
actual_data_size, data = unwrap(get_pipeline_cache_data(device, pipeline_cache, data_size))
```

## Queries

### Enumerated items

Sometimes, when enumerating objects or properties for example, a function may need to be called twice: a first time for returning the number of elements to be enumerated, then a second time with an initialized array of the right length to be filled with Vulkan objects:

=#

function example_enumerate_physical_devices(instance)
    pPhysicalDeviceCount = Ref{UInt32}(0)

    ## get the length in pPhysicalDeviceCount
    code = vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL)

    @assert code == VK_SUCCESS
    ## initialize the array with the returned length
    pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])

    ## fill the array
    code = vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices)
    @assert code == VK_SUCCESS

    pPhysicalDevices
end

example_enumerate_physical_devices(instance)

# The relevant enumeration functions are wrapped with this, so that only one call needs to be made, without worrying about creating intermediate arrays:

unwrap(enumerate_physical_devices(instance))

#=

### Incomplete retrieval

Some API commands such as `vkEnumerateInstanceLayerProperties` may return a `VK_INCOMPLETE` code indicating that some items could not be written to the provided array. This happens if the number of available items changes after that the length is obtained, making the array too small. In this case, it is recommended to simply query the length again, and provide a vector of the updated size, starting over if the number of items changes again. To avoid doing this by hand, this step is automated in a while loop. Here is what it may look like:

=#

function example_enumerate_physical_devices_2(instance)
    pPhysicalDeviceCount = Ref{UInt32}(0)

    @assert vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL) == VK_SUCCESS
    pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])
    code = vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices)

    while code == VK_INCOMPLETE
        @assert vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, C_NULL) ==
                VK_SUCCESS
        pPhysicalDevices = Vector{VkPhysicalDevice}(undef, pPhysicalDeviceCount[])
        code = vkEnumeratePhysicalDevices(instance, pPhysicalDeviceCount, pPhysicalDevices)
    end

    pPhysicalDevices
end

example_enumerate_physical_devices_2(instance)

# Fortunately, this is automated for you and you can just call

unwrap(enumerate_physical_devices(instance))

#=

## [Exposing create info arguments](@id expose-create-info-args)

Functions that take a single `Create*Info` or `Allocate*Info` structure as an argument additionally define a method where all create info parameters are unpacked. The method will then build the create info structure automatically, slightly reducing boilerplate.

For example, it is possible to create a [`Fence`](@ref) with `create_fence(device; flags = FENCE_CREATE_SIGNALED_BIT)`, instead of doing `create_fence(device, FenceCreateInfo(; flags = FENCE_CREATE_SIGNALED_BIT))`.

## Automatic insertion of inferable arguments

In some places, part of the arguments of a function or of the fields of a structure can only take one logical value. It can be divided into two sets:

1. The structure type `sType` of certain structures
2. Arguments related to the start and length of a pointer which represents an array

The second set is a consequence of using a higher-level language than C. In C, the pointer alone does not provide any information regarding the number of elements it holds. In Julia, array-like values can be constructed in many different ways, being an `Array`, a `NTuple` or other container types which provide a `length` method.

#### Structure type

Many API structures possess a `sType` field which must be set to a unique value. This is done to favor the extendability of the API, but is unnecessary boilerplate for the user. Worse, this is an error-prone process which may lead to crashes. All the constructors of this wrapper do not expose this `sType` argument, and hardcode the expected value.

#### Pointer lengths

The length of array pointers is automatically deduced from the length of the container passed in as argument.

#### Pointer starts

Some API functions require to specify the start of a pointer array as an argument. They have been hardcoded to 0 (first element in C), since it is always possible to pass in a sub-array (e.g. a view).

## Intermediate functions

=#
