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
    vw = VulkanWrapper(config)
    @info "Vulkan successfully wrapped."
    write(vw, config)
end
