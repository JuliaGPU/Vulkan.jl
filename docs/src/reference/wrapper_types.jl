#=

# Wrapper types

The Vulkan API possesses a few data structures that exhibit a different behavior. Each structure type has been wrapped carefully to automate the underlying API patterns. We list all of these here along with their properties and features that we hope will free the developer of some of the heaviest patterns and boilerplate of the Vulkan API.

## Handles

Handles are opaque pointers to internal Vulkan objects. Almost every handle must be created and destroyed with API commands. Some handles have a parent handle (see [Parent handle access](@ref Parent-handle-access) for navigating through the resulting handle hierarchy), which *must not* be destroyed before its children. For this we provide wrappers around creation functions with an automatic finalization feature (see [Automatic finalization](@ref Automatic-finalization)) that uses a simple reference couting system. This alleviates the burden of tracking when a handle can be freed and freeing it, in conformance with the Vulkan specification.

Most handles are typically created with a `*CreateInfo` or `*AllocateInfo` structure, that packs creation parameters to be provided to the API creation function. To allow for nice one-liners that don't involve long create info names, [these create info parameters are exposed](@ref expose-create-info-args) in the creation function, automatically building the create info structure.

!!! tip
    Most handle types have constructors defined that wrap around the creation function and automatically unwrap the result (see [Error handling](@ref Error-handling)).


### Automatic finalization

In the Vulkan API, handles are created with the functions `vkCreate*` and `vkAllocate*`, and most of them must be destroyed after use with a call to `vkDestroy*` or `vkFree*`. More importantly, they must be destroyed with the same allocator and parent handle that created them.

To automate this, new mutable handle types were defined to allow for the registration of a [finalizer](https://docs.julialang.org/en/v1/base/base/#Base.finalizer). The `create_*` and `allocate_*` wrappers automatically register the corresponding destructor in a finalizer, so that you don't need to worry about destructors (except for `CommandBuffer`s and `DescriptorSet`s, see below). The finalizer of a handle, and therefore its API destructor, will execute when there are no program-accessible references to this handle. Because finalizers may run in arbitrary order in Julia, and some handle types such as `VkDevice` require to be destroyed only after all their children, a simple thread-safe reference counting system is used to make sure that a handle is destroyed **only after all its children are destroyed**.

As an exception, because they are meant to be freed in batches, `CommandBuffer`s and `DescriptorSet`s do not register any destructor and are not automatically freed. Those handles will have to explicitly freed with [`free_command_buffers`](@ref) and [`free_descriptor_sets`](@ref) respectively.

Finalizers can be run eagerly with [`finalize`](https://docs.julialang.org/en/v1/base/base/#Base.finalize), which allows one to reclaim resources early. The finalizers won't run twice if triggered manually.

!!! danger
    You should **never** explicitly call a destructor, except for `CommandBuffer` and `DescriptorSet`. Otherwise, the object will be destroyed twice and will lead to a segmentation fault.

!!! note
    If you need to construct a handle from an opaque pointer (obtained, for example, via an external library such as a `VkSurfaceKHR` from GLFW), you can use the constructor `(::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor[, parent])` as in

    ```julia
    surface_ptr = GLFW.CreateWindowSurface(instance, window)
    SurfaceKHR(surface_ptr, x -> destroy_surface_khr(instance, x), instance)
    ```

    If the surface doesn't need to be destroyed (for example, if the external library does it automatically), the `identity` function should be passed in as destructor.

### Handle constructors

Handles that can only be created with a single API constructor have constructors defined which wrap the relevant create/allocate\* function and `unwrap` the result.

For example, `Instance(layers, extensions)` is equivalent to `unwrap(create_instance(layers, extensions))`.

If the API constructor returns an error, an exception will be raised (see [Error handling](@ref)).

### Parent handle access

Handles store their parent handle if they have one. For example, `Pipeline`s have a `device` field as a [`Device`](@ref), which itself contains a `physical_device` field and so on until the instance that has no parent. This reduces the number of objects that must be carried around in user programs.

`Base.parent` was extended to navigate this hierarchy, where for example `parent(device) == device.physical_device` and `parent(physical_device) == physical_device.instance`.

## Structures

Vulkan structures, such as `Extent2D`, `InstanceCreateInfo` and `PhysicalDeviceFeatures` were wrapped into two different structures each: a high-level structure, which should be used most of the time, and an intermediate structure used for maximal performance whenever required.

### High-level structures

High-level structures were defined to ressemble idiomatic Julia structures, replacing C types by idiomatic Julia types. They abstract most pointers away, using Julia arrays and strings, and use `VersionNumbers` instead of integers. Equality and hashing are implemented with [AutoHashEquals.jl](https://github.com/andrewcooke/AutoHashEquals.jl) to facilitate their use in dictionaries.

### Intermediate structures

Intermediate structures wrap C-compatible structures and embed pointer data as dependencies. Therefore, as long as the intermediate structure lives, all pointer data contained within the C-compatible structure will be valid. These structures are mostly used internally by Vulkan.jl, but they can be used with [intermediate functions](@ref Intermediate-functions) for maximum performance, avoiding the overhead incurred by high-level structures which require back and forth conversions with C-compatible structures for API calls.

These intermediate structures share the name of the high-level structures, starting with an underscore. For example, the high-level structure [`InstanceCreateInfo`](@ref) has an intermediate counterpart [`_InstanceCreateInfo`](@ref).

Note that intermediate structures can only be used with other intermediate structures. `convert` methods allow the conversion between arbitrary high-level and intermediate structures, if required.

!!! tip
    Outside performance-critical sections such as tight loops, high-level structures are much more convenient to manipulate and should be used instead.

## Bitmask flags

In the Vulkan API, certain flags use a bitmask structure. A bitmask is a logical `or` combination of several bit values, whose meaning is defined by the bitmask type. In Vulkan, the associated flag type is defined as a `UInt32`, which allows any value to be passed in as a flag. This opens up the door to incorrect usage that may be hard to debug. To circumvent that, most bitmask flags were wrapped with an associated type which prevents combinations with flags of other bitmask types.

For example, consider the core `VkSampleCountFlags` type (alias for `UInt32`) with bits defined via the enumerated type `VkSampleCountFlagBits`:

```@repl
using Vulkan.VkCore
VK_SAMPLE_COUNT_1_BIT isa VkSampleCountFlagBits
VK_SAMPLE_COUNT_1_BIT === VkSampleCountFlagBits(1)
VK_SAMPLE_COUNT_1_BIT === VkSampleCountFlags(1)
VK_SAMPLE_COUNT_1_BIT | VK_SAMPLE_COUNT_2_BIT === VkSampleCountFlags(3)
VK_SAMPLE_COUNT_1_BIT & VK_SAMPLE_COUNT_2_BIT === VkSampleCountFlags(0)
VK_SAMPLE_COUNT_1_BIT & VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR === VkSampleCountFlags(1)
```

Those two types are combined into one `SampleCountFlag`:

```@repl
using Vulkan
SampleCountFlag <: BitMask
SurfaceTransformFlagKHR <: BitMask # another bitmask flag
SAMPLE_COUNT_1_BIT | SAMPLE_COUNT_2_BIT === SampleCountFlag(3)
SAMPLE_COUNT_1_BIT & SAMPLE_COUNT_2_BIT === SampleCountFlag(0)
SAMPLE_COUNT_1_BIT & SURFACE_TRANSFORM_IDENTITY_BIT_KHR
UInt32(typemax(SampleCountFlag)) === UInt32(VkCore.VK_SAMPLE_COUNT_FLAG_BITS_MAX_ENUM)
```

All functions that were expecting a `VkSampleCountFlags` (`UInt32`) value will have their wrapped versions expect a value of type `SampleCountFlag`. Furthermore, the `*FLAG_BITS_MAX_ENUM` values are removed. This value is the same for all enums and can be accessed via `typemax(T)` where `T` is a `BitMask` (e.g. `SampleCountFlag`).

=#
