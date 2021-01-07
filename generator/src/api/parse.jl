parse_text(text) = striplines.(filter(x -> !(x isa LineNumberNode), Meta.parse(join(["quote", text, "end"], ";")).args[1].args))

mutable struct API
    structs::Vector{Expr}
    funcs::Vector{Expr}
    consts::Vector{Expr}
    enums::Vector{Expr}
end

API(d::AbstractDict) = API(d[:struct], d[:function], d[:const], d[:enum])

Base.show(io::IO, api::API) = print(io, "API with $(length(api.structs)) structs, $(length(api.funcs)) functions, $(length(api.consts)) consts and $(length(api.enums)) enums")

function API(code::AbstractString, eval)
    exprs = parse_text(code)
    triaged_exprs = Dict([:struct, :function, :const, :enum] .=> [Expr[], Expr[], Expr[], Expr[]])

    foreach(exprs) do ex
        push!(triaged_exprs[category(ex)], ex)
    end

    filter!(triaged_exprs[:function]) do f
        p = deconstruct(f)
        !isalias(p[:name]) && :fun_ptr ∉ p[:args]
    end

    API(triaged_exprs)
end

parse_api(files::AbstractVector{<:AbstractString}, eval) = API(join(read.(files, String), "\n"), eval)
parse_api(file::AbstractString, eval) = API(read(file, String), eval)
