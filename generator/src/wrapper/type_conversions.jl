const extension_types = [
    :ANativeWindow,
    :AHardwareBuffer,
    :CAMetalLayer,
    :wl_surface,
    :wl_display,
    :Display,
    :VisualID,
    :xcb_connection_t,
    :xcb_window_t,
    :xcb_visualid_t,
    :MirConnection,
    :MirSurface,
    :HINSTANCE,
    :HANDLE,
    :HWND,
    :RROutput,
]

function nice_julian_type(type)
    @match t = type begin
        GuardBy(is_fn_ptr) => :Function
        :(NTuple{$N, UInt8}) => :String
        :Cstring => :String
        :VkBool32 => :Bool
        :(Ptr{$pt}) => nice_julian_type(pt)
        if t ∈ spec_constants.name end => follow_constant(t)
        GuardBy(is_vulkan_type) => remove_vk_prefix(t)
        _ => t
    end
end

function nice_julian_type(spec::Spec)
    @match s = spec begin
        GuardBy(is_version) => :VersionNumber
        if !isnothing(s.len) end => :(Vector{$(nice_julian_type(ptr_type(s.type)))})
        _ => nice_julian_type(s.type)
    end
end

is_fn_ptr(type) = startswith(string(type), "PFN")
is_version(spec::Spec) = contains(lowercase(string(spec.name)), "version") && (follow_constant(spec.type) == :UInt32 || isnothing(spec.len) && !spec.is_constant && is_ptr(spec.type) && follow_constant(ptr_type(spec.type)) == :UInt32) 
