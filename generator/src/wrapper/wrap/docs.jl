function Documented(def::StructDefinition{false})
    (; spec) = def
    doc = string(
        "Intermediate wrapper for $(spec.name).",
        extension_doc(spec),
        api_doc(spec),
    )
    Documented(def, doc)
end

function Documented(def::StructDefinition{true})
    (; spec) = def
    doc = string(
        "High-level wrapper for $(spec.name).",
        extension_doc(spec),
        api_doc(spec),
    )
    Documented(def, doc)
end

function Documented(def::Constructor{<:StructDefinition{HL, SpecStruct}}) where {HL}
    (; p) = def
    (; spec) = def.to
    doc = string(
        extension_doc(spec),
        args_summary(document_arguments(p, spec, HL)),
        api_doc(spec),
    )
    Documented(def, doc)
end

function Documented(def::Constructor{HandleDefinition})
    Documented(def, "")
end

backquoted(arg) = string('`', arg, '`')

function document_return_codes(spec::SpecFunc)
    res = ""
    if !isempty(spec.success_codes) || !isempty(spec.error_codes)
        res *= "Return codes:"
    end
    if !isempty(spec.success_codes) && must_return_success_code(spec)
        res *= string("\n- ", join(backquoted.(remove_vk_prefix.(spec.success_codes)), "\n- "))
    end
    if !isempty(spec.error_codes)
        res *= string("\n- ", join(backquoted.(remove_vk_prefix.(spec.error_codes)), "\n- "))
    end

    isempty(res) && return ""
    '\n'^2 * res
end
document_return_codes(spec::CreateFunc) = document_return_codes(spec.func)
document_return_codes(spec) = ""


function append_to_argdoc!(argdocs, spec, str)
    identifier = wrap_identifier(spec)
    doc = argdocs[identifier]
    argdocs[identifier] = doc * str
end

api_doc(spec::Spec) = string("\n\n", "[API documentation](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/$(spec.name).html)")
api_doc(spec::CreateFunc) = api_doc(spec.func)
api_doc(::Nothing) = ""

extension_doc(::Nothing) = ""
function extension_doc(spec)
    ext = extension(spec)
    isnothing(ext) && return ""
    string("\n\n", "Extension: ", replace(string(ext.name), '_' => "\\\\_"))
end

function args_summary(argdocs)
    isempty(argdocs) && return ""
    string("\n\n", "Arguments:\n- ", join(argdocs, "\n- "))
end

Documented(def::APIFunction{SpecFunc}) = Documented(def, def.spec, def.p, false)
Documented(def::APIFunction{APIFunction{SpecFunc}}) = Documented(def, def.spec.spec, def.p, true)
function Documented(def::APIFunction{T}) where {T<:Union{CreateFunc,APIFunction{CreateFunc}}}
    is_hl = T === APIFunction{CreateFunc}
    create_func = is_hl ? def.spec.spec : def.spec
    spec = create_func.batch ? nothing : create_func
    Documented(def, spec, def.p, is_hl)
end

function extra_doc(spec::SpecFunc)
    params = parameters(spec)
    if any(is_data_with_retrievable_size, params)
        """


        !!! warning
            The pointer returned by this function holds memory owned by Julia. It is therefore **your** responsibility to free it after use (e.g. with `Libc.free`)."""
    else
        ""
    end
end
extra_doc(spec::CreateFunc) = extra_doc(spec.func)
extra_doc(spec) = ""

function update_argdocs!(argdocs, spec::SpecFunc)
    params = parameters(spec)
    if any(is_opaque_data, params)
        opaque_params = params[findall(is_opaque_data, params)]
        for param in opaque_params
            append_to_argdoc!(
                argdocs,
                param,
                " (must be a valid pointer with `$(wrap_identifier(len(param)))` bytes)",
            )
        end
    end
end
update_argdocs!(argdocs, spec::CreateFunc) = update_argdocs!(argdocs, spec.func)
update_argdocs!(argdocs, spec) = nothing

function Documented(def::APIFunction, spec, p, is_hl)
    argdocs = document_arguments(p, spec, is_hl)
    update_argdocs!(argdocs, spec)

    doc = string(
        extension_doc(spec),
        document_return_codes(spec),
        args_summary(argdocs),
        extra_doc(spec),
        api_doc(spec),
    )
    Documented(def, doc)
end

parameters(spec::Spec) = children(spec)
parameters(spec::CreateFunc) = [collect(children(spec.func)); collect(children(spec.create_info_struct))]

function document_arguments(p, spec::Spec, is_hl)
    params = parameters(spec)
    args, kwargs = get(Vector, p, :args), get(Vector, p, :kwargs)
    d = Dictionary{Symbol,String}()
    for arg in args
        identifier = name(arg)
        str = @match identifier begin
            :fptr => string(backquoted(arg), ": function pointer used for the API call")
            :fptr_create => string(backquoted(arg), ": function pointer used for creating the handle(s)")
            :fptr_destroy => string(backquoted(arg), ": function pointer used for destroying the handle(s) upon finalization")
            :next_types => string(backquoted(arg), ": types of members to initialize and include as part of the `next` chain")
            _ => nothing
        end
        if !isnothing(str)
            insert!(d, identifier, str)
            continue
        end
        i = findfirst(==(identifier) ∘ wrap_identifier, params)
        str = if !isnothing(i)
            param = params[i]
            t = is_hl ? hl_type(param) : idiomatic_julia_type(param)
            str = backquoted(:($identifier::$t))
            param.is_externsync ? str * " (externsync)" : str
        else
            backquoted(arg)
        end
        insert!(d, identifier, str)
    end
    for kwarg in kwargs
        identifier, value = kwarg.args
        i = findfirst(==(identifier) ∘ wrap_identifier, params)
        str = if !isnothing(i)
            param = params[i]
            t = is_hl ? hl_type(param) : idiomatic_julia_type(param)
            str = string(backquoted(:($identifier::$t)), ": defaults to ", backquoted(value))
            param.is_externsync ? str * " (externsync)" : str
        else
            string(backquoted(identifier), ": defaults to ", backquoted(value))
        end
        insert!(d, identifier, str)
    end
    d
end

function docstring(ex, docstring)
    endswith(docstring, '\n') || (docstring *= '\n')
    Dict(
        :category => :doc,
        :ex => ex,
        :docstring => docstring,
    )
end
