function hl_type(spec::SpecStructMember)
    @match s = spec begin
        if s.name == :pNext end => :Any
        GuardBy(is_version) => :VersionNumber
        GuardBy(is_arr) => begin
            T = hl_type(ptr_type(s.type))
            :(Vector{$T})
        end
        _ => hl_type(spec.type)
    end
end

function hl_type(type)
    @match t = type begin
        :Cstring => :String
        :VkBool32 => :Bool
        GuardBy(is_opaque_pointer) => t
        :(NTuple{$N,$T}) => begin
            @match T begin
                :UInt8 => :String
                # :(Ntuple{$M,$T}) => :(SMatrix{$N,$M,$T})
                # _ => :(SVector{$N,$T})
                _ => :(NTuple{$N,$(hl_type(T))})
            end
        end
        GuardBy(in([spec_structs.name; spec_unions.name])) => struct_name(t, true)
        GuardBy(in(spec_handles.name)) => remove_vk_prefix(t)
        GuardBy(is_fn_ptr) => :FunctionPtr
        :(Ptr{$T}) => hl_type(T)
        GuardBy(is_flag_bitmask) => bitmask_flag_type(t)
        GuardBy(in(spec_flags.name)) && if !isnothing(flag_by_name(t).bitmask)
        end => bitmask_flag_type(flag_by_name(t).bitmask)
        GuardBy(in(spec_constants.name)) => follow_constant(t)
        GuardBy(in(spec_enums.name)) => enum_type(t)
        GuardBy(is_vulkan_type) => remove_vk_prefix(t)
        _ => t
    end
end

function nice_julian_type(type)
    @match t = type begin
        GuardBy(is_fn_ptr) => :FunctionPtr
        GuardBy(is_opaque_pointer) => t
        :(NTuple{$N,UInt8}) => :String
        :(NTuple{$N,$T}) => begin
            _N = @match N begin
                ::Symbol => :(Int($N))
                _ => N
            end
            :(NTuple{$_N,$(nice_julian_type(T))})
        end
        :Cstring => :String
        :VkBool32 => :Bool
        :(Ptr{$pt}) => nice_julian_type(pt)
        GuardBy(in([spec_structs.name; spec_unions.name])) => struct_name(t)
        GuardBy(in(spec_handles.name)) => remove_vk_prefix(t)
        GuardBy(in(spec_enums.name)) => enum_type(t)
        GuardBy(is_flag_bitmask) => bitmask_flag_type(t)
        GuardBy(in(spec_flags.name)) && if !isnothing(flag_by_name(t).bitmask)
        end => bitmask_flag_type(flag_by_name(t).bitmask)
        GuardBy(in(spec_constants.name)) => follow_constant(t)
        _ => t
    end
end

"""
Return a new type easier to deal with.
"""
function nice_julian_type(spec::Spec)
    @match s = spec begin
        GuardBy(is_version) => :VersionNumber
        GuardBy(is_arr) => :(Vector{$(nice_julian_type(ptr_type(s.type)))})
        GuardBy(is_data) => :(Ptr{Cvoid})
        _ => nice_julian_type(s.type)
    end
end

function signature_type(type)
    @match type begin
        :UInt || :UInt8 || :UInt16 || :UInt32 || :UInt64 || :Int || :Int8 || :Int16 || :Int32 || :Int64 => :Integer
        :Float16 || :Float32 || :Float64 => :Real
        :String => :AbstractString
        :(Vector{$et}) => @match et begin
            GuardBy(in(remove_vk_prefix.(spec_handles.name))) => :AbstractArray
            _ => :(AbstractArray{<:$(signature_type(et))})
        end
        t => t
    end
end

function relax_signature_type(type)
    @match type begin
        :(AbstractArray{<:$_}) => :AbstractArray
        t => t
    end
end

function relax_function_signature!(p::Dict)
    p[:args] = relax_function_signature(p[:args])
    p
end

function relax_function_signature(args::AbstractVector)
    map(args) do arg
        @match arg begin
            :($identifier::$type) => :($identifier::$(relax_signature_type(type)))
            _ => arg
        end
    end
end

bitmask_flag_type(type) = Symbol(replace(remove_vk_prefix(string(type)), "Bits" => ""))
bitmask_flag_type(spec::SpecBitmask) = bitmask_flag_type(spec.name)
