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
