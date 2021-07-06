## Handles

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

There are exceptions to the described above. `CommandBuffer`s and `DescriptorSet`s do not register any destructor and are never implicitly freed. You will have to explicitly free those resources yourself with `free_command_buffers` and `free_descriptor_sets` respectively. The reason for that is that they are supposed to be freed in batches for performance considerations. Please note also that, except for these two handle types, you should **never** explicitly call the destructors, otherwise they will be destroyed twice, likely resulting in a crash.

Because finalization order is the source of many Vulkan bugs, particularly when objects implicitly depend on other objects being alive, there is a [preference](@ref preferences) `LOG_DESTRUCTION` that allows you to log all destructions if set to `"true"`.

### [Expose \*\[Create/Allocate\]Info arguments](@id expose-create-info-args)

Handles that can only be created with a single API constructor possess an additional constructor that wraps around the generated create/allocate\* functions, building the required \*\[Create/Allocate\]Info from exposed arguments. That way, you do not have to explicitly construct this intermediate structure, which reduces boilerplate code.

For example

```julia
fence = unwrap(create_fence(device, FenceCreateInfo()))
fence_signaled = unwrap(create_fence(
    device,
    FenceCreateInfo(flags=VK_FENCE_CREATE_SIGNALED_BIT);
    allocator=my_allocator
))
```

can be replaced with

```julia
fence = unwrap(create_fence(device))
fence_signaled = unwrap(create_fence(device; flags=VK_FENCE_CREATE_SIGNALED_BIT, allocator=my_allocator))
```

Note that we `unwrap` the result every time, assuming that the `create_fence` function did not return any error. See the [error handling](@ref error-handling) section for more information.

Furthermore, handle types have a generated constructor that exposes the same arguments as the create/allocate\* functions, but automatically unwrapping the result so you don't have to call it manually. The above can then be further reduced into

```julia
fence = Fence(device)
fence_signaled = Fence(device, flags=VK_FENCE_CREATE_SIGNALED_BIT; allocator=my_allocator)
```

When multiple info structures are requested, only the main one is exposed

```julia
# the ApplicationInfo has to be provided manually
instance = Instance([], []; application_info = ApplicationInfo(...))
...
# the array of DeviceQueueCreateInfo has to be provided manually
device = Device(physical_device, [DeviceQueueCreateInfo(0, [1.0])], [], [])
```

When multiple handles are constructed at the same time, no additional constructor is defined and you need to call the create_\* function manually

```julia
pipelines = unwrap(create_graphics_pipelines(device, [GraphicsPipelineCreateInfo(...)]))
command_buffers = unwrap(allocate_command_buffers(device, CommandBufferAllocateInfo(
    command_pool, VK_COMMAND_BUFFER_LEVEL_PRIMARY, 3)))
```

### Parent handle access

Handles store their parent handle if they have one. This removes the need to have giant structures or global variables to store your handles. The user can, e.g., just carry a `Pipeline` around and access its `device` field whenever he like, and the `physical_device` field of this device and so on until you reach the instance that has no parent. That way, it is not necessary to keep all the other parent handles in scope (e.g. `Device` and `Instance` handles) to make an API call.

`Base.parent` was extended to work on handles that possess a parent handle.
