default_spacing(::SDefinition) = "\n"^2
default_spacing(decl::FDefinition) = decl.short && length(generate(decl)) < 150 ? "\n" : "\n"^2
default_spacing(::CDefinition) = "\n"
default_spacing(::EDefinition) = "\n"

unsolved_dependencies(sdef, decls) = collect(values(decls)[findall(keys(decl) .== setdiff(type_dependencies(sdef), keys(decls)))])
are_dependencies_solved(def, decls) = isempty(unsolved_dependencies(def, decls))

function write_api!(io::IO, def::Declaration; spacing)
    write(io, generate(def) * spacing(def))
end

exports(symbols) = "export $(join_args(symbols))"

"""
Write a wrapped API to `destfile`.
Spacing options can be controlled by providing the corresponding argument with a function that takes a Declaration type as argument.
"""
function Base.write(w_api::WrappedAPI, destfile; spacing=default_spacing)
    decls = OrderedDict((vcat(w_api.consts, w_api.enums, w_api.structs, w_api.bags)...)...)
    decls_order = resolve_dependencies(decls)
    check_dependencies(decls, decls_order)
    open(destfile, "w+") do io
        write(io, read(joinpath(@__DIR__, "wrapping", "prewrap.jl"), String))
        println(io)
    end
    for fdef ∈ values(w_api.extended_vk_constructors)
        open(destfile, "a+") do io
            write_api!(io, fdef; spacing)
        end
    end
    for decl ∈ getindex.(Ref(decls), decls_order)
        open(destfile, "a+") do io
            write_api!(io, decl; spacing)
        end
    end
    open(destfile, "a+") do io
        write(io, "\n\n" * join(w_api.misc, "\n") * "\n\n")
    end
    open(destfile, "a+") do io
        write(io, "\n\n")
        write_api!.(Ref(io), collect(values(w_api.funcs)); spacing)
        write(io, "\n\n" * exports(unique(vcat((map(x -> x.name, filter(x -> x.name ∉ ["Base.convert", "Base", extension_types...], vcat(map(collect ∘ values, [decls, w_api.funcs])...)))), collect(Iterators.flatten(map.(Ref(x -> strip.(first.(split.(x, "=")))), getproperty.(values(w_api.enums), :fields))))))))
    end

    format(destfile)
    nothing
end
