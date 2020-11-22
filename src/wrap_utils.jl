struct VulkanError <: Exception
    msg::AbstractString
    return_code
end

Base.showerror(io::IO, e::VulkanError) = print(io, "$(e.return_code): ", e.msg)

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
        elseif Int(return_code) < 0
            throw(VulkanError($msg, return_code))
        end
        return_code
    end
end

unsafe_pointer(obj::Base.RefValue{T}) where {T} = Base.unsafe_convert(Ptr{T}, obj)
unsafe_pointer(obj::AbstractArray) = pointer(obj)
unsafe_pointer(obj::AbstractString) = pointer(obj)
unsafe_pointer(obj::Ptr{Nothing}) = obj

unsafe_pointer_load(ptr::Ptr{T}; index=1) where {T} = unsafe_load(ptr, index)
unsafe_pointer_load(ptr::Ptr{T}, length::Integer) where {T} = unsafe_wrap(Array{T}, ptr, length)
unsafe_pointer_load(ptr::Ptr{UInt8}) = unsafe_string(ptr)
unsafe_pointer_load(ptr::Cstring) = unsafe_string(ptr)

pointer_length(p) = p == C_NULL || isempty(p) ? 0 : length(p)

to_vk(T, x) = convert(T, x)
to_vk(T::Type{UInt32}, version::VersionNumber) = T((version.major << 22) + (version.minor << 12) + version.patch)
to_vk(T::Type{NTuple{N,UInt8}}, s::AbstractString) where {N} = T(s * "\0" ^ (N - length(s)))

from_vk(T, x) = convert(T, x)
from_vk(T::Type{VersionNumber}, version::UInt32) = T(version >> 22, (version >> 12) & 0x3ff, version & 0xfff)
from_vk(T::Type{<: AbstractArray{P}}, b::Ptr{P}; length) where P = unsafe_pointer_load(b, length)
from_vk(T::Type{S}, str::NTuple{N,UInt8}) where {N,S <: AbstractString} = T(filter!(x -> x ≠ 0, UInt8[str...]))
