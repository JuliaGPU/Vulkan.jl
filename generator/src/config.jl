"""
Configuration structure which allow the selection of specific parts of the Vulkan API.
"""
Base.@kwdef struct WrapperConfig
    "Include core API (with core extensions)."
    wrap_core::Bool = true
    "Include beta (provisional) exensions. Provisional extensions may break between patch releases."
    include_provisional_exts::Bool = false
    "Platform-specific families of extensions to include."
    include_platforms::Vector{PlatformType} = []
    "Path the wrapper will be written to."
    destfile::String
end

include_provisional_exts(config::WrapperConfig) = config.include_provisional_exts || PLATFORM_PROVISIONAL in config.include_platforms

function extensions(config::WrapperConfig)
    exts = filter(x -> x.is_provisional && include_provisional_exts(config) || x.platform in config.include_platforms || x.platform == PLATFORM_NONE && config.wrap_core, filter(x -> VULKAN in x.applicable, api.extensions))
end

function _filter_specs(specs, extensions, wrap_core, disabled)
    filter(specs) do spec
        # Symbols the C headers never define must not reach *any* emission path
        # (constants, structs, structure_type methods, aliases, ...), or the
        # generated module fails to resolve them at load time.
        hasproperty(spec, :name) && spec.name in disabled && return false
        ext = get(api.extensions, spec, nothing)
        isnothing(ext) && wrap_core || ext in extensions
    end
end

function filter_specs(config::WrapperConfig)
    disabled = disabled_symbols(api)
    x -> _filter_specs(x, extensions(config), config.wrap_core, disabled)
end

"""
Symbols the Vulkan headers do not define: reachable only through disabled
extensions (Vulkan-Docs#1225) or through Vulkan SC-only requirements.

VulkanSpec dropped `VulkanAPI.disabled_symbols` in 0.1.5. The information now
lives on the extensions *and* on the version sets (`api.sets`), each carrying an
`applicable::Vector{ApplicableAPI}` and `groups` holding the symbols. Both must
be walked: `VkPerformanceQueryReservationInfoKHR` is reachable only through a
`<require api="vulkansc">` block of a version set, never an extension.

A symbol counts as disabled only if it is reachable **exclusively** from
non-Vulkan groups. Many types are shared and merely gain extra Vulkan SC values -
`VkPipelineCacheCreateFlagBits` is listed in an SC-only require block but is very
much part of core Vulkan - so the enabled paths must be subtracted out.

An empty `applicable` means "no API restriction", not "no APIs".
"""
function disabled_symbols(api::VulkanAPI)
    enabled, disabled = Set{Symbol}(), Set{Symbol}()
    applies(x) = isempty(x.applicable) || VULKAN in x.applicable
    function sort_groups!(groups, off)
        for group in groups
            target = (off || !applies(group)) ? disabled : enabled
            for sym in group.symbols
                push!(target, sym.name)
            end
        end
    end
    for ext in api.extensions
        sort_groups!(ext.groups, ext.disabled || !applies(ext))
    end
    for set in api.sets
        sort_groups!(set.groups, !applies(set))
    end
    setdiff!(disabled, enabled)
end

abstract type Platform end

struct Linux <: Platform end
struct MacOS <: Platform end
struct BSD <: Platform end
struct Windows <: Platform end

WrapperConfig(p::Platform, destfile; kwargs...) = WrapperConfig(; include_platforms = platform_extensions(p), destfile, kwargs...)

platform_extensions(::Linux) = [PLATFORM_WAYLAND, PLATFORM_XCB, PLATFORM_XLIB, PLATFORM_XLIB_XRANDR]
platform_extensions(::MacOS) = [PLATFORM_MACOS, PLATFORM_METAL]
platform_extensions(::BSD) = [PLATFORM_WAYLAND, PLATFORM_XCB, PLATFORM_XLIB, PLATFORM_XLIB_XRANDR]
platform_extensions(::Windows) = [PLATFORM_WIN32]
