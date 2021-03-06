function wrap(spec::SpecHandle)
    Dict(
        :category => :struct,
        :decl => :($(remove_vk_prefix(spec.name)) <: Handle),
        :is_mutable => true,
        :fields => [
            :(vks::$(spec.name)),
            :(refcount::RefCounter),
            :destructor,
        ],
        :constructors => [
            :($(remove_vk_prefix(spec.name))(vks::$(spec.name), refcount::RefCounter) = new(vks, refcount, undef)),
        ],
    )
end

function destructor(handle::SpecHandle; with_func_ptr=false)
    destroy = destroy_func(handle)
    if !isnothing(destroy) && isnothing(destroy.destroyed_param.len)
        p = wrap(destroy.func)
        p_call = Dict(
            :name => p[:name],
            :args => Any[name.(p[:args])...],
            :kwargs => name.(p[:kwargs]),
        )
        with_func_ptr && push!(p_call[:args], :fun_ptr_destroy)
        p_call[:args][findfirst(==(remove_vk_prefix(handle.name)), type.(p[:args]))] = :x
        :(x -> $(reconstruct_call(p_call)))
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
            body = reconstruct_call(p_func; is_decl=false)
        else
            p_func_extended = extend_handle_constructor(create; with_func_ptr)
            body = :(unwrap($(reconstruct_call(p_func_extended; is_decl=false))))
            args, kwargs = p_func_extended[:args], p_func_extended[:kwargs]
        end

        Dict(
            :category => :function,
            :name => remove_vk_prefix(spec.name),
            :args => args,
            :kwargs => kwargs,
            :short => true,
            :body => body,
        )
    end
end
