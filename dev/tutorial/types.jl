#=

# Vulkan types

The API possesses a few data structures that exhibit a different behavior. We list all of these here along with their properties and features that we hope will free the developer of many patterns and obligations of the Vulkan API.

## Handles

Handles are opaque pointers to internal Vulkan objects. Almost every handle must be created and destroyed with API commands. Some handles have a parent handle (see [Parent handle access](@ref) for navigating through the resulting handle hierarchy), which *must not* be destroyed before its children. For this we provide wrappers around creation functions with an automatic finalization feature (see [Automatic finalization](@ref)) that uses a simple reference couting system. This alleviates the burden of tracking when a handle can be freed and freeing it, in conformance with the Vulkan specification.
Most handles are typically created with a `*CreateInfo` or `*AllocateInfo` structure, that packs creation parameters to be provided to the API creation function. To allow for nice one-liners that don't involve long create info names, [these create info parameters are exposed](@ref expose-create-info-args) in the creation function, automatically building the create info structure for you.

!!! tip
    Handle types have a constructor defined that wraps around the creation function and automatically unwrap the result (see [Error handling](@ref error-handling)).


### Automatic finalization

Handles can be created with the API functions `vkCreate*` and `vkAllocate*`, and most of them must be destroyed after use with a `vkDestroy*` or `vkFree*`. More importantly, they must be destroyed with the same allocator and parent handle that created them. To facilitate this, new mutable handle types were defined to allow for the registration of a finalizer. Instead of having to manually specify the finalizer for each handle instance, the `create_*` and `allocate_*` wrappers automatically register the corresponding destructor.

However, finalizers can be run in arbitrary order, and some handles require to be destroyed only after all their children (such as `VkDevice`s). To avoid crashes related to bad finalization execution order, a simple thread-safe reference counting system is used to make sure that a handle is destroyed **only after all its children are destroyed**.

!!! note
    If you need to construct a handle from an opaque pointer (obtained, for example, via an external library such as a `VkSurfaceKHR` from GLFW), you can use the constructor `(::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor[, parent])` as in

    ```julia
    surface_ptr = GLFW.CreateWindowSurface(instance, window)
    SurfaceKHR(surface_ptr, x -> destroy_surface_khr(instance, x), instance)
    ```

    If you don't need to destroy the surface (for example, if the external library does it for you), then you can just pass in the `identity` function as a destructor.


This introduces a small overhead, since the parent handle and allocator are stored in an anonymous function for each handle at creation. However, it should be minor compared to the execution time of the API destructors.

There are exceptions to what is described above. `CommandBuffer`s and `DescriptorSet`s do not register any destructor and are never implicitly freed. You will have to explicitly free those resources yourself with `free_command_buffers` and `free_descriptor_sets` respectively. The reason for that is that they are supposed to be freed in batches for performance considerations. Please note also that, except for these two handle types, you should **never** explicitly call the destructors, otherwise they will be destroyed twice, likely resulting in a crash.

Because finalization order is the source of many Vulkan bugs, particularly when objects implicitly depend on other objects being alive, there is a [preference](@ref Preferences) `LOG_DESTRUCTION` that allows you to log all destructions if set to `"true"` for debugging purposes.

### [Exposition of `*[Create/Allocate\]Info` arguments](@id expose-create-info-args)

Handles that can only be created with a single API constructor possess an additional constructor that wraps around the generated create/allocate\* functions, building the required \*\[Create/Allocate\]Info from exposed arguments. That way, you do not have to explicitly construct this intermediate structure, which reduces boilerplate code.

For example

=#

using SwiftShader_jll # hide
using Vulkan
@set_driver :SwiftShader # hide

const instance = Instance([], [])
const physical_device = first(unwrap(enumerate_physical_devices(instance)))
const device = Device(
    physical_device, [DeviceQueueCreateInfo(0, [1.])],
    [],
    [],
)

fence = unwrap(create_fence(device, FenceCreateInfo()))
fence_signaled = unwrap(
                   create_fence(
                     device,
                     FenceCreateInfo(flags=FENCE_CREATE_SIGNALED_BIT);
                   )
                 )

# can be replaced with

fence = unwrap(create_fence(device))
fence_signaled = unwrap(
                   create_fence(
                     device;
                     flags=FENCE_CREATE_SIGNALED_BIT,
                     )
                   )

#=

Note that we `unwrap` the result every time, assuming that the `create_fence` function did not return any error. See the [error handling](@ref error-handling) section for more information.

Furthermore, handle types have a generated constructor that exposes the same arguments as the create/allocate\* functions, but automatically unwrapping the result so you don't have to call it manually. The above can then be further reduced into

=#

fence = Fence(device)
fence_signaled = Fence(
                   device,
                   flags=FENCE_CREATE_SIGNALED_BIT;
                 )

# When multiple info structures are requested, only the main one has its fields exposed as function arguments:

## the ApplicationInfo has to be provided manually
Instance([], []; application_info = ApplicationInfo(v"0.1", v"0.1", v"1.2"))

# Or, if an array of create infos is expected, then you will have to provide it yourself:

## the array of DeviceQueueCreateInfo has to be provided manually
Device(physical_device, [DeviceQueueCreateInfo(0, [1.0])], [], [])

# When multiple handles are constructed at the same time, no additional constructor is defined and you need to call the `create_*` function manually

command_pool = CommandPool(device, 0)
command_buffers = unwrap(
                    allocate_command_buffers(
                      device,
                      CommandBufferAllocateInfo(
                        command_pool,
                        COMMAND_BUFFER_LEVEL_PRIMARY,
                        3,
                      )
                    )
                  )

#=

### Parent handle access

Handles store their parent handle if they have one. This removes the need to have giant structures or global variables to store your handles. The user can, e.g., just carry a `Pipeline` around and access its `device` field whenever he like, and the `physical_device` field of this device and so on until you reach the instance that has no parent. That way, it is not necessary to keep all the other parent handles in scope (e.g. `Device` and `Instance` handles) to make an API call.

`Base.parent` was extended to work on handles that possess a parent handle.


## Structures

Vulkan structures, such as `Extent2D`, `InstanceCreateInfo` and `PhysicalDeviceFeatures` were wrapped into two different structures each.

First, there are high-level-ish structures that are easier to work with, replacing C types by Julian types. The user will almost never need to worry about pointers, and will be able to use types such as Julia arrays, strings and version numbers in a transparent manner. All the data is stored in its fields, and is accessible just like you would expect from a Julia structure.

However, storing data and converting it to a C-compatible format for API calls introduce some overhead for these high-level structures. It will not matter in non performance-critical sections, but may be a limitation in tight loops. Therefore, lower-level, minimalistic types are available, which only carry the smallest possible amount of information needed to use the API. Although they can be created very similarly to high-level structures, the high-level arguments are directly converted to their C-compatible counterpart. The main drawback is a lack of introspection, since these minimalistic structures carry C types, so these structures are badly suited to keeping data around. Minimalistic structures are not defined for types that are only returned and never requested by Vulkan, such as `ExtensionProperties`.

There is a final family of Vulkan types that you may encounter. Those are the barebones VulkanCore.jl types, which you won't have to worry about in all cases *except when you need to pass functions to the API*. In this case, inputs will not be automatically converted for you, and you will have to define the appropriate signature before obtaining function pointers with `Base.@cfunction`. You can access these types from the (exported) module `Vulkan.core`.

To summarize:

- High-level structs:
  - should be used most of the time.
  - store values in a way that makes it easy to retrieve them later.
  - introduce a small overhead, which may be a concern in some performance-critical sections.

- Low-level structs:
  - offer performance advantages over high-level structs.
  - may be preferred in performance-critical sections.
  - are not meant for introspection capabilities.
  - are not defined for structures not needed by the API.

- VulkanCore structs:
  - should never be used directly, except as argument types for functions intended to be passed to the API.

In general, high-level and low-level structs can be used interchangeably as function arguments to constructors or API functions, at the condition that they are not mixed together.

Using either high-level or low-level structs should be a performance matter, and as such it is encouraged to profile applications before using low-level structs all: they are faster, but can require additional bookkeeping due to a lack of introspection.

Typically, it is easier to use high-level types for create info arguments to handles that are created at a low frequency; this includes `Instance`, `Device` or `SwapchainKHR` handles for example. Their create info structures may contain precious information that needs to be accessed by the application, e.g. to make sure that image formats in a render pass comply with the swapchain image format, or to check instance or device extensions before using extension functionality.

API functions and structures accept either low-level structs or high-level structs. For commands with low-level structs, you currently need to provide typed arrays (i.e. not `[]` which are of type `Vector{Any}`).

In general:
- High-level structs are returned from functions with high-level arguments.
- Low-level structs are returned from functions with low-level arguments.

The only exception currently is for functions that would have the same low-level/high-level argument types, for which only one version is available that returns values in low-level types.


### Conversion

In Vulkan, version numbers are `UInt32` with a special encoding to extract major, minor and patch numbers, booleans are represented as `UInt32` values, `String`s as `Ptr{UInt8}` or `NTuple{N, UInt8}`. Those types have a natural counterpart in Julia, being respectively `VersionNumber`, `Bool` and `String` types. The wrapper makes it possible to work with these Julian types, automatically converting them wherever necessary.

### Automatic insertion of inferable arguments

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

## Bitmask flags

In Vulkan, the value of some flags carry meaning through a bitmask structure. Bitmasks define bit values which they can be a composition of (using bitwise _and_, _or_, and _xor_ operations). However, the associated flag type is defined as a `UInt32`, which allows any value to be passed in as a flag. This opens up the door to incorrect usage that may be hard to debug. To circumvent that, every bitmask flag now has one associated type which prevents combinations with flags of other bitmask types.

For example, consider the vanilla `VkSampleCountFlags` type (alias for `UInt32`) with bits defined via the enumerated type `VkSampleCountFlagBits`:

```@repl
using Vulkan.core
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
UInt32(typemax(SampleCountFlag)) === UInt32(core.VK_SAMPLE_COUNT_FLAG_BITS_MAX_ENUM)
```

All functions that were expecting a `VkSampleCountFlags` (`UInt32`) value will have their wrapped versions expect a value of type `SampleCountFlag`. Furthermore, the `*FLAG_BITS_MAX_ENUM` values are removed. This value is the same for all enums and can be accessed via `typemax(T)` where `T` is a `BitMask` (e.g. `SampleCountFlag`).

=#
