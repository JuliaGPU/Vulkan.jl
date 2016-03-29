
"""
Excerpt from: (gpuopen)[http://gpuopen.com/vulkan-renderpasses/]
```
[...]
In Vulkan, a renderpass object contains the structure of the frame. In its simplest form, a renderpass encapsulates the set of framebuffer attachments, basic information about pipeline state and not much more. However, a renderpass can contain one or more subpasses and information about how those subpasses relate to one another. This is where things get interesting.

Each subpass can reference a subset of the framebuffer attachments for writing and also a subset of the framebuffer attachments for reading. These readable framebuffer attachments are known as input attachments and effectively contain the result of an earlier subpass at the same pixel. Unlike traditional render-to-texture techniques, where each pass may read any pixel produced by a previous pass, input attachments guarantee that each fragment shader only accesses data produced by shader invocations at the same pixel. Further, each subpass contains information about what to do with each of the attachments when it begins  (clear it, restore it from memory, or leave it uninitialized) and what to do with the attachments when it ends (store it back to memory or throw it away). The dependencies between the subpasses are explicitly spelled out by the application. This allows a tiled renderer to know, exactly, when it needs to flush its tile buffer, clear it, restore it from memory, and so on.
[...]
```
"""
module Renderpass


end
