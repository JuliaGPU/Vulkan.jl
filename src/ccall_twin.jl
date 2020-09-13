struct Substitute
    expr
    id
    Substitute(expr) = new(expr, gensym())
end

function handle_interpolated_function!(lowering, func)
    if Meta.isexpr(func, :$)
        push!(lowering, Expr(:(=), :func, esc(func.args[1])))
        name = QuoteNode(func.args[1])
        func = :func
        check = quote
            if !isa(func, Ptr{Cvoid})
                name = $name
                throw(ArgumentError("interpolated function `$name` was not a Ptr{Cvoid}, but $(typeof(func))"))
            end
        end
        push!(lowering, check)
    else
        func = esc(func)
    end
    func
end

default_twin_f(type, twin) = fieldnames(twin), fieldtypes(type)

function substitute_twin(type)
    is_twinned = type ∈ keys(twin_structs)
    # replace the struct by its twin, if it has one
    if is_twinned
        twin_type_info = twin_structs[type]
        twin_type_eval, twin_type_f = typeof(twin_type_info) <: Tuple ? twin_type_info : (twin_type_info, nothing)
        twin_type = Symbol(twin_type_eval)
        @debug "Type $type twinned with $twin_type"
        !isnothing(twin_type_f) && return twin_type_f(type, twin_type_eval)
        default_twin_f(type, twin_type_eval)
    else
        fieldnames(type), fieldtypes(type)
    end
end

function convert_struct!(lowering, gc_roots, arg, type, i, l, namespace)
    args = []
    type_eval = eval(type)

    for (j, (x, y)) ∈ enumerate(zip(substitute_twin(type_eval)...))
        realarg = convert_level!(lowering, gc_roots, x, y, j, l+1, [namespace..., arg])
        push!(args, realarg)
    end
    struct_arg = Symbol(join([namespace..., string(arg, i, "_L", l)], "_"))
    args_ns = esc.([Symbol(join([namespace..., arg], "_")) for arg ∈ args])
    # @debug "$struct_arg => $type($(join(args, ", ")))"
    push!(lowering, :($struct_arg = $(esc(type))($(args...)))) # initialize new struct
    struct_arg
end

function convert_level!(lowering, gc_roots, arg, sub::Substitute, i, l, namespace)
    # sym_ns = Symbol(join([namespace..., string(arg, i, "_L", l)], "_"))
    push!(lowering, :($(sub.id) = $(esc(sub.expr(Meta.parse(join([namespace..., arg], ".")))))))
    sub.id
end

function convert_level!(lowering, gc_roots, arg, type, i, l, namespace) where {T}
    etype = esc(type)
    type_eval = eval(type)
    # @info namespace
    if isstructtype(type_eval)
        convert_struct!(lowering, gc_roots, arg, type, i, l, namespace)
    elseif type_eval <: Ptr && !any(Base.:<:.(Ref(eltype(type_eval)), [Cstring, AbstractString, Number, AbstractArray]))
        if isstructtype(eltype(type_eval))
            arg = convert_struct!(lowering, gc_roots, arg, Symbol(eltype(type_eval)), i, l, namespace)
        else
            arg = Symbol(join([namespace..., arg], "."))
        end
        sym_ns = Symbol("$(arg)_ref")
        sym2_ns = Symbol("$(arg)_ptr")
        arg_ns = arg
        push!(lowering, :($sym_ns = _cconvert_ptr($type, $arg_ns)))
        push!(lowering, :($sym2_ns = Base.unsafe_convert($etype, $sym_ns)))
        push!(gc_roots, sym_ns)
        sym2_ns
    else
        sym_ns = Symbol(join([namespace..., string(arg, i, "_L", l, "_gcroot")], "_"))
        earg = isempty(namespace) ? esc(arg) : esc(Meta.parse(join([namespace..., arg], ".")))
        etype = esc(type)
        push!(lowering, :($sym_ns = _cconvert($etype, $earg)))
        if any(Base.:<:.(Ref(type_eval), [Ptr, Cstring]))
            sym2_ns = Symbol(join([namespace..., string(arg, i, "_L", l)], "_"))
            push!(lowering, :($sym2_ns = Base.unsafe_convert($etype, $sym_ns)))
            push!(gc_roots, sym_ns)
            sym2_ns
        else
            sym_ns
        end
    end
end

function convert_all_levels!(lowering, gc_roots, args, types)
    realargs = convert_level!.(Ref(lowering), Ref(gc_roots), args, types, 1:length(args), fill(1, length(args)), Ref([]))
    # push!(lowering, :(@debug("Rooted variables: \n", $(gc_roots...))))
    realargs
end

function _ccall_macro_lower(convention, func, rettype, types, args, nreq)
    lowering = []
    realargs = []
    gc_roots = []

    # if interpolation was used, ensure variable is a function pointer at runtime.
    func = handle_interpolated_function!(lowering, func)

    realargs = convert_all_levels!(lowering, gc_roots, args, types)
    # println.(lowering)
    # display(gc_roots)
    # display(realargs)
    etypes = Expr(:call, Expr(:core, :svec), types...)
    exp = Expr(:foreigncall,
               func,
               esc(rettype),
               esc(etypes),
               nreq,
               QuoteNode(convention),
               realargs..., gc_roots...)
    push!(lowering, exp)

    return Expr(:block, lowering...)
end

macro ccall_twin(expr)
    return _ccall_macro_lower(:ccall, Base.ccall_macro_parse(expr)...)
end