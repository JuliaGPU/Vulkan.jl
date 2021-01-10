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
Write the wrapper to `destfile`.
"""
function Base.write(vw::VulkanWrapper, destfile)
    decls = vcat(vw.handles, vw.structs, vw.funcs, vw.misc)
    decls_order = resolve_dependencies(name.(decls), decls)
    ordered_decls = decls[decls_order]
    check_dependencies(ordered_decls)

    cp(joinpath(@__DIR__, "prewrap.jl"), destfile; force=true)

    open(destfile, "a+") do io
        println(io)

        print_block(io, ordered_decls)

        write_exports(io, decls)
    end

    format_file(destfile; margin=200)
    nothing
end

function write_exports(io::IO, decls)
    println(io)

    ignored_symbols = vcat(:(Base.convert), :Base)

    decl_symbols = sort(filter(!in(ignored_symbols), unique(name.(decls))))

    exports = :(export $(decl_symbols...))

    println(io, string(exports))
end
