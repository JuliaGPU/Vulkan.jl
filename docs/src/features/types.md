```@setup main
using SwiftShader_jll
using Vulkan
@set_driver :SwiftShader
```

# Types

## Structures

As the API is written in C, there are a lot of pointers to deal with and handling them is not always an easy task. With a little practice, one can figure out how to wrap function calls with `cconvert` and `unsafe_convert` provided by Julia. Those functions provide automatic conversions and `ccall` GC-roots `cconvert`ed variables to ensure that pointers will point to valid memory (by explicitly telling the compiler not to garbage-collect nor optimize away the original variable).

However, the situation gets a lot more complicated when you deal with pointers as type fields. We will look at a naive example that show how difficult it can get for a Julia developer not used to calling C code. If we wanted to create a `VkInstance`, we might be tempted to do:

```julia
function create_instance(app_name, engine_name)
    app_info = VkApplicationInfo(
        VK_STRUCTURE_TYPE_APPLICATION_INFO, # sType
        C_NULL, # pNext
        pointer(app_name), # application name
        1, # application version
        pointer(engine_name), # engine name
        0, # engine version
        VK_VERSION_1_2, # requested API version
    )
    create_info = InstanceCreateInfo(
        VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO, # sType
        C_NULL, # pNext
        0, # flags
        Base.unsafe_convert(Ptr{VkApplicationInfo}, (Ref(app_info))), # application info
        0, # layer count
        C_NULL, # layers (none requested)
        0, # extension count
        C_NULL, # extensions (none requested)
    )
    p_instance = Ref{VkInstance}()

    GC.@preserve app_info begin
        vkCreateInstance(
            Ref(create_info),
            C_NULL, # custom allocator (we choose the default one provided by Vulkan)
            p_instance,
        )
    end

    p_instance[]
end

instance = create_instance("AppName", "NoEngine") # very likely to segfault
```

which will probably result in a segmentation fault. Why?

Two causes may lead to such a result:
1. `app_name` and `engine_name` may never be allocated if the compiler decides not to, so there is no guarantee that `pointer(app_name)` and `pointer(engine_name)` will point to anything valid. Additionally, even if those variables were allocated with valid pointer addresses at some point, they can be garbage collected **at any time**, including before the call to `vkCreateInstance`.
2. `app_info` is not what should be preserved. It cannot be converted to a pointer, but a `Ref` to it can. Therefore it is the reference that needs to be `GC.@preserve`d, not `app_info`. So, `Ref(app_info)` must be assigned to a variable, and replace `app_info` in the call to `GC.@preserve`.

Basically, it all comes down to having to preserve everything you take a pointer of. And, if you need to create an intermediary object when converting a variable to a pointer, you need to preserve it too. For example, take of an array of `String`s, that need to be converted as a `Ptr{Cstring}`. You first need to create an array of `Cstring`s, then convert that array to a pointer. The `String`s and the `Cstring` array need to be preseved.

This is exactly what `cconvert` and `unsafe_convert` are for. `cconvert` converts a variable to a type that can be converted to the desired (possibly pointer) type using `unsafe_convert`. In addition of chaining both conversions, `ccall` also preserves the `cconvert`ed variable, so that the unsafe conversion becomes safe.

Because we cannot use `ccall` in this case, we need to `cconvert` any argument that will be transformed to a pointer, and store the result as long as the desired struct may be used. Then, `unsafe_convert` can be called on this result, to get the desired (pointer) type necessary to construct the API struct.

There are several possibilities for preserving what we may call "pointer dependencies". One of them is to reference them inside a global variable, such as a `Dict`, and deleting them once we no longer need it. This has the severe disadvantage of requiring to explicitly manage every dependency, along with large performance issues. Another possibility, which we have taken in this wrapper, is to create a new structure that will store both the API structure and the required dependencies. That way, we can safely rely on the GC for preserving what we need just when we need it.

Therefore, every API structure is wrapped inside another one (without the "Vk" prefix), as follows:

```julia
struct InstanceCreateInfo <: VulkanStruct{true} # true means there are dependencies
    vks::VkInstanceCreateInfo # API struct
    deps::Vector{Any}         # contains all required dependencies
end
```

and every structure exposes a convenient constructor that works perfectly with `String`s and mutable `AbstractArray`s. No manual `Ref`s/`cconvert`/`unsafe_convert` needed.

We hope that the additional `Vector{Any}` will not introduce too much overhead. In the future, this might be changed to a `NTuple{N, Any}` or a `StaticArrays.SVector{N, Any}`. We could also have stored dependencies as additional fields, but this does not scale well with nested structs. It would either require putting an additional field for each dependency (be it direct, or indirect dependencies coming from a pointer to another struct), possibly defining other structures that hold dependencies to avoid having a large number of fields, inducing additional compilation time.

!!! note
    `cconvert`/`unsafe_convert` were extended so that, when using an API function directly, [`ccall`](https://docs.julialang.org/en/v1/base/c/#ccall) will convert a struct to its `vks` field. Therefore, there is no need to specify it manually in that case.


### Conversion

In Vulkan, version numbers are `UInt32` with a special encoding to extract major, minor and patch numbers, booleans are represented as `UInt32` values, `String`s as `Ptr{UInt8}` or `NTuple{N, UInt8}`. Those types have a natural counterpart in Julia, being respectively `VersionNumber`, `Bool` and `String` types. The wrapper makes it possible to work with these Julian types, automatically converting them wherever necessary.

### Automatic insertion of inferable arguments

In some places, part of the arguments of a function or of the fields of a structure can only take one logical value. It can be divided into two sets:

1. The structure type `sType` of certain structures
2. Arguments related to the start and length of a pointer which represents an array

The second set is a consequence of using a higher-level language than C. In C, the pointer alone does not provide any information regarding the number of elements it holds. In Julia, array-like values can be constructed in many different ways, being an `Array`, a `NTuple` or other container types which provide a `length` method.

#### Structure type

Many API structures possess a `sType` field which must be set to a unique value. This is done to favor the extendability of the API, but is unnecessary boilerplate for the user. Worse, this is an error-prone process which may lead to crashes. All the constructors of this wrapper do not expose this `sType` argument, and hardcode the expected value.

#### Pointer lengths

The length of array pointers is automatically deduced from the length of the container passed in as argument.

#### Pointer starts

Some API functions require to specify the start of a pointer array as an argument. They have been hardcoded to 0 (first element), since it is always possible (and very straightforward) to pass in a sub-array.

## [Error handling](@id error-handling)

Error handling is achieved via [ResultTypes.jl](https://github.com/iamed2/ResultTypes.jl) to avoid the large overhead incurred by `try`/`catch` blocks. All functions that need to perform an operation that returns a `VkResult` are wrapped into a `Result`, which contains a [`VulkanError`](@ref) if a non-success code is encountered. Custom error handling can be performed using the following pattern

```@example main
res = create_instance(InstanceCreateInfo([], []))
if iserror(res) # handle the error
    err = unwrap_error(res)
    if err.code == VK_ERROR_INCOMPATIBLE_DRIVER
        error("No driver compatible with the requested API version could be found.
                Please make sure that a driver supporting Vulkan is installed, and
                that it is up to date with the requested version.")
    else
        throw(err)
    end
else # get the instance
    unwrap(res)
end
```

Note that calling `unwrap` directly on the result will throw any contained `VulkanError` if there is one. So, if you just want to throw an exception when encountering an error, you can do

```@example main
unwrap(create_instance(InstanceCreateInfo([], [])))
```

Because it may be tedious to unwrap everything by hand and explicitly set the create info structures, [convenience constructors](@ref expose-create-info-args) are defined for handle types so that you can just do

```@example main
Instance([], [])
```

However, note that exceptions are thrown whenever the result is an error with this shorter approach.

For more details on the `Result` type and how to handle it, please consult the [ResultTypes documentation](https://iamed2.github.io/ResultTypes.jl/stable/).

## Bitmask flags

In Vulkan, the value of some flags carry meaning through a bitmask structure. Bitmasks define bit values which they can be a composition of (using bitwise _and_, _or_, and _xor_ operations). However, the associated flag type is defined as a `UInt32`, which allows any value to be passed in as a flag. This opens up the door to incorrect usage that may be hard to debug. To circumvent that, every bitmask flag now has one associated type which prevents combinations with flags of other bitmask types.

For example, consider the vanilla `VkSampleCountFlags` type (alias for `UInt32`) with bits defined via the enumerated type `VkSampleCountFlagBits`:

```@repl main
using Vulkan.core
VK_SAMPLE_COUNT_1_BIT isa VkSampleCountFlagBits
VK_SAMPLE_COUNT_1_BIT === VkSampleCountFlagBits(1)
VK_SAMPLE_COUNT_1_BIT === VkSampleCountFlags(1)
VK_SAMPLE_COUNT_1_BIT | VK_SAMPLE_COUNT_2_BIT === VkSampleCountFlags(3)
VK_SAMPLE_COUNT_1_BIT & VK_SAMPLE_COUNT_2_BIT === VkSampleCountFlags(0)
VK_SAMPLE_COUNT_1_BIT & VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR === VkSampleCountFlags(1)
```

Those two types are combined into one `SampleCountFlag`:

```@repl main
SampleCountFlag <: BitMask
SurfaceTransformFlagKHR <: BitMask # another bitmask flag
SAMPLE_COUNT_1_BIT | SAMPLE_COUNT_2_BIT === SampleCountFlag(3)
SAMPLE_COUNT_1_BIT & SAMPLE_COUNT_2_BIT === SampleCountFlag(0)
SAMPLE_COUNT_1_BIT & SURFACE_TRANSFORM_IDENTITY_BIT_KHR
UInt32(typemax(SampleCountFlag)) === UInt32(vk.VK_SAMPLE_COUNT_FLAG_BITS_MAX_ENUM)
```

All functions that were expecting a `VkSampleCountFlags` (`UInt32`) value will have their wrapped versions expect a value of type `SampleCountFlag`. Note also that the `*FLAG_BITS_MAX_ENUM` fields are removed. This value is the same for all enums and can be accessed via `typemax(T)` where `T` is a `BitMask` (e.g. `SampleCountFlag`).
