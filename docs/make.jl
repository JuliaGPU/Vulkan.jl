using Documenter
using Literate
using SafeTestsets

julia_files(dir) = sort(filter(endswith(".jl"), readdir(dir, join=true)))

const TUTORIAL_DIR = joinpath(@__DIR__, "src", "tutorial")

function generate_tutorials_md(dir)
    for files in julia_files(dir)
        @safetestset "$(filename)" begin
            include(filename)
        end
        Literate.markdown(
            filename,
            dir;
            documenter = true,
        )
    end
end

generate_tutorials_md(TUTORIAL_DIR)

if get(ENV, "JULIA_DOCUMENTER_CI", "OFF") == "ON"
    using Pkg
    Pkg.develop(path=joinpath(dirname(@__DIR__), "generator"))
else
    push!(LOAD_PATH, joinpath(dirname(@__DIR__), "generator"))
end

using Vulkan
using VulkanGen

makedocs(;
    modules=[Vulkan, VulkanGen],
    format=Documenter.HTML(prettyurls = true),
    pages=[
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "About" => [
            "Motivations" => "about/motivations.md",
            "Interfacing with the C API" => "about/interfacing.md",
        ],
        "Tutorial" => [
            "Getting started" => "tutorial/getting_started.md",
            "Types" => "tutorial/types.md",
            "Vulkan functions" => "tutorial/functions.md",
            "Error handling" => "tutorial/error_handling.md",
            "In-depth tutorial" => "tutorial/indepth.md",
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
    strict=false,
    doctest=false,
    checkdocs=:exports,
    linkcheck=:true,
)

deploydocs(
    repo = "github.com/JuliaGPU/Vulkan.jl.git",
)
