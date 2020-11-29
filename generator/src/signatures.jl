abstract type Argument end

struct PositionalArgument <: Argument
    name::AbstractString
    type
end

function PositionalArgument(decl::AbstractString)
    name_split = split(decl, "::")
    name = first(name_split)
    type = length(name_split) == 2 ? last(name_split) : nothing
    PositionalArgument(name, type)
end

types(arg::AbstractArray{PositionalArgument}) = getproperty.(arg, :type)

typed_field(name, type) = isnothing(type) || type == "" ? name : join([name, type], "::")

Base.show(io::IO, arg::PositionalArgument) = print(io, typed_field(arg.name, arg.type))

struct KeywordArgument <: Argument
    name::AbstractString
    default
    KeywordArgument(name, default) = new(name, string(default))
end

function KeywordArgument(decl::AbstractString)
    name_split = split(decl, "=")
    name = first(name_split)
    default = length(name_split) == 2 ? last(name_split) : ""
    KeywordArgument(name, default)
end

Base.show(io::IO, arg::KeywordArgument) = print(io, arg.name * (isempty(arg.default) ? "" : "=" * string(arg.default)))

Base.convert(T::Type{KeywordArgument}, arg::PositionalArgument) = T(arg.name, nothing)

Base.names(arg::AbstractArray{<:Argument}) = getproperty.(arg, :name)

function decompose_field_decl(typed_field)
    parts = split(typed_field, "::")
    length(parts) == 1 ? parts[1] => nothing : parts[1] => parts[2]
end

Base.join(args::AbstractArray{<:Argument}) = join_args(string.(args))

struct Signature
    name::AbstractString
    args::AbstractArray{PositionalArgument}
    kwargs::AbstractArray{KeywordArgument}
end

function Signature(m::Method)
    args_and_types = Base.arg_decl_parts(m)[2][2:end]
    arg_names = getindex.(args_and_types, 1)
    arg_types = map(x -> isempty(x) ? nothing : x, getindex.(args_and_types, 2))
    args = PositionalArgument.(arg_names, arg_types)
    kwargs = KeywordArgument.(String.(map(x -> isnothing(x) ? "" : x, Base.kwarg_decl(m))))
    sig = Signature(String(m.name), args, kwargs)
end

"""Get argument names from the first method of function f
"""
function Signature(f)
    ms = methods(f)
    length(ms) > 1 && @warn "Function $f has $(length(ms)) methods"
    Signature(first(ms))
end

argnames(sig::Signature) = [getproperty.(sig.args, :name)..., getproperty.(sig.kwargs, :name)...]

argtypes(sig::Signature) = getproperty.(sig.args, :type)

Base.show(io::IO, sig::Signature) = print(io, sig.name, "(", join(sig.args), isempty(sig.kwargs) ? "" : ("; " * join(sig.kwargs)), ")")
