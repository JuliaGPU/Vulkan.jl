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

struct Constructor{T,X} <: WrapperNode
    p::Dict
    to::T
    from::X
end

struct Documented{W<:WrapperNode} <: WrapperNode
    def::W
    p::Dict
end

Documented(def::WrapperNode) = Documented(def, "")
function Documented(def::WrapperNode, doc::AbstractString)
    doc = lstrip(doc, '\n')
    Documented(def, docstring(to_expr(def), doc))
end

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

struct AliasDeclaration <: WrapperNode
    source::Symbol
    target::Symbol
end

function AliasDeclaration((source, target))
    f = startswith(string(source), "vk") ? Base.Fix2(function_name, true) : remove_vk_prefix
    AliasDeclaration(f(source), f(target))
end

to_expr(def::Union{StructureType, TypeMapping}) = def.ex
to_expr((; source, target)::AliasDeclaration) = :(const $source = $target)
to_expr(def::WrapperNode) = resolve_types(to_expr(def.p))
to_expr(def::Union{Documented, ConstantDefinition, EnumDefinition, BitmaskDefinition}) = to_expr(def.p)
to_expr(def::StructDefinition{true,<:SpecStruct}) = :(@struct_hash_equal $(resolve_types(to_expr(def.p))))

function documented(def::WrapperNode)
    doc = Documented(def)
    # Avoid empty docstrings.
    isempty(strip(doc.p[:docstring], '\n')) && return to_expr(def)
    to_expr(doc)
end

name(def::WrapperNode) = name(def.p)
name(alias::AliasDeclaration) = alias.source

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
    function VulkanWrapper(independent::AbstractVector{Expr}, interdependent::AbstractVector{Expr}, dependent::AbstractVector{Expr}, exports::AbstractVector{Symbol})
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

    funcs = APIFunction.(f(spec_funcs), false)
    funcs_fptr = APIFunction.(f(spec_funcs), true)
    funcs_hl = promote_hl.(funcs)
    funcs_hl_fptr = promote_hl.(funcs_fptr)

    create_func_wrappers = APIFunction{CreateFunc}[]
    create_func_wrappers_fptr = APIFunction{CreateFunc}[]
    create_func_wrappers_hl = APIFunction{APIFunction{CreateFunc}}[]
    create_func_wrappers_hl_fptr = APIFunction{APIFunction{CreateFunc}}[]
    handle_constructors = Constructor{HandleDefinition,APIFunction{CreateFunc}}[]
    handle_constructors_fptr = Constructor{HandleDefinition,APIFunction{CreateFunc}}[]
    handle_constructors_hl = Constructor{HandleDefinition,APIFunction{APIFunction{CreateFunc}}}[]
    handle_constructors_hl_fptr = Constructor{HandleDefinition,APIFunction{APIFunction{CreateFunc}}}[]
    handle_constructors_api = Constructor{HandleDefinition,APIFunction{SpecFunc}}[]
    handle_constructors_api_fptr = Constructor{HandleDefinition,APIFunction{SpecFunc}}[]
    handle_constructors_api_hl = Constructor{HandleDefinition,APIFunction{APIFunction{SpecFunc}}}[]
    handle_constructors_api_hl_fptr = Constructor{HandleDefinition,APIFunction{APIFunction{SpecFunc}}}[]

    for handle in handles
        cs = f(filter(x -> x.handle == handle.spec && !x.batch, spec_create_funcs))
        for api_constructor in cs
            (; func) = api_constructor
            f1 = APIFunction(func, false)
            f2 = APIFunction(func, true)
            f1_p = promote_hl(f1)
            f2_p = promote_hl(f2)
            if !isnothing(api_constructor.create_info_param)
                cf1 = APIFunction(api_constructor, false)
                cf2 = APIFunction(api_constructor, true)
                push!(create_func_wrappers, cf1)
                push!(create_func_wrappers_fptr, cf2)
                cf1_p = promote_hl(cf1)
                cf2_p = promote_hl(cf2)
                push!(create_func_wrappers_hl, cf1_p)
                push!(create_func_wrappers_hl_fptr, cf2_p)
                if can_wrap(handle.spec, cs, api_constructor)
                    if contains_api_structs(cf1)
                        push!(handle_constructors, Constructor(handle, cf1))
                        push!(handle_constructors_fptr, Constructor(handle, cf2))
                    end
                    push!(handle_constructors_hl, Constructor(handle, cf1_p))
                    push!(handle_constructors_hl_fptr, Constructor(handle, cf2_p))
                end
            end
            can_wrap(handle.spec, cs, api_constructor) || continue
            push!(handle_constructors_api_hl, Constructor(handle, f1_p))
            push!(handle_constructors_api_hl_fptr, Constructor(handle, f2_p))
            if contains_api_structs(f1)
                push!(handle_constructors_api, Constructor(handle, f1))
                push!(handle_constructors_api_fptr, Constructor(handle, f2))
            end
        end
    end

    parent_overloads = Parent.(filter(has_parent, handles))

    stypes = StructureType.(filter(x -> haskey(structure_types, x.name), f(spec_structs)))
    hl_type_mappings = [HLTypeMapping.(f(spec_structs)); HLTypeMapping.(f(spec_unions))]
    core_type_mappings = [CoreTypeMapping.(f(spec_structs)); CoreTypeMapping.(f(spec_unions))]
    intermediate_type_mappings = IntermediateTypeMapping.(filter(has_intermediate_type, f(spec_structs)))

    # For SPIR-V, there is no platform-dependent behavior, so no need to call `f`.
    spirv_exts = spec_spirv_extensions
    spirv_caps = map(spec_spirv_capabilities) do spec
        feats = map(spec.enabling_features) do feat
            FeatureCondition(struct_name(follow_alias(feat.type), true), nc_convert(SnakeCaseLower, feat.member), feat.core_version, feat.extension)
        end
        props = map(spec.enabling_properties) do prop
            bit = isnothing(prop.bit) ? nothing : remove_vk_prefix(prop.bit)
            PropertyCondition(struct_name(prop.type, true), nc_convert(SnakeCaseLower, prop.member), prop.core_version, prop.extension, prop.is_bool, bit)
        end
        SpecCapabilitySPIRV(spec.name, spec.promoted_to, spec.enabling_extensions, feats, props)
    end

    exported_symbols = Symbol[
        exports.(constants); exports.(enums)...; exports.(bitmasks)...; exports.(handles); exports.(structs); exports.(unions); exports.(structs_hl); exports.(unions_hl); exports.(funcs); exports.(funcs_hl); :SPIRV_EXTENSIONS; :SPIRV_CAPABILITIES; :CORE_FUNCTIONS; :INSTANCE_FUNCTIONS; :DEVICE_FUNCTIONS;
    ]

    aliases = AliasDeclaration[]
    for (source, target) in collect(alias_dict)
        startswith(string(target), "vk") && continue
        al = AliasDeclaration(source => target)
        al.target in exported_symbols && push!(aliases, al)
    end
    function_aliases = Expr[]
    _spec_funcs = f(spec_funcs)
    for (source, target) in collect(alias_dict)
        al = AliasDeclaration(source => target)
        startswith(string(source), "vk") || continue
        f = func_by_name(target)
        handle = dispatch_handle(f)
        param = @match handle begin
            :(device($x)) || :(instance($x)) || x::Symbol => x
            nothing => nothing
        end
        args = Any[:(args...)]
        !isnothing(param) && pushfirst!(args, param)
        if f in _spec_funcs
            push!(function_aliases,
                # :($source(args..., fptr::FunctionPtr; kwargs...) = $target(args..., fptr; kwargs...)),
                :($(al.source)($(args...); kwargs...) = @dispatch $source $handle $(al.target)($(args...); kwargs...))
            )
            push!(exported_symbols, al.source)
        end
    end

    append!(exported_symbols, exports.(aliases))

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
            to_expr.(struct_constructors_from_hl);
            to_expr.(struct_constructors_from_ll);
            to_expr.(struct_constructors_from_core);
            documented.(struct_converts_to_ll);

            documented.(funcs);
            to_expr.(funcs_fptr);
            documented.(funcs_hl);
            to_expr.(funcs_hl_fptr);

            documented.(create_func_wrappers);
            to_expr.(create_func_wrappers_fptr);
            documented.(create_func_wrappers_hl);
            to_expr.(create_func_wrappers_hl_fptr);

            documented.(handle_constructors);
            to_expr.(handle_constructors_fptr);
            documented.(handle_constructors_hl);
            to_expr.(handle_constructors_hl_fptr);
            documented.(handle_constructors_api);
            to_expr.(handle_constructors_api_fptr);
            documented.(handle_constructors_api_hl);
            to_expr.(handle_constructors_api_hl_fptr);

            to_expr.(stypes);
            to_expr.(hl_type_mappings);
            to_expr.(core_type_mappings);
            to_expr.(intermediate_type_mappings);

            to_expr.(aliases);
            function_aliases;

            :(const SPIRV_EXTENSIONS = [$(spirv_exts...)]);
            :(const SPIRV_CAPABILITIES = [$(spirv_caps...)]);
            :(const CORE_FUNCTIONS = $core_functions);
            :(const INSTANCE_FUNCTIONS = $instance_functions);
            :(const DEVICE_FUNCTIONS = $device_functions);
        ],
        exported_symbols,
    )
end
