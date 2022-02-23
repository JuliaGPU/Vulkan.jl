function Documented(def::StructDefinition{false})
    spec = def.spec
    ext = extension(spec)
    doc = string(
        """
        Intermediate wrapper for $(spec.name).
        """,
        !isnothing(ext) ? """

        Extension: $(ext.name)
        """ : "",
        """

        API documentation: https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/$(spec.name).html
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

        [API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/$(spec.name).html)
        """,
    )
    Documented(def, doc)
end

function Documented(def::Constructor{<:StructDefinition{<:Any, SpecStruct}})
    (; p) = def
    args = get(Vector, p, :args)
    # Skip wrapping inter-constructors for now.
    !isempty(args) && name(args[1]) == :x && return Documented(def, "")
    (; spec) = def.def
    doc = string(
        call_doc(p),
        extension_doc(spec),
        args_summary(document_arguments(p, children(spec))),
        api_doc(spec),
    )
    Documented(def, doc)
end

call_doc(p) = string(' '^4, reconstruct_call(p))

function Documented(def::Constructor{HandleDefinition})
    Documented(def, call_doc(def.p))
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

    isempty(res) && return ""
    '\n'^2 * res
end

document_return_codes(spec::SpecHandle) = document_return_codes(add_constructor(spec))
document_return_codes(spec::SpecStruct) = ""

function append_to_argdoc!(argdocs, spec, str)
    i = findfirst(==(wrap_identifier(spec)), first.(argdocs))
    (decl, type) = argdocs[i]
    argdocs[i] = decl => type * str
end

function document_arguments(p, specs)
    argdocs = document_arguments(p)
    for param in filter(x -> x.is_externsync, specs)
        append_to_argdoc!(argdocs, param, " (externsync)")
    end
    argdocs
end

api_doc(spec) = string("\n\n", "[API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/$(spec.name).html)")

function extension_doc(spec)
    ext = extension(spec)
    isnothing(ext) && return ""
    string("\n\n", "Extension: ", replace(string(ext.name), '_' => "\\\\_"))
end

function args_summary(argdocs)
    isempty(argdocs) && return ""
    string("\n\n", "Arguments:\n- ", join(last.(argdocs), "\n- "))
end

Documented(def::APIFunction{SpecFunc}) = Documented(def, def.spec, def.p)
Documented(def::APIFunction{APIFunction{SpecFunc}}) = Documented(def, def.spec.spec, def.p)

function Documented(def::APIFunction, spec::SpecFunc, p)
    params = children(spec)
    argdocs = document_arguments(p, params)
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

    doc = string(
        call_doc(p),
        extension_doc(spec),
        document_return_codes(spec),
        args_summary(argdocs),
        extra,
        api_doc(spec),
    )
    Documented(def, doc)
end

function document_arguments(p)
    args, kwargs = get(Vector, p, :args), get(Vector, p, :kwargs)
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
    endswith(docstring, '\n') || (docstring *= '\n')
    Dict(
        :category => :doc,
        :ex => ex,
        :docstring => docstring,
    )
end
