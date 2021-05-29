include("wrapper/exprs.jl")
include("wrapper/type_conversions.jl")
include("wrapper/naming_conventions.jl")
include("wrapper/conventions.jl")
include("wrapper/docs.jl")
include("wrapper/wrap.jl")

include("wrapper/dependency_resolution.jl")
include("wrapper/write.jl")

export
    # Naming Conventions
    ### Convention types
    CamelCaseLower,
    CamelCaseUpper,
    SnakeCaseLower,
    SnakeCaseUpper,

    ### Convention utilities
    detect_convention,
    nc_convert,
    remove_parts,
    remove_prefix,
    struct_name,

    # Expr
    name,
    category,
    deconstruct,
    reconstruct,
    rmlines,
    striplines,
    unblock,
    prettify,
    concat_exs,
    broadcast_ex,
    is_broadcast,

    # Wrapping
    VulkanWrapper,
    wrap,
    add_constructor,
    add_constructors,
    extend_from_vk,
    extend_handle_constructor,
    hl_wrap,
    hl_convert,
    hl_convert_overload,
    hl_add_constructor,
    to_expr,
    document
