struct VulkanError <: Exception
    msg::AbstractString
    errorcode
end

Base.showerror(io::Core.IO, e::VulkanError) = print(io, "$(e.errorcode): ", e.msg)

"""
    @check vkFunctionSomething()

Checks whether the expression returned VK_SUCCESS or any non-error codes. Else, throw an error printing the corresponding code.
"""
macro check(expr)
    quote
        local msg = "failed to execute " * $(string(expr))
        @check $(esc(expr)) msg
    end
end

macro check(expr, msg)
    quote
        return_code = $(esc(expr))
        if Int(return_code) > 0
            @debug "Non-success return code $return_code"
            return return_code
        elseif Int(return_code) < 0
            throw(VulkanError($msg, return_code))
        end
    end
end

"""
    assign_fields(T, expr)

Call the constructor of S with val.\$f for all fields f of t1.
# Examples
```
julia> assign_fields(S, val::T)
```
"""
macro assign_fields(T, expr)
    name, type = split(string(expr), "::")
    names = Symbol[fieldnames(Base.eval(Vulkan, Meta.parse(type)))...]
    types = replace.([string.(fieldtypes(Base.eval(Vulkan, Meta.parse("$T"))))...], r"Union{Nothing\s*,\s*(.*)}" => s"\1")
    esc(Meta.parse("$T(" * join("vk_convert(" .* string.(types) .* ", " .* "$name." .* string.(names) .* ")", ", ") * ")"))
end

is_union(t) = startswith(t, "Union{")

union_nothing(t) = strip.(split(match(r"Union{(.*)}", t).captures[1], "Nothing,"))

macro add_vk_convert(t1, t2)
    :(vk_convert(T::Type{$t1}, val::$t2) = @assign_fields($t1, val::$t2))
end

macro add_vk_convert_bidirectional(t1, t2)
    quote
        @add_vk_convert($t1, $t2)
        @add_vk_convert($t2, $t1)
    end
end

unsafe_pointer(obj::Base.RefValue) = Base.unsafe_convert(Ptr{typeof(obj[])}, obj)
unsafe_pointer(obj::Base.RefValue{<: AbstractArray}) = unsafe_pointer(obj[])
unsafe_pointer(obj::Union{<: AbstractArray, <: AbstractString}) = pointer(obj)

unsafe_pointer_load(ptr::Ptr{T}; index=1) where T = unsafe_load(ptr, index)
unsafe_pointer_load(ptr::Ptr{T}, length::Integer) where {T} = unsafe_wrap(Array{T}, ptr, length)
unsafe_pointer_load(ptr::Ptr{UInt8}) = unsafe_string(ptr)
unsafe_pointer_load(ptr::Cstring) = unsafe_string(ptr)

vk_convert(::Type{<: AbstractArray{T, 1}}, var::Ptr{Nothing}) where {T} = T[]
vk_convert(::Type{<: AbstractString}, var::Ptr{Nothing}) = ""
vk_convert(T::Type{<: AbstractArray{P}}, b::Ptr{P}; length) where P = unsafe_pointer_load(b, length)
vk_convert(T::Type{VersionNumber}, version::UInt32) = T(UInt32(version) >> 22, (UInt32(version) >> 12) & 0x3ff, UInt32(version) & 0xfff)
vk_convert(T::Type{S}, str::NTuple{N,UInt8}) where {N,S <: AbstractString} = T(filter!(x -> x ≠ 0, UInt8[str...]))

pointer_length(p) = p == C_NULL || isempty(p) ? 0 : length(p)
pointer_length_s = Substitute(x -> :(pointer_length($x)))

default(x::Type{<: Number}) = 0
default(x) = C_NULL


_cconvert(::Type{T}, x) where {T} = Base.cconvert(T, x)
_cconvert(T::Type{UInt32}, version::VersionNumber) = T((version.major << 22) + (version.minor << 12) + version.patch)
_cconvert_ptr(::Type{T}, ::Nothing) where {T} = default(T)
_cconvert_ptr(::Type{Ptr{T}}, x) where {T} = Ref{T}(x)
_cconvert(T::Type{<: Number}, ::Nothing) = T(0)
_cconvert(T::Type{NTuple{N,UInt8}}, s::AbstractString) where {N} = T(s * "\0" ^ (N - length(s)))

vk_convert(T::Type{N}, var::N) where {N} = var

### broken for now?
# unsafe_string_arr_load(arr::Ptr{Cstring}, length) = unsafe_string_arr_load(convert(Ptr{UInt8}, arr), length)
# function unsafe_string_arr_load(arr::Ptr{UInt8}, length)
#     res = String[]
#     j = 0
#     for i ∈ 1:length
#         str = Char[]
#         while true
#             c = Char(unsafe_load(arr, j))
#             println(c)
#             j += 1
#             c == '\0' && break
#             push!(str, c)
#         end
#         push!(res, String(str))
#     end
#     res
# end