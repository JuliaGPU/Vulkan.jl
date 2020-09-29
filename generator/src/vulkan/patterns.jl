"""Abstract type of all possible patterns.
"""

abstract type Pattern end
    

struct CreateInfo <: Pattern
    sdef::SDefinition
end

struct Create <: Pattern
    f::FDefinition
    type

    function Create(decl)
        type = remove_parts(decl.name, discarded_parts=[1, 2])
        new(decl, type)
    end
end

struct Command <: Pattern
    f::FDefinition
end

struct Finalizer <: Pattern
    f::FDefinition
    x
    function Finalizer(decl)
        x = remove_parts(decl.name, discarded_parts=[1, 2], convert_to=SnakeCaseLower)
        new(decl, x)
    end
end


const patterns_dict = OrderedDict(
    (decl -> startswith(decl.name, "create_")) => Create,
    (decl -> occursin("CreateInfo", decl.name)) => CreateInfo,
    (decl -> startswith(decl.name, "vkCmd")) => Command,
    (decl -> startswith(decl.name, "vkDestroy")) => Finalizer,
)

function patterns(decl::Declaration)
    patterns_found = []
    for (ispattern, pat) ∈ patterns_dict
        ispattern(decl) ? push!(patterns_found, pat(decl)) : nothing
    end
    patterns_found
end