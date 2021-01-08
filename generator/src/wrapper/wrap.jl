struct VulkanWrapper
    handles::Vector{Expr}
    structs::Vector{Expr}
    funcs::Vector{Expr}
    misc::Vector{Expr}
end

Base.show(io::IO, vw::VulkanWrapper) = print(io, "VulkanWrapper with $(length(vw.handles)) handles, $(length(vw.structs)) structs, $(length(vw.funcs)) functions and $(length(vw.misc)) others.")

function wrap(spec::SpecHandle)
    :(mutable struct $(remove_vk_prefix(spec.name)) <: Handle
         handle::$(spec.name)
     end)
end

function wrap(spec::SpecStruct)
    p = Dict(
        :category => :struct,
        :decl => :($(remove_vk_prefix(spec.name)) <: $(spec.is_returnedonly ? :ReturnedOnly : :VulkanStruct)),
    )
    if spec.is_returnedonly
        p[:fields] = map(x -> :($(nc_convert(SnakeCaseLower, x.name))::$(nice_julian_type(x))), spec.members)
    else
        p[:fields] = [
            :(vks::$(spec.name)),
        ]
    end
    (any(!isnothing, spec.members.len) || any(spec.members.type .== :Cstring)) && push!(p[:fields], :(deps::Vector{Any}))
    reconstruct(p)
end

function wrap(spec::SpecFunc)

end

function VulkanWrapper()
    handles = wrap.(spec_handles)
    structs = wrap.(spec_structs)
    # funcs = wrap.(spec_funcs)
    funcs = []
    misc = []
    VulkanWrapper(handles, structs, funcs, misc)
end

is_optional(member::SpecStructMember) = member.name == :pNext || member.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]
is_optional(param::SpecFuncParam) = param.requirement ∈ [OPTIONAL, POINTER_OPTIONAL]
