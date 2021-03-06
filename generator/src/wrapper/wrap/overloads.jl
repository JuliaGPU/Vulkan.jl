function extend_from_vk(spec::SpecStruct)
    p = Dict(:category => :function, :name => :from_vk, :args => [:(T::Type{$(remove_vk_prefix(spec.name))}), :(x::$(spec.name))], :short => true)
    p[:body] = :(T($(filter(!isnothing, from_vk_call.(spec.members))...)))
    p
end
