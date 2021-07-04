abstract type WrapperNode end

struct Definition{S<:Spec} <: WrapperNode
    spec::S
    p::Dict
end

const EnumDefinition = Definition{SpecEnum}
const BitmaskDefinition = Definition{SpecBitmask}
const ConstantDefinition = Definition{SpecConstant}

struct StructDefinition{HL,S<:Union{SpecStruct,SpecUnion}} <: WrapperNode
    spec::S
    p::Dict
end

StructDefinition{T}(spec, p) where {T} = StructDefinition{T,typeof(spec)}(spec, p)

is_returnedonly(spec::Spec) = spec.is_returnedonly
is_returnedonly(def::WrapperNode) = is_returnedonly(def.spec)

struct HandleDefinition <: WrapperNode
    spec::SpecHandle
    p::Dict
end

struct Constructor{S} <: WrapperNode
    def::S
    p::Dict
end

struct Docstring{W<:WrapperNode} <: WrapperNode
    def::W
    p::Dict
end

abstract type MethodDefinition <: WrapperNode end

struct FromVk{S} <: MethodDefinition
    spec::S
    p::Dict
end

struct Convert{A,B} <: MethodDefinition
    T::A
    x::B
    p::Dict
end

struct GetProperty{D} <: MethodDefinition
    def::D
    p::Dict
end

struct APIFunction{S} <: MethodDefinition
    spec::S
    with_func_ptr::Bool
    p::Dict
end

to_expr(def::WrapperNode) = resolve_types(to_expr(def.p))
to_expr(def::Union{Docstring, ConstantDefinition, EnumDefinition, BitmaskDefinition}) = to_expr(def.p)

name(def::WrapperNode) = name(def.p)

function exports(def::WrapperNode)
    @match n = name(def) begin
        ::Symbol => n
        :($_.$n) => n
    end
end

exports(def::Union{EnumDefinition, BitmaskDefinition}) = [name(def); name.(def.p[:values])]

struct VulkanWrapper
    independent::Vector{Expr}
    interdependent::Vector{Expr}
    dependent::Vector{Expr}
    exports::Vector{Symbol}
    function VulkanWrapper(independent::Vector{Expr}, interdependent::Vector{Expr}, dependent::Vector{Expr}, exports::Vector{Symbol})
        new(independent, interdependent, dependent, unique(exports))
    end
end

include("wrap/classification.jl")
include("wrap/identifiers.jl")
include("wrap/defaults.jl")
include("wrap/call.jl")
include("wrap/return.jl")
include("wrap/decl.jl")
include("wrap/initialization.jl")
include("wrap/parent.jl")

include("wrap/constants.jl")
include("wrap/enums.jl")
include("wrap/bitmasks.jl")
include("wrap/handles.jl")
include("wrap/structs.jl")
include("wrap/unions.jl")
include("wrap/functions.jl")
include("wrap/overloads.jl")
include("wrap/docs.jl")

function VulkanWrapper(config::WrapperConfig)
    f = filter_specs(config)

    constants = ConstantDefinition.(filter(include_constant, f(spec_constants)))
    enums = EnumDefinition.(f(spec_enums))
    bitmasks = BitmaskDefinition.(f(spec_bitmasks))
    handles = HandleDefinition.(f(spec_handles))
    structs = StructDefinition{false}.(f(spec_structs))
    api_structs = filter(!is_returnedonly, structs)
    unions = StructDefinition{false}.(f(spec_unions))
    api_unions = filter(!is_returnedonly, unions)
    structs_hl = StructDefinition{true}.(api_structs)
    unions_hl = StructDefinition{true}.(api_unions)

    struct_constructors = Constructor.(api_structs)
    struct_constructors_from_hl = [Constructor(T, x) for (T, x) in zip(api_structs, structs_hl)]
    struct_constructors_hl = Constructor.(structs_hl)

    # do not overwrite the default constructor (leads to infinite recursion)
    filter!(struct_constructors_hl) do def
        !isempty(def.p[:kwargs])
    end

    union_constructors = [constructors.(unions)...;]
    union_constructors_from_hl = [Constructor(T, x) for (T, x) in zip(api_unions, unions_hl)]
    union_constructors_hl = [constructors.(unions_hl)...;]

    union_getproperty_hl = GetProperty.(unions_hl)
    from_vk = FromVk.(filter(is_returnedonly, structs))

    enum_converts_to_integer = [Convert(enum, enum_val_type(enum)) for enum in enums]
    enum_converts_to_enum = [Convert(enum_val_type(enum), enum) for enum in enums]
    enum_converts_from_spec = [Convert(enum, spec_enum.name) for (enum, spec_enum) in zip(enums, f(spec_enums))]
    enum_converts_to_spec = [Convert(spec_enum.name, enum) for (enum, spec_enum) in zip(enums, f(spec_enums))]
    struct_converts_to_ll = [Convert(T, x) for (T, x) in zip(api_structs, structs_hl)]
    union_converts_to_ll = [Convert(T, x) for (T, x) in zip(api_unions, unions_hl)]

    funcs = [APIFunction.(f(spec_funcs), false); APIFunction.(f(spec_funcs), true)]

    api_constructor_wrappers = APIFunction{CreateFunc}[]
    handle_constructors = Constructor{HandleDefinition}[]
    for handle in handles
        for api_constructor in f(wrappable_constructors(handle.spec))
            if !isnothing(api_constructor.create_info_param)
                defs = [APIFunction(api_constructor, false); APIFunction(api_constructor, true)]
                append!(api_constructor_wrappers, defs)
            else
                defs = [APIFunction(api_constructor.func, false); APIFunction(api_constructor.func, true)]
            end
            append!(handle_constructors, Constructor(handle, def) for def in defs)
        end
    end

    api_constructor_wrappers_hl = promote_hl.(filter(contains_api_structs, api_constructor_wrappers))
    handle_constructors_hl = promote_hl.(filter(contains_api_structs, handle_constructors))
    funcs_hl = promote_hl.(filter(contains_api_structs, funcs))

    VulkanWrapper(
        [
            to_expr.(constants); to_expr.(enums); to_expr.(enum_converts_to_enum); to_expr.(enum_converts_to_integer); to_expr.(enum_converts_from_spec); to_expr.(enum_converts_to_spec); to_expr.(bitmasks);
            to_expr.(unions); to_expr.(unions_hl);
        ],
        [
            to_expr.(handles); to_expr.(structs); to_expr.(structs_hl);
        ],
        [
            to_expr.(union_constructors);
            to_expr.(union_constructors_hl);
            to_expr.(union_constructors_from_hl);
            to_expr.(union_converts_to_ll);
            to_expr.(union_getproperty_hl);
            to_expr.(struct_constructors);
            to_expr.(struct_constructors_hl);
            to_expr.(struct_constructors_from_hl);
            to_expr.(struct_converts_to_ll);
            to_expr.(funcs);
            to_expr.(funcs_hl);
            to_expr.(api_constructor_wrappers);
            to_expr.(api_constructor_wrappers_hl);
            to_expr.(handle_constructors);
            to_expr.(handle_constructors_hl);
            to_expr.(from_vk);
            to_expr.(Docstring.(structs));
            to_expr.(Docstring.(structs_hl));
            to_expr.(Docstring.(handle_constructors));
            to_expr.(Docstring.(funcs));
        ],
        Symbol[
            exports.(constants); exports.(enums)...; exports.(bitmasks)...; exports.(handles); exports.(structs); exports.(unions); exports.(structs_hl); exports.(unions_hl); exports.(funcs);
        ]
    )
end
