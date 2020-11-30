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
        if is_opaque(api.eval(value(cdef))) && !startswith(name(cdef), "PFN") && !isalias(name(cdef)) # ignore function pointers
            sdef = parse_ptr(name(cdef))
            api.structs[sdef.name] = sdef
        end
    end
end

function parse_ptr(sym)
    base = remove_prefix(sym)
    SDefinition(sym, false, OrderedDict("handle" => "Ptr{Nothing}"))
end

function API(file, eval_symbol)
    exprs = parse_text(read(file, String))
    sdefs, fdefs, cdefs, edefs = SDefinition[], FDefinition[], CDefinition[], EDefinition[]
    foreach(exprs) do ex
        if ex.head == :struct
            push!(sdefs, SDefinition(ex; prettify=false))
        elseif ex.head == :function || (ex.head == :(=) && ex.args[1].head == :call)
            ld_ex = longdef(ex)
            if (@capture(ld_ex, function f_(args__) b_ end) && last(args) ≠ :fun_ptr && !isalias(string(f)))
                push!(fdefs, FDefinition(ex; prettify=false))
            end
        elseif @capture(ex, const a_ = b_) && !isalias(string(a))
            push!(cdefs, CDefinition(ex; prettify=false))
        elseif ex.head == :macrocall
            push!(edefs, EDefinition(ex; prettify=false))
        end
    end
    api = API(file, OrderedDict.((sdefs, fdefs, cdefs, edefs))...)
    api.eval = eval_symbol
    convert_constptr_to_struct!(api)
    api
end

API(files::AbstractArray{<: AbstractString}, eval_symbol) = merge(API.(files, eval_symbol)...)
