mutable struct API
    source
    structs::OrderedDict
    funcs::OrderedDict
    consts::OrderedDict
    enums::OrderedDict
    eval
end

API(source, structs, funcs, consts, enums) = API(source, structs, funcs, consts, enums, nothing)

extract_fields(apis, sym) = OrderedDict(vcat(collect.(getproperty.(apis, sym))...))
merge(apis::API...) = API(getproperty.(apis, :source), extract_fields.(Ref(apis), [:structs, :funcs, :consts, :enums])..., nothing)

Base.show(io::IO, pf::API) = print(io, "API with $(length(pf.structs)) structs, $(length(pf.funcs)) functions, $(length(pf.consts)) consts and $(length(pf.enums)) enums from $(pf.source)")


function definition_begins(line, ::Type{FDefinition})
    !isnothing(match(r"\w+\(.*\)\s+=(?!=)", line)) || !isnothing(match(r"^function ", line))
end
definition_ends(line, ::Type{FDefinition}) = strip(line) == "end" || (definition_begins(line, FDefinition) && isnothing(match(r"function \w+", line)))

definition_begins(line, ::Type{SDefinition}) = split(line, " ")[1] ∈ ["mutable", "struct"]
definition_ends(line, ::Type{SDefinition}) = (definition_begins(line, SDefinition) && split(line, " ")[end] == "end") || strip(line) == "end"

definition_begins(line, ::Type{CDefinition}) = startswith(line, "const ")
definition_ends(line, ::Type{CDefinition}) = !endswith(strip(line), ",")


definition_begins(line, ::Type{EDefinition}) = strip(first(split(line, " "))) ∈ ["@enum", "@cenum"]
definition_ends(line, ::Type{EDefinition}) = (definition_begins(line, EDefinition) && strip(split(line, " ")[end]) != "begin") || "end" ∈ strip.(split(line, " "))

function detect_definition(io, T)
    lines = String[]
    line = readline(io)
    if eof(io)
        definition_begins(line, T) && definition_ends(line, T) && return [line]
        return
    end
    while !definition_begins(line, T)
        line = readline(io)
        eof(io) && definition_begins(line, T) && definition_ends(line, T) && return [line]
        eof(io) && return
    end
    push!(lines, line)
    while !definition_ends(line, T)
        line = readline(io)
        eof(io) && !definition_ends(line, T) && error("EOF while scanning for end of definition for type $T")
        push!(lines, line)
    end
    lines
end

function parse_for_definition(file, ::Type{T}) where {T <: Declaration}
    defs = T[]
    open(file) do io
        while !eof(io)
            lines = detect_definition(io, T)
            if !isnothing(lines)
                decl = T(join(lines, "\n"))
                !(decl isa FDefinition && last(decl.signature.args).name == "fun_ptr") && !isalias(decl.name) ? push!(defs, decl) : nothing
            end
        end
    end
    defs
end

function convert_constptr_to_struct!(api)
    for cdef ∈ values(api.consts)
        if is_opaque(api.eval(cdef.value)) && !startswith(cdef.name, "PFN") && !isalias(cdef.name) # ignore function pointers
            sdef = parse_ptr(cdef.name)
            api.structs[sdef.name] = sdef
        end
    end
end

function parse_ptr(sym)
    base = remove_prefix(sym)
    SDefinition(sym, false, OrderedDict("handle" => "Ptr{Nothing}"))
end

function API(file, eval_symbol)
    defs = []
    for decl ∈ [SDefinition, FDefinition, CDefinition, EDefinition]
        push!(defs, parse_for_definition(file, decl))
    end
    api = API(file, OrderedDict.(defs)...)
    api.eval = eval_symbol
    convert_constptr_to_struct!(api)
    api
end

API(files::AbstractArray{<: AbstractString}, eval_symbol) = merge(API.(files, eval_symbol)...)
