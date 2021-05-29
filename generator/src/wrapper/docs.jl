function document(spec, p)
    doc = @match p[:category] begin
        :function => document_function(spec, p)
        :struct => document_struct(spec, p)
    end
    sig = @match spec begin
        ::SpecHandle => reconstruct_call(p)
        _ => name(reconstruct(p))
    end
    docstring(sig, doc)
end

document(spec::SpecHandle) = document.(Ref(spec), add_constructors(spec))

backquoted(arg) = string('`', arg, '`')

function document_return_codes(spec::SpecFunc)
    res = ""
    if !isempty(spec.success_codes) || !isempty(spec.error_codes)
        res *= "Return codes:"
    end
    if !isempty(spec.success_codes) && must_return_success_code(spec)
        res *= string("\n- Success:\n  - ", join(backquoted.(remove_vk_prefix.(spec.success_codes)), "\n  - "))
    end
    if !isempty(spec.error_codes)
        res *= string("\n- Error:\n  - ", join(backquoted.(remove_vk_prefix.(spec.error_codes)), "\n  - "))
    end

    if !isempty(res)
        res *= '\n'^2
    end

    res
end

document_return_codes(spec::SpecHandle) = document_return_codes(add_constructor(spec))
document_return_codes(spec::SpecStruct) = ""

function document_function(spec::SpecHandle, p)
    string(' '^4, reconstruct_call(p), '\n'^2)
end

function append_to_argdoc!(argdocs, spec, str)
    i = findfirst(==(wrap_identifier(spec)), first.(argdocs))
    argdocs[i] = concat_right(argdocs[i], str)
end

function document_function(spec, p)
    params = children(spec)
    externsync_params = filter(x -> x.is_externsync, params)
    argdocs = document_arguments(p)
    if !isempty(externsync_params)
        for param ∈ externsync_params
            append_to_argdoc!(argdocs, param, " (externsync)")
        end
    end
    extra = ""
    if spec isa SpecFunc
        if any(is_data_with_retrievable_size, params)
            extra = """
            !!! warning
                The pointer returned by this function holds memory owned by Julia. It is therefore **your** responsibility to free it after use (e.g. with `Libc.free`)."""
        elseif any(is_opaque_data, params)
            opaque_params = params[findall(is_opaque_data, params)]
            map(opaque_params) do param
                append_to_argdoc!(
                    argdocs,
                    param,
                    " (must be a valid pointer with `$(wrap_identifier(len(param)))` bytes)",
                )
            end
        end
    end

    string(
        ' '^4,
        reconstruct_call(p),
        '\n'^2,
        document_return_codes(spec),
        join(["Arguments:"; last.(argdocs)], "\n- "),
        isempty(extra) ? "" : '\n'^2 * extra,
        '\n',
    )
end

function document_arguments(p)
    args, kwargs = p[:args], p[:kwargs]
    if isempty(args) && isempty(kwargs)
        []
    else
        backquoted_args = map(x -> name(x) => backquoted(x), args)
        documented_kwargs = map(kwargs) do kwarg
            identifier, value = kwarg.args
            identifier => string(backquoted(identifier), ": defaults to ", backquoted(value))
        end
        vcat(backquoted_args, documented_kwargs)
    end
end

function document_struct(spec::SpecStruct, p)
    "High-level wrapper for $(spec.name)"
end

function docstring(name, docstring)
    Dict(
        :category => :doc,
        :ex => name,
        :docstring => docstring,
    )
end

function hl_document(spec::SpecStruct, p)
    document(spec, p)
end

concat_right(pair::Pair, val) = pair.first => (pair.second * val)
