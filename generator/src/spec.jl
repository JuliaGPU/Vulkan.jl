using EzXML
using Vulkan_Headers_jll:vk_xml

xdoc = readxml(vk_xml)
xroot = xdoc.root

include("spec/utils.jl")
include("spec/aliases.jl")
include("spec/specs.jl")
include("spec/structure_types.jl")

for name ∈ names(@__MODULE__, all=true)
    if any(startswith.(string(name), ["spec_", "Spec"]))
        @eval export $name
    end
end

export
        # alias manipulation
        follow_alias,
        isalias,
        hasalias,

        # specs
        ### utility
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

        ### render_passes
        RenderPassRequirement,
        RenderPassInside,
        RenderPassOutside,
        render_pass_compatibiltiy_map,

        ### queues
        QueueType,
        QueueCompute,
        QueueGraphics,
        QueueTransfer,
        QueueSparseBinding,

        ### structs & funcs
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
