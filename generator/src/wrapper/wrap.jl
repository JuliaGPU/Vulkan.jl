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

struct HandleDefinition <: WrapperNode
    spec::SpecHandle
    p::Dict
end

struct Constructor{S} <: WrapperNode
    def::S
    p::Dict
end

struct Documented{W<:WrapperNode} <: WrapperNode
    def::W
    p::Dict
end

Documented(def::WrapperNode) = Documented(def, "")
Documented(def::WrapperNode, doc::AbstractString) = Documented(def, docstring(to_expr(def), doc))

abstract type MethodDefinition <: WrapperNode end

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

struct Parent <: MethodDefinition
    def::HandleDefinition
    p::Dict
end

VulkanSpec.has_parent(def::HandleDefinition) = has_parent(def.spec)

struct StructureType <: MethodDefinition
    spec::SpecStruct
    ex::Expr
end

abstract type TypeMapping <: MethodDefinition end

struct HLTypeMapping <: TypeMapping
    spec::Union{SpecStruct,SpecUnion}
    ex::Expr
end

struct CoreTypeMapping <: TypeMapping
    spec::Union{SpecStruct,SpecUnion}
    ex::Expr
end

struct IntermediateTypeMapping <: TypeMapping
    spec::Union{SpecStruct,SpecUnion}
    ex::Expr
end

to_expr(def::Union{StructureType, TypeMapping}) = def.ex
to_expr(def::WrapperNode) = resolve_types(to_expr(def.p))
to_expr(def::Union{Documented, ConstantDefinition, EnumDefinition, BitmaskDefinition}) = to_expr(def.p)
to_expr(def::StructDefinition{true,<:SpecStruct}) = :(@auto_hash_equals $(resolve_types(to_expr(def.p))))

documented(def::WrapperNode) = to_expr(Documented(def))

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
include("wrap/reflection.jl")
include("wrap/docs.jl")

function VulkanWrapper(config::WrapperConfig)
    f = filter_specs(config)

    constants = ConstantDefinition.(filter(include_constant, f(spec_constants)))
    enums = EnumDefinition.(f(spec_enums))
    bitmasks = BitmaskDefinition.(f(spec_bitmasks))
    handles = HandleDefinition.(f(spec_handles))

    # Structures.
    structs = StructDefinition{false}.(f(spec_structs))
    structs_hl = StructDefinition{true}.(structs)

    struct_constructors = Constructor.(structs)
    struct_constructors_from_hl = [Constructor(T, x) for (T, x) in zip(structs, structs_hl)]
    struct_constructors_from_ll = [Constructor(T, x) for (T, x) in zip(structs_hl, structs)]
    struct_constructors_from_core = [Constructor(T, x) for (T, x) in zip(structs_hl, f(spec_structs))]
    struct_constructors_hl = Constructor.(structs_hl)

    ## Do not overwrite the default constructor (leads to infinite recursion).
    filter!(struct_constructors_hl) do def
        !isempty(def.p[:kwargs])
    end

    # Unions.
    unions = StructDefinition{false}.(f(spec_unions))
    unions_hl = StructDefinition{true}.(unions)

    union_constructors = [constructors.(unions)...;]
    union_constructors_from_hl = [Constructor(T, x) for (T, x) in zip(unions, unions_hl)]
    union_constructors_hl = [constructors.(unions_hl)...;]

    union_getproperty_hl = GetProperty.(unions_hl)

    enum_converts_to_integer = [Convert(enum, enum_val_type(enum)) for enum in enums]
    enum_converts_to_enum = [Convert(enum_val_type(enum), enum) for enum in enums]
    enum_converts_from_spec = [Convert(enum, spec_enum.name) for (enum, spec_enum) in zip(enums, f(spec_enums))]
    enum_converts_to_spec = [Convert(spec_enum.name, enum) for (enum, spec_enum) in zip(enums, f(spec_enums))]
    struct_converts_to_ll = [Convert(T, x) for (T, x) in zip(structs, structs_hl)]
    union_converts_to_ll = [Convert(T, x) for (T, x) in zip(unions, unions_hl)]

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

    api_constructor_wrappers_hl = promote_hl.(api_constructor_wrappers)
    handle_constructors_hl = promote_hl.(filter(contains_api_structs, handle_constructors))
    funcs_hl = promote_hl.(funcs)

    parent_overloads = Parent.(filter(has_parent, handles))

    stypes = StructureType.(filter(x -> haskey(structure_types, x.name), f(spec_structs)))
    hl_type_mappings = [HLTypeMapping.(f(spec_structs)); HLTypeMapping.(f(spec_unions))]
    core_type_mappings = [CoreTypeMapping.(f(spec_structs)); CoreTypeMapping.(f(spec_unions))]
    intermediate_type_mappings = IntermediateTypeMapping.(filter(has_intermediate_type, f(spec_structs)))

    # For SPIR-V, there is no platform-dependent behavior, so no need to call `f`.
    spirv_exts = spec_spirv_extensions
    spirv_caps = map(spec_spirv_capabilities) do spec
        feats = map(spec.enabling_features) do feat
            FeatureCondition(struct_name(feat.type, true), nc_convert(SnakeCaseLower, feat.member), feat.core_version, feat.extension)
        end
        props = map(spec.enabling_properties) do prop
            bit = isnothing(prop.bit) ? nothing : remove_vk_prefix(prop.bit)
            PropertyCondition(struct_name(prop.type, true), nc_convert(SnakeCaseLower, prop.member), prop.core_version, prop.extension, prop.is_bool, bit)
        end
        SpecCapabilitySPIRV(spec.name, spec.promoted_to, spec.enabling_extensions, feats, props)
    end

    VulkanWrapper(
        Expr[
            documented.(constants); documented.(enums); documented.(enum_converts_to_enum); documented.(enum_converts_to_integer); documented.(enum_converts_from_spec); documented.(enum_converts_to_spec); documented.(bitmasks);
        ],
        Expr[
            documented.(handles); documented.(structs); documented.(unions); documented.(structs_hl); documented.(unions_hl);
        ],
        Expr[
            documented.(parent_overloads);
            documented.(union_constructors);
            documented.(union_constructors_hl);
            documented.(union_constructors_from_hl);
            documented.(union_converts_to_ll);
            documented.(union_getproperty_hl);
            documented.(struct_constructors);
            documented.(struct_constructors_hl);
            documented.(struct_constructors_from_hl);
            documented.(struct_constructors_from_ll);
            documented.(struct_constructors_from_core);
            documented.(struct_converts_to_ll);
            documented.(funcs);
            documented.(funcs_hl);
            documented.(api_constructor_wrappers);
            documented.(api_constructor_wrappers_hl);
            documented.(handle_constructors);
            documented.(handle_constructors_hl);
            to_expr.(stypes);
            to_expr.(hl_type_mappings);
            to_expr.(core_type_mappings);
            to_expr.(intermediate_type_mappings);

            :(const SPIRV_EXTENSIONS = [$(spirv_exts...)]);
            :(const SPIRV_CAPABILITIES = [$(spirv_caps...)]);
        ],
        Symbol[
            exports.(constants); exports.(enums)...; exports.(bitmasks)...; exports.(handles); exports.(structs); exports.(unions); exports.(structs_hl); exports.(unions_hl); exports.(funcs); exports.(funcs_hl); exports.(api_constructor_wrappers_hl); :SPIRV_EXTENSIONS; :SPIRV_CAPABILITIES;
        ]
    )
end
