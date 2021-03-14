struct VulkanWrapper
    handles::Vector{Expr}
    structs::Vector{Expr}
    funcs::Vector{Expr}
    enums::Vector{Expr}
    docs::Vector{Expr}
end

Base.show(io::IO, vw::VulkanWrapper) = print(
    io,
    "VulkanWrapper with $(length(vw.handles)) handles, $(length(vw.structs)) structs and $(length(vw.funcs)) functions.",
)

include("wrap/classification.jl")
include("wrap/identifiers.jl")
include("wrap/call.jl")
include("wrap/return.jl")
include("wrap/decl.jl")
include("wrap/initialization.jl")
include("wrap/parent.jl")

include("wrap/bitmasks.jl")
include("wrap/overloads.jl")
include("wrap/structs.jl")
include("wrap/functions.jl")
include("wrap/handles.jl")

function VulkanWrapper()
    handles = to_expr.(wrap.(spec_handles))
    structs = to_expr.(wrap.(spec_structs))
    returnedonly_structs = filter(x -> x.is_returnedonly, spec_structs)
    api_structs = filter(!in(returnedonly_structs), spec_structs)
    funcs =
        to_expr.(
            vcat(
                wrap.(spec_funcs),
                add_constructor.(api_structs),
                extend_from_vk.(returnedonly_structs),
                add_constructors.(spec_handles_with_wrappable_constructors)...,
                extend_handle_constructor.(
                    filter(
                        x -> !isnothing(x.create_info_param),
                        create_func.(spec_handles_with_wrappable_constructors),
                    ),
                ),
                wrap.(spec_funcs; with_func_ptr = true),
                add_constructors.(spec_handles_with_wrappable_constructors; with_func_ptr = true)...,
                extend_handle_constructor.(
                    filter(
                        x -> !isnothing(x.create_info_param),
                        create_func.(spec_handles_with_wrappable_constructors),
                    );
                    with_func_ptr = true,
                ),
            ),
        )

    enums = to_expr.(wrap.(spec_bitmasks))
    docs = vcat(
        document.(spec_funcs, wrap.(spec_funcs)),
        document.(api_structs, add_constructor.(api_structs)),
        document.(spec_handles_with_wrappable_constructors)...,
    )
    VulkanWrapper(handles, structs, funcs, enums, docs)
end
