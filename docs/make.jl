using Documenter
using Literate
using Vulkan
using VulkanGen

function julia_files(dir)
    files = reduce(vcat, [joinpath(root, file) for (root, dirs, files) in walkdir(dir) for file in files])
    sort(filter(endswith(".jl"), files))
end

function generate_markdowns()
    dir = joinpath(@__DIR__, "src")
    Threads.@threads for file in julia_files(dir)
        Literate.markdown(
            file,
            dirname(file),
            documenter = true,
        )
    end
end

generate_markdowns()

if get(ENV, "JULIA_DOCUMENTER_CI", "OFF") == "ON"
    using Pkg
    Pkg.develop(path=joinpath(dirname(@__DIR__), "generator"))
else
    push!(LOAD_PATH, joinpath(dirname(@__DIR__), "generator"))
end

makedocs(;
    modules=[Vulkan, VulkanGen],
    format=Documenter.HTML(prettyurls = true),
    pages=[
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "About" => [
            "Motivations" => "about/motivations.md",
            "Interfacing with the C API" => "about/interfacing.md",
            "Extension mechanism" => "about/extension_mechanism.md",
        ],
        "Tutorial" => [
            "Getting started" => "tutorial/getting_started.md",
            "Vulkan types" => "tutorial/types.md",
            "Vulkan functions" => "tutorial/functions.md",
            "Error handling" => "tutorial/error_handling.md",
            "Resource management" => "tutorial/resource_management.md",
            "Dispatch" => "tutorial/dispatch.md",
            "In-depth tutorial" => "tutorial/indepth.md",
            "Running compute shaders" => "tutorial/minimal_working_compute.md",
        ],
        "How to" => [
            "howto/preferences.md",
            "howto/debugging.md",
        ],
        "API" => "api.md",
        "Utility" => "utility.md",
        "Troubleshooting" => "troubleshooting.md",
        "Developer documentation" => [
            "Overview" => "dev/overview.md",
            "Vulkan specification" => "dev/spec.md",
            "Generator" => "dev/gen.md",
            "Next chains" => "dev/next_chains.md",
        ],
    ],
    repo="https://github.com/JuliaGPU/Vulkan.jl/blob/{commit}{path}#L{line}",
    sitename="Vulkan.jl",
    authors="serenity4 <cedric.bel@hotmail.fr>",
    strict=false,
    doctest=false,
    checkdocs=:exports,
    linkcheck=:false,
)

deploydocs(
    repo = "github.com/JuliaGPU/Vulkan.jl.git",
    push_preview = true,
)
