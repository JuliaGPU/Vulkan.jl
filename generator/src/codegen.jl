struct Statement
    body
    assigned_id
    Statement(body::Expr, assigned_id = nothing) = new(body, isnothing(assigned_id) ? nothing : string(assigned_id))
    Statement(body::Symbol, assigned_id = nothing) = new(body, isnothing(assigned_id) ? nothing : string(assigned_id))
    Statement(body::AbstractString, assigned_id = nothing) = new(Meta.parse(body), assigned_id)
end

Base.show(io::IO, st::Statement) = print(io, prettify(st.body))

abstract type Declaration end

(T::Type{<:Declaration})(ex::Expr; prettify=true) = T(string(prettify ? MacroTools.prettify(ex) : ex))

name(decl::Declaration) = decl.name

mutable struct SDefinition <: Declaration
    name::AbstractString
    is_mutable::Bool
    fields::OrderedDict
    abstract_type
    inner_constructor
    function SDefinition(name, is_mutable, fields, abstract_type, inner_constructor)
        if !isnothing(inner_constructor)
            @assert inner_constructor.name == name
        end
        new(name, is_mutable, fields, abstract_type, inner_constructor)
    end
end

SDefinition(name::AbstractString, is_mutable::Bool, fields::OrderedDict) = SDefinition(name, is_mutable, fields, nothing, nothing)
SDefinition(name::AbstractString, is_mutable::Bool; fields=()) = SDefinition(name, is_mutable, OrderedDict(fields))

function SDefinition(str::AbstractString)
    split_str = strip.(split(str, "\n"))
    def = split_str[1]
    def_parts = split(def, " ")
    is_mutable = def_parts[1] == "mutable"
    name = is_mutable ? def_parts[3] : def_parts[2]
    field_decls = OrderedDict(decompose_field_decl(field) for field ∈ split_str[2:end - 1]) # skip struct... and end lines
    SDefinition(name, is_mutable, field_decls)
end

struct FDefinition <: Declaration
    name::AbstractString
    signature::Signature
    short::Bool
    body::AbstractArray{Statement}
    docstring::AbstractString
    return_type::AbstractString
end

FDefinition(name::AbstractString, signature::Signature, short::Bool, body::AbstractArray{Statement}) = FDefinition(name, signature, short, body, "", "")
FDefinition(name::AbstractString, signature::Signature, short::Bool, body::AbstractArray{Statement}, docstring::AbstractString) = FDefinition(name, signature, short, body, docstring, "")

function FDefinition(str::AbstractString)
    short = !startswith(str, "function")
    if short
        id, args, body = match(r"([\w\.]+)\((.*)\)\s+=(?!=)(.*)$", str).captures
        body = [Statement(body)]
    else
        id, args = match(r"function ([\w\.]+)\((.*)\)", str).captures
        body = Statement.(split(str, "\n")[2:end - 1]) # remove function... and end lines
    end
    if occursin(";", args)
        args_str, kwargs_str = split(args, ";")
        kwargs = KeywordArgument.(splitargs(kwargs_str))
    else
        args_str, kwargs_str = args, []
        kwargs = []
    end
    args = PositionalArgument.(splitargs(args_str))
    sig = Signature(id, args, kwargs)
    FDefinition(id, sig, short, body)
end

struct CDefinition <: Declaration
    ex::Expr
    CDefinition(ex::Expr) = new(ex)
end

CDefinition(str::AbstractString) = CDefinition(prettify(Meta.parse(str)))

name(cdef::CDefinition) = string(cdef.ex.args[1].args[1])
value(cdef::CDefinition) = string(cdef.ex.args[1].args[2])

@with_kw_noshow struct EDefinition <: Declaration
    ex::Expr
    EDefinition(ex::Expr) = new(ex)
end

EDefinition(str::AbstractString) = EDefinition(prettify(Meta.parse(str)))

function name(decl::EDefinition)
    id = decl.ex.args[3]
    string(id isa Expr ? id.args[1] : id)
end

function fields(edef::EDefinition)
    @assert @capture(edef.ex, (@m_ E_ begin B__ end) | (@m_ E_ B__))
    B
end

DataStructures.OrderedDict(defs::AbstractArray{T}) where {T <: Declaration} = OrderedDict{AbstractString,T}(map(x -> name(x) => x, defs))

function Signature(sdef::SDefinition)
    if isnothing(sdef.inner_constructor)
        args = PositionalArgument.(keys(sdef.fields), values(sdef.fields))
        Signature(sdef.name, args, KeywordArgument[])
    else
        sdef.inner_constructor.signature
    end
end

"""
Generate formatted source code from a declaration.
"""
function generate(decl::Declaration)
    text = string(decl)
    try
        format_text(text)
    catch e
        @error("Invalid input for formatting: $text")
        rethrow(e)
    end
end

Base.show(io::IO, cdef::CDefinition) = print(io, prettify(cdef.ex))

Base.show(io::IO, edef::EDefinition) = print(io, prettify(edef.ex))


function Base.show(io::IO, s::SDefinition)
    def = (s.is_mutable ? "mutable " : "") * "struct $(s.name)" * (isnothing(s.abstract_type) ? "" : "<: $(s.abstract_type)")
    fields = join(typed_field.(keys(s.fields), values(s.fields)), "\n")
    inner_constructor = isnothing(s.inner_constructor) ? "" : "\n$(s.inner_constructor)\n"
    print(io, "$def $fields $inner_constructor end")
end

function Base.show(io::IO, f::FDefinition)
    body = join(string.(f.body), "\n")
    docstring = isempty(f.docstring) ? "" : """\"\"\"
    $(f.docstring)
    \"\"\"
    """
    f_decl = if isempty(f.body)
        f.short && error("Cannot generate short function definition without body.")
        "function $(f.signature) end"
    elseif f.short
        "$(f.signature) = $body"
    else
        """function $(f.signature)
               $(body)
           end"""
    end

    print(io, join((docstring, f_decl)))
end
