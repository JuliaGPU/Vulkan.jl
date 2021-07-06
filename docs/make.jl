using Documenter, Vulkan

if get(ENV, "JULIA_DOCUMENTER_CI", "OFF") == "ON"
    using Pkg
    Pkg.develop(path=joinpath(dirname(@__DIR__), "generator"))
else
    push!(LOAD_PATH, joinpath(dirname(@__DIR__), "generator"))
end

using VulkanGen

makedocs(;
    modules=[Vulkan, VulkanGen],
    format=Documenter.HTML(prettyurls = true),
    pages=[
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "Design" => "design.md",
        "Features" => [
            "Overview" => "features/overview.md",
            "Vulkan functions" => "features/functions.md",
            "Handles" => "features/handles.md",
            "Types" => "features/types.md",
        ],
        "API" => "api.md",
        "Utility" => "utility.md",
        "Troubleshooting" => "troubleshooting.md",
        "Developer documentation" => [
            "Overview" => "dev/overview.md",
            "Vulkan specification" => "dev/spec.md",
            "Generator" => "dev/gen.md",
        ],
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
