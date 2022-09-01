function StructDefinition{false}(spec::SpecStruct)
    p = Dict(
        :category => :struct,
        :decl => :($(struct_name(spec)) <: VulkanStruct{$(needs_deps(spec))}),
    )
    p[:fields] = [:(vks::$(spec.name))]
    needs_deps(spec) && push!(p[:fields], :(deps::Vector{Any}))
    for member in parent_handles(spec)
        handle_type = remove_vk_prefix(member.type)
        name = wrap_identifier(member)
        field_type = is_optional(member) ? :(OptionalPtr{$handle_type}) : handle_type
        push!(p[:fields], :($name::$field_type))
    end
    StructDefinition{false}(spec, p)
end

function Constructor(def::StructDefinition{false})
    spec = def.spec
    cconverted_members = getindex(children(spec), findall(is_semantic_ptr, children(spec).type))
    cconverted_ids = map(wrap_identifier, cconverted_members)
    p = Dict(
        :category => :function,
        :name => name(def),
        :relax_signature => true,
    )
    if needs_deps(spec)
        p[:body] = quote
            $(
                (
                    :($id = cconvert($(m.type), $id)) for
                    (m, id) ∈ zip(cconverted_members, cconverted_ids)
                )...
            )
            deps = Any[$((cconverted_ids)...)]
            vks = $(spec.name)($(map(vk_call, children(spec))...))
            $(name(def))(vks, deps, $(wrap_identifier.(parent_handles(spec))...))
        end
    else
        p[:body] = :($(name(def))($(spec.name)($(map(vk_call, children(spec))...)), $(wrap_identifier.(parent_handles(spec))...)))
    end
    potential_args = filter(x -> x.type ≠ :VkStructureType, children(spec))
    add_func_args!(p, spec, potential_args)
    Constructor(p, def, def.spec)
end

StructDefinition{true}(spec::Spec) = StructDefinition{true}(StructDefinition{false}(spec))

function StructDefinition{true}(def::StructDefinition{false})
    (; spec) = def
    p = Dict(
        :category => :struct,
        :decl => :($(struct_name(spec, true)) <: HighLevelStruct),
        :fields => hl_fields(spec),
    )
    StructDefinition{true}(spec, p)
end

function hl_fields(spec::Union{SpecStruct,SpecUnion})
    fields = Expr[]
    for member in filter(!drop_field, children(spec))
        T = hl_type(member)
        if hl_is_optional(member)
            T = :(OptionalPtr{$T})
        end
        push!(fields, :($(wrap_identifier(member))::$T))
    end
    fields
end

drop_field(x::Spec) = drop_arg(x) || x.name == :sType

function Constructor(T::StructDefinition{false}, x::StructDefinition{true})
    (; spec) = T
    p = Dict(
        :category => :function,
        :name => name(T),
        :args => [:(x::$(name(x)))],
        :short => true,
    )
    args = Expr[]
    kwargs = Expr[]
    for member in filter(!drop_field, children(spec))
        id = wrap_identifier(member)
        id_deref = :(x.$id)
        Tsym = hl_type(member)
        _Tsym = @match innermost_type(Tsym) begin
            GuardBy(is_hl) => @match Tsym begin
                :(Vector{$T}) => :(Vector{$(Symbol(:_, T))})
                :(NTuple{$N,$T}) => :(NTuple{$N,$(Symbol(:_, T))})
                ::Symbol => Symbol(:_, Tsym)
                _ => error("Unhandled conversion for type $Tsym")
            end
            _ => nothing
        end
        ex = isnothing(_Tsym) ? id_deref : :(convert_nonnull($_Tsym, $id_deref))
        if is_optional(member)
            push!(kwargs, ex == id_deref ? ex : Expr(:kw, id, ex))
        else
            push!(args, ex)
        end
    end
    p[:body] = reconstruct_call(Dict(:name => p[:name], :args => args, :kwargs => kwargs))
    Constructor(p, T, x)
end

function Constructor(T::StructDefinition{true}, x::SpecStruct)
    p = Dict(
        :category => :function,
        :name => name(T),
        :args => [:(x::$(x.name))],
        :body => :($(name(T))($(filter(!isnothing, from_vk_call.(filter(!drop_field, children(x))))...))),
        :short => true,
    )
    :pNext in x.members.name && push!(p[:args], :(next_types::Type...))
    Constructor(p, T, x)
end

function Constructor(T::StructDefinition{true}, x::StructDefinition{false})
    (; spec) = x
    p = Dict(
        :category => :function,
        :name => name(T),
        :args => [:(x::$(name(x)))],
        :short => !needs_deps(spec),
    )
    :pNext in spec.members.name && push!(p[:args], :(next_types::Type...))
    p[:body] = if needs_deps(spec)
        quote
            (; deps) = x
            GC.@preserve deps $(name(T))(x.vks, next_types...)
        end
    else
        Expr(:call, name(T), :(x.vks))
    end
    Constructor(p, T, x)
end

function Convert(T::StructDefinition{false}, x::StructDefinition{true})
    p = Dict(
        :category => :function,
        :name => :convert,
        :args => [:(T::Type{$(name(T))}), :(x::$(name(x)))],
        :body => :(T(x)),
        :short => true,
    )
    Convert(T, x, p)
end

function Constructor(def::StructDefinition{true})
    spec = def.spec
    p = Dict(
        :category => :function,
        :name => name(def),
        :args => [],
        :kwargs => [],
        :short => true,
        :relax_signature => true,
    )
    args = []
    for member in filter(!drop_field, children(spec))
        id = wrap_identifier(member)
        if is_optional(member)
            push!(p[:kwargs], Expr(:kw, id, hl_default(member)))
        else
            push!(p[:args], :($id::$(signature_type(hl_type(member)))))
        end
        push!(args, id)
    end
    p[:body] = reconstruct_call(Dict(:name => p[:name], :args => args))
    Constructor(p, def, def.spec)
end

function hl_default(member::SpecStructMember)
    !embeds_sentinel(member) && return :C_NULL
    @match hl_type(member) begin
        :String => ""
        :(Vector{$t}) => :($t[])
        _ => default(member)
    end
end

hl_is_optional(member::SpecStructMember) = is_optional(member) && !embeds_sentinel(member) && member.name ≠ :pNext

function embeds_sentinel(member::SpecStructMember)
    @match hl_type(member) begin
        :(Vector{$_}) => return !is_optional(member) # optional means C_NULL can be provided, and may have different semantics than for an empty vector
        :String || :UInt32 || :UInt64 || :Int32 || :Int => return true
        _ => nothing
    end

    @match member.type begin
        GuardBy(in(spec_enums.name)) || GuardBy(in(spec_bitmasks.name)) || GuardBy(is_flag) => true
        _ => false
    end
end

function StructureType(spec::SpecStruct)
    stype = structure_types[spec.name]
    types = [spec.name, struct_name(spec.name), struct_name(spec.name, true)]
    ex = :(structure_type(@nospecialize(_::Union{$((:(Type{$T}) for T in types)...)})) = $stype)
    StructureType(spec, ex)
end
