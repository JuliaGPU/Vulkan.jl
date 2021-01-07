using VulkanGen
using VulkanCore

vulkancore_generated_file(name) = joinpath(dirname(dirname(pathof(VulkanCore))), "gen", name)

const vg = VulkanGen
const destfile = joinpath(dirname(dirname(@__DIR__)), "generated", "vulkan_wrapper.jl")
const files = vulkancore_generated_file.(["vk_common.jl", "vk_api.jl"])
const ignored_symbols = Dict(
    :structs => [
        :VkBaseOutStructure,
        :VkBaseInStructure,
    ],
)

function filter_api(api)
    new_api = deepcopy(api)
    for (type, list) ∈ ignored_symbols, sym ∈ list
        exs = getproperty(new_api, type)
        deleteat!(exs, findfirst(x -> name(x) == sym, getproperty(new_api, type)))
    end
    new_api
end

function generate_wrapper(api)
    f_api = filter_api(api)
    w_api = wrap(f_api)

    @info "Writing wrapper to $destfile."
    write(w_api, destfile)
end

api = parse_api(files, ex -> Base.eval(VulkanCore, ex))
generate_wrapper(api)
