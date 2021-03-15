using Documenter, Pkg, Vulkan

Pkg.develop(path="generator")

using VulkanGen

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
    repo="https://github.com/JuliaGPU/Vulkan.jl/blob/{commit}{path}#L{line}",
    sitename="Vulkan.jl",
    authors="serenity4 <cedric.bel@hotmail.fr>",
    strict=true,
    doctest=false,
    checkdocs=:exports,
    linkcheck=:true,
)

deploydocs(
    repo = "github.com/JuliaGPU/Vulkan.jl.git",
)
