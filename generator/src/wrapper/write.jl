"""
Write the wrapper to `destfile`.
"""
function Base.write(vw::VulkanWrapper, destfile, docfile)
    exprs = vcat(vw.handles, vw.structs, vw.funcs, vw.enums)
    ordered_exprs = sort_expressions(exprs)
    structs = filter(is_category(:struct), ordered_exprs)
    funcs = filter(is_category(:function), ordered_exprs)
    enums = filter(is_category(:enum), ordered_exprs)

    open(destfile, "w+") do io
        print_block(io, enums)
        print_block(io, structs)
        print_block(io, funcs)
        print_block(io, setdiff(ordered_exprs, vcat(structs, funcs, enums)))

        write_exports(io, exprs)
    end

    open(docfile, "w+") do io
        print_block(io, vw.docs)
    end
end

function sort_expressions(exprs)
    exprs_order = resolve_dependencies(name.(exprs), exprs)
    ordered_exprs = exprs[exprs_order]
    check_dependencies(ordered_exprs)

    ordered_exprs
end

is_category(cat) = x -> category(x) == cat

function print_block(io::IO, exs)
    print.(Ref(io), block.(exs))
    println(io)
end

function block(ex::Expr)
    str = @match category(ex) begin
        :doc => string('\"'^3, ex.args[3], '\"'^3, '\n', ex.args[4])
        :enum => string(ex)
        _ => string(prettify(ex))
    end
    str * spacing(ex)
end

spacing(ex::Expr) = spacing(category(ex))

spacing(cat::Symbol) = @match cat begin
    :struct => '\n'^2
    :function => '\n'^2
    :const => '\n'
    :enum => '\n'^2
    :doc => '\n'^2
end

function write_exports(io::IO, decls)
    println(io)

    ignored_symbols = vcat(:(Base.convert), :Base)

    candidates = unique(Iterators.flatten(exported_names.(decls)))
    decl_symbols = collect(Iterators.flatten(sort(
        filter!.(
            [
                !in(ignored_symbols),
                !is_vulkan_type,
            ],
            Ref(candidates),
        )
    )))

    exports = :(export $(decl_symbols...))

    println(io, string(exports))
end

function exported_names(decl)
    @match category(decl) begin
        :enum => begin
            p = deconstruct(decl)
            [p[:name]; name.(p[:values])]
        end
        _ => [name(decl)]
    end
end
