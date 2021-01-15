using VulkanGen

const destfile = joinpath(dirname(dirname(@__DIR__)), "generated", "vulkan_wrapper.jl")

vw = VulkanWrapper()
@info "Vulkan successfully wrapped."
write(vw, destfile)
