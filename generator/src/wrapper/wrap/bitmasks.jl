function wrap(spec::SpecBitmask)
    name = bitmask_flag_type(spec.name)
    Dict(
        :category => :enum,
        :macro => Symbol("@bitmask_flag"),
        :values => map(x -> :($(remove_vk_prefix(x.name)) = $(2^(x.position))), spec.bits),
        :decl => :($name::UInt32),
    )
end
