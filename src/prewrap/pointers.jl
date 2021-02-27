Base.cconvert(T::Type, x::VulkanStruct) = x
Base.cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{false}}) = getproperty.(x, :vks)
Base.cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{true}}) = (x, getproperty.(x, :vks))
Base.cconvert(T::Type{<:Ptr}, x::VulkanStruct{false}) = Ref(x.vks)
Base.cconvert(T::Type{<:Ptr}, x::VulkanStruct{true}) = (x, Ref(x.vks))
Base.cconvert(T::Type{<:Ptr}, x::Handle) = x

Base.unsafe_convert(T::Type, x::VulkanStruct) = x.vks
Base.unsafe_convert(T::Type, x::Tuple{<:VulkanStruct{true}, <:Ref}) = Base.unsafe_convert(T, last(x))
Base.unsafe_convert(T::Type, x::Tuple{<:AbstractVector{<:VulkanStruct{true}}, <:Any}) = Base.unsafe_convert(T, last(x))

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
