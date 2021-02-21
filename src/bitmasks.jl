includes_bits(mask, bits) = Bool(mask & bits == bits)
includes_bits(bits) = Base.Fix2(includes_bits, bits)

optional_bitwise_op(op, value, option::Nothing) = value
optional_bitwise_op(op, value, option) = op(value, option)

optional_bitwise_or(value, option) = optional_bitwise_op(|, value, option)
optional_bitwise_and(value, option) = optional_bitwise_op(&, value, option)
optional_bitwise_xor(value, option) = optional_bitwise_op(xor, value, option)
