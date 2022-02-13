function FromVk(def::StructDefinition)
    p = Dict(
        :category => :function,
        :name => :from_vk,
        :args => [:(T::Type{$(name(def))}), :(x::$(def.spec.name))],
        :short => true,
    )
    :pNext in def.spec.members.name && push!(p[:args], :(next_types...))
    p[:body] = :(T($(filter(!isnothing, from_vk_call.(def.spec.members))...)))
    FromVk(def, p)
end
