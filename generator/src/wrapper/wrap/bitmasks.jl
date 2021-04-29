function bitmask_type(spec::SpecBitmask)
    @match spec.width begin
        8 => :UInt8
        16 => :UInt16
        32 => :UInt32
        64 => :UInt64
        _ => error("Failed to generate bitmask type with width $(spec.width) from $spec")
    end
end

function wrap(spec::SpecBitmask)
    name = bitmask_flag_type(spec.name)
    Dict(
        :category => :enum,
        :macro => Symbol("@bitmask_flag"),
        :values => map(x -> :($(remove_vk_prefix(x.name)) = $(2^(x.position))), spec.bits),
        :decl => :($name::$(bitmask_type(spec))),
    )
end
