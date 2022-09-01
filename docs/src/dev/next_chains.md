# Next chains

Vulkan has a concept of `next` chains, where API structures can be chained together by filling an optional `next` field in a nested manner (hence the name).

This poses a few challenges on the Julia side, because in Vulkan such chains are linked lists which use raw pointers. Raw pointers are the reason why we required so-called intermediate structures that wrap core structures. As a reminder, these intermediate structures are nothing more than a core structure put alongside a vector of dependencies which holds Julia objects (arrays or references). These dependencies are what guarantees the validity of pointers present in the core structure, by making the garbage collector aware that these references must not be freed as long as the core structure is used (i.e., as long as the intermediate wrapper is used).

Having linked lists with opaque pointers complicate the matter. First, one must be able to build such chains to pass in the data structures to Vulkan in the format the API expects. That is the easiest part, since we can have arbitrary objects in the `next` field of high-level wrappers. From there, we can build a reference (`Ref`) to these (immutable) objects and then turn these references into pointers.

The Vulkan API sometimes makes use of a pattern where a `next` chain gets filled by an API command, such as `vkGetPhysicalDeviceProperties2`. The challenge then lies in initializing an empty intermediate object for Vulkan to fill in. We must construct core objects recursively with the right dependencies; care must be taken because every core object that is used in the chain must be saved as a dependency, but must also contain `next` members recursively. Therefore, in the initialization logic (implemented in [`initialize`](@ref Vk.initialize)), core objects are initialized via [`initialize_core`](@ref Vk.initialize_core) and their corresponding reference (if the object is not the root object) is filled with the result to be retained in the only intermediate structure that will contain the whole chain.

Reconstructing the original object is fairly straightforward. If the result is meant to be an intermediate structure, we can simply wrap the core object, the dependency being the original intermediate object that was used to initialize the object and its chain. If we want a high-level structure instead, then we need to chase pointers iteratively from the `next` chain of the core object, reconstructing the `next` objects by loading the pointers as we go along.

```@docs
Vk.initialize
Vk.initialize_core
```
