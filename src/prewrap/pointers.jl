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
        ref[] = _initialize_core(Base.inferencebarrier(typeof(ref[])), refs)
        pNext = Base.unsafe_convert(Ptr{Cvoid}, ref)
    end
    setproperties(res, (; sType, pNext))
end

initialize_core(T, refs) = _initialize_core(Base.inferencebarrier(T), Base.inferencebarrier(refs))

# """
# Initialize a core structure of type `T` recursively, converting references provided in `vars_types` to pointers for their `next` chain.
# """
# function initialize_core(T::DataType, refs = [])
#     # This function takes a while to compile, if there are ways to speed it up that would be nice.
#     args = []
#     for (name, t) in zip(fieldnames(T), fieldtypes(T))
#         if name == :sType
#             push!(args, structure_type(T))
#         elseif name == :pNext
#             if isempty(refs)
#                 push!(args, C_NULL)
#             else
#                 ref, refs... = refs
#                 ref[] = initialize_core(eltype(ref), refs)
#                 push!(args, Base.unsafe_convert(Ptr{Cvoid}, ref))
#             end
#         elseif isstructtype(t) && !(t <: NTuple)
#             push!(args, initialize_core(t))
#         else
#             push!(args, initialize(t))
#         end
#     end
#     T(args...)
# end

"""
Initialize an intermediate structure, with a `next` chain built from initialized `Tnext` structs.
"""
function _initialize(T::Type{<:VulkanStruct}, Tnext)
    refs = Any[]
    for t in Tnext
        push!(refs, Ref{core_type(t)}())
    end
    vks = _initialize_core(Base.inferencebarrier(core_type(T)), Base.inferencebarrier(refs))
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
            push!(args, isempty(Tnext) ? C_NULL : _initialize(Base.inferencebarrier(Tnext[1]), Base.inferencebarrier(Tnext[2:end])))
        else
            push!(args, initialize(t))
        end
    end
    T(args...)
end

initialize(T::Type{<:HighLevelStruct}, args...) = _initialize(Base.inferencebarrier(T), Base.inferencebarrier(collect(args)))
initialize(T::Type{<:VulkanStruct}, args...) = _initialize(Base.inferencebarrier(T), Base.inferencebarrier(collect(args)))

# """
# Initialize a core structure of type `T` recursively, converting references provided in `vars_types` to pointers for their `next` chain.
# """
# function initialize_core(T::DataType, vars_types::Pair{Symbol,DataType}...)
#     # This function takes a while to compile, if there are ways to speed it up that would be nice.
#     args = []
#     for (name, t) in zip(fieldnames(T), fieldtypes(T))
#         if name == :sType
#             push!(args, structure_type(T))
#         elseif name == :pNext
#             if isempty(vars_types)
#                 push!(args, C_NULL)
#             else
#                 ((var, type), vars_types...) = vars_types
#                 ref_ex = initialize_core(type, (vars_types)...)
#                 push!(args, quote
#                     $var[] = $ref_ex
#                     Base.unsafe_convert(Ptr{Cvoid}, $var)
#                 end)
#             end
#         elseif isstructtype(t) && !(t <: NTuple)
#             push!(args, initialize_core(t))
#         else
#             push!(args, initialize(t))
#         end
#     end
#     :($T($(args...)))
# end

# """
# Initialize an intermediate structure, with a `next` chain built from initialized `Tnext` structs.
# """
# @generated function initialize(::Type{T}, Tnext...) where {T<:VulkanStruct}
#     Tnext = getindex.(getproperty.(Tnext, :parameters), 1)
#     vars_types = Symbol.(:ref_, 1:length(Tnext)) .=> core_type.(Tnext)
#     body = [:($var = Ref{$t}()) for (var, t) in vars_types]
#     vks = initialize_core(core_type(T), vars_types...)
#     Expr(:block, body..., :($T($vks, Any[$(first.(vars_types)...)])))
# end

# """
# Initialize a high-level structure, with a `next` chain built from initialized `Tnext` structs.
# """
# @generated function initialize(::Type{T}, Tnext...) where {T<:HighLevelStruct}
#     Tnext = getindex.(getproperty.(Tnext, :parameters), 1)
#     args = []
#     for (name, t) in zip(fieldnames(T), fieldtypes(T))
#         if t === StructureType
#             push!(args, structure_type(T))
#         elseif name == :next
#             push!(args, isempty(Tnext) ? C_NULL : initialize(Tnext...))
#         else
#             push!(args, initialize(t))
#         end
#     end
#     Expr(:call, nameof(T), args...)
# end

# @generated function load_next_chain(ptr, next_types...)
#     isempty(next_types) && return C_NULL
#     next_types = only.(getproperty.(next_types, :parameters))
#     T, Ts... = next_types
#     quote
#         @assert ptr ≠ C_NULL
#         vks = Base.unsafe_load(Base.unsafe_convert($(Ptr{core_type(T)}), ptr))
#         $T(vks, $(Ts...))
#     end
# end

@noinline function _load_next_chain(ptr, next_types)
    isempty(next_types) && return C_NULL
    T, Ts... = next_types
    @assert ptr ≠ C_NULL
    vks = Base.unsafe_load(Ptr{core_type(T)}(ptr))
    T(vks, Ts...)
end

load_next_chain(ptr, args...) = _load_next_chain(Base.inferencebarrier(ptr), Base.inferencebarrier(collect(args)))

@specialize
