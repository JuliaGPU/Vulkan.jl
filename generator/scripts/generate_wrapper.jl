using VulkanGen

const destdir = joinpath(dirname(dirname(@__DIR__)), "generated")

wrapper_config(platform, destfile) = WrapperConfig(platform, joinpath(destdir, destfile))

configs = [
    wrapper_config(Linux(), "linux.jl"),
    wrapper_config(MacOS(), "macos.jl"),
    wrapper_config(BSD(), "bsd.jl"),
    wrapper_config(Windows(), "windows.jl"),
]

foreach(configs) do config
    @time vw = VulkanWrapper(config)
    @time write(vw, config)
    @info "Vulkan successfully wrapped at $(config.destfile)"
end
