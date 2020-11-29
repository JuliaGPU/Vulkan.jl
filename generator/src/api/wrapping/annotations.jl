function inline_getproperty_annotation(name, type, sname)
    (name == "sType" || is_enum(type) || is_bitmask(type) || is_base_type(type) || is_base_type(converted_type(fieldtype_transform(name, type, sname))) || is_optional_parameter(name, sname)) && return "noproperty"
    is_handle(type) && return "handle"
    is_vulkan_type(type) && return "vulkan_type"
    "unknown"
end

function annotate_pass(statements, pass)
    body_statements = getproperty.(statements, :body)
    Statement.(rstrip.(body_statements, '\n') .* "    # $(typeof(pass).name)" .* map(x -> endswith(x, "\n") ? "\n" : "", body_statements), getproperty.(statements, :assigned_id))
end
