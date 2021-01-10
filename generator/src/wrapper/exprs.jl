const enum_sym = Symbol("@enum")
const cenum_sym = Symbol("@cenum")

isline(x) = false
isline(x::LineNumberNode) = true

function rmlines(ex)
    @match ex begin
        Expr(:macrocall, m, _...) => Expr(:macrocall, m, nothing, filter(x->!isline(x), ex.args[3:end])...)
        :: Expr                   => Expr(ex.head, filter(!isline, ex.args)...)
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

function category(ex)
    @match ex begin
        Expr(:struct, _...)                                          => :struct
        Expr(:const, _...)                                           => :const
        Expr(:function, _...) || Expr(:(=), Expr(:call, _...), _...) => :function
        Expr(:macrocall, &enum_sym || &cenum_sym, _...)              => :enum
        _                                                            => nothing
    end
end

prettify(ex) = ex |> striplines |> unblock

isblock(ex) = false
isblock(ex::Expr) = ex.head == :block

concat_exs(x, y) = Expr(:block, vcat((isblock(x) ? x.args : x), (isblock(y) ? y.args : y))...)

name(sym::Symbol) = sym

function name(ex::Expr)
    @match ex begin
        Expr(:(::), a...)                  => name(first(a))
        Expr(:<:, a...)                    => name(first(a))
        Expr(:struct, _, _name, _)         => name(_name)
        Expr(:call, f, _...)               => name(f)
        Expr(:., subject, attr, _...)      => name(subject)
        Expr(:function, sig, _...)         => name(sig)
        Expr(:const, assn, _...)           => name(assn)
        Expr(:(=), call, body, _...)       => name(call)
        Expr(:macrocall, &enum_sym || &cenum_sym, _, decl, _...) => name(decl)
        Expr(:kw, _name, _...) => _name
        Expr(expr_type,  _...)             => error("Can't extract name from ", expr_type, " expression:\n", "    $ex\n")
    end
end

type(ex::Expr) = @match ex begin
    :($_<:$T) || :($_::$T) || :(::$T) => T
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
            for field ∈ fields.args
                field isa LineNumberNode && continue
                @when :function = category(field) begin
                    push!(dict[:constructor], deconstruct(field))
                @otherwise
                    push!(dict[:fields], field)
                end
            end

        @case Expr(:const, Expr(:(=), sym, val))
            dict[:name] = sym
            dict[:value] = val

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

        @case Expr(:macrocall, m, _, decl, args...)
            dict[:macro] = m
            dict[:name] = name(decl)
            dict[:type] = decl isa Symbol ? Int : type(decl)
            dict[:decl] = decl
            dict[:values] = @match args begin
                                [::Expr] => rmlines(args[1].args)
                                x        => x
                            end
    end
    dict
end

function reconstruct_call(d::Dict)
    @match (get(d, :args, []), get(d, :kwargs, [])) begin
        (args, []) => Expr(:call, d[:name], args...)
        (args, kwargs) => Expr(:call, d[:name], Expr(:parameters, kwargs...), args...)
    end
end

function reconstruct(d::Dict)
    category = d[:category]
    ex = @match category begin
        :struct                       => begin
                                             props = vcat(get(d, :fields, []), get(d, :constructors, []))
                                             Expr(:struct, get(d, :is_mutable, false), d[:decl], Expr(:block, props...))
                                         end
        :const                        => :(const $(d[:name]) = $(d[:value]))
        :enum                         => Expr(:macrocall, d[:macro], nothing, d[:decl], Expr(:block, d[:values]...))
        :function                     => begin
                                            call = reconstruct_call(d)
                                            get(d, :short, false) ? :($call = $(d[:body])) : Expr(:function, call, d[:body])
                                         end
        _                             => error("Category $category cannot be constructed")
    end
    unblock(ex)
end

function unblock(ex::Expr)
    prewalk(ex) do ex
        ex isa Expr && ex.head == :block && length(ex.args) == 1 ? ex.args[1] : ex
    end
end
