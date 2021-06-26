function Base.write(vw::VulkanWrapper, config::WrapperConfig)
    ordered_exprs = sort_expressions([vw.structs; vw.handles; vw.enums; vw.bitmasks; vw.hl_structs])
    structs = filter(in(vw.structs), ordered_exprs)
    hl_structs = filter(in(vw.hl_structs), ordered_exprs)

    mkpath(dirname(config.destfile))
    open(config.destfile, "w+") do io
        print_block(io, vw.enums)
        print_block(io, vw.bitmasks)
        print_block(io, filter(in(vw.handles), ordered_exprs))
        print_block(io, structs)
        print_block(io, vw.struct_constructors)
        print_block(io, vw.handle_constructors)
        print_block(io, vw.api_constructor_overloads)
        print_block(io, vw.from_vk_overloads)
        print_block(io, vw.enum_converts)
        print_block(io, vw.api_funcs)

        print_block(io, hl_structs)
        print_block(io, vw.hl_struct_constructors)
        print_block(io, vw.hl_struct_converts)
        print_block(io, vw.hl_convert_overloads)
        print_block(io, vw.hl_api_funcs_overloads)

        print_block(io, vw.docs)
        print_block(io, vw.hl_docs)

        write_exports(io, [vw.enums; vw.bitmasks; vw.handles; vw.structs; vw.api_funcs; hl_structs])
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

function write_exports(io::IO, decls)
    ignored_symbols = [:(Base.convert), :Base]

    candidates = unique([exported_names.(decls)...;])
    exported_symbols = filter(candidates) do sym
        sym ∉ ignored_symbols && !is_vulkan_type(sym)
    end

    exports = :(export $(exported_symbols...))

    println(io, '\n', exports)
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
