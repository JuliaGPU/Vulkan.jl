function nice_julian_type(type)
    @match t = type begin
        GuardBy(is_fn_ptr) => :FunctionPtr
        GuardBy(is_opaque_pointer) => t
        :(NTuple{$N, UInt8}) => :String
        :Cstring => :String
        :VkBool32 => :Bool
        :(Ptr{$pt}) => nice_julian_type(pt)
        GuardBy(in(spec_constants.name)) => follow_constant(t)
        GuardBy(in(extension_types)) => :(vk.$t)
        GuardBy(is_vulkan_type) => remove_vk_prefix(t)
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
        :(Vector{$et}) => :(AbstractArray{<:$(signature_type(et))})
        t => t
    end
end

is_fn_ptr(type) = startswith(string(type), "PFN")
is_opaque_pointer(type) = type == :(Ptr{Cvoid})
