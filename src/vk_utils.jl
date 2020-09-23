struct VulkanError <: Exception
    msg::AbstractString
    return_code
end

Base.showerror(io::Core.IO, e::VulkanError) = print(io, "$(e.return_code): ", e.msg)

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

to_vk(T::Type{UInt32}, version::VersionNumber) = T((version.major << 22) + (version.minor << 12) + version.patch)
to_vk(T::Type{NTuple{N,UInt8}}, s::AbstractString) where {N} = T(s * "\0" ^ (N - length(s)))


from_vk(T::Type{VersionNumber}, version::UInt32) = T(version >> 22, (version >> 12) & 0x3ff, version & 0xfff)
from_vk(T::Type{<: AbstractArray{P}}, b::Ptr{P}; length) where P = unsafe_pointer_load(b, length)
from_vk(T::Type{S}, str::NTuple{N,UInt8}) where {N,S <: AbstractString} = T(filter!(x -> x ≠ 0, UInt8[str...]))

# """
#     assign_fields(T, expr)

# Call the constructor of S with val.\$f for all fields f of t1.
# # Examples
# ```
# julia> assign_fields(S, val::T)
# ```
# """
# macro assign_fields(T, expr)
#     name, type = split(string(expr), "::")
#     names = Symbol[fieldnames(Base.eval(Vulkan, Meta.parse(type)))...]
#     esc(Meta.parse("$T(" * join(names, ", ") * ")"))
# end

# is_union(t) = startswith(t, "Union{")

# union_nothing(t) = strip.(split(match(r"Union{(.*)}", t).captures[1], "Nothing,"))

# macro add_trivial_conversion(fun_name, t1, t2)
#     :($fun_name(T::Type{$t1}, val::$t2) = @assign_fields($t1, val::$t2))
# end

# """
# Add a trivial conversion (simply )
# """

# macro add_vk_trivial_conversion_bidirectional(t1, t2)
#     quote
#         @add_vk_convert(from_vk, $t1, $t2)
#         @add_vk_convert(to_vk, $t2, $t1)
#     end
# end