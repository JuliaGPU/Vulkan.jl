Vulkan.jl uses a generator to programmatically generate higher-level wrappers for low-level API functions. This is a consequent part of this library, which allowed us to minimize the amount of human errors in the wrapping process, particularly when dealing with pointers. The related project is found in the `generator` folder.

Its unique purpose is to generate the file `generated/wrapped_api.jl`.
