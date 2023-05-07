using Documenter
using Literate
using Vulkan
using VulkanGen

function julia_files(dir)
    files = reduce(vcat, [joinpath(root, file) for (root, dirs, files) in walkdir(dir) for file in files])
    sort(filter(endswith(".jl"), files))
end

function replace_edit(content)
    haskey(ENV, "JULIA_GITHUB_ACTIONS_CI") && return content
    # Linking does not work locally, but we can make
    # the warning go away with a hard link to the repo.
    replace(
        content,
        r"EditURL = \".*<unknown>/(.*)\"" => s"EditURL = \"https://github.com/JuliaGPU/Vulkan.jl/tree/master/\1\"",
    )
end

function generate_markdowns()
    dir = joinpath(@__DIR__, "src")
    Threads.@threads for file in julia_files(dir)
        Literate.markdown(
            file,
            dirname(file);
            postprocess = replace_edit,
            documenter = true,
        )
    end
end

generate_markdowns()

makedocs(;
    modules=[Vulkan, VulkanGen],
    format=Documenter.HTML(prettyurls = true),
    pages=[
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "Glossary" => "glossary.md",
        "Tutorial" => [
            "Getting started" => "tutorial/getting_started.md",
            "Error handling" => "tutorial/error_handling.md",
            "Resource management" => "tutorial/resource_management.md",
            "In-depth tutorial" => "tutorial/indepth.md",
            "Running compute shaders" => "tutorial/minimal_working_compute.md",
        ],
        "How to" => [
            "Specify package options" => "howto/preferences.md",
            "Debug an application" => "howto/debugging.md",
            "Manipulate handles" => "howto/handles.md",
            "Compile a SPIR-V shader from Julia" => "howto/shaders.md",
        ],
        "Reference" => [
            "Wrapper types" => "reference/wrapper_types.md",
            "Wrapper functions" => "reference/wrapper_functions.md",
            "API function dispatch" => "reference/dispatch.md",
            "Package options" => "reference/options.md",
        ],
        "Explanations" => [
            "Motivations" => "about/motivations.md",
            "Extension mechanism" => "about/extension_mechanism.md",
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
    strict=true,
    doctest=false,
    checkdocs=:exports,
    linkcheck=:false,
)

deploydocs(
    repo = "github.com/JuliaGPU/Vulkan.jl.git",
    push_preview = true,
)
