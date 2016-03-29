#=
Fences
Related to barriers are fences (CreateFence and vkCreateFence), which are required to synchronize the CPU with the GPU as well as different queues on GPUs. A fence is a very heavyweight synchronization primitive as it requires the GPU to flush all caches at least, and potentially some additional synchronization. Due to those costs, fences should be used sparingly. In particular, try to group per-frame resources and track them together with a single fence instead of fine-grained per-resource tracking. For instance, all commands buffers used in one frame should be protected by one fence, instead of one fence per command buffer.

Fences should be also used sparingly to synchronize the compute, copy and graphics queues per frame. Ideally, try to submit large batches of asynchronous compute jobs with a single fence at the end which denotes that all jobs have finished. Same goes for copies, you should have the end of all copies signaled with a single fence to get the best possible performance.
=#
