using VulkanGen
using VulkanCore

const vg = VulkanGen

getfile(name) = dirname(dirname(pathof(VulkanCore))) *  "/gen/" * name
files = getfile.(["vk_common.jl", "vk_api.jl"])
api = API(files, sym -> @eval(VulkanCore, $(Meta.parse("$sym"))))

ignored_symbols = Dict(
    "structs" => [
        "VkBaseOutStructure",
        "VkBaseInStructure",
    ],
)

destfile = joinpath(dirname(dirname(@__DIR__)), "generated", "wrapped_api.jl")

function filter_api(api)
    new_api = deepcopy(api)
    for (type, list) ∈ ignored_symbols, name ∈ list
        api_dict = getproperty(new_api, Symbol(type))
        haskey(api_dict, name) && delete!(api_dict, name)
    end
    new_api
end

f_api = filter_api(api)
w_api = wrap(f_api)

@info "Writing wrapped API to $destfile."
write(w_api, destfile)
