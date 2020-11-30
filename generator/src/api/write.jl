default_spacing(::SDefinition) = "\n"^2
default_spacing(decl::FDefinition) = decl.short && length(generate(decl)) < 150 ? "\n" : "\n"^2
default_spacing(::CDefinition) = "\n"
default_spacing(::EDefinition) = "\n"

unsolved_dependencies(sdef, decls) = collect(values(decls)[findall(keys(decl) .== setdiff(type_dependencies(sdef), keys(decls)))])
are_dependencies_solved(def, decls) = isempty(unsolved_dependencies(def, decls))

function write_api!(io::IO, def::Declaration; spacing)
    write(io, generate(def) * spacing(def))
end

"""
Write a wrapped API to `destfile`.
Spacing options can be controlled by providing the corresponding argument with a function that takes a Declaration type as argument.
"""
function Base.write(w_api::WrappedAPI, destfile; spacing=default_spacing)
    decls = OrderedDict((vcat(w_api.consts, w_api.enums, w_api.structs, w_api.bags)...)...)
    decls_order = resolve_dependencies(decls)
    check_dependencies(decls, decls_order)
    cp("$(@__DIR__)/wrapping/prewrap.jl", destfile; force=true)
    open(destfile, "a+") do io
        println(io)

        for fdef ∈ values(w_api.extended_vk_constructors)
            write_api!(io, fdef; spacing)
        end

        for decl ∈ getindex.(Ref(decls), decls_order)
            write_api!(io, decl; spacing)
        end
        write(io, "\n\n" * join(w_api.misc, "\n") * "\n\n")

        write(io, "\n\n")
        write_api!.(Ref(io), values(w_api.funcs); spacing)

        write_exports(io, w_api)
    end

    format(destfile)
    nothing
end

function write_exports(io::IO, w_api::WrappedAPI)
    write(io, "\n\n")

    enum_assignments = vcat(fields.(values(w_api.enums))...)
    enums_values = map(x -> x.args[1], enum_assignments)

    all_decls = vcat(collect.(values.(vcat(w_api.consts, w_api.enums, w_api.structs, w_api.bags, w_api.funcs)))...)
    all_decl_symbols = Symbol.(unique(name.(all_decls)))

    ignored_symbols = Symbol.(vcat("Base.convert", "Base", extension_types))
    
    exports = :(export $(all_decl_symbols...), $(enums_values...))

    filter!(x -> x ∉ ignored_symbols, exports.args)

    write(io, string(exports))
end
