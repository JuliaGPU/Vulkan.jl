function Documented(def::StructDefinition{false})
    spec = def.spec
    ext = extension(spec)
    doc = string(
        """
        Minimalistic wrapper for $(spec.name).
        """,
        !isnothing(ext) ? """

        Extension: $(ext.name)
        """ : "",
        """

        API documentation: https://www.khronos.org/registry/vulkan/specs/1.2-extensions/man/html/$(spec.name).html
        """,
    )
    Documented(def, doc)
end

function Documented(def::StructDefinition{true})
    spec = def.spec
    ext = extension(spec)
    doc = string(
        """
        High-level wrapper for $(spec.name).
        """,
        !isnothing(ext) ? """

        Extension: $(replace(string(ext.name), '_' => "\\\\_"))
        """ : "",
        """

        [API documentation](https://www.khronos.org/registry/vulkan/specs/1.2-extensions/man/html/$(spec.name).html)
        """,
    )
    Documented(def, doc)
end

function Documented(def::Constructor{HandleDefinition})
    doc = string(' '^4, reconstruct_call(def.p), '\n'^2)
    Documented(def, doc)
end

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
        res = '\n' * res * '\n'
    end

    res
end

document_return_codes(spec::SpecHandle) = document_return_codes(add_constructor(spec))
document_return_codes(spec::SpecStruct) = ""

function append_to_argdoc!(argdocs, spec, str)
    i = findfirst(==(wrap_identifier(spec)), first.(argdocs))
    argdocs[i] = concat_right(argdocs[i], str)
end

function Documented(def::APIFunction{SpecFunc})
    p = def.p
    spec = def.spec
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
                The pointer returned by this function holds memory owned by Julia. It is therefore **your** responsibility to free it after use (e.g. with `Libc.free`).
            """
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

    extra *= """

    [API documentation](https://www.khronos.org/registry/vulkan/specs/1.2-extensions/man/html/$(spec.name).html)
    """

    ext = extension(spec)

    doc = string(
        """
            $(reconstruct_call(p))
        """,
        !isnothing(ext) ? """

        Extension: $(replace(string(ext.name), '_' => "\\\\_"))
        """ : "",
        document_return_codes(spec),
        isempty(argdocs) ? "" : """

        Arguments:
        - $(join(last.(argdocs), "\n- "))
        """,
        extra,
    )
    Documented(def, doc)
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
        [backquoted_args; documented_kwargs]
    end
end

function docstring(ex, docstring)
    Dict(
        :category => :doc,
        :ex => ex,
        :docstring => docstring,
    )
end

concat_right(pair, val) = pair.first => (pair.second * val)
