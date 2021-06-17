const enum_sym = Symbol("@enum")
const cenum_sym = Symbol("@cenum")
const bitmask_enum_sym = Symbol("@bitmask_flag")

isline(x) = false
isline(x::LineNumberNode) = true

function rmlines(ex)
    @match ex begin
        Expr(:macrocall, m, _...) => Expr(:macrocall, m, nothing, filter(!isline, ex.args[3:end])...)
        ::Expr                    => Expr(ex.head, filter(!isline, ex.args)...)
        a                         => a
    end
end

symbols(ex::Expr) = vcat(map(symbols, ex.args)...)
symbols(sym::Symbol) = sym
symbols(x) = []

walk(ex::Expr, inner, outer) = outer(Expr(ex.head, map(inner, ex.args)...))
walk(ex, inner, outer) = outer(ex)

postwalk(f, ex) = walk(ex, x -> postwalk(f, x), f)
prewalk(f, ex) = walk(f(ex), x -> prewalk(f, x), identity)

striplines(ex) = prewalk(rmlines, ex)

function unblock(ex::Expr)
    prewalk(ex) do ex
        ex isa Expr && ex.head == :block && length(ex.args) == 1 ? ex.args[1] : ex
    end
end

function category(ex)
    @match ex begin
        Expr(:struct, _...)                                                                                  => :struct
        Expr(:const, _...)                                                                                   => :const
        Expr(:function, _...) || Expr(:(=), Expr(:call, _...) || Expr(:(::), Expr(:call, _...), _...), _...) => :function
        Expr(:macrocall, &enum_sym || &cenum_sym || &bitmask_enum_sym, _...)                                 => :enum
        :(Core.@doc $_ $docstring $ex)                                                                       => :doc
        _                                                                                                    => nothing
    end
end

prettify(ex) = ex |> striplines |> unblock

isblock(ex) = false
isblock(ex::Expr) = ex.head == :block

broadcast_ex(ex) = Expr(:., ex.args[1], Expr(:tuple, ex.args[2:end]...))
broadcast_ex(ex, cond::Bool) = cond ? broadcast_ex(ex) : ex
broadcast_ex(::Nothing, ::Bool) = nothing

is_broadcast(ex) = @match ex begin
    :($_.($(_...))) => true
    _ => false
end

concat_exs(x) = x
concat_exs(x, y) = Expr(:block, vcat((isblock(x) ? x.args : x), (isblock(y) ? y.args : y))...)
concat_exs(x, y, z...) = foldl(concat_exs, z; init = concat_exs(x, y))

name(sym::Symbol) = sym

function name(ex::Expr)
    @match ex begin
        Expr(:(::), a...)                                                             => name(first(a))
        Expr(:<:, a...)                                                               => name(first(a))
        Expr(:struct, _, _name, _)                                                    => name(_name)
        Expr(:call, f, _...)                                                          => name(f)
        Expr(:., subject, attr, _...)                                                 => name(subject)
        Expr(:function, sig, _...)                                                    => name(sig)
        Expr(:const, assn, _...)                                                      => name(assn)
        Expr(:(=), call, body, _...)                                                  => name(call)
        Expr(:macrocall, &enum_sym || &cenum_sym || &bitmask_enum_sym, _, decl, _...) => name(decl)
        Expr(:kw, _name, _...)                                                        => _name
        :(Core.@doc $_ $docstring $ex)                                                => name(ex)
        Expr(expr_type, _...)                                                         => error("Can't extract name from ", expr_type, " expression:\n", "    $ex\n")
    end
end

type(ex::Expr) = @match ex begin
    :($_ <: $T) || :($_::$T) || :(::$T) => T
    _ => nothing
end

function deconstruct(ex::Expr)
    ex = striplines(ex)
    dict = Dict{Symbol,Any}(:category => category(ex))
    @switch ex begin
        @case Expr(:struct, is_mutable, decl, fields)
        dict[:name] = name(decl)
        dict[:decl] = decl
        dict[:is_mutable] = is_mutable
        dict[:fields] = []
        dict[:constructors] = []
        fields = @match fields begin
            Expr(:block, fields...) => fields
            _ => [fields]
        end
        for field ∈ fields
            field isa LineNumberNode && continue
            @when :function = category(field) begin
                push!(dict[:constructors], deconstruct(field))
                @otherwise
                push!(dict[:fields], field)
            end
        end

        @case Expr(:const, Expr(:(=), sym, val))
        dict[:name] = sym
        dict[:value] = val

        @case Expr(func_sym, :($call::$return_type), body) || Expr(func_sym, :($call::$return_type), body)
        dict = deconstruct(Expr(func_sym, call, body))
        dict[:return_type] = return_type

        @case Expr(:(=), call, body) || Expr(:function, call, body)
        sig_params = deconstruct(call)
        dict[:name] = sig_params[:name]
        dict[:args] = sig_params[:args]
        dict[:kwargs] = sig_params[:kwargs]
        dict[:body] = body
        dict[:short] = ex.head ≠ :function

        @case Expr(:call, f, args...)
        dict[:name] = f
        dict[:args] = []
        dict[:kwargs] = []
        for arg ∈ args
            @switch arg begin
                @case Expr(:parameters, kwargs...)
                append!(dict[:kwargs], kwargs)
                @case _arg
                push!(dict[:args], arg)
            end
        end

        @case :(Core.@doc $_ $docstring $ex)
        dict[:docstring] = docstring
        dict[:ex] = ex

        @case Expr(:macrocall, m, _, decl, args...)
        dict[:macro] = m
        dict[:name] = name(decl)
        dict[:type] = decl isa Symbol ? Int : type(decl)
        dict[:decl] = decl
        dict[:values] = @match args begin
            [::Expr] => rmlines(args[1].args)
            x        => x
        end

        @case _
        error("Matching non-exhaustive for expr $ex\n$(dump(ex))")
    end
    dict
end

function reconstruct_call(d::Dict; is_decl = true)
    args = get(d, :args, [])
    kwargs = get(d, :kwargs, [])

    if !is_decl
        args = name.(args)
        kwargs = name.(kwargs)
    end

    call = @match (args, kwargs) begin
        (args, []) => Expr(:call, d[:name], args...)
        (args, kwargs) => Expr(:call, d[:name], Expr(:parameters, kwargs...), args...)
    end
    rt = get(d, :return_type, nothing)
    if isnothing(rt) || !is_decl
        call
    else
        :($call::$rt)
    end
end

function reconstruct_documented(d::Dict, ex)
    docstring = get(d, :docstring, "")
    isempty(docstring) ? ex : :(Core.@doc $docstring $ex)
end

function reconstruct(d::Dict)
    category = d[:category]
    ex = @match category begin
        :struct   => begin
            props = [get(d, :fields, []); get(d, :constructors, [])]
            Expr(:struct, get(d, :is_mutable, false), d[:decl], Expr(:block, props...))
        end
        :const    => :(const $(d[:name]) = $(d[:value]))
        :enum     => Expr(:macrocall, d[:macro], nothing, d[:decl], Expr(:block, d[:values]...))
        :function => begin
            call = reconstruct_call(d)
            get(d, :short, false) ? :($call = $(d[:body])) : Expr(:function, call, d[:body])
        end
        :doc      => :(Core.@doc $(d[:docstring]) $(d[:ex]))
        _         => error("Category $category cannot be constructed")
    end
    if category == :enum
        ex
    else
        unblock(ex)
    end
end

function to_expr(p::Dict)
    p[:category] == :function && get(p, :relax_signature, false) && relax_function_signature!(p)
    reconstruct(p)
end
