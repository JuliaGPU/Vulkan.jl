using VulkanGen

const destdir = joinpath(dirname(dirname(@__DIR__)), "generated")

vw = VulkanWrapper(WrapperConfig())
@info "Vulkan successfully wrapped."
write(vw, destdir)
