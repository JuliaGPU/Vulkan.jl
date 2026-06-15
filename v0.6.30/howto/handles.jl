#=

# Manipulating handles

## Creating a handle

=#

using SwiftShader_jll # hide
using Vulkan
set_driver(:SwiftShader) # hide

const instance = Instance([], [])
const pdevice = first(unwrap(enumerate_physical_devices(instance)))
const device = Device(pdevice, [DeviceQueueCreateInfo(0, [1.0])], [], [])

# The most convenient way to create a handle is through its constructor

buffer = Buffer(
    device,
    100,
    BUFFER_USAGE_TRANSFER_SRC_BIT,
    SHARING_MODE_EXCLUSIVE,
    [];
    flags = BUFFER_CREATE_SPARSE_ALIASED_BIT,
)

# This is equivalent to

unwrap(
    create_buffer(
        device,
        100,
        BUFFER_USAGE_TRANSFER_SRC_BIT,
        SHARING_MODE_EXCLUSIVE,
        [];
        flags = BUFFER_CREATE_SPARSE_ALIASED_BIT,
    ),
)

# [Error handling](@ref) can be performed before unwrapping, e.g.

res = create_buffer(
    device,
    100,
    BUFFER_USAGE_TRANSFER_SRC_BIT,
    SHARING_MODE_EXCLUSIVE,
    [];
    flags = BUFFER_CREATE_SPARSE_ALIASED_BIT,
)
if iserror(res)
    error("Could not create buffer!")
else
    unwrap(res)
end

# Create info parameters can be built separately, such as

info = BufferCreateInfo(
    100,
    BUFFER_USAGE_TRANSFER_SRC_BIT,
    SHARING_MODE_EXCLUSIVE,
    [];
    flags = BUFFER_CREATE_SPARSE_ALIASED_BIT,
)

Buffer(device, info)
#-
create_buffer(device, info)

# Handles allocated in batches (such as command buffers) do not have a dedicated constructor; you will need to call the corresponding function yourself.

command_pool = CommandPool(device, 0)
info = CommandBufferAllocateInfo(command_pool, COMMAND_BUFFER_LEVEL_PRIMARY, 5)
res = allocate_command_buffers(device, info)
iserror(res) && error("Tried to create 5 command buffers, but failed miserably.")
cbuffers = unwrap(res)

# Note that they won't be freed automatically; forgetting to free them after use would result in a memory leak (see [Destroying a handle](@ref)).

# ## Destroying a handle

# The garbage collector will free most handles automatically with a finalizer (see [Automatic finalization](@ref)), but you can force the destruction yourself early with

finalize(buffer) # calls `destroy_buffer`

# This is most useful when you need to release resources associated to a handle, e.g. a `DeviceMemory`.
# Handle types that can be freed in batches don't register finalizers, such as `CommandBuffer` and `DescriptorSet`. They must be freed with

free_command_buffers(device, command_pool, cbuffers)

# or the corresponding `free_descriptor_sets` for `DescriptorSet`s.
