function extend_from_vk(spec::SpecStruct)
    p = Dict(
        :category => :function,
        :name => :from_vk,
        :args => [:(T::Type{$(struct_name(spec))}), :(x::$(spec.name))],
        :short => true,
    )
    p[:body] = :(T($(filter(!isnothing, from_vk_call.(spec.members))...)))
    p
end
