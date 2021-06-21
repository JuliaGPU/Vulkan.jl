include("wrapper/exprs.jl")
include("wrapper/type_conversions.jl")
include("wrapper/naming_conventions.jl")
include("wrapper/conventions.jl")
include("wrapper/docs.jl")
include("wrapper/config.jl")
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
    WrapperConfig,
    extensions,
    filter_specs,
    VulkanWrapper,
    wrap,
    
    ### Low-level wrappers
    ##### Handles
    wrappable_constructors,
    spec_handles_with_wrappable_constructors,
    add_constructors,
    extend_handle_constructor,
    default,

    ##### Structs
    add_constructor,
    extend_from_vk,

    ### High-level wrappers
    hl_wrap,
    hl_convert,
    hl_convert_overload,
    hl_add_constructor,
    to_expr,
    document
