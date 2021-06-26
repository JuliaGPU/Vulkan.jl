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
    exs::NTuple{length(fieldtypes(VulkanWrapper)),Vector{Expr}} = map(ds) do d
        map(resolve_types ∘ to_expr, d)
    end

    VulkanWrapper(exs...)
end

Base.show(io::IO, vw::VulkanWrapper) = print(
    io,
    "VulkanWrapper(#defs=",
    sum(map(length, (getproperty(vw, prop) for prop in fieldnames(typeof(vw))))),
    ')',
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

function VulkanWrapper(config::WrapperConfig)

    # filter out specification elements
    f = filter_specs(config)
    _spec_funcs = f(spec_funcs)
    _spec_structs = f(spec_structs)
    _spec_handles = f(spec_handles)
    _spec_handles_with_wrappable_constructors = f(spec_handles_with_wrappable_constructors)
    _spec_enums = f(spec_enums)
    _spec_bitmasks = f(spec_bitmasks)

    api_structs = filter(x -> !x.is_returnedonly, _spec_structs)
    extendable_api_constructors = collect(filter([create_funcs.(_spec_handles_with_wrappable_constructors)...;]) do func
        !isnothing(func.create_info_param) && !func.batch
    end)

    docs = [
        document.(_spec_funcs, wrap.(_spec_funcs));
        document.(api_structs, add_constructor.(api_structs));
        document.(_spec_handles_with_wrappable_constructors)...;
    ]

    hl_docs = hl_document.(api_structs, hl_wrap.(api_structs))
    hl_api_funcs = [
        hl_api_funcs_overload.(_spec_funcs, false);
        hl_api_funcs_overload.(extendable_api_constructors, false);
        hl_api_funcs_overloads.(_spec_handles_with_wrappable_constructors, false)...;
        hl_api_funcs_overload.(_spec_funcs, true);
        hl_api_funcs_overload.(extendable_api_constructors, true);
        hl_api_funcs_overloads.(_spec_handles_with_wrappable_constructors, true)...;
    ]

    VulkanWrapper(
        wrap.(_spec_handles),
        [add_constructors.(_spec_handles_with_wrappable_constructors)...; add_constructors.(_spec_handles_with_wrappable_constructors; with_func_ptr=true)...],
        wrap.(_spec_structs),
        add_constructor.(api_structs),
        [wrap.(_spec_funcs); wrap.(_spec_funcs; with_func_ptr=true)],
        [extend_handle_constructor.(extendable_api_constructors); extend_handle_constructor.(extendable_api_constructors; with_func_ptr=true)],
        wrap.(_spec_enums),
        [convert_overload.(_spec_enums); convert_back_overload.(_spec_enums)],
        wrap.(_spec_bitmasks),
        extend_from_vk.(filter(x -> x.is_returnedonly, _spec_structs)),
        docs,
        hl_wrap.(api_structs),
        filter(p -> !isempty(p[:kwargs]), hl_add_constructor.(api_structs)), # do not overwrite the default constructor (leads to infinite recursion)
        hl_convert.(api_structs),
        hl_convert_overload.(api_structs),
        filter(!isnothing, hl_api_funcs),
        hl_docs,
    )
end
