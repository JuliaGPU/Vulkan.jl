# Utility tools

## Profilers

### NVIDIA Nsight Systems

[NVIDIA Nsight Systems](https://developer.nvidia.com/nsight-systems) is a tool developed by NVIDIA to profile applications, showing both CPU and GPU usage. It can be very useful for analyzing the balance between CPU and GPU usage, as well as troubleshoot general performance bottlenecks. However, it only outputs high-level information on the GPU tasks. Therefore, to catch GPU bottlenecks on a low-level one should instead use a dedicated profiler such as [Nsight Graphics](@ref ngfx) or [Renderdoc](@ref renderdoc).

### [NVIDIA Nsight Graphics](@id ngfx)

[Nsight Graphics](https://developer.nvidia.com/nsight-graphics) dives deeper into the execution details of an application and provides detailed information regarding graphics pipelines, shaders and so on. This is a tool of choice to consider for NVIDIA GPUs once the GPU is identified as a bottleneck with Nsight Systems.

### [Renderdoc](@id renderdoc)

[Renderdoc](https://renderdoc.org/) plays a similar role to Nsight Graphics for a wider range of GPUs. It is open-source and community-maintained.
