spacing(ex, cat) = @match cat begin
    :struct => "\n"^2
    :function && if ex.head ≠ :function end => "\n"
    :function => "\n"^2
    :const => "\n"
    :enum => "\n"
end

spacing(ex::Expr) = spacing(ex, category(ex))

block(ex::Expr) = string(prettify(ex)) * spacing(ex)

function print_block(io::IO, exs)
    print.(Ref(io), block.(exs))
    println(io)
end

"""
Write a wrapped API to `destfile`.
"""
function Base.write(w_api::WrappedAPI, destfile)
    decls = vcat(w_api.consts, w_api.enums, w_api.structs, w_api.bags)
    decls_order = resolve_dependencies(name.(decls), decls)
    ordered_decls = decls[decls_order]
    check_dependencies(ordered_decls)
    # decls_order = 1:length(decls)
    # ordered_decls = decls

    cp("$(@__DIR__)/wrapping/prewrap.jl", destfile; force=true)

    open(destfile, "a+") do io
        println(io)

        print_block(io, w_api.extended_vk_constructors)
        print_block(io, ordered_decls)
        print_block(io, w_api.misc)
        print_block(io, w_api.funcs)

        write_exports(io, w_api)
    end

    format(destfile; margin=500)
    nothing
end

function write_exports(io::IO, w_api::WrappedAPI)
    println(io)

    enum_assignments = vcat(getindex.(deconstruct.(w_api.enums), :decl)...)
    enum_identifiers = map(x -> x.args[1], enum_assignments)

    all_decls = vcat(w_api.consts, w_api.enums, w_api.structs, w_api.bags, w_api.funcs)
    all_decl_symbols = unique(name.(all_decls))

    ignored_symbols = vcat(:(Base.convert), :Base, extension_types)

    exports = :(export $(all_decl_symbols...), $(enum_identifiers...))

    filter!(x -> x ∉ ignored_symbols, exports.args)

    println(io, string(exports))
end
