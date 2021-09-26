abstract type BitMask{T<:Unsigned} end

Base.broadcastable(x::BitMask) = Ref(x)

function generate_bitmask_flags(type, decl)
    identifier, value = decl.args
    :(const $identifier = $type($value))
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
    if !Meta.isexpr(expr, :block)
        expr = Expr(:block, expr)
    end
    decls = filter(x -> typeof(x) ≠ LineNumberNode, expr.args)
    etype = esc(type)
    values = map(decls) do decl
        (identifier, value) = decl.args
        :($(QuoteNode(identifier)) => $etype($value))
    end

    ex = quote
        Base.@__doc__ struct $type <: BitMask{$eltype}
            val::$eltype
        end
        $(esc.(generate_bitmask_flags.(type, decls))...)
        Base.values(::Type{$etype}) = [$(values...)]
    end

    ex
end

Base.iszero(a::BitMask) = iszero(a.val)
Base.zero(a::T) where {T <: BitMask} = T(zero(a.val))

(&)(a::BitMask, b::BitMask) = error("Bitwise operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
(|)(a::BitMask, b::BitMask) = error("Bitwise operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
xor(a::BitMask, b::BitMask) = error("Bitwise operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
isless(a::BitMask, b::BitMask) = error("Bitwise operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
(==)(a::BitMask, b::BitMask) = error("Operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")
in(a::BitMask, b::BitMask) = error("Operation not allowed between incompatible bitmasks '$(typeof(a))', '$(typeof(b))'")

(&)(a::T, b::T) where {T <: BitMask} = T(a.val & b.val)
(|)(a::T, b::T) where {T <: BitMask} = T(a.val | b.val)
xor(a::T, b::T) where {T <: BitMask} = T(xor(a.val, b.val))
isless(a::T, b::T) where {T <: BitMask} = isless(a.val, b.val)
(==)(a::T, b::T) where {T <: BitMask} = a.val == b.val
in(a::T, b::T) where {T <: BitMask} = a & b == a

(&)(a::T, b::Integer) where {T <: BitMask} = T(a.val & b)
(|)(a::T, b::Integer) where {T <: BitMask} = T(a.val | b)
xor(a::T, b::Integer) where {T <: BitMask} = T(xor(a.val, b))
isless(a::T, b::Integer) where {T <: BitMask} = isless(a.val, b)
in(a::T, b::Integer) where {T <: BitMask} = a & b == a

(&)(a::Integer, b::T) where {T <: BitMask} = b & a
(|)(a::Integer, b::T) where {T <: BitMask} = b | a
xor(a::Integer, b::T) where {T <: BitMask} = xor(b, a)
isless(a::Integer, b::T) where {T <: BitMask} = isless(a, b.val) # need b.val to prevent stackoverflow
in(a::Integer, b::T) where {T <: BitMask} = a | b == b

(::Type{T})(bm::BitMask) where {T <: Integer} = T(bm.val)

convert(T::Type{<:Integer}, bm::BitMask) = T(bm.val)
convert(T::Type{<:BitMask}, val::Integer) = T(val)

typemax(T::Type{<:BitMask{_T}}) where {_T} = T(typemax(_T))

function Base.show(io::IO, flag::T) where {T <: BitMask}
    print(io, T, '(')
    first = true
    for (name, val) in values(T)
        if val in flag && (Int(val) ≠ 0 || val == flag)
            !first && print(io, " | ")
            first = false
            print(io, name)
        end
    end
    print(io, ')')
end
