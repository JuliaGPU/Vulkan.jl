
"""
This (post)[https://m.reddit.com/r/vulkan/comments/47tc3s/differences_between_vkfence_vkevent_and/] from szdarkhack gives a good intro:

Well, simple things first: Fences are GPU to CPU syncs while semaphores are GPU to GPU syncs, specifically they are used to sync queue submissions (on the same or different queues).
They both get signaled by the GPU but fences can only be waited on by the CPU and semaphores by the GPU. Another small difference between these two is that fences need to be reset manually, while semaphores reset after being waited on.

Events are more general, they can be set, reset and checked on both CPU and GPU, although you can only wait on them on the GPU. However they are limited within a single queue. You can also use these to synchronize work within a command buffer, as opposed to the other two (and yes, work within a command buffer can run out of order according to the spec).

"""
module Synchronization

    # barriers are for restricting write access to memory
    include("barriers.jl")
    # Set anywhere, Wait on GPU (intra-queue)
    include("events.jl")
    # Fences : Set on GPU, Wait on CPU
    include("fences.jl")
    # Set on GPU, Wait on GPU (inter-queue)
    include("semaphores.jl")

end
