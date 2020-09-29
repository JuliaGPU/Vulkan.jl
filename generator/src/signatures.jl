abstract type Argument end

struct PositionalArgument <: Argument
    name::AbstractString
    type
end

struct KeywordArgument <: Argument
    name::AbstractString
    default
end

function KeywordArgument(decl::AbstractString)
    name_split = split(decl, "=")
    name = first(name_split)
    default = length(name_split) == 2 ? last(name_split) : nothing
    KeywordArgument(name, default)
end
function PositionalArgument(decl::AbstractString)
    name_split = split(decl, "::")
    name = first(name_split)
    type = length(name_split) == 2 ? last(name_split) : nothing
    PositionalArgument(name, type)
end

Base.convert(T::Type{KeywordArgument}, arg::PositionalArgument) = T(arg.name, nothing)

Base.names(arg::AbstractArray{<: Argument}) = getproperty.(arg, :name)
types(arg::AbstractArray{PositionalArgument}) = getproperty.(arg, :type)

struct Signature
    name::AbstractString
    args::AbstractArray{PositionalArgument}
    kwargs::AbstractArray{KeywordArgument}
end

argnames(sig::Signature) = [getproperty.(sig.args, :name)..., getproperty.(sig.kwargs, :name)...]
argtypes(sig::Signature) = getproperty.(sig.args, :type)

function Signature(m::Method)
    args_and_types = Base.arg_decl_parts(m)[2][2:end]
    arg_names = getindex.(args_and_types, 1)
    arg_types = map(x -> isempty(x) ? nothing : x, getindex.(args_and_types, 2))
    args = PositionalArgument.(arg_names, arg_types)
    kwargs = KeywordArgument.(String.(Base.kwarg_decl(m)))
    sig = Signature(String(m.name), args, kwargs)
end

"""Get argument names from the first method of function f
"""
function Signature(f)
    ms = methods(f)
    length(ms) > 1 && @warn "Function $f has $(length(ms)) methods"
    Signature(first(ms))
end

typed_field(name, type) = isnothing(type) || type == "" ? name : join([name, type], "::") 
function decompose_field_decl(typed_field)
    parts = split(typed_field, "::")
    length(parts) == 1 ? parts[1] => nothing : parts[1] => parts[2]
end

Base.string(arg::KeywordArgument) = arg.name * (isnothing(arg.default) ? "" : "=" * string(arg.default))
Base.string(arg::PositionalArgument) = typed_field(arg.name, arg.type)
Base.join(args::AbstractArray{<: Argument}) = join_args(string.(args))
Base.show(io::IO, sig::Signature) = print(io, sig.name, "(", join(sig.args), isempty(sig.kwargs) ? "" : ("; " * join(sig.kwargs)), ")")


generate(sig::Signature) = join([sig.name, "(", join(sig.args), isempty(sig.kwargs) ? "" : ("; " * join(sig.kwargs)), ")"])