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
        GuardBy(in(extension_types)) => :(vk.$t)
        GuardBy(is_vulkan_type) => remove_vk_prefix(t)
        _ => @match _t = innermost_type(t) begin
            GuardBy(in(getproperty.(filter(!isnothing, spec_flags.bitmask), :name))) => begin
                bitmask_types = getproperty.(filter(!isnothing, spec_flags.bitmask), :name)
                i = findfirst(==(_t), bitmask_types)
                bitmask_flag_type(bitmask_types[i])
            end
            GuardBy(in(spec_flags.name)) && if !isnothing(flag_by_name(_t).bitmask)
            end => bitmask_flag_type(flag_by_name(_t).bitmask)
            _ => @match t begin
                GuardBy(in(spec_constants.name)) => follow_constant(t)
                _ => t
            end
        end
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
        :(Vector{$et}) => :(AbstractArray{<:$(signature_type(et))})
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

is_fn_ptr(type) = startswith(string(type), "PFN")
is_opaque_pointer(type) = type == :(Ptr{Cvoid})
