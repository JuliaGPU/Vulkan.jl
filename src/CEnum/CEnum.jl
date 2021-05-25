# Copyright (c) 2019 JuliaInterop

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# copied from https://github.com/JuliaLang/julia/pull/30924
# modified to be in compliance with C99: http://port70.net/~nsz/c/c99/n1256.html#6.7.2.2
module CEnum

import Core.Intrinsics.bitcast
export @cenum

function namemap end
function name_value_pairs end

"""
    Cenum{T<:Integer}
The abstract supertype of all enumerated types defined with [`@cenum`](@ref).
"""
abstract type Cenum{T<:Integer} end

basetype(::Type{<:Cenum{T}}) where {T<:Integer} = T

(::Type{T})(x::Cenum{T2}) where {T<:Integer,T2<:Integer} = T(bitcast(T2, x))::T
Base.cconvert(::Type{T}, x::Cenum{T2}) where {T<:Integer,T2<:Integer} = T(x)
Base.write(io::IO, x::Cenum{T}) where {T<:Integer} = write(io, T(x))
Base.read(io::IO, ::Type{T}) where {T<:Cenum} = T(read(io, basetype(T)))

Base.isless(x::T, y::T) where {T<:Cenum} = isless(basetype(T)(x), basetype(T)(y))

Base.Symbol(x::Cenum)::Symbol = get(namemap(typeof(x)), Integer(x), :UnknownMember)

Base.print(io::IO, x::Cenum) = print(io, Symbol(x))

function Base.show(io::IO, x::Cenum)
    sym = Symbol(x)
    if !get(io, :compact, false)
        from = get(io, :module, Main)
        def = typeof(x).name.module
        if from === nothing || !Base.isvisible(sym, def, from)
            show(io, def)
            print(io, ".")
        end
    end
    print(io, sym)
end

function Base.show(io::IO, ::MIME"text/plain", x::Cenum)
    print(io, x, "::")
    show(IOContext(io, :compact => true), typeof(x))
    print(io, " = ")
    show(io, Integer(x))
end

function Base.show(io::IO, ::MIME"text/plain", t::Type{<:Cenum})
    print(io, "Cenum ")
    Base.show_datatype(io, t)
    print(io, ":")
    for (s, i) in name_value_pairs(t)
        print(io, "\n", Symbol(s), " = ")
        show(io, Integer(i))
    end
end

# give Cenum types scalar behavior in broadcasting
Base.broadcastable(x::Cenum) = Ref(x)

@noinline enum_argument_error(typename, x) = throw(ArgumentError(string("input value out of range for Cenum $(typename): $x")))

macro cenum(T, syms...)
    if isempty(syms)
        throw(ArgumentError("no arguments given for Cenum $T"))
    end
    basetype = Int32
    typename = T
    if isa(T, Expr) && T.head == :(::) && length(T.args) == 2 && isa(T.args[1], Symbol)
        typename = T.args[1]
        basetype = Core.eval(__module__, T.args[2])
        if !isa(basetype, DataType) || !(basetype <: Integer) || !isbitstype(basetype)
            throw(ArgumentError("invalid base type for Cenum $typename, $T=::$basetype; base type must be an integer primitive type"))
        end
    elseif !isa(T, Symbol)
        throw(ArgumentError("invalid type expression for Cenum $T"))
    end
    seen = Set{Symbol}()
    name_values = Tuple{Symbol,basetype}[]
    namemap = Dict{basetype,Symbol}()
    lo = hi = 0
    i = zero(basetype)

    if length(syms) == 1 && syms[1] isa Expr && syms[1].head == :block
        syms = syms[1].args
    end
    for s in syms
        s isa LineNumberNode && continue
        if isa(s, Symbol)
            if i == typemin(basetype) && !isempty(name_values)
                throw(ArgumentError("overflow in value \"$s\" of Cenum $typename"))
            end
        elseif isa(s, Expr) &&
               (s.head == :(=) || s.head == :kw) &&
               length(s.args) == 2 && isa(s.args[1], Symbol)
            i = Core.eval(__module__, s.args[2]) # allow exprs, e.g. uint128"1"
            if !isa(i, Integer)
                throw(ArgumentError("invalid value for Cenum $typename, $s; values must be integers"))
            end
            i = convert(basetype, i)
            s = s.args[1]
        else
            throw(ArgumentError(string("invalid argument for Cenum ", typename, ": ", s)))
        end
        if !Base.isidentifier(s)
            throw(ArgumentError("invalid name for Cenum $typename; \"$s\" is not a valid identifier"))
        end
        haskey(namemap, i) || (namemap[i] = s;)
        if s in seen
            throw(ArgumentError("name \"$s\" in Cenum $typename is not unique"))
        end
        push!(seen, s)
        push!(name_values, (s,i))
        if length(name_values) == 1
            lo = hi = i
        else
            lo = min(lo, i)
            hi = max(hi, i)
        end
        i += oneunit(i)
    end
    blk = quote
        # enum definition
        Base.@__doc__(primitive type $(esc(typename)) <: Cenum{$(basetype)} $(sizeof(basetype) * 8) end)
        function $(esc(typename))(x::Integer)
            x ≤ typemax(x) || enum_argument_error($(Expr(:quote, typename)), x)
            return bitcast($(esc(typename)), convert($(basetype), x))
        end
        CEnum.namemap(::Type{$(esc(typename))}) = $(esc(namemap))
        CEnum.name_value_pairs(::Type{$(esc(typename))}) = $(esc(name_values))
        Base.typemin(x::Type{$(esc(typename))}) = $(esc(typename))($lo)
        Base.typemax(x::Type{$(esc(typename))}) = $(esc(typename))($hi)
        let insts = (Any[ $(esc(typename))(v[2]) for v in $name_values ]...,)
            Base.instances(::Type{$(esc(typename))}) = insts
        end
    end
    if isa(typename, Symbol)
        for (sym, i) in name_values
            push!(blk.args, :(const $(esc(sym)) = $(esc(typename))($i)))
        end
    end
    push!(blk.args, :nothing)
    blk.head = :toplevel
    return blk
end

include("operators.jl")

end # module
