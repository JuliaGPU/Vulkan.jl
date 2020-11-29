using VulkanGen
using VulkanCore

getfile(name) = joinpath(dirname(dirname(pathof(VulkanCore))), "gen", name)

const vg = VulkanGen
const destfile = joinpath(dirname(dirname(@__DIR__)), "generated", "wrapped_api.jl")
const files = getfile.(["vk_common.jl", "vk_api.jl"])
const ignored_symbols = Dict(
    :structs => [
        "VkBaseOutStructure",
        "VkBaseInStructure",
    ],
)

function filter_api(api)
    new_api = deepcopy(api)
    for (type, list) ∈ ignored_symbols, name ∈ list
        api_dict = getproperty(new_api, type)
        delete!(api_dict, name)
    end
    new_api
end

function generate_wrapper(api)
    f_api = filter_api(api)
    w_api = wrap(f_api)

    @info "Writing wrapper to $destfile."
    write(w_api, destfile)
end

api = API(files, sym -> Base.eval(VulkanCore, Meta.parse(sym)))
generate_wrapper(api)
