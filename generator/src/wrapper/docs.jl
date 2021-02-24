function document(spec, p)
    name, args, kwargs = p[:name], p[:args], p[:kwargs]
    signature = string(name, '(', join([join(args, ", "), join(map(x -> "$(x[1]) = $(x[2])", getproperty.(kwargs, :args)), ", ")], "; "), ')')
    argdocs = if !isempty(args) || !isempty(kwargs)
        string(join(["Arguments:"; map(x -> string('`', x, '`'), args); map(kwargs) do kwarg
            identifier, value = kwarg.args
            string('`', identifier, '`', ": defaults to `", value, '`')
        end], "\n- "), '\n')
    else
        ""
    end

    p2 = Dict(
        :category => :doc,
        :docstring => string('\n'^2, ' '^4, signature, '\n'^2, argdocs, '\n'),
        :ex => name,
    )

    reconstruct(p2)
end
