
#=

# Minimal working compute example

The amount of control offered by Vulkan is not a very welcome property for
users who just want to run a simple shader to compute something quickly, and
the effort required for the "first good run" is often quite deterrent. To ease
the struggle, this tutorial gives precisely the small "bootstrap" piece of code
that should allow you to quickly run a compute shader on actual data. In short,
we walk through the following steps:

- Opening a device and finding good queue families and memory types
- Allocating memory and buffers
- Compiling a shader program and filling up the structures necessary to run it:
  - specialization constants
  - push constants
  - descriptor sets and layouts
- Making a command buffer and submitting it to the queue, efficiently running
  the shader

## Initialization

=#

using SwiftShader_jll # hide
using Vulkan
set_driver(:SwiftShader) # hide

instance = Instance([], [])

# Take the first available physical device (you might check that it is an
# actual GPU, using [`get_physical_device_properties`](@ref)).
physical_device = first(unwrap(enumerate_physical_devices(instance)))

# At this point, we need to choose a queue family index to use. For this
# example, have a look at `vulkaninfo` command and pick the good queue manually
# from the list of `VkQueueFamilyProperties` -- you want one that has
# `QUEUE_COMPUTE` in the flags. In a production environment, you would use
# [`get_physical_device_queue_family_properties`](@ref) to find a good index.
qfam_idx = 0

# Create a device object and make a queue for our purposes.
device = Device(physical_device, [DeviceQueueCreateInfo(qfam_idx, [1.0])], [], [])

# ## Allocating the memory
#
# Similarly, you need to find a good memory type. Again, you can find a good one
# using `vulkaninfo` or with [`get_physical_device_memory_properties`](@ref).
# For compute, you want something that is both at the device (contains
# `MEMORY_PROPERTY_DEVICE_LOCAL_BIT`) and visible from the host
# (`..._HOST_VISIBLE_BIT`).
memorytype_idx = 0

# Let's create some data. We will work with 100 flimsy floats.
data_items = 100
mem_size = sizeof(Float32) * data_items

# Allocate the memory of the correct type
mem = DeviceMemory(device, mem_size, memorytype_idx)

# Make a buffer that will be used to access the memory, and bind it to the
# memory. (Memory allocations may be quite demanding, it is therefore often
# better to allocate a single big chunk of memory, and create multiple buffers
# that view it as smaller arrays.)
buffer = Buffer(
    device,
    mem_size,
    BUFFER_USAGE_STORAGE_BUFFER_BIT,
    SHARING_MODE_EXCLUSIVE,
    [qfam_idx],
)

bind_buffer_memory(device, buffer, mem, 0)

# ## Uploading the data to the device
#
# First, map the memory and get a pointer to it.
memptr = unwrap(map_memory(device, mem, 0, mem_size))

# Here we make Julia to look at the mapped data as a vector of `Float32`s, so
# that we can access it easily:
data = unsafe_wrap(Vector{Float32}, convert(Ptr{Float32}, memptr), data_items, own = false);

# For now, let's just zero out all the data, and *flush* the changes to make
# sure the device can see the updated data. This is the simplest way to move
# array data to the device.
data .= 0
unwrap(flush_mapped_memory_ranges(device, [MappedMemoryRange(mem, 0, mem_size)]))
# The flushing is not required if you have verified that the memory is
# host-coherent (i.e., has `MEMORY_PROPERTY_HOST_COHERENT_BIT`).

# Eventually, you may need to allocate memory types that are not visible from
# host, because these provide better capacity and speed on the discrete GPUs.
# At that point, you may need to use the transfer queue and memory transfer
# commands to get the data from host-visible to GPU-local memory, using e.g.
# [`cmd_copy_buffer`](@ref).

# ## Compiling the shader
#
# Now we need to make a shader program. We will use `glslangValidator` packaged
# in a JLL to compile a GLSL program from a string into a spir-v bytecode,
# which is later passed to the GPU drivers.

shader_code = """
#version 430

layout(local_size_x_id = 0) in;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

layout(constant_id = 0) const uint blocksize = 1; // manual way to capture the specialization constants

layout(push_constant) uniform Params
{
    float val;
    uint n;
} params;

layout(std430, binding=0) buffer databuf
{
    float data[];
};

void
main()
{
    uint i = gl_GlobalInvocationID.x;
    if(i < params.n) data[i] = params.val * i;
}
"""

# Push constants are small packs of variables that are used to quickly send
# configuration data to the shader runs. Make sure that this structure
# corresponds to what is declared in the shader.
struct ShaderPushConsts
    val::Float32
    n::UInt32
end

# Specialization constants are similar to push constants, but less dynamic: You
# can change them before compiling the shader for the pipeline, but not
# dynamically. This may have performance benefits for "very static" values,
# such as block sizes.
struct ShaderSpecConsts
    local_size_x::UInt32
end

# Let's now compile the shader to SPIR-V with `glslang`. We can use the artifact `glslang_jll` which provides the binary through the [Artifact system](https://pkgdocs.julialang.org/v1/artifacts/).

# First, make sure to `] add glslang_jll`, then we can do the shader compilation through:
using glslang_jll: glslangValidator
glslang = glslangValidator(identity)
shader_bcode = mktempdir() do dir
    inpath = joinpath(dir, "shader.comp")
    outpath = joinpath(dir, "shader.spv")
    open(f -> write(f, shader_code), inpath, "w")
    status = run(`$glslang -V -S comp -o $outpath $inpath`)
    @assert status.exitcode == 0
    reinterpret(UInt32, read(outpath))
end

# We can now make a shader module with the compiled code:
shader = ShaderModule(device, sizeof(UInt32) * length(shader_bcode), shader_bcode)

# ## Assembling the pipeline
#
# A `descriptor set layout` describes how many resources of what kind will
# be used by the shader. In this case, we only use a single buffer:
dsl = DescriptorSetLayout(
    device,
    [
        DescriptorSetLayoutBinding(
            0,
            DESCRIPTOR_TYPE_STORAGE_BUFFER,
            SHADER_STAGE_COMPUTE_BIT;
            descriptor_count = 1,
        ),
    ],
)

# Pipeline layout describes the descriptor set together with the location of
# push constants:
pl = PipelineLayout(
    device,
    [dsl],
    [PushConstantRange(SHADER_STAGE_COMPUTE_BIT, 0, sizeof(ShaderPushConsts))],
)

# Shader compilation can use "specialization constants" that get propagated
# (and optimized) into the shader code. We use them to make the shader
# workgroup size "dynamic" in the sense that the size (32) is not hardcoded in
# GLSL, but instead taken from here.
const_local_size_x = 32
spec_consts = [ShaderSpecConsts(const_local_size_x)]

# Next, we create a pipeline that can run the shader code with the specified layout:
pipeline_info = ComputePipelineCreateInfo(
    PipelineShaderStageCreateInfo(
        SHADER_STAGE_COMPUTE_BIT,
        shader,
        "main", # this needs to match the function name in the shader
        specialization_info = SpecializationInfo(
            [SpecializationMapEntry(0, 0, 4)],
            UInt64(4),
            Ptr{Nothing}(pointer(spec_consts)),
        ),
    ),
    pl,
    -1,
)
ps, _ = unwrap(create_compute_pipelines(device, [pipeline_info]))
p = first(ps)

# Now make a descriptor pool to allocate the buffer descriptors from (not a big
# one, just 1 descriptor set with 1 descriptor in total), ...
dpool = DescriptorPool(device, 1, [DescriptorPoolSize(DESCRIPTOR_TYPE_STORAGE_BUFFER, 1)],
                       flags=DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT)

# ... allocate the descriptors for our layout, ...
dsets = unwrap(allocate_descriptor_sets(device, DescriptorSetAllocateInfo(dpool, [dsl])))
dset = first(dsets)

# ... and make the descriptors point to the right buffers.
update_descriptor_sets(
    device,
    [
        WriteDescriptorSet(
            dset,
            0,
            0,
            DESCRIPTOR_TYPE_STORAGE_BUFFER,
            [],
            [DescriptorBufferInfo(buffer, 0, WHOLE_SIZE)],
            [],
        ),
    ],
    [],
)

# ## Executing the shader
#
# Let's create a command pool in the right queue family, and take a command
# buffer out of that.
cmdpool = CommandPool(device, qfam_idx)
cbufs = unwrap(
    allocate_command_buffers(
        device,
        CommandBufferAllocateInfo(cmdpool, COMMAND_BUFFER_LEVEL_PRIMARY, 1),
    ),
)
cbuf = first(cbufs)

# Now that we have a command buffer, we can fill it with commands that cause
# the kernel to be run. Basically, we bind and fill everything, and then
# dispatch a sufficient amount of invocations of the shader to span over the
# array.
begin_command_buffer(
    cbuf,
    CommandBufferBeginInfo(flags = COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT),
)

cmd_bind_pipeline(cbuf, PIPELINE_BIND_POINT_COMPUTE, p)

const_buf = [ShaderPushConsts(1.234, data_items)]
cmd_push_constants(
    cbuf,
    pl,
    SHADER_STAGE_COMPUTE_BIT,
    0,
    sizeof(ShaderPushConsts),
    Ptr{Nothing}(pointer(const_buf)),
)

cmd_bind_descriptor_sets(cbuf, PIPELINE_BIND_POINT_COMPUTE, pl, 0, [dset], [])

cmd_dispatch(cbuf, div(data_items, const_local_size_x, RoundUp), 1, 1)

end_command_buffer(cbuf)

# Finally, find a handle to the compute queue and send the command to execute
# the shader!
compute_q = get_device_queue(device, qfam_idx, 0)
unwrap(queue_submit(compute_q, [SubmitInfo([], [], [cbuf], [])]))

# ## Getting the data
#
# After submitting the queue, the data is being crunched in the background. To
# get the resulting data, we need to wait for completion and invalidate the
# mapped memory (so that whatever data updates that happened on the GPU get
# transferred to the mapped range visible for the host).
#
# While [`queue_wait_idle`](@ref) will wait for computations to be carried out,
# we need to make sure that the required data is kept alive during queue
# operations. In non-global scopes, such as functions, the compiler may skip
# the allocation of unused variables or garbage-collect objects that the
# runtime thinks are no longer used. If garbage-collected, objects will call
# their finalizers which imply the destruction of the Vulkan objects
# (via `vkDestroy...`). In this particular case, the runtime is not aware
# that for example the pipeline and buffer objects are still used and that
# there's a dependency with these variables until the command returns, so we
# tell it manually.
GC.@preserve buffer dsl pl p const_buf spec_consts begin
    unwrap(queue_wait_idle(compute_q))
end

# Free the command buffers and the descriptor sets. These are the only handles that are not cleaned up automatically (see [Automatic finalization](@ref)).

free_command_buffers(device, cmdpool, cbufs)
free_descriptor_sets(device, dpool, dsets)

# Just as with flushing, the invalidation is only required for memory that is
# not host-coherent. You may skip this step if you check that the memory has
# the host-coherent property flag.
unwrap(invalidate_mapped_memory_ranges(device, [MappedMemoryRange(mem, 0, mem_size)]))

# Finally, let's have a look at the data created by your compute shader!
data # WHOA
