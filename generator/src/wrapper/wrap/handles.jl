function wrappable_constructors(handle::SpecHandle)::Vector{CreateFunc}
    # don't wrap VkSurfaceKHR, almost all signatures conflict with one another with create info parameters exposed
    handle.name == :VkSurfaceKHR && return []
    all_constructors_nobatch = filter(x -> x.handle == handle && !x.batch, spec_create_funcs)
    if length(unique(all_constructors_nobatch.create_info_struct)) == length(all_constructors_nobatch)
        all_constructors_nobatch
    else
        []
    end
end

const spec_handles_with_wrappable_constructors = filter(x -> !isempty(wrappable_constructors(x)), spec_handles)

function wrap(spec::SpecHandle)
    d = Dict(
        :category => :struct,
        :decl => :($(remove_vk_prefix(spec.name)) <: Handle),
        :is_mutable => true,
        :fields => [:(vks::$(spec.name)), :(refcount::RefCounter), :destructor],
    )

    if !isnothing(spec.parent)
        id = wrap_identifier(handle_by_name(spec.parent))
        pdecl = :($id::$(remove_vk_prefix(spec.parent)))
        insert!(d[:fields], 2, pdecl)
        d[:constructors] = [
            :(
                $(remove_vk_prefix(spec.name))(vks::$(spec.name), $pdecl, refcount::RefCounter) =
                    new(vks, $id, refcount, undef)
            ),
        ]
    else
        d[:constructors] =
            [:($(remove_vk_prefix(spec.name))(vks::$(spec.name), refcount::RefCounter) = new(vks, refcount, undef))]
    end

    d
end

function destructor(handle::SpecHandle; with_func_ptr = false)
    dfs = destroy_funcs(handle)
    has_destructors = !isempty(dfs)
    if has_destructors
        @assert length(dfs) == 1
        df = first(dfs)
        if isnothing(df.destroyed_param.len)
            p = wrap(df.func)
            p_call = Dict(:name => p[:name], :args => Any[name.(p[:args])...], :kwargs => name.(p[:kwargs]))
            with_func_ptr && push!(p_call[:args], :fun_ptr_destroy)
            p_call[:args][findfirst(==(remove_vk_prefix(handle.name)), type.(p[:args]))] = :x
            :(x -> $(reconstruct_call(p_call)))
        else
            :identity
        end
    else
        :identity
    end
end

function add_constructors(spec::SpecHandle; with_func_ptr = false)
    map(wrappable_constructors(spec)) do create

        if isnothing(create.create_info_struct)
            # just pass the arguments as-is
            p_func = wrap(create.func; with_func_ptr)
            args, kwargs = p_func[:args], p_func[:kwargs]
            body = reconstruct_call(p_func; is_decl = false)
        else
            p_func_extended = extend_handle_constructor(create; with_func_ptr)
            body = :(unwrap($(reconstruct_call(p_func_extended; is_decl = false))))
            args, kwargs = p_func_extended[:args], p_func_extended[:kwargs]
        end

        Dict(
            :category => :function,
            :name => remove_vk_prefix(spec.name),
            :args => args,
            :kwargs => kwargs,
            :short => true,
            :body => body,
            :relax_signature => true,
        )
    end
end
