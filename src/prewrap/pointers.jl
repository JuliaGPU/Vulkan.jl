cconvert(T::Type, x::VulkanStruct) = x
cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{false}}) = getproperty.(x, :vks)
cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{true}}) = (x, getproperty.(x, :vks))
cconvert(T::Type{<:Ptr}, x::VulkanStruct{false}) = Ref(x.vks)
cconvert(T::Type{<:Ptr}, x::VulkanStruct{true}) = (x, Ref(x.vks))
cconvert(T::Type{Ptr{_T}}, x::Vector{<:HighLevelStruct}) where {_T} = cconvert(T, convert(Vector{getproperty(@__MODULE__, Symbol(:_, nameof(eltype(x))))}, x))
cconvert(T::Type{Ptr{_T}}, x::HighLevelStruct) where {_T} = cconvert(T, convert(getproperty(@__MODULE__, Symbol(:_, nameof(typeof(x)))), x))
cconvert(T::Type{<:Ptr}, x::Handle) = x

convert(T::Type{<:Ptr}, x::Handle) = x.vks

unsafe_convert(T::Type, x::VulkanStruct) = x.vks
unsafe_convert(T::Type, x::Tuple{<:VulkanStruct{true}, <:Ref}) = unsafe_convert(T, last(x))
unsafe_convert(T::Type, x::Tuple{<:AbstractVector{<:VulkanStruct{true}}, <:Any}) = unsafe_convert(T, last(x))

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

convert_nonnull(T, val) = convert(T, val)
convert_nonnull(T, val::Ptr{Cvoid}) = val == C_NULL ? val : convert(T, val)
