"""
Configuration structure which allow the selection of specific parts of the Vulkan API.
"""
Base.@kwdef struct WrapperConfig
    wrap_core::Bool = true
    include_provisional_exts::Bool = false
    include_platforms::Vector{PlatformType} = []
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
