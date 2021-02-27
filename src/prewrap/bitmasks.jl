abstract type BitMask end

function generate_bitmask_flags(type, decl)
    identifier, value = decl.args
    :(const $(esc(identifier)) = $(esc(:($type($value)))))
end

"""
    @bitmask_flags BitFlags::UInt32 begin
        FLAG_A = 1
        FLAG_B = 2
        FLAG_C = 4
    end

Enumeration of bitmask flags that can be combined with `&`, `|` and `xor`, forbidding the combination of flags from different bitmasks.
"""
macro bitmask_flags(typedecl, expr)
    type, eltype = @match typedecl begin
        :($a::$b) => (a, b)
        _ => error("First argument to @bitmask_flags must be of the form 'type::eltype'")
    end
    decls = filter(x -> typeof(x) ≠ LineNumberNode, expr.args)
    Expr(:block, esc(:(struct $type <: BitMask; val::$eltype; end)), generate_bitmask_flags.(type, decls)...)
end

(&)(a::BitMask, b::BitMask) = error("Bitwise operation between incompatible bitmasks '$(typeof(a))', '$(typeof(b))' not allowed")
(|)(a::BitMask, b::BitMask) = error("Bitwise operation between incompatible bitmasks '$(typeof(a))', '$(typeof(b))' not allowed")
xor(a::BitMask, b::BitMask) = error("Bitwise operation between incompatible bitmasks '$(typeof(a))', '$(typeof(b))' not allowed")

(&)(a::T, b::T) where {T <: BitMask} = T(a.val & b.val)
(|)(a::T, b::T) where {T <: BitMask} = T(a.val | b.val)
xor(a::T, b::T) where {T <: BitMask} = T(xor(a.val, b.val))

(&)(a::T, b::Integer) where {T <: BitMask} = T(a.val & b)
(|)(a::T, b::Integer) where {T <: BitMask} = T(a.val | b)
xor(a::T, b::Integer) where {T <: BitMask} = T(xor(a.val, b))

(&)(a::Integer, b::T) where {T <: BitMask} = b & a
(|)(a::Integer, b::T) where {T <: BitMask} = b | a
xor(a::Integer, b::T) where {T <: BitMask} = xor(b, a)

convert(::Type{UInt32}, bm::BitMask) = bm.val
