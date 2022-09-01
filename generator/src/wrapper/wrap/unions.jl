function StructDefinition{false}(spec::SpecUnion)
    p = Dict(
        :category => :struct,
        :decl => :($(struct_name(spec)) <: VulkanStruct{false}),
        :fields => [:(vks::$(spec.name))],
    )
    StructDefinition{false}(spec, p)
end

function StructDefinition{true}(def::StructDefinition{false,SpecUnion})
    (; spec) = def
    p = Dict(
        :category => :struct,
        :decl => :($(struct_name(spec, true)) <: HighLevelStruct),
        :fields => [
            :(vks::$(spec.name)),
        ],
    )
    StructDefinition{true}(spec, p)
end

function constructors(def::StructDefinition{HL,SpecUnion}) where {HL}
    spec = def.spec
    name = struct_name(spec, HL)
    supertypes = supertype_union.(spec.types, HL)
    sig_types = map(zip(spec.types, supertypes)) do (type, supertype)
        if count(==(supertype), supertypes) > 1
            type
        else
            @match supertype begin
                :Unsigned || :Signed => count(in((:Unsigned,:Signed)), supertypes) == 1 ? :Integer : supertype
                _ => supertype
            end
        end
    end

    map(zip(spec.types, sig_types, spec.fields)) do (type, sig_type, field)
        var = wrap_identifier(field)
        call = if type in spec_unions.name
            :($var.vks)
        elseif HL && type in spec_structs.name
            :(($(struct_name(type))($var)).vks)
        elseif type in spec_structs.name
            :($var.vks)
        else
            var
        end
        p = Dict(
            :category => :function,
            :name => name,
            :args => [:($var::$sig_type)],
            :body => :(
                $name($(spec.name)(($call)))
            ),
            :short => true,
        )
        Constructor(p, def, spec)
    end
end

function Constructor(T::StructDefinition{false, SpecUnion}, x::StructDefinition{true, SpecUnion})
    p = Dict(
        :category => :function,
        :name => name(T),
        :args => [:(x::$(name(x)))],
        :body => :($(name(T))(getfield(x, :vks))),
        :short => true,
    )
    Constructor(p, T, x)
end

function GetProperty(def::StructDefinition{true, SpecUnion})
    spec = def.spec
    itr = map(spec.fields) do field
        newfield = wrap_identifier(field)
        (:(sym === $(QuoteNode(newfield))), :(x.data.$field))
    end

    first, rest = Iterators.peel(itr)
    body = Expr(:block)
    ex = Expr(:if, first...)
    push!(body.args, ex)
    for (cond, branch) in rest
        _ex = Expr(:elseif, cond, branch)
        push!(ex.args, _ex)
        ex = _ex
    end
    push!(ex.args, :(getfield(x, sym)))

    p = Dict(
        :category => :function,
        :name => :(Base.getproperty),
        :args => [
            :(x::$(name(def))),
            :(sym::Symbol),
        ],
        :body => body,
        :short => false,
    )
    GetProperty(def, p)
end

function supertype_union(type, is_high_level)
    @match type begin
        :UInt8 || :UInt16 || :UInt32 || :UInt64 => :Unsigned
        :Int8 || :Int16 || :Int32 || :Int64 => :Signed
        :Float8 || :Float16 || :Float32 || :Float64 => :AbstractFloat
        _ => is_high_level ? hl_type(type) : idiomatic_julia_type(type)
    end
end
