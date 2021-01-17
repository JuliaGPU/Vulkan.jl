# Design

Vulkan is a low-level API that exhibits many patterns than any C library exposes. For example, some functions return error codes as a result, or mutate pointer memory as a way of returning values. The length of array pointers is always requested, while trivially available when originating from Julia arrays. Pointers are the primary objects of interest, while it is not trivial to keep them valid (i.e. have them point to valid memory) in Julia. Their validity is not guaranteed out of the box, which introduces several pitfalls that ultimately lead to crashes. Notably, the API makes a heavy use of structures with pointer fields and structure pointers, which demands a clear knowledge of variable preservation in Julia.

Usually, the patterns mentioned above are not problematic for small libraries, because structures are relatively simple. They however become visible annoyances in the case of a large API such as Vulkan. This motivates the use of a procedural approach to handle those patterns.

Vulkan.jl uses a generator to programmatically generate higher-level wrappers for low-level API functions. This is a consequent part of this library, which helped us to minimize the amount of human errors in the wrapping process, while allowing a certain flexilibity. The related project is found in the `generator` folder. Because its unique purpose is to generate the wrapper `generated/vulkan_wrapper.jl`, it is not included in the package, which results in a lightweight library.