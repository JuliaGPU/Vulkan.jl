using Documenter, Vulkan

makedocs(;
    modules=[Vulkan],
    format=Documenter.HTML(prettyurls = true),
    pages=[
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "Features" => "features.md",
        "Design" => "design.md",
        "API" => "api.md",
        "Utility" => "utility.md",
        "Troubleshooting" => "troubleshooting.md",
    ],
    repo="https://github.com/serenity4/Vulkan.jl/blob/{commit}{path}#L{line}",
    sitename="Vulkan.jl",
    authors="serenity4 <cedric.bel@hotmail.fr>, SimonDanisch"
)

deploydocs(
    repo = "github.com/serenity4/Vulkan.jl.git",
)
