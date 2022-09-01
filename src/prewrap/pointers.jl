cconvert(T::Type, x::VulkanStruct) = x
cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{false}}) = getproperty.(x, :vks)
cconvert(T::Type{<:Ptr}, x::AbstractVector{<:VulkanStruct{true}}) = (x, getproperty.(x, :vks))
cconvert(T::Type{<:Ptr}, x::VulkanStruct{false}) = Ref(x.vks)
cconvert(T::Type{<:Ptr}, x::VulkanStruct{true}) = (x, Ref(x.vks))
cconvert(T::Type{Ptr{_T}}, x::Vector{<:HighLevelStruct}) where {_T} = cconvert(T, convert(Vector{getproperty(@__MODULE__, Symbol(:_, nameof(eltype(x))))}, x))
cconvert(T::Type{Ptr{_T}}, x::HighLevelStruct) where {_T} = cconvert(T, convert(getproperty(@__MODULE__, Symbol(:_, nameof(typeof(x)))), x))
cconvert(T::Type{Ptr{Cvoid}}, x::Handle) = x

convert(T::Type{Ptr{Cvoid}}, x::Handle) = x.vks

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

# # Initialization.

@nospecialize

initialize(::Type{T}) where {T<:VkCore.CEnum.Cenum} = typemin(T)
initialize(::Type{T}) where {T} = zero(T)
initialize(::Type{NTuple{N,T}}) where {N,T} = ntuple(Returns(zero(T)), N)
initialize(::Type{T}) where {T<:AbstractArray} = T()
initialize(::Type{<:Ptr}) = C_NULL

function init_empty(T)
    @assert isbitstype(T)
    ptr = Libc.calloc(1, sizeof(T))
    res = unsafe_load(Ptr{T}(ptr))
    Libc.free(ptr)
    res
end

function _initialize_core(T, refs)
    res = init_empty(T)
    sType = structure_type(T)
    if isempty(refs)
        pNext = C_NULL
    else
        ref = popfirst!(refs)
        ref[] = initialize_core(typeof(ref[]), refs)
        pNext = Base.unsafe_convert(Ptr{Cvoid}, ref)
    end
    setproperties(res, (; sType, pNext))
end

"""
    initialize_core(T, next_refs)

Initialize a core Vulkan structure, with `next` chain types specified in `refs`.

Every ref in `refs` will be used to construct an initialized `pNext` element, and will be filled with the *value* of the initialized type, acting as the pointer. Note that these references will have to be preserved for the initialized Vulkan structure to remain valid.
"""
initialize_core(T, refs) = _initialize_core(Base.inferencebarrier(T), Base.inferencebarrier(refs))

"""
Initialize an intermediate structure, with a `next` chain built from initialized `Tnext` structs.
"""
function _initialize(T::Type{<:VulkanStruct}, Tnext)
    refs = Any[]
    for t in Tnext
        push!(refs, Ref{core_type(t)}())
    end
    vks = initialize_core(core_type(T), refs)
    T(vks, refs)
end

"""
Initialize a high-level structure, with a `next` chain built from initialized `Tnext` structs.
"""
function _initialize(T::Type{<:HighLevelStruct}, Tnext)
    args = []
    for (name, t) in zip(fieldnames(T), fieldtypes(T))
        if t === StructureType
            push!(args, structure_type(T))
        elseif name == :next
            push!(args, isempty(Tnext) ? C_NULL : initialize(Tnext...))
        else
            push!(args, initialize(t))
        end
    end
    T(args...)
end

"""
    initialize(T, next_Ts...)

Initialize a value or Vulkan structure with the purpose of being
filled in by the API. The types can be either high-level or intermediate
wrapper types.

If `next_Ts` is not empty and `T` designates
a Vulkan structure which can hold `next` chains, then the corresponding
types will be initialized and added to the `next`/`pNext` member.
"""
initialize(T::Union{Type{<:HighLevelStruct}, Type{<:VulkanStruct}}, args...) = _initialize(Base.inferencebarrier(T), Base.inferencebarrier(collect(args)))

@noinline function _load_next_chain(ptr, next_types)
    isempty(next_types) && return C_NULL
    T, Ts... = next_types
    @assert ptr ≠ C_NULL
    vks = Base.unsafe_load(Ptr{core_type(T)}(ptr))
    T(vks, Ts...)
end

load_next_chain(ptr, args...) = _load_next_chain(Base.inferencebarrier(ptr), Base.inferencebarrier(collect(args)))

@specialize
