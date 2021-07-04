include("wrapper/exprs.jl")
include("wrapper/type_conversions.jl")
include("wrapper/naming_conventions.jl")
include("wrapper/conventions.jl")
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
    to_expr,

    # Wrapping
    WrapperConfig,
    Platform,
    Linux,
    Windows,
    MacOS,
    BSD,
    extensions,
    filter_specs,
    VulkanWrapper,
    wrap,
    resolve_types,
    resolve_dependencies,

    ### Utility
    is_flag,
    is_returnedonly,
    contains_api_structs,
    promote_hl,

    ### Wrapper types
    WrapperNode,
    Definition,
    ConstantDefinition,
    EnumDefinition,
    BitmaskDefinition,
    StructDefinition,
    HandleDefinition,
    Constructor,
    Docstring,
    MethodDefinition,
    FromVk,
    Convert,
    GetProperty,
    APIFunction,
    exports


