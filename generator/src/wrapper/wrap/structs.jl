function wrap(spec::SpecStruct)
    p = Dict(
        :category => :struct,
        :decl => :(
            $(struct_name(spec)) <:
            $(spec.is_returnedonly ? :ReturnedOnly : :(VulkanStruct{$(needs_deps(spec))}))
        ),
    )
    if spec.is_returnedonly
        p[:fields] = map(x -> :($(wrap_identifier(x))::$(nice_julian_type(x))), children(spec))
    else
        p[:fields] = [:(vks::$(spec.name))]
        needs_deps(spec) && push!(p[:fields], :(deps::Vector{Any}))

        foreach(parent_handles(spec)) do member
            handle_type = remove_vk_prefix(member.type)
            name = wrap_identifier(member)
            field_type = is_optional(member) ? :(OptionalPtr{$handle_type}) : handle_type
            push!(p[:fields], :($name::$field_type))
        end
    end

    p
end

function add_constructor(spec::SpecStruct)
    cconverted_members = getindex(children(spec), findall(is_semantic_ptr, children(spec).type))
    cconverted_ids = map(wrap_identifier, cconverted_members)
    p = init_wrapper_func(spec)
    if needs_deps(spec)
        p[:body] = quote
            $(
                (
                    :($id = cconvert($(m.type), $id)) for
                    (m, id) ∈ zip(cconverted_members, cconverted_ids)
                )...
            )
            deps = [$((cconverted_ids)...)]
            vks = $(spec.name)($(map(vk_call, children(spec))...))
            $(p[:name])(vks, deps, $(wrap_identifier.(parent_handles(spec))...))
        end
    else
        p[:body] = :($(p[:name])($(spec.name)($(map(vk_call, children(spec))...)), $(wrap_identifier.(parent_handles(spec))...)))
    end
    potential_args = filter(x -> x.type ≠ :VkStructureType, children(spec))
    add_func_args!(p, spec, potential_args)
    p
end

function hl_wrap(spec::SpecStruct)
    @assert !spec.is_returnedonly
    p = Dict(
        :category => :struct,
        :decl => :(
            $(struct_name(spec, true)) <: HighLevelStruct
        ),
        :fields => Expr[],
    )
    for member in filter(!drop_field, children(spec))
        T = hl_type(member)
        if hl_is_optional(member)
            T = :(OptionalPtr{$T})
        end
        push!(p[:fields], :($(wrap_identifier(member))::$T))
    end
    p
end

drop_field(x::Spec) = drop_arg(x) || x.name == :sType

function hl_convert(spec::SpecStruct)
    p = Dict(
        :category => :function,
        :name => struct_name(spec),
        :args => [:(x::$(struct_name(spec, true)))],
        :short => true,
    )
    args = Expr[]
    kwargs = Expr[]
    for member in filter(!drop_field, children(spec))
        id = wrap_identifier(member)
        id_deref = :(x.$id)
        T = hl_type(member)
        _T = @match innermost_type(T) begin
            GuardBy(is_hl) => @match T begin
                :(Vector{$T}) => :(Vector{$(Symbol(:_, T))})
                :(NTuple{$N,$T}) => :(NTuple{$N,$(Symbol(:_, T))})
                ::Symbol => Symbol(:_, T)
                _ => error("Unhandled conversion for type $T")
            end
            _ => nothing
        end
        ex = isnothing(_T) ? id_deref : :(convert_nonnull($_T, $id_deref))
        if is_optional(member)
            push!(kwargs, ex == id_deref ? ex : Expr(:kw, id, ex))
        else
            push!(args, ex)
        end
    end
    p[:body] = reconstruct_call(Dict(:name => p[:name], :args => args, :kwargs => kwargs))
    p
end

function hl_convert_overload(spec)
    p = Dict(
        :category => :function,
        :name => :convert,
        :args => [:(T::Type{$(struct_name(spec))}), :(x::$(struct_name(spec, true)))],
        :body => :(T(x)),
        :short => true,
    )
end

function hl_add_constructor(spec::SpecStruct)
    name = struct_name(spec, true)
    p = Dict(
        :category => :function,
        :name => name,
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
    p[:body] = reconstruct_call(Dict(:name => name, :args => args))
    p
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
