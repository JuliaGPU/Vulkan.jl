using EzXML: Node, readxml
using Vulkan_Headers_jll:vk_xml

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
]

include("spec/utils.jl")
include("spec/aliases.jl")
include("spec/types.jl")
include("spec/specs.jl")
include("spec/structure_types.jl")

for name ∈ names(@__MODULE__, all=true)
    if any(startswith.(string(name), ["spec_", "Spec"]))
        @eval export $name
    end
end

export
        # Alias manipulation
        follow_alias,
        isalias,
        hasalias,

        # Specifications
        ### Utility
        default,
        func_by_name,
        struct_by_name,
        handle_by_name,
        bitmask_by_name,
        enum_by_name,
        constant_by_name,
        create_func_by_name,
        destroy_func_by_name,
        follow_constant,
        children,
        parent_spec,
        has_length,
        has_computable_length,
        is_length,
        is_arr,
        is_size,
        length_chain,
        is_fn_ptr,
        is_version,

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

        STRUCT_TYPE,
        CREATE_INFO,
        ALLOCATE_INFO,
        GENERIC_INFO,
        DATA,
        PROPERTY,

        FUNC_TYPE,
        CREATE,
        DESTROY,
        ALLOCATE,
        FREE,
        COMMAND,
        QUERY,
        OTHER
