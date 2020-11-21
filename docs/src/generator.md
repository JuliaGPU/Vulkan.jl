Vulkan is a low-level API that exhibits many patterns than any C library exposes. For example, some functions return error codes as a result, or mutate pointer memory as a way of returning multiple values (what would correspond to Julia `Array`s). The length of array pointers are requested, while directly available as a Julia object. Pointers are the primary objects of interest, while it is not trivial to keep them valid (i.e. have them point to valid memory) in Julia. Their validity is not guaranteed out of the box, which introduces several pitfalls that ultimately lead to crashes. Notably, the API makes a heavy use of structures with pointer fields and structure pointers, which demands a clear knowledge of variable preservation in Julia.

Usually, the patterns mentioned above are not problematic for small libraries, because structures are relatively simple. They however become visible annoyances in the case of a large API such as Vulkan. This motivates the use of a procedural approach to handle those patterns.

Vulkan.jl uses a generator to programmatically generate higher-level wrappers for low-level API functions. This is a consequent part of this library, which allowed us to minimize the amount of human errors in the wrapping process, dealing with the patterns mentioned above. The related project is found in the `generator` folder. Its unique purpose is to generate the file `generated/wrapped_api.jl`.

## Wrapper content

### Structures

API structures often use pointer fields to pass other structures around, or to have the pointed object filled in by the API, similarly to an assignment. To function properly in Julia, the pointed data has to be conserved in order for the pointer to be valid. Having it conserved here means that it should not be garbage-collected, and used so that compiler optimizations cannot decide to elide the computation. A common way to do this is to store the data in structure fields. Therefore, API structures should have additional fields to preserve variables that are in use by a pointer. However, changing their layout would make them unsuitable for API calls. New structures were generated for each corresponding API structure. They have two fields:
- a `vks` field, which holds the API structure,
- a `bag` field, which contains all dependencies required for the API structure to work properly. This mostly includes original data that is used by pointers.

When using an API function with `ccall`, the `vks` field is automatically taken as argument, so there is no need to specify it manually in that case.

### Handles

Handles are represented as opaque (void) pointers in the API. They have to be created (resp. destroyed) using specific creation (destruction) functions.

#### Creation

Constructors were added to the corresponding [`Handle`](@ref) structs, which removes the need to manually call these creation functions.

#### Finalization

Handles are wrapped in a mutable structure that allows the registration of its VkDestroy\* finalizer upon instantiation. Therefore, finalizing a handle is as simple as calling `Base.finalize(handle)`. However, the order of finalization is not guaranteed in Julia, while a specific order needs to be maintained (i.e. finalizing device objects before the device itself). Therefore, finalization will have to be triggered manually. All the required arguments to VkDestroy\* are passed upon creation of the handle, conforming to valid API usage (creating and destroying an object must be done with the same allocator).

For example, let's say we have a `VkInstance` and a `VkDevice`. The device needs to be finalized prior to the instance with `VkDestroyDevice` before calling `VkDestroyInstance`. The corresponding `Instance` and `Device` structures make it easier by only having to call `Base.finalize.([device, instance])` (note the order of the arguments; putting the instance first would result in a savage crash).

### API usage patterns

#### Pointer and array filling

Some functions may ask for a pointer object to be filled in by Vulkan, be it a reference to an object or an array. Pointer objects to fill in should be initialized with an empty `Ref`, or with an `Array` of undefined elements. Setting up `Ref` and `Array` objects are now done automatically and are no longer the responsibility of the programmer.

#### Enumerations

Sometimes, when enumerating objects or properties for example, a function may need to be called twice: a first time for returning the number of elements to be enumerated, then a second time with an initialized array of the right length to be filled with Vulkan objects. The relevant enumeration functions are wrapped with these two calls, so that only one calls needs to be made, without worrying about creating intermediate arrays.

#### Array arguments

Array variables are passed in functions as pointers, with a length argument that tells Vulkan how far to jump in memory to recover its elements. Manually specifying the length is no longer necessary in the wrapped functions, as the length argument of the array variable is simply passed in as `length(array)`.

#### Type conversion

Version numbers and `Bool` objects were represented as `UInt32`, `Strings` as `Ptr{UInt8}` or `NTuple{N, UInt8}`. They are now represented correctly as `VersionNumber`, `Bool` and `String` objects. For example, this means that when passing or receiving version numbers, one will only have to worry about `VersionNumber`s.


#### Error codes

In the Vulkan API, some functions can return error codes. To avoid silent errors happening unnoticed, one should always check the return value of the relevant functions. With the wrapper, error codes are checked for automatically, raising a `VulkanError` which holds the corresponding `returncode` field when the code is an error. A warning is issued if the operation is successful, but different than `VkSuccess`.

### Miscellaneous

#### Minor improvements to VulkanCore structures

Structure field types follow a consistent notation throughout the library. For example, `Cfloat` and `Cint` are just aliases for `Float32` and `Int32`, and have been replaced accordingly in the wrapped versions.
