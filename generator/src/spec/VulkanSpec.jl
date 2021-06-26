module VulkanSpec

using StructArrays: StructVector
using LightGraphs
using MLStyle
using DocStringExtensions
using EzXML: Node, readxml
using Vulkan_Headers_jll: vk_xml

@template (FUNCTIONS, METHODS, MACROS) = """
                                         $(DOCSTRING)
                                         $(TYPEDSIGNATURES)
                                         """

@template TYPES = """
                  $(DOCSTRING)
                  $(TYPEDEF)
                  $(TYPEDSIGNATURES)
                  $(TYPEDFIELDS)
                  $(SIGNATURES)
                  """

const ExprLike = Union{Symbol,Expr}
const Optional{T} = Union{Nothing,T}

const xdoc = readxml(vk_xml)
const xroot = xdoc.root

const extension_types = [
    :Display,
    :VisualID,
    :Window,
    :RROutput,
    :wl_display,
    :wl_surface,
    :HINSTANCE,
    :HWND,
    :HMONITOR,
    :HANDLE,
    :SECURITY_ATTRIBUTES,
    :DWORD,
    :LPCWSTR,
    :xcb_connection_t,
    :xcb_visualid_t,
    :xcb_window_t,
    :IDirectFB,
    :IDirectFBSurface,
    :zx_handle_t,
    :GgpStreamDescriptor,
    :GgpFrameToken,
    :MirConnection,
    :MirSurface,
    :ANativeWindow,
    :AHardwareBuffer,
    :CAMetalLayer,
    :_screen_context,
    :_screen_window,
]

include("utils.jl")
include("aliases.jl")
include("types.jl")
include("specs.jl")
include("structure_types.jl")

for sym in names(@__MODULE__, all=true)
    if any(startswith(string(sym), prefix) for prefix in ["PLATFORM_", "FTYPE_", "STYPE_"])
        @eval export $sym
    end
end

export
    # Types
    Spec,
    SpecAlias,
    SpecBit,
    SpecBitmask,
    SpecConstant,
    SpecEnum,
    SpecExtension,
    SpecFlag,
    SpecFunc,
    SpecFuncParam,
    SpecStruct,
    SpecStructMember,
    SpecHandle,
    SpecUnion,
    CreateFunc,
    DestroyFunc,
    AuthorTag,
    PlatformType,

    # Classification
    extension_types,
    structure_types,

    # Specification data structures
    spec_extensions,
    spec_extensions_supported,
    spec_constants,
    spec_flags,
    spec_enums,
    spec_bitmasks,
    spec_unions,
    spec_structs,
    spec_struct_members,
    spec_funcs,
    spec_func_params,
    spec_create_funcs,
    spec_create_info_structs,
    spec_destroy_funcs,
    spec_handles,
    spec_all_semantic_enums,
    spec_all_noalias,
    disabled_symbols,

    # Alias manipulation
    follow_alias,
    isalias,
    hasalias,

    # Specifications
    ### Utility
    default,
    func_by_name,
    struct_by_name,
    union_by_name,
    handle_by_name,
    bitmask_by_name,
    flag_by_name,
    enum_by_name,
    constant_by_name,
    create_func,
    create_funcs,
    create_func_no_batch,
    destroy_func,
    destroy_funcs,
    follow_constant,
    children,
    parent_spec,
    len,
    has_length,
    has_computable_length,
    arglen,
    is_length,
    is_length_exception,
    is_inferable_length,
    length_chain,
    is_arr,
    is_size,
    is_data,
    is_fn_ptr,
    is_version,
    is_void,
    extension,

    ### Render passes
    RenderPassRequirement,
    RenderPassInside,
    RenderPassOutside,
    render_pass_compatibiltiy_map,

    ### Queues
    QueueType,
    QueueCompute,
    QueueGraphics,
    QueueTransfer,
    QueueSparseBinding,

    ### Structures & functions
    PARAM_REQUIREMENT,
    OPTIONAL,
    REQUIRED,
    POINTER_OPTIONAL,
    POINTER_REQUIRED,
    StructType,
    FunctionType

end # module
