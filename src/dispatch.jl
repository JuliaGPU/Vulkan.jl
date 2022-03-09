struct DispatchTable
    """
    Core version that the dispatch table must be used with.

    For more information, see [Valid Usage for Newer Core Versions](https://www.khronos.org/registry/vulkan/specs/1.3/html/vkspec.html#fundamentals-validusage-versions).
    """
    required_version::VersionNumber
    "Function pointers used for API calls."
    pointers::Dict{Symbol,Ptr{Cvoid}}
end

DispatchTable(required_version::VersionNumber) = DispatchTable(required_version, Dict())

function DispatchTable(application_version::Optional{VersionNumber}, loader_version::VersionNumber)
    DispatchTable(min(something(application_version, typemax(VersionNumber)), loader_version))
end

function DispatchTable(application_version::Optional{VersionNumber}, device::Device)
    props = Vk.get_physical_device_properties(device.physical_device)
    DispatchTable(min(something(application_version, typemax(VersionNumber)), props.api_version))
end

# const PromotionInfo = Dict{Symbol, Vector{Pair{VersionNumber, Symbol}}}
#TODO: remove that
promotion_info = Dict()

function add_fptr!(dtable::DispatchTable, handle, f::Symbol)
    if haskey(promotion_info, f)
        # Compute latest name of `f` after promotion.
        # Promotion in versions higher than `dtable.required_version` are ignored.
        promoted_version = v"0"
        for (version, promoted_name) in promotion_info[f]
            if version ≤ dtable.required_version && version > promoted_version
                f = promoted_name
                promoted_version = version
            end
        end
    end
    fptr = function_pointer(handle, string(f))
    if fptr == C_NULL
        error("Could not retrieve function pointer for '$f'. This can be caused by an extension not being enabled for a function that needs it; see the help with `?` or the documentation for more information.")
    end
    dtable.pointers[f] = fptr
end

struct APIDispatcher
    application_versions::Dict{Instance,Optional{VersionNumber}}
    loader_table::DispatchTable
    instance_tables::Dict{Instance,DispatchTable}
    device_tables::Dict{Device,DispatchTable}
end

function APIDispatcher()
    loader_version = unwrap(enumerate_instance_version(function_pointer("vkEnumerateInstanceVersion")))
    APIDispatcher(Dict(), DispatchTable(loader_version), Dict(), Dict())
end

table(disp::APIDispatcher, ::Nothing) = disp.loader_table
table(disp::APIDispatcher, x) = table(disp, handle(x))

function table(disp::APIDispatcher, instance::Instance)
    get!(() -> DispatchTable(disp.application_versions[instance], disp.loader_table.required_version), disp.instance_tables, instance)
end

function table(disp::APIDispatcher, device::Device)
    get!(() -> DispatchTable(disp.application_versions[instance(device)], device), disp.device_tables, device)
end

function get_fptr(disp::APIDispatcher, handle, key::Symbol)::Ptr{Cvoid}
    t = table(disp, handle)
    val = get(t.pointers, key, nothing)
    !isnothing(val) && return val
    add_fptr!(t, handle, key)
end
