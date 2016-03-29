#=
Barriers
A barrier is a new concept exposed to developers which was previously hidden inside the driver. If you think synchronization, you’re not too far off, as this is also part of what a barrier is.The synchronization part is well known for CPUs: you have multiple writer threads updating a buffer, then you synchronize to make sure all writes have finished, and then you can process the data with multiple reader threads. However, that’s not all there is to a GPU barrier (ResourceBarrier and vkCmdPipelineBarrier). Here, it has three functions in total:

Synchronization, ensuring that previous dependent work has completed before new work starts.
Visibility, ensuring that data that might be cached on a particular unit is visible to other units that might want to see it.
Reformatting, ensuring that data to be read by a unit is in a format that unit understands.
You may wonder when the reformatting happens. This is often required when compression comes into play. A render target for example is typically compressed to reduce the bandwidth required to read and write it. Some units of the GPU may not support all compression modes, and require a decompression. Typically, a barrier is converted into cache flushes (the L1 caches attached to individual units such as the color buffers or depth buffer and/or the more unified L2 cache), waits (e.g. wait for this compute shader to complete before this graphics shader which wants to read the results starts) and / or decompressions.

Now that we know what a barrier does, why are they important? Barriers are often a source of bugs in Direct3D® 12 and Vulkan™. Many instances of flickering, blocky artifacts, corrupted data and broken geometry can be attributed to incorrect barriers. First of all, ensure that barriers are 100% correct, including per-subresource tracking. That is, if you’re writing to one layer of a texture array, this layer needs to be transitioned to be in the correct state – subresources are often overlooked. You also have to make sure to have all required transitions in place. Some might be easy to overlook like transitioning for presentation.

Once this is done, it’s time to optimize. Barriers are expensive and every barrier counts. Make sure to only transition resources that require it — for instance, render targets which are read as textures. In general, you shouldn’t have more barriers than you have resources that are written to. All other resources shouldn’t transition per frame at all. In particular, if a resource is written once and then read in different ways, transition the resource once to the most general read state instead of multiple read-read state transitions.

Batching barriers is also critical for good performance. A barrier may require a GPU flush, and by transitioning more resources in one barrier call, the flush will be done only once for all resources that need it. This can result in a major performance boost – so batch barrier calls as much as possible. One way to implement this is to identify the state all resources have to be in for a command list, and transition them all together at the beginning of the command list, or the end of the previous one. Definitely try to avoid the anti-pattern of checking the resource state just before issuing the actual draw and transition “just-in-time” – this will lead to many more transition calls than needed.
source: http://gpuopen.com/performance-tweets-series-barriers-fences-synchronization/

more about barriers:
http://boxbase.org/entries/2016/mar/7/vulkan-api-overview-3/
=#
