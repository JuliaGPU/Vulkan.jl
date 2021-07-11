using SafeTestsets

@safetestset "Vulkan.jl" begin
    include("base.jl")
end

# Integration tests on unregistered packages.
# It is advised not to try to install them because
# they have also unregistered dependencies which makes
# it very painful to setup.

const DEV_PATH = joinpath(homedir(), ".julia", "dev")

using Pkg

if isdir(DEV_PATH)
    for package in ["Givre", "VulkanExamples"]
        if package in readdir(DEV_PATH)
            Pkg.activate(joinpath(DEV_PATH, package))
            Pkg.test()
            GC.gc()
        end
    end
end
