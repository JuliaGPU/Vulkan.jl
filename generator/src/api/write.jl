spacing(::SDefinition) = "\n"^2
spacing(decl::FDefinition) = decl.short && length(generate(decl)) < 150 ? "\n" : "\n"^2
spacing(::CDefinition) = "\n"
spacing(::EDefinition) = "\n"

decl_block(decl::Declaration) = generate(decl) * spacing(decl)

function print_block(io::IO, decls)
    print.(Ref(io), decl_block.(decls))
    println(io)
end

"""
Write a wrapped API to `destfile`.
Spacing options can be controlled by providing the corresponding argument with a function that takes a Declaration type as argument.
"""
function Base.write(w_api::WrappedAPI, destfile)
    decls = vcat(collect.(values.([w_api.consts, w_api.enums, w_api.structs, w_api.bags]))...)
    decls_order = resolve_dependencies(name.(decls), decls)
    ordered_decls = decls[decls_order]
    check_dependencies(ordered_decls)

    funcs = values(w_api.funcs)
    extended_vk_constructors = values(w_api.extended_vk_constructors)

    cp("$(@__DIR__)/wrapping/prewrap.jl", destfile; force=true)

    open(destfile, "a+") do io
        println(io)

        print_block(io, extended_vk_constructors)
        print_block(io, ordered_decls)
        print_block(io, w_api.misc)
        print_block(io, funcs)

        write_exports(io, w_api)
    end

    format(destfile)
    nothing
end

function write_exports(io::IO, w_api::WrappedAPI)
    println(io)

    enum_assignments = vcat(fields.(values(w_api.enums))...)
    enum_identifiers = map(x -> x.args[1], enum_assignments)

    all_decls = vcat(collect.(values.(vcat(w_api.consts, w_api.enums, w_api.structs, w_api.bags, w_api.funcs)))...)
    all_decl_symbols = Symbol.(unique(name.(all_decls)))

    ignored_symbols = Symbol.(vcat("Base.convert", "Base", extension_types))
    
    exports = :(export $(all_decl_symbols...), $(enum_identifiers...))

    filter!(x -> x ∉ ignored_symbols, exports.args)

    println(io, string(exports))
end
