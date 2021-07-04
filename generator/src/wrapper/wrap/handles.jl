"""
API constructors (for a given handle) that can be wrapped to expose create info parameters.
"""
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

function HandleDefinition(spec::SpecHandle)
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

    HandleDefinition(spec, d)
end

function destructor(handle::SpecHandle, with_func_ptr = false)
    dfs = destroy_funcs(handle)
    has_destructors = !isempty(dfs)
    if has_destructors
        @assert length(dfs) == 1
        df = first(dfs)
        if isnothing(df.destroyed_param.len)
            p = APIFunction(df.func, false).p
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

function Constructor(handle::HandleDefinition, def::APIFunction)
    args, kwargs = def.p[:args], def.p[:kwargs]
    body = :(unwrap($(reconstruct_call(def.p; is_decl = false))))

    p = Dict(
        :category => :function,
        :name => name(handle),
        :args => args,
        :kwargs => kwargs,
        :short => true,
        :body => body,
        :relax_signature => false,
    )
    Constructor(handle, p)
end
