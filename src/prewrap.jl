"""
Represents any kind of wrapper structure that was generated from a Vulkan structure.
`D` is a `Bool` parameter indicating whether the structure has specific dependencies or not.
"""
abstract type VulkanStruct{D} end

"""
Opaque handle referring to internal Vulkan data.
Finalizer registration is taken care of by constructors.
"""
abstract type Handle <: VulkanStruct{false} end

"""
Represents a structure that will never be requested by API functions.
"""
abstract type ReturnedOnly <: VulkanStruct{false} end

const FunctionPtr = Union{Ptr{Cvoid}, Base.CFunction}
const RefCounter = Threads.Atomic{UInt}

Base.cconvert(T::Type, x::VulkanStruct) = x
Base.cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{false}}) = getproperty.(x, :vks)
Base.cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{true}}) = (x, getproperty.(x, :vks))
Base.cconvert(T::Type{<:Ptr}, x::VulkanStruct{false}) = Ref(x.vks)
Base.cconvert(T::Type{<:Ptr}, x::VulkanStruct{true}) = (x, Ref(x.vks))
Base.cconvert(T::Type{<:Ptr}, x::Handle) = x

Base.unsafe_convert(T::Type, x::VulkanStruct) = x.vks
Base.unsafe_convert(T::Type, x::Tuple{<:VulkanStruct{true}, <:Ref}) = Base.unsafe_convert(T, last(x))
Base.unsafe_convert(T::Type, x::Tuple{<:AbstractVector{<:VulkanStruct{true}}, <:Any}) = Base.unsafe_convert(T, last(x))

Base.broadcastable(x::VulkanStruct) = Ref(x)

"""
Exception type indicating that an API function
returned a non-success code.
"""
struct VulkanError <: Exception
    msg::AbstractString
    return_code
end

Base.showerror(io::IO, e::VulkanError) = print(io, e.return_code, ": ", e.msg)

"""
    @check vkCreateInstance(args...)

If the expression does not return `VK_SUCCESS`, raise a [`VulkanError`](@ref) holding the return code.

Requires the `ERROR_CHECKING` preference enabled. Otherwise, it only returns the expression.
"""
macro check(expr)
    @static if ERROR_CHECKING
        quote
            local msg = string("failed to execute ", $(string(expr)))
            @check $(esc(expr)) msg
        end
    else
        esc(expr)
    end
end

macro check(expr, msg)
    quote
        return_code = $(esc(expr))
        if Int(return_code) ≠ 0
            throw(VulkanError($msg, return_code))
        end
        return_code
    end
end

"""
    `pointer_length(val)`

Return the length `val` considering it as an array.

Differ from `Base.length` in that `pointer_length(C_NULL) == 0` and that a `RefArray`s return the length of their roots.
"""
function pointer_length end

pointer_length(arr::Ptr{Nothing}) = 0
pointer_length(arr::AbstractArray) = length(arr)
pointer_length(arr::RefArray) = length(arr.roots)
pointer_length(arr::Tuple{<:Any,<:Any}) = length(first(arr))

"""
Convert a type into its corresponding Vulkan type.

### Examples
```jldoctest
julia> to_vk(UInt32, v"1")
0x00400000

julia> to_vk(NTuple{6, UInt8}, "hello")
(0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x00)
```
"""
function to_vk end

to_vk(T, x) = convert(T, x)
to_vk(T::Type{UInt32}, version::VersionNumber) = VK_MAKE_VERSION(version.major, version.minor, version.patch)
to_vk(T::Type{NTuple{N,UInt8}}, s::AbstractString) where {N} = T(s * '\0' ^ (N - length(s)))

"""
Convert a Vulkan type into its corresponding Julia type.

### Examples
```jldoctest
julia> from_vk(VersionNumber, UInt32(VK_MAKE_VERSION(1, 2, 3)))
v"1.2.3"

julia> from_vk(String, (0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x00))
"hello"

julia> from_vk(Bool, UInt32(1))
true
```
"""
function from_vk end

from_vk(T::Type{<:VulkanStruct{false}}, x) = T(x)
from_vk(T::Type{<:VulkanStruct{true}}, x) = T(x, [])
from_vk(T, x) = convert(T, x)
from_vk(T::Type{VersionNumber}, version::UInt32) = T(VK_VERSION_MAJOR(version), VK_VERSION_MINOR(version), VK_VERSION_PATCH(version))
from_vk(T::Type{S}, str::NTuple{N,UInt8}) where {N,S <: AbstractString} = T(filter!(x -> x ≠ 0, UInt8[str...]))

Base.show(io::IO, h::Handle) = print(io, typeof(h), '(', h.vks, ')')

increment_refcount!(handle::Handle) = Threads.atomic_add!(handle.refcount, UInt(1))
decrement_refcount!(handle::Handle) = Threads.atomic_sub!(handle.refcount, UInt(1))

function try_destroy(f, handle::Handle)
    decrement_refcount!(handle)
    if handle.refcount == 0
        f(handle)
    end
end

function (T::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor)
    handle = T(ptr, RefCounter(UInt(1)))
    handle.destructor = () -> try_destroy(destructor, handle)
    finalizer(x -> handle.destructor(), handle)
end

function (T::Type{<:Handle})(ptr::Ptr{Cvoid}, destructor, parent::Handle)
    increment_refcount!(parent)
    finalizer(x -> parent.destructor(), T(ptr, destructor))
end
