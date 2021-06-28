function wrap(spec::SpecUnion, is_high_level)
    _is_high_level = is_high_level || spec.is_returnedonly
    name = struct_name(spec, _is_high_level)
    Dict(
        :category => :struct,
        :decl => :($name <: $(spec.is_returnedonly ? :ReturnedOnly : is_high_level ? :HighLevelStruct : :(VulkanStruct{false}))),
        :fields => [
            :($(_is_high_level ? :data : :vks)::$(spec.name)),
        ],
    )
end

function add_constructors(spec::SpecUnion, is_high_level)
    _is_high_level = is_high_level || spec.is_returnedonly
    name = struct_name(spec, _is_high_level)
    supertypes = supertype_union.(spec.types, _is_high_level)
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
        Dict(
            :category => :function,
            :name => name,
            :args => [:($var::$sig_type)],
            :body => :(
                $name($(spec.name)(to_vk($type, $var)))
            ),
            :short => true,
        )
    end
end

function hl_convert(spec::SpecUnion)
    name = struct_name(spec, false)
    hl_name = struct_name(spec, true)
    Dict(
        :category => :function,
        :name => name,
        :args => [:(x::$hl_name)],
        :body => :($name(getfield(x, :data))),
        :short => true,
    )
end

function hl_getproperty(spec::SpecUnion)
    name = struct_name(spec, true)

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

    Dict(
        :category => :function,
        :name => :(Base.getproperty),
        :args => [
            :(x::$name),
            :(sym::Symbol),
        ],
        :body => body,
        :short => false,
    )
end

function supertype_union(type, is_high_level)
    @match type begin
        :UInt8 || :UInt16 || :UInt32 || :UInt64 => :Unsigned
        :Int8 || :Int16 || :Int32 || :Int64 => :Signed
        :Float8 || :Float16 || :Float32 || :Float64 => :AbstractFloat
        _ => is_high_level ? hl_type(type) : nice_julian_type(type)
    end
end
