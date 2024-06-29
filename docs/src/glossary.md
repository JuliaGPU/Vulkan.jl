# Glossary

*Core handle*: Opaque pointer (`void*`) extensively used by the Vulkan API. See the [Object model](https://registry.khronos.org/vulkan/specs/1.3-extensions/html/chap3.html#fundamentals-objectmodel-overview) section of the Vulkan documentation for more details.

*Handle*: Mutable type which wraps a core handle, allowing the use of finalizers to call API destructors with a reference counting mechanism to ensure no handle is destroyed before its children. Read more about them [here](@ref Handles).

*Core structure*: Structure defined in [VulkanCore.jl](https://github.com/JuliaGPU/VulkanCore.jl) with a 1:1 correspondence with C.

*Intermediate structure*: Minimal wrapper around a core structure which allows the interaction with pointer fields in a safe manner.

*High-level structure*: Structure meant to be interacted with like any other Julia structure, hiding C-specific details by providing e.g. arrays instead of a pointer and a count, strings instead of character pointers, version numbers instead of integers with a specific encoding.

*Core function*: Julia function defined in [VulkanCore.jl](https://github.com/JuliaGPU/VulkanCore.jl) which [forwards a call](https://docs.julialang.org/en/v1/base/c/#ccall) to the Vulkan API function of the same name.

*Intermediate function*: Wrapper around a core function meant to automate certain C anv Vulkan patterns. May return handles and intermediate structures, wrapped in a `ResultTypes.Result` if the core function may fail.

*High-level function*: Almost identical to an intermediate function, except that all returned structures are high-level structures.
