struct VulkanWrapper
    handles                  ::Vector{Expr}
    handle_constructors      ::Vector{Expr}
    structs                  ::Vector{Expr}
    struct_constructors      ::Vector{Expr}
    api_funcs                ::Vector{Expr}
    api_constructor_overloads::Vector{Expr}
    enums                    ::Vector{Expr}
    enum_converts            ::Vector{Expr}
    bitmasks                 ::Vector{Expr}
    from_vk_overloads        ::Vector{Expr}
    docs                     ::Vector{Expr}
    hl_structs               ::Vector{Expr}
    hl_struct_constructors   ::Vector{Expr}
    hl_struct_converts       ::Vector{Expr}
    hl_convert_overloads     ::Vector{Expr}
    hl_api_funcs_overloads   ::Vector{Expr}
    hl_docs                  ::Vector{Expr}
end

function VulkanWrapper(ds::Vector...)
    exs = map(ds) do d
        map(to_expr, d)
    end

    VulkanWrapper(exs...)
end

Base.show(io::IO, vw::VulkanWrapper) = print(
    io,
    "VulkanWrapper with $(length(vw.handles)) handles, $(length(vw.structs)) structs and $(length(vw.funcs)) functions.",
)

include("wrap/classification.jl")
include("wrap/identifiers.jl")
include("wrap/defaults.jl")
include("wrap/call.jl")
include("wrap/return.jl")
include("wrap/decl.jl")
include("wrap/initialization.jl")
include("wrap/parent.jl")

include("wrap/bitmasks.jl")
include("wrap/enums.jl")
include("wrap/overloads.jl")
include("wrap/structs.jl")
include("wrap/functions.jl")
include("wrap/handles.jl")

function VulkanWrapper()
    api_structs = filter(x -> !x.is_returnedonly, spec_structs)
    extendable_api_constructors = collect(filter([create_funcs.(spec_handles_with_wrappable_constructors)...;]) do func
        !isnothing(func.create_info_param) && !func.batch
    end)

    docs = [
        document.(spec_funcs, wrap.(spec_funcs));
        document.(api_structs, add_constructor.(api_structs));
        document.(spec_handles_with_wrappable_constructors)...;
    ]

    hl_docs = hl_document.(api_structs, hl_wrap.(api_structs))
    hl_api_funcs = [
        hl_api_funcs_overload.(spec_funcs, false);
        hl_api_funcs_overload.(extendable_api_constructors, false);
        hl_api_funcs_overloads.(spec_handles_with_wrappable_constructors, false)...;
        hl_api_funcs_overload.(spec_funcs, true);
        hl_api_funcs_overload.(extendable_api_constructors, true);
        hl_api_funcs_overloads.(spec_handles_with_wrappable_constructors, true)...;
    ]

    VulkanWrapper(
        wrap.(spec_handles),
        [add_constructors.(spec_handles_with_wrappable_constructors)...; add_constructors.(spec_handles_with_wrappable_constructors; with_func_ptr=true)...],
        wrap.(spec_structs),
        add_constructor.(api_structs),
        [wrap.(spec_funcs); wrap.(spec_funcs; with_func_ptr=true)],
        [extend_handle_constructor.(extendable_api_constructors); extend_handle_constructor.(extendable_api_constructors; with_func_ptr=true)],
        wrap.(spec_enums),
        [convert_overload.(spec_enums); convert_back_overload.(spec_enums)],
        wrap.(spec_bitmasks),
        extend_from_vk.(filter(x -> x.is_returnedonly, spec_structs)),
        docs,
        hl_wrap.(api_structs),
        filter(p -> !isempty(p[:kwargs]), hl_add_constructor.(api_structs)), # do not overwrite the default constructor (leads to infinite recursion)
        hl_convert.(api_structs),
        hl_convert_overload.(api_structs),
        filter(!isnothing, hl_api_funcs),
        hl_docs,
    )
end
