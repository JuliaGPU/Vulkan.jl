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
    exts = filter(x -> x.is_provisional && include_provisional_exts(config) || x.platform in config.include_platforms || x.platform == PLATFORM_NONE && config.wrap_core, spec_extensions_supported)
end

function _filter_specs(specs, extensions, wrap_core)
    filter(specs) do spec
        ext = extension(spec)
        isnothing(ext) && wrap_core || ext in extensions
    end
end

filter_specs(config::WrapperConfig) = x -> _filter_specs(x, extensions(config), config.wrap_core)

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
