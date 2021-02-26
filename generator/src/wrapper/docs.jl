function document(spec, p)
    @match p[:category] begin
        :function => document_function(spec, p)
        :struct => document_struct(spec, p)
    end
end

function document_function(spec::SpecHandle, p)
    docstring(p[:name], string(' '^4, reconstruct_call(p), '\n'^2))
end

function document_function(spec, p)
    externsync_params = filter(x -> x.is_externsync, children(spec))
    argdocs = document_arguments(p)
    if !isempty(externsync_params)
        for param ∈ wrap_identifier.(externsync_params.name)
            i = findfirst(==(param), first.(argdocs))
            argdocs[i] = concat_right(argdocs[i], " (externsync)")
        end
    end

    docstring(p[:name], string(' '^4, reconstruct_call(p), '\n'^2, join(["Arguments:"; last.(argdocs)], "\n- "), '\n'))
end

function document_arguments(p)
    args, kwargs = p[:args], p[:kwargs]
    if isempty(args) && isempty(kwargs)
        []
    else
        backquoted_args = map(x -> name(x) => string('`', x, '`'), args)
        documented_kwargs = map(kwargs) do kwarg
            identifier, value = kwarg.args
            identifier => string('`', identifier, '`', ": defaults to `", value, '`')
        end
        vcat(backquoted_args, documented_kwargs)
    end
end

function document_struct(spec::SpecStruct, p)
    error("Not implemented")
end

function docstring(name, docstring)
    p_with_docs = Dict(
        :category => :doc,
        :docstring => string('\n', docstring, '\n'),
        :ex => name,
    )

    reconstruct(p_with_docs)
end

concat_right(pair::Pair, val) = pair.first => (pair.second * val)
