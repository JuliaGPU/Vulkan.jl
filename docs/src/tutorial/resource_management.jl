# # Resource management

# Let's see how resources get freed automatically, and when they aren't. First let's set the preference `"LOG_DESTRUCTION"` to `"true"` to see what's going on:

using SwiftShader_jll # hide
using Vulkan
set_driver(:SwiftShader) # hide

Vulkan.set_preferences!("LOG_DESTRUCTION" => "true")

# You will need to restart your session and import Vulkan again, for changes to take effect.
# Now let's create a bunch of handles and see what happens when the GC runs:

function do_something()
    instance = Instance([], [])
    physical_devices = unwrap(enumerate_physical_devices(instance))
    physical_device = first(physical_devices)
    device = Device(physical_device, [DeviceQueueCreateInfo(0, [1.0])], [], [])

    command_pool = CommandPool(device, 0)
    buffers = unwrap(
        allocate_command_buffers(
            device,
            CommandBufferAllocateInfo(command_pool, COMMAND_BUFFER_LEVEL_PRIMARY, 10),
        ),
    )
    ## they won't be automatically freed individually
    free_command_buffers(device, command_pool, buffers)
    nothing
end

do_something()

## to force some finalizers to run
GC.gc()

#=

Not all handles were destroyed upon finalization. In particular, the physical device and the buffers were not destroyed. That's because a physical device is not owned by the application, so you can't destroy it, and buffers must be freed in batches with `free_command_buffers` (as done above). See more information in [Automatic finalization](@ref).

!!! note
    Not all finalizers have run. In some cases (e.g. when a finalizer must be run to release resources), it may be preferable to run them directly.
    You can do this by calling `finalize` (exported from `Base`):

    ```@example resource_management
    instance = Instance([], [])
    finalize(instance)
    ```
=#
