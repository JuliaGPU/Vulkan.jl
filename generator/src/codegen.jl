"""Code generator which aims at automating idenfitied patterns.
"""

abstract type Declaration end

generate(cgs::Declaration) = error("No generator available for type $(typeof(cgs))")

struct Statement
    body::AbstractString
    assigned_id
end


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


struct FDefinition <: Declaration
    name::AbstractString
    signature::Signature
    short::Bool
    body::AbstractArray{Statement}
    docstring::AbstractString
    return_type::AbstractString
end

struct CDefinition <: Declaration
    name::AbstractString
    value
end

@with_kw struct EDefinition <: Declaration
    name::AbstractString
    fields
    with_begin_block::Bool = length(fields) > 8
    type = nothing
    enum_macro::AbstractString = "@enum"
end

OrderedDict(defs::AbstractArray{T}) where {T <: Declaration} = OrderedDict{AbstractString,T}(map(x -> x.name => x, defs))

generate(cdef::CDefinition) = format_text("const $(cdef.name) = $(cdef.value)")
function generate(edef::EDefinition)
    bg = edef.with_begin_block
    format_text("$(edef.enum_macro) $(typed_field(edef.name, edef.type)) $(bg ? "begin\n" : "") $(join(edef.fields, bg ? "\n" : " ")) $(bg ? "\nend" : "")")
end

Statement(body::AbstractString) = Statement(strip(body), nothing)
SDefinition(name::AbstractString, is_mutable::Bool, fields::OrderedDict) = SDefinition(name, is_mutable, fields, nothing, nothing)
SDefinition(name::AbstractString, is_mutable::Bool; fields=()) = SDefinition(name, is_mutable, OrderedDict(fields))
Signature(sdef::SDefinition) = isnothing(sdef.inner_constructor) ? Signature(sdef.name, PositionalArgument.(keys(sdef.fields), values(sdef.fields)), KeywordArgument[]) : sdef.inner_constructor.signature

function extract_args(str)
    split_str = split(str, ";") # get kwargs first
    @assert length(split_str) <= 2 "More than one kwargs separator ';' in arguments ($str)"
    args, kwargs = first(split_str), length(split_str) == 1 ? nothing : split_str[2]
    splitstrip(args), splitstrip(kwargs)
end

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

FDefinition(name::AbstractString, signature::Signature, short::Bool, body::AbstractArray{Statement}) = FDefinition(name, signature, short, body, "", "")
FDefinition(name::AbstractString, signature::Signature, short::Bool, body::AbstractArray{Statement}, docstring::AbstractString) = FDefinition(name, signature, short, body, docstring, "")

function CDefinition(str::AbstractString)
    split_str = split(str, " ")
    id = split_str[2]
    value_multiline = splitjoin(str, [1], delim="=")
    value = replace(join(splitstrip(value_multiline; delim="\n"), "\n"), "\n" => " ") # remove any whitespace for each line
    CDefinition(id, value)
end

function EDefinition(str::AbstractString)
    split_str = split(str, " ")
    enum_macro, id = split_str[1:2]
    id, type = decompose_field_decl(id)
    split_str_n = splitstrip(str, delim="\n")
    with_begin_block = last(split(split_str_n[1], " ")) == "begin"
    values = with_begin_block ? strip.(split(join(split_str_n[2:end - 1], "\n"), "\n")) : strip.(splitjoin(str, [1, 2], delim=" "))
    EDefinition(id, values, with_begin_block, type, enum_macro)
end

function SDefinition(str::AbstractString)
    split_str = strip.(split(str, "\n"))
    def = split_str[1]
    def_parts = split(def, " ")
    is_mutable = def_parts[1] == "mutable"
    name = is_mutable ? def_parts[3] : def_parts[2]
    field_decls = OrderedDict(decompose_field_decl(field) for field ∈ split_str[2:end - 1]) # skip struct... and end lines
    SDefinition(name, is_mutable, field_decls)
end

function generate(statements::AbstractArray{Statement})
    isempty(statements) && return ""
    format_text(join(getproperty.(statements, :body), "\n"))
end

function generate(s::SDefinition)
    def = (s.is_mutable ? "mutable " : "") * "struct $(s.name)" * (isnothing(s.abstract_type) ? "" : "<: $(s.abstract_type)")
    fields = join(typed_field.(keys(s.fields), values(s.fields)), "\n")
    inner_constructor = isnothing(s.inner_constructor) ? "" : "\n" * generate(s.inner_constructor) * "\n"
    format_text("$def $fields $inner_constructor end")
end

function generate(f::FDefinition)
    body = generate(f.body)
    docstring = isempty(f.docstring) ? "" : """\"\"\"
    $(f.docstring)
    \"\"\"\n"""
    if f.short
        str = docstring * generate(f.signature) * " = " * body
    else
        str = docstring * "function $(generate(f.signature)) $(body) end"
    end
    format_text(str)
end