using Documenter, Vulkan

using Pkg

Pkg.activate("generator")
Pkg.instantiate()

using VulkanGen

# docstring tests setup
DocMeta.setdocmeta!(Vulkan, :DocTestSetup, quote
    using Vulkan
    instance = unwrap(Instance(String[], String[]))
    physical_device = first(unwrap(enumerate_physical_devices(instance)))
end)

makedocs(;
    modules=[Vulkan, VulkanGen],
    format=Documenter.HTML(prettyurls = true),
    pages=[
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "Design" => "design.md",
        "Features" => "features.md",
        "API" => "api.md",
        "Utility" => "utility.md",
        "Troubleshooting" => "troubleshooting.md",
        "Developer documentation" => "dev.md",
    ],
    repo="https://github.com/serenity4/Vulkan.jl/blob/{commit}{path}#L{line}",
    sitename="Vulkan.jl",
    authors="serenity4 <cedric.bel@hotmail.fr>, SimonDanisch",
    strict=true,
)

deploydocs(
    repo = "github.com/serenity4/Vulkan.jl.git",
)
