function FromVk(def::StructDefinition{false})
    p = Dict(
        :category => :function,
        :name => :from_vk,
        :args => [:(T::Type{$(name(def))}), :(x::$(def.spec.name))],
        :short => true,
    )
    p[:body] = :(T($(filter(!isnothing, from_vk_call.(def.spec.members))...)))
    FromVk(def, p)
end
