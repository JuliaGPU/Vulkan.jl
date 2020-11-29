parse_text(text) = prettify.(filter(x -> !(x isa LineNumberNode), Meta.parse(join(["quote", text, "end"], ";")).args[1].args))

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
    exprs = parse_text(read(file, String))
    for decl ∈ [SDefinition, FDefinition, CDefinition, EDefinition]
        decl_defs = decl[]
        map(exprs) do ex
            ((ex.head == :struct && decl == SDefinition)
            || (isexpr(longdef(ex), :function) && decl == FDefinition && (@capture(longdef(ex), function f_(args__) b_ end) && last(args) ≠ :fun_ptr && !isalias(string(f))))
            || (@capture(ex, const a_ = b_) && decl == CDefinition && !isalias(string(a)))
            || (ex.head == :macrocall && decl == EDefinition)
            ) && push!(decl_defs, decl(ex))
        end
        push!(defs, decl_defs)
    end
    api = API(file, OrderedDict.(defs)...)
    api.eval = eval_symbol
    convert_constptr_to_struct!(api)
    api
end

API(files::AbstractArray{<: AbstractString}, eval_symbol) = merge(API.(files, eval_symbol)...)
