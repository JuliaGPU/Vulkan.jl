
#=

# Minimal working compute example

The amount of control offered by Vulkan is not a very welcome property for
users who just want to run a simple shader to compute something quickly, and
the effort required for the "first good run" is often quite deterrent. To ease
the struggle, this tutorial gives precisely the small "bootstrap" piece of code
that should allow you to quickly run a compute shader on actual data. In short,
we walk through the following steps:

- Opening a device and finding good queues families and memory types
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
@set_driver :SwiftShader # hide

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
# Same way, you need to find a good memory type. Again, you can find a good one
# using `vulkaninfo` or with [`get_physical_device_memory_properties`](@ref).
# For compute, you want something that is both at the device (contains
# `MEMORY_PROPERTY_DEVICE_LOCAL_BIT`) and visible from the host
# (`..._HOST_VISIBLE_BIT`).
memorytype_idx = 0

# Let's create some data. We will work with 100 flimsy floats.
data_items = 100
mem_size = sizeof(Float32) * data_items

# Allocate the memory of the correct type
mem = unwrap(allocate_memory(device, mem_size, memorytype_idx))

# Make a buffer that will be used to access the memory, and bind it to the
# memory. (Memory allocations may be quite demanding, it is therefore often
# better to allocate a single big chunk of memory, and create multiple buffers
# that view it as smaller arrays.)
buffer = unwrap(create_buffer(device, mem_size, BUFFER_USAGE_STORAGE_BUFFER_BIT, SHARING_MODE_EXCLUSIVE, [qfam_idx]))

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
flush_mapped_memory_ranges(device, [MappedMemoryRange(mem, 0, mem_size)])
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
struct shader_push_consts
    val::Float32
    n::UInt32
end

# Specialization constants are similar to push constants, but less dynamic: You
# can change them before compiling the shader for the pipeline, but not
# dynamically. This may have performance benefits for "very static" values,
# such as block sizes.
struct shader_spec_consts
    local_size_x::UInt32
end

# `glslangValidator` program is used to compile the shader:
using glslang_jll
shader_bcode = mktempdir() do dir
    inpath = joinpath(dir, "shader.comp")
    outpath = joinpath(dir, "shader.spv")
    open(f -> write(f, shader_code), inpath, "w")
    status = glslangValidator(bin -> run(`$bin -V -S comp -o $outpath $inpath`))
    @assert status.exitcode == 0
    reinterpret(UInt32, read(outpath))
end

# We can now make a shader module with the compiled code:
shader = unwrap(create_shader_module(device, sizeof(UInt32) * length(shader_bcode), shader_bcode))

# ## Assembling the pipeline
#
# Descriptor set layout describes how many buffers of what kind are going to be
# used by the shader:
dsl = unwrap(
    create_descriptor_set_layout(
        device,
        [DescriptorSetLayoutBinding(0, DESCRIPTOR_TYPE_STORAGE_BUFFER, 1, SHADER_STAGE_COMPUTE_BIT, Sampler[])],
    ),
)

# Pipeline layout describes the descriptor set together with the location of
# push constants:
pl = unwrap(
    create_pipeline_layout(device, [dsl], [PushConstantRange(SHADER_STAGE_COMPUTE_BIT, 0, sizeof(shader_push_consts))]),
)

# Shader compilation can use "specialization constants" that get propagated
# (and optimized) into the shader code. We use them to make the shader
# workgroup size "dynamic" in the sense that the size (32) is not hardcoded in
# GLSL, but instead taken from here.
const_local_size_x = 32
spec_consts = [shader_spec_consts(const_local_size_x)]

# Next, we create a pipeline that can run the shader code with the specified layout:
p = first(
    first(
        unwrap(
            create_compute_pipelines(
                device,
                [
                    ComputePipelineCreateInfo(
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
                    ),
                ],
            ),
        ),
    ),
)

# Now make a descriptor pool to allocate the buffer descriptors from (not a big
# one, just 1 descriptor set with 1 descriptor in total), ...
dpool = unwrap(create_descriptor_pool(device, 1, [DescriptorPoolSize(DESCRIPTOR_TYPE_STORAGE_BUFFER, 1)]))

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
cmdpool = unwrap(create_command_pool(device, qfam_idx))
cbufs = unwrap(allocate_command_buffers(device, CommandBufferAllocateInfo(cmdpool, COMMAND_BUFFER_LEVEL_PRIMARY, 1)))
cbuf = first(cbufs)

# Now that we have a command buffer, we can fill it with commands that cause
# the kernel to be run. Basically, we bind and fill everything, and then
# dispatch a sufficient amount of invocations of the shader to span over the
# array.
begin_command_buffer(cbuf, CommandBufferBeginInfo(flags = COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT))

cmd_bind_pipeline(cbuf, PIPELINE_BIND_POINT_COMPUTE, p)

const_buf = [shader_push_consts(1.234, data_items)]
cmd_push_constants(cbuf, pl, SHADER_STAGE_COMPUTE_BIT, 0, sizeof(shader_push_consts), Ptr{Nothing}(pointer(const_buf)))

cmd_bind_descriptor_sets(cbuf, PIPELINE_BIND_POINT_COMPUTE, pl, 0, [dset], [])

cmd_dispatch(cbuf, div(data_items, const_local_size_x, RoundUp), 1, 1)

end_command_buffer(cbuf)

# Finally, find a handle to the compute queue and send the command to execute
# the shader!
compute_q = get_device_queue(device, qfam_idx, 0)
queue_submit(compute_q, [SubmitInfo([], [], [cbuf], [])])

# ## Getting the data
#
# After submitting the queue, the data is being crunched in the background. To
# get the resulting data, we need to wait for completion and invalidate the
# mapped memory (so that whatever data updates that happened on the GPU get
# transferred to the mapped range visible for the host).
queue_wait_idle(compute_q)
invalidate_mapped_memory_ranges(device, [MappedMemoryRange(mem, 0, mem_size)])

# Finally, let's have a look at the data created by your compute shader!
data # WHOA
