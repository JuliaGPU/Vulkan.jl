"""
Queue type on which a computation can be carried.
"""
abstract type QueueType end

struct QueueCompute <: QueueType end
struct QueueGraphics <: QueueType end
struct QueueTransfer <: QueueType end
struct QueueSparseBinding <: QueueType end
struct QueueVideoDecode <: QueueType end
struct QueueVideoEncode <: QueueType end

"""
Render pass execution specification for commands.
"""
abstract type RenderPassRequirement end

"""
The command can be executed inside a render pass.
"""
struct RenderPassInside <: RenderPassRequirement end

"""
The command can be executed outside a render pass.
"""
struct RenderPassOutside <: RenderPassRequirement end

"""
Function type classification.

Types:
- `FTYPE_CREATE`: constructor (functions that begin with `vkCreate`).
- `FTYPE_DESTROY`: destructor (functions that begin with `vkDestroy`).
- `FTYPE_ALLOCATE`: allocator (functions that begin with `vkAllocate`).
- `FTYPE_FREE`: deallocator (functions that begin with `vkFree`).
- `FTYPE_COMMAND`: Vulkan command (functions that begin with `vkCmd`).
- `FTYPE_QUERY`: used to query parameters, returned directly or indirectly through pointer mutation (typically, functions that begin with `vkEnumerate` and `vkGet`, but not all of them and possibly others).
- `FTYPE_OTHER`: no identified type.
"""
@enum FunctionType FTYPE_CREATE = 1 FTYPE_DESTROY FTYPE_ALLOCATE FTYPE_FREE FTYPE_COMMAND FTYPE_QUERY FTYPE_OTHER

"""
Structure type classification.

Types:
- `STYPE_CREATE_INFO`: holds constructor parameters (structures that end with `CreateInfo`).
- `STYPE_ALLOCATE_INFO`: holds allocator parameters (structures that end with `AllocateInfo`).
- `STYPE_GENERIC_INFO`: holds parameters for another function or structure (structures that end with `Info`, excluding those falling into the previous types).
- `STYPE_DATA`: usually represents user or Vulkan data.
- `STYPE_PROPERTY`: is a property returned by Vulkan in a `returnedonly` structure, usually done through `FTYPE_QUERY` type functions.
"""
@enum StructType STYPE_CREATE_INFO = 1 STYPE_ALLOCATE_INFO STYPE_GENERIC_INFO STYPE_DATA STYPE_PROPERTY

"""
Parameter requirement. Applies both to struct members and function parameters.

Requirement types: 
- `OPTIONAL`: may have its default zero (or nullptr) value, acting as a sentinel value (similar to `Nothing` in Julia).
- `REQUIRED`: must be provided, no sentinel value is allowed.
- `POINTER_OPTIONAL`: is a pointer which may be null, but must have valid elements if provided.
- `POINTER_REQUIRED`: must be a valid pointer, but its elements are optional (e.g. are allowed to be sentinel values).
"""
@enum PARAM_REQUIREMENT OPTIONAL = 1 REQUIRED POINTER_OPTIONAL POINTER_REQUIRED

PARAM_REQUIREMENT(node::Node) =
    !haskey(node, "optional") || node["optional"] == "false" ? REQUIRED :
    PARAM_REQUIREMENT(findfirst(node["optional"] .== ["true", "false", "true,false", "false,true"]))

"""
Everything that a Vulkan specification can apply to: data structures, functions, parameters...
"""
abstract type Spec end

Base.broadcastable(spec::Spec) = Ref(spec)

"""
Specification for a function parameter.
"""
struct SpecFuncParam <: Spec
    "Name of the parent function."
    func::Symbol
    "Identifier."
    name::Symbol
    "Expression of its idiomatic Julia type."
    type::ExprLike
    "If constant, cannot be mutated by Vulkan functions."
    is_constant::Bool
    "Whether it must be externally synchronized before calling the function."
    is_externsync::Bool
    "[`PARAM_REQUIREMENT`](@ref) classification."
    requirement::PARAM_REQUIREMENT
    "Name of the parameter (of the same function) which represents its length. `Nothing` for non-vector types."
    len::Optional{Symbol}
    "Name of the parameters (of the same function) it is a length of."
    arglen::Vector{Symbol}
    "Whether automatic validity documentation is enabled. If false, this means that the parameter may be an exception to at least one Vulkan convention."
    autovalidity::Bool
end

"""
Specification for a function.
"""
struct SpecFunc <: Spec
    "Name of the function."
    name::Symbol
    "[`FunctionType`](@ref) classification."
    type::FunctionType
    "Return type (void if `Nothing`)."
    return_type::Optional{ExprLike}
    "Whether the function can be executed inside a render pass, outside, or both. Empty if not specified, in which case it is equivalent to both inside and outside."
    render_pass_compatibility::Vector{RenderPassRequirement}
    "Type of queues on which the function can be executed. Empty if not specified, in which case it is equivalent to being executable on all queues."
    queue_compatibility::Vector{QueueType}
    "Function parameters."
    params::StructVector{SpecFuncParam}
    success_codes::Vector{Symbol}
    error_codes::Vector{Symbol}
end

"""
Specification for a structure parameter.
"""
struct SpecStructMember <: Spec
    "Name of the parent structure."
    parent::Symbol
    "Identifier."
    name::Symbol
    "Expression of its idiomatic Julia type."
    type::ExprLike
    "If constant, cannot be mutated by Vulkan functions."
    is_constant::Bool
    "Whether it must be externally synchronized before calling any function which uses the parent structure."
    is_externsync::Bool
    "[`PARAM_REQUIREMENT`](@ref) classification."
    requirement::PARAM_REQUIREMENT
    "Name of the member (of the same structure) which represents its length. `Nothing` for non-vector types."
    len::Optional{ExprLike}
    "Name of the members (of the same structure) it is a length of."
    arglen::Vector{ExprLike}
    "Whether automatic validity documentation is enabled. If false, this means that the member may be an exception to at least one Vulkan convention."
    autovalidity::Bool
end

"""
Specification for a structure.
"""
struct SpecStruct <: Spec
    "Name of the structure."
    name::Symbol
    "[`StructType`](@ref) classification."
    type::StructType
    "Whether the structure is only returned by Vulkan functions (and never requested as input)."
    is_returnedonly::Bool
    "Name of the structures it extends, usually done through the original structures' `pNext` argument."
    extends::Vector{Symbol}
    "Structure members."
    members::StructVector{SpecStructMember}
end

"""
Specification for a union type.
"""
struct SpecUnion <: Spec
    "Name of the union type."
    name::Symbol
    "Possible types for the union."
    types::Vector{ExprLike}
    "Fields which cast the struct into the union types"
    fields::Vector{Symbol}
    "Selector values, if any, to determine the type of the union in a given context (function call for example)."
    selectors::Vector{Symbol}
    "Whether the type is only returned by Vulkan functions (and never requested as input)."
    is_returnedonly::Bool
end

"""
Specification for a constant.
"""
struct SpecConstant <: Spec
    "Name of the constant."
    name::Symbol
    "Value of the constant."
    value::Any
end

"""
Specification for an enumeration type.
"""
struct SpecEnum <: Spec
    "Name of the enumeration type."
    name::Symbol
    "Vector of possible enumeration values."
    enums::StructVector{SpecConstant}
end

"""
Specification for a bit used in a bitmask.
"""
struct SpecBit <: Spec
    "Name of the bit."
    name::Symbol
    "Position of the bit."
    position::Int
end

"""
Specification for a bitmask type that must be formed through a combination of `bits`.

Is usually an alias for a `UInt32` type which carries meaning through its bits.
"""
struct SpecBitmask <: Spec
    "Name of the bitmask type."
    name::Symbol
    "Valid bits that can be combined to form the final bitmask value."
    bits::StructVector{SpecBit}
    width::Integer
end

"""
Specification for a flag type `name` that is a type alias of `typealias`. Can be associated with a bitmask structure, in which case the `bitmask` number is set to the corresponding `SpecBitmask`.
"""
struct SpecFlag <: Spec
    "Name of the flag type."
    name::Symbol
    "The type it aliases."
    typealias::Symbol
    "Bitmask, if applicable."
    bitmask::Optional{SpecBitmask}
end

"""
Specification for handle types.

A handle may possess a parent. In this case, the handle can only be valid if its parent is valid.

Some handles are dispatchable, which means that they are represented as opaque pointers.
Non-dispatchable handles are 64-bit integer types, and may encode information directly into their value.
"""
struct SpecHandle <: Spec
    "Name of the handle type."
    name::Symbol
    "Name of the parent handle, if any."
    parent::Optional{Symbol}
    "Whether the handle is dispatchable or not."
    is_dispatchable::Bool
end

"""
Specification for an alias of the form `const <name> = <alias>`.
"""
struct SpecAlias{S<:Spec} <: Spec
    "Name of the new alias."
    name::Symbol
    "Aliased specification element."
    alias::S
end

"""
Function `func` that creates a `handle` from a create info structure `create_info_struct` passed as the value of the parameter `create_info_param`.

If `batch` is true, then `func` expects a list of multiple create info structures and will create multiple handles at once.
"""
struct CreateFunc <: Spec
    func::SpecFunc
    handle::SpecHandle
    create_info_struct::Optional{SpecStruct}
    create_info_param::Optional{SpecFuncParam}
    batch::Bool
end

"""
Function `func` that destroys a `handle` passed as the value of the parameter `destroyed_param`.

If `batch` is true, then `func` expects a list of multiple handles and will destroy all of them at once.
"""
struct DestroyFunc <: Spec
    func::SpecFunc
    handle::SpecHandle
    destroyed_param::SpecFuncParam
    batch::Bool
end

@enum ExtensionType begin
    EXTENSION_TYPE_INSTANCE
    EXTENSION_TYPE_DEVICE
    EXTENSION_TYPE_ANY
end

@enum PlatformType::UInt32 begin
    PLATFORM_NONE        = 0
    PLATFORM_XCB         = 1
    PLATFORM_XLIB        = 2
    PLATFORM_XLIB_XRANDR = 4
    PLATFORM_WAYLAND     = 8
    PLATFORM_METAL       = 16
    PLATFORM_MACOS       = 32
    PLATFORM_IOS         = 64
    PLATFORM_WIN32       = 128
    PLATFORM_ANDROID     = 256
    PLATFORM_GGP         = 512
    PLATFORM_VI          = 1024
    PLATFORM_FUCHSIA     = 2048
    PLATFORM_DIRECTFB    = 4096
    PLATFORM_SCREEN      = 8192
    PLATFORM_PROVISIONAL = 16384
end

struct SpecPlatform <: Spec
    type::PlatformType
    description::String
end

struct SpecExtension <: Spec
    name::Symbol
    type::ExtensionType
    requirements::Vector{Symbol}
    is_disabled::Bool
    author::Optional{String}
    symbols::Vector{Symbol}
    platform::PlatformType
    is_provisional::Bool
end

function Base.show(io::IO, ::MIME"text/plain", ext::SpecExtension)
    @match ext.type begin
        &EXTENSION_TYPE_INSTANCE => print(io, "Instance extension ")
        &EXTENSION_TYPE_DEVICE => print(io, "Device extension ")
        &EXTENSION_TYPE_ANY => print(io, "Extension ")
    end
    print(io, ext.name)
    inline_infos = String[]
    ext.is_provisional && push!(inline_infos, "provisional")
    ext.is_disabled && push!(inline_infos, "disabled")
    !isempty(inline_infos) && print(io, " (", join(inline_infos, ", "), ')')
    println(io)
    ext.platform ∉ (PLATFORM_NONE, PLATFORM_PROVISIONAL) && println(io, "• Platform: ", replace(string(ext.platform), "PLATFORM_" => ""), " (", first(spec_by_field(spec_platforms, :type, ext.platform)).description, ')')
    !isempty(ext.requirements) && println(io, "• Depends on: ", join(ext.requirements, ", "))
    n = length(ext.symbols)
    if n > 0
        println(io, "• $n symbols: ")
        limit = 8
        foreach(enumerate(sort(ext.symbols))) do (i, symbol)
            (i ≤ limit / 2 || i > n - limit ÷ 2) && (i == n ? print : println)(io, "  ∘ ", symbol)
            i == limit ÷ 2 && println(io, "  ⋮")
        end
    end
    if !isnothing(ext.author)
        print(io, "\n• From: ", ext.author)
        authors = spec_by_field(author_tags, :tag, ext.author)
        if !isempty(authors)
            @assert length(authors) == 1
            print(io, " (", first(authors).author, ')')
        end
    end
end

struct AuthorTag
    tag::String
    author::String
end
