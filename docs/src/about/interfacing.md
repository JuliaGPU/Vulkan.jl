# Interfacing with the C API

## Structures and variable preservation

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
    `cconvert`/`unsafe_convert` were extended on wrapper types so that, when using an API function directly, [`ccall`](https://docs.julialang.org/en/v1/base/c/#ccall) will convert a struct to its API-compatible version.

## Version numbers

Version numbers are encoded in unsigned integers (often `UInt32`) in C. Most APIs have a specific encoding (and decoding) scheme. Ideally we want to use version numbers from Julia without having to look for this encoding or decoding function, and this has been automated for the Vulkan API.
