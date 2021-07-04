function Base.write(vw::VulkanWrapper, config::WrapperConfig)
    ordered_exprs = sort_expressions([vw.independent; vw.interdependent; vw.dependent])

    mkpath(dirname(config.destfile))
    open(config.destfile, "w+") do io
        print_block(io, vw.independent)
        print_block(io, filter(in(vw.interdependent), ordered_exprs))
        print_block(io, vw.dependent)

        write_exports(io, vw.exports)
    end
end

function sort_expressions(exprs)
    exprs_order = resolve_dependencies(name.(exprs), exprs)
    ordered_exprs = exprs[exprs_order]
    check_dependencies(ordered_exprs)
end

function print_block(io::IO, exs)
    foreach(exs) do ex
        print(io, block(ex))
    end
    println(io)
end

function block(ex::Expr)
    str = @match category(ex) begin
        :doc => string('\"'^3, '\n', ex.args[3], '\n', '\"'^3, '\n', ex.args[4])
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

function write_exports(io::IO, exports)
    exports = :(export $(exports...))
    println(io, '\n', exports)
end
