function wrap(spec::SpecStruct)
    p = Dict(
        :category => :struct,
        :decl => :(
            $(struct_name(spec.name)) <:
            $(spec.is_returnedonly ? :ReturnedOnly : :(VulkanStruct{$(needs_deps(spec))}))
        ),
    )
    if spec.is_returnedonly
        p[:fields] = map(x -> :($(nc_convert(SnakeCaseLower, x.name))::$(nice_julian_type(x))), spec.members)
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
    cconverted_members = getindex(spec.members, findall(is_semantic_ptr, spec.members.type))
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
            vks = $(spec.name)($(map(vk_call, spec.members)...))
            $(p[:name])(vks, deps, $(wrap_identifier.(parent_handles(spec))...))
        end
    else
        p[:body] = :($(p[:name])($(spec.name)($(map(vk_call, spec.members)...)), $(wrap_identifier.(parent_handles(spec))...)))
    end
    potential_args = filter(x -> x.type ≠ :VkStructureType, spec.members)
    add_func_args!(p, spec, potential_args)
    p
end

function hl_wrap(spec::SpecStruct)
    @assert !spec.is_returnedonly
    p = Dict(
        :category => :struct,
        :decl => :(
            $(struct_name(spec.name, true)) <: HighLevelStruct
        ),
        :fields => Expr[],
    )
    for member in spec.members
        if !drop_field(member)
            push!(p[:fields], :($(wrap_identifier(member))::$(nice_julian_type(member, true))))
        end
    end
    p
end

drop_field(x::Spec) = drop_arg(x) || x.name == :sType
