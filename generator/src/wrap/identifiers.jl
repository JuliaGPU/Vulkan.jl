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

function wrap_identifier(spec::Union{SpecFuncParam,SpecStructMember})

    # handle the case where two identifiers end up being the same
    # issue caused by VkAccelerationStructureBuildGeometryInfoKHR
    # which has both pGeometries and ppGeometries
    siblings = children(spec.parent)
    id = wrap_identifier(spec.name)
    ids = wrap_identifier.(siblings.name)
    if count(==(id), ids) == 2
        lastidx = findlast(==(id), ids)
        if siblings[lastidx] == spec
            Symbol(id, "_2")
        else
            id
        end
    else
        id
    end
end

function wrap_identifier(spec::SpecHandle)
    # try to get an id from an existing function parameter
    spec.name == :VkDeferredOperationKHR && return :operation
    cfs = api.constructors[spec]
    id = nothing
    if !isempty(cfs)
        for cf in cfs
            id = wrap_identifier(spec, first(cfs).func)
            !isnothing(id) && return id
        end
    end
    for f in api.functions
        id = wrap_identifier(spec, f)
        !isnothing(id) && return id
    end
    wrap_identifier(remove_vk_prefix(spec.name))
end

function wrap_identifier(spec::SpecHandle, func::SpecFunc)
    for param in func
        if spec.name == param.type
            return wrap_identifier(param)
        end
    end
    nothing
end

function struct_name(sym::Symbol, is_high_level = false)
    spec = @something(get(api.structs, sym, nothing), get(api.unions, sym, nothing), api.handles[sym])
    struct_name(spec, is_high_level)
end

function struct_name(spec::Spec, is_high_level = false)
    sym = remove_vk_prefix(spec.name)
    is_high_level || !has_intermediate_type(spec) ? sym : Symbol(:_, sym)
end
