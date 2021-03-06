"""
Generate an identifier from a Vulkan identifier, in lower snake case and without pointer prefixes (such as in `pNext`).
"""
function wrap_identifier(identifier)
    identifier ∈ keys(convention_exceptions) && return convention_exceptions[identifier]
    var_str = @match s = string(identifier) begin
        GuardBy(startswith(r"p+[A-Z]")) => remove_prefix(convert(SnakeCaseLower, CamelCaseLower(s))).value
        _ => nc_convert(SnakeCaseLower, s)
    end
    Symbol(var_str)
end

wrap_identifier(spec::Union{SpecFuncParam,SpecStructMember}) = wrap_identifier(spec.name)

function wrap_identifier(spec::SpecHandle)
    # try to get an id from an existing function parameter
    func = create_func(spec)
    id = nothing
    if !isnothing(func)
        id = _wrap_identifier(spec, func.func)
    end
    if isnothing(id)
        for func ∈ spec_funcs
            id = _wrap_identifier(spec, func)
            !isnothing(id) && return id
        end
        wrap_identifier(remove_vk_prefix(spec.name))
    end
end

function _wrap_identifier(spec::SpecHandle, func::SpecFunc)
    for param ∈ children(func)
        if spec.name == param.type
            return wrap_identifier(param)
        end
    end
    nothing
end
