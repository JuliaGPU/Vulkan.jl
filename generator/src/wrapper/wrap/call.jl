function from_vk_call(x::Spec)
    prop = :(x.$(x.name))
    jtype = nice_julian_type(x)
    @match x begin

        # array pointer
        GuardBy(is_arr) => @match jtype begin
            :(Vector{$_}) => :(unsafe_wrap($jtype, $prop, x.$(x.len); own = true))
        end

        GuardBy(is_length) => nothing
        _ => from_vk_call(prop, jtype, x.type)
    end
end

function from_vk_call(prop, jtype, t)
    @match t begin
        :Cstring => :(unsafe_string($prop))
        GuardBy(in(spec_flags.name)) || GuardBy(in(spec_enums.name)) => prop
        GuardBy(in(getproperty.(filter(!isnothing, spec_flags.bitmask), :name))) => :($jtype(UInt32($prop)))
        GuardBy(in(spec_handles.name)) => :($(remove_vk_prefix(t))($prop))
        GuardBy(is_ntuple) && if ntuple_type(t) ∈ filter(x -> x.is_returnedonly, spec_structs).name
        end => :(from_vk.($(remove_vk_prefix(ntuple_type(t))), $prop))
        if follow_constant(t) == jtype
        end => prop
        :(NTuple{$N,$T}) && if is_vulkan_type(T)
        end => broadcast_ex(from_vk_call(prop, nice_julian_type(T), T))
        _ => :(from_vk($jtype, $prop))
    end
end

function vk_call(x::Spec)
    var = wrap_identifier(x.name)
    jtype = nice_julian_type(x)
    @match x begin
        ::SpecStructMember && if x.type == :VkStructureType && parent(x) ∈ keys(structure_types)
        end => structure_types[parent(x)]
        ::SpecStructMember && if is_semantic_ptr(x.type)
        end => :(unsafe_convert($(x.type), $var))
        if is_fn_ptr(x.type)
        end => var
        GuardBy(is_size) && if x.requirement == POINTER_REQUIRED
        end => x.name # parameter converted to a Ref already
        GuardBy(is_opaque_data) => var
        GuardBy(is_length) => begin
            !x.autovalidity && @debug "Automatic validation was disabled for length parameter $x."
            @match x begin
                GuardBy(is_length_exception) || GuardBy(!is_inferable_length) => var
                _ => :(pointer_length($(wrap_identifier(first(arglen(x)))))) # Julia works with arrays, not pointers, so the length information can directly be retrieved from them
            end
        end
        GuardBy(is_pointer_start) => 0 # always set first* variables to 0, and the user should provide a (sub)array of the desired length
        if x.type ∈ spec_handles.name
        end => var # handled by unsafe_convert in ccall

        # constant pointer to a unique object
        if is_ptr(x.type) &&
           !is_arr(x) &&
           (x.is_constant || (func = func_by_name(x.func); func.type == FTYPE_QUERY && x ≠ last(children(func))))
        end => @match x begin
            if ptr_type(x.type) ∈ spec_structs.name
            end => var # handled by cconvert and unsafe_convert in ccall
            if x.requirement == OPTIONAL
            end => :($var == $(default(x)) ? $(default(x)) : Ref($var)) # allow optional pointers to be passed as C_NULL instead of a pointer to a 0-valued integer
            _ => :(Ref($var))
        end
        if x.type ∈ [spec_flags.name; spec_enums.name]
        end => var
        if x.type ∈ getproperty.(filter(!isnothing, spec_flags.bitmask), :name)
        end => :($(x.type)($var.val))
        if x.type ∈ extension_types
        end => var
        _ => @match jtype begin
            :String || :Bool || :(Vector{$et}) || if jtype == follow_constant(x.type)
            end => var # conversions are already defined
            if x.type ∈ spec_structs.name && jtype == struct_name(x.type)
            end => :($var.vks)
            _ => :(to_vk($(x.type), $var)) # fall back to the to_vk function for conversion
        end
    end
end
