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
    name::AbstractString
    value
end

function CDefinition(str::AbstractString)
    split_str = split(str, " ")
    id = split_str[2]
    value_multiline = splitjoin(str, [1], delim="=")
    value = replace(join(splitstrip(value_multiline; delim="\n"), "\n"), "\n" => " ") # remove any whitespace for each line
    CDefinition(id, value)
end

@with_kw_noshow struct EDefinition <: Declaration
    name::AbstractString
    fields
    with_begin_block::Bool = length(fields) > 8
    type = nothing
    enum_macro::AbstractString = "@enum"
end

function EDefinition(str::AbstractString)
    split_str = split(str, " ")
    enum_macro, id = split_str[1:2]
    id, type = decompose_field_decl(id)
    split_str_n = splitstrip(str, delim="\n")
    with_begin_block = last(split(split_str_n[1], " ")) == "begin"
    values = if with_begin_block
        strip.(split(join(split_str_n[2:end - 1], "\n"), "\n"))
    else
        strip.(splitjoin(str, [1, 2], delim=" "))
    end
    values isa Array ? nothing : values = [values]
    EDefinition(id, values, true, type, enum_macro)
end

DataStructures.OrderedDict(defs::AbstractArray{T}) where {T <: Declaration} = OrderedDict{AbstractString,T}(map(x -> x.name => x, defs))

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

Base.show(io::IO, cdef::CDefinition) = print(io, "const $(cdef.name) = $(cdef.value)")

function Base.show(io::IO, edef::EDefinition)
    bg = edef.with_begin_block
    print(io, "$(edef.enum_macro) $(typed_field(edef.name, edef.type)) $(bg ? "begin\n" : "") $(join(edef.fields, bg ? "\n" : " ")) $(bg ? "\nend" : "")")
end

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
