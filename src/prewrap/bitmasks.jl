abstract type BitMask end

function generate_bitmask_flags(type, decl)
    identifier, value = decl.args
    :(const $(esc(identifier)) = $(esc(:($type($value)))))
end

"""
    @bitmask_flag BitFlags::UInt32 begin
        FLAG_A = 1
        FLAG_B = 2
        FLAG_C = 4
    end

Enumeration of bitmask flags that can be combined with `&`, `|` and `xor`, forbidding the combination of flags from different bitmasks.
"""
macro bitmask_flag(typedecl, expr)
    type, eltype = @match typedecl begin
        :($a::$b) => (a, b)
        _ => error("First argument to @bitmask_flag must be of the form 'type::eltype'")
    end
    decls = filter(x -> typeof(x) ≠ LineNumberNode, expr.args)
    Expr(:block, esc(:(struct $type <: BitMask; val::$eltype; end)), generate_bitmask_flags.(type, decls)...)
end

(&)(a::BitMask, b::BitMask) = error("Bitwise operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
(|)(a::BitMask, b::BitMask) = error("Bitwise operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
xor(a::BitMask, b::BitMask) = error("Bitwise operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
isless(a::BitMask, b::BitMask) = error("Bitwise operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
(==)(a::BitMask, b::BitMask) = error("Operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")

(&)(a::T, b::T) where {T <: BitMask} = T(a.val & b.val)
(|)(a::T, b::T) where {T <: BitMask} = T(a.val | b.val)
xor(a::T, b::T) where {T <: BitMask} = T(xor(a.val, b.val))
isless(a::T, b::T) where {T <: BitMask} = isless(a.val, b.val)
(==)(a::T, b::T) where {T <: BitMask} = a.val == b.val

(&)(a::T, b::Integer) where {T <: BitMask} = T(a.val & b)
(|)(a::T, b::Integer) where {T <: BitMask} = T(a.val | b)
xor(a::T, b::Integer) where {T <: BitMask} = T(xor(a.val, b))
isless(a::T, b::Integer) where {T <: BitMask} = isless(a.val, b)

(&)(a::Integer, b::T) where {T <: BitMask} = b & a
(|)(a::Integer, b::T) where {T <: BitMask} = b | a
xor(a::Integer, b::T) where {T <: BitMask} = xor(b, a)
isless(a::Integer, b::T) where {T <: BitMask} = isless(a, b.val) # need b.val to prevent stackoverflow

(::Type{T})(bm::BitMask) where {T <: Integer} = T(bm.val)

convert(T::Type{<:Integer}, bm::BitMask) = T(bm.val)
convert(T::Type{<:BitMask}, val::Integer) = T(val)

Base.typemax(T::Type{<:BitMask}) = T(0x7fffffff)
