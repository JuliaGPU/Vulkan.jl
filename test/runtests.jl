using SafeTestsets

@safetestset "Vulkan.jl" begin
    include("base.jl")
end

# Integration tests on unregistered packages.
# It is advised not to try to install them because
# they have also unregistered dependencies which makes
# it very painful to setup.

const DEV_PATH = joinpath(homedir(), ".julia", "dev")

if "Givre" in readdir(DEV_PATH)
    @safetestset "Givre" begin
        using Pkg
        DEV_PATH = joinpath(homedir(), ".julia", "dev")
        Pkg.activate(joinpath(DEV_PATH, "Givre"))
        include(joinpath(DEV_PATH, "Givre", "test", "runtests.jl"))
        GC.gc()
        ENV["JULIA_DEBUG"] = ""
    end
end

# VulkanExamples and Givre both do type piracy on Vulkan.jl
# which is incompatible with each other, affecting Givre specifically.

if "VulkanExamples" in readdir(DEV_PATH)
    @safetestset "VulkanExamples" begin
        using Pkg
        DEV_PATH = joinpath(homedir(), ".julia", "dev")
        Pkg.activate(joinpath(DEV_PATH, "VulkanExamples"))
        include(joinpath(DEV_PATH, "VulkanExamples", "examples", "headless", "headless.jl"))
        GC.gc()
        include(joinpath(DEV_PATH, "VulkanExamples", "examples", "texture", "texture_2d.jl"))
        GC.gc()
    end
end
