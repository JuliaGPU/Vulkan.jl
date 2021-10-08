function bitmask_type(spec::SpecBitmask)
    @match spec.width begin
        8 => :UInt8
        16 => :UInt16
        32 => :UInt32
        64 => :UInt64
        _ => error("Failed to generate bitmask type with width $(spec.width) from $spec")
    end
end

bitmask_value(spec::SpecBit) = 2^(spec.position)
bitmask_value(spec::SpecBitCombination) = spec.value

function BitmaskDefinition(spec::SpecBitmask)
    name = bitmask_flag_type(spec)
    p = Dict(
        :category => :enum,
        :macro => Symbol("@bitmask_flag"),
        :values => map(x -> :($(remove_vk_prefix(x.name)) = $(bitmask_value(x))), [collect(spec.bits); collect(spec.combinations)]),
        :decl => :($name::$(bitmask_type(spec))),
    )
    BitmaskDefinition(spec, p)
end
