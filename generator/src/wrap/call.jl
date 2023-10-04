function from_vk_call(x::Spec, identifier = :x)
    prop = :($identifier.$(x.name))
    x.name == :pNext && return :(load_next_chain($prop, next_types...))
    x.name == :sType && return nothing
    jtype = hl_type(x)
    @match x begin
        # array pointer
        GuardBy(is_arr) => @match jtype begin
            :(Vector{$_}) => :(unsafe_wrap($jtype, $prop, $(len_expr(x, identifier)); own = true))
        end

        GuardBy(is_length) => nothing
        _ => from_vk_call(prop, x.type, jtype)
    end
end

function len_expr(x::Spec, identifier)
    @assert !isnothing(x.len)
    params = children(x.parent)
    postwalk(x.len) do ex
        ex == :/ && return :÷
        ex isa Symbol && ex in params.name && return :($identifier.$ex)
        ex
    end
end

function from_vk_call(prop, t, jtype = hl_type(t))
    @match t begin
        :Cstring => :(unsafe_string($prop))
        GuardBy(in(api.flags.name)) || GuardBy(in(api.enums.name)) => prop
        GuardBy(in(getproperty.(filter(!isnothing, api.flags.bitmask), :name))) => :($jtype(UInt32($prop)))
        GuardBy(in(api.handles.name)) => :($(remove_vk_prefix(t))($prop))
        :(NTuple{$_,$T}) && if jtype ≠ :String end => broadcast_ex(from_vk_call(prop, ntuple_type(t)))
        if follow_constant(t, api.constants) == jtype
        end => prop
        if is_hl(jtype) end => :($jtype($prop))
        _ => :(from_vk($jtype, $prop))
    end
end

function vk_call(x::Spec)
    var = wrap_identifier(x.name)
    jtype = idiomatic_julia_type(x)
    @match x begin
        ::SpecStructMember && if x.type == :VkStructureType && x.parent.name ∈ keys(api.structure_types)
        end => :(structure_type($(x.parent.name)))
        ::SpecStructMember && if is_semantic_ptr(x.type)
        end => :(unsafe_convert($(x.type), $var))
        if is_fn_ptr(x.type)
        end => var
        GuardBy(is_size) && if x.requirement == POINTER_REQUIRED
        end => x.name # parameter converted to a Ref already
        GuardBy(is_opaque) => var
        GuardBy(is_length) => begin
            !x.autovalidity && @debug "Automatic validation was disabled for length parameter $x."
            @match x begin
                GuardBy(is_length_exception) || GuardBy(!is_inferable_length) => var
                _ => :(pointer_length($(wrap_identifier(first(arglen(x)))))) # Julia works with arrays, not pointers, so the length information can directly be retrieved from them
            end
        end
        GuardBy(is_pointer_start) => 0 # always set first* variables to 0, and the user should provide a (sub)array of the desired length
        if x.type ∈ api.handles.name
        end => var # handled by unsafe_convert in ccall

        # constant pointer to a unique object
        if is_ptr(x.type) &&
           !is_arr(x) &&
           (x.is_constant || x.parent.type == FTYPE_QUERY && x ≠ x.parent[end])
        end => @match x begin
            if ptr_type(x.type) ∈ [api.structs.name; api.unions.name]
            end => var # handled by cconvert and unsafe_convert in ccall
            if x.requirement == OPTIONAL
            end => :($var == $(default(x)) ? $(default(x)) : Ref($var)) # allow optional pointers to be passed as C_NULL instead of a pointer to a 0-valued integer
            _ => :(Ref($var))
        end
        if x.type ∈ [api.flags.name; api.enums.name]
        end => var
        if x.type ∈ getproperty.(filter(!isnothing, api.flags.bitmask), :name)
        end => :($(x.type)($var.val))
        if x.type ∈ extension_types
        end => var
        _ => @match jtype begin
            :String || :Bool || :(Vector{$et}) || if jtype == follow_constant(x.type, api.constants)
            end => var # conversions are already defined
            if x.type in [api.structs.name; api.unions.name] && jtype == struct_name(x.type)
            end => :($var.vks)
            :(NTuple{Int($_N),$_T}) => var
            _ => :(to_vk($(x.type), $var)) # fall back to the to_vk function for conversion
        end
    end
end
