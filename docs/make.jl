using Documenter, Vulkan

using Pkg

Pkg.activate("generator")
Pkg.instantiate()

using VulkanGen

DocMeta.setdocmeta!(Vulkan, :DocTestSetup, quote
    using Vulkan
    instance = Instance(String[], String[])
    physical_device = first(enumerate_physical_devices(instance))
end)

makedocs(;
    modules=[Vulkan, VulkanGen],
    format=Documenter.HTML(prettyurls = true),
    pages=[
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "Features" => "features.md",
        "Design" => "design.md",
        "API" => "api.md",
        "Utility" => "utility.md",
        "Troubleshooting" => "troubleshooting.md",
        "Developer documentation" => "dev.md",
    ],
    repo="https://github.com/serenity4/Vulkan.jl/blob/{commit}{path}#L{line}",
    sitename="Vulkan.jl",
    authors="serenity4 <cedric.bel@hotmail.fr>, SimonDanisch"
)

deploydocs(
    repo = "github.com/serenity4/Vulkan.jl.git",
)
