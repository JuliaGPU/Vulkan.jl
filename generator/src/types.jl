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
    :HWND,
    :RROutput,
]

const type_conversions = Dict(
    :Cstring => :Cstring,
    :Float32 => :Float32,
    :Float64 => :Float64,
    :Int32 => :Int32,
    :Int64 => :Int64,
    :Nothing => :Nothing,
    :(Ptr{Nothing}) => :(Ptr{Nothing}),
    :UInt16 => :UInt16,
    :UInt32 => :UInt32,
    :UInt64 => :UInt64,
    :UInt8 => :UInt8,
    :Cdouble => :Float64,
    :Cfloat => :Float32,
    :Cint => :Int32,
    :Csize_t => :UInt,
    :Cssize_t => :Int,
    :Cstring => :String,
    :Cuint => :UInt32,
    :VkBool32 => :Bool,
    :(Ptr{Cstring}) => :(Array{String}),
    :(NTuple{256, UInt8}) => :String,
    :(NTuple{16, UInt8}) => :String,
    :(Ptr{Cvoid}) => :(Ptr{Cvoid}),
    :Cvoid => :Cvoid,
    :(Ptr{ANativeWindow}) => :(Ptr{Cvoid}),
    :(Ptr{AHardwareBuffer}) => :(Ptr{Cvoid}),
    :(Ptr{CAMetalLayer}) => :(Ptr{Cvoid}),
    :(Ptr{xcb_connection_t}) => :(Ptr{Cvoid}),
    :xcb_window_t => :UInt32,
    :Window => :UInt32,
    :(Ptr{Display}) => :(Ptr{Cvoid}),
    :void => :Any
)

const base_types = [
    :Bool,
    :String,
    :Function,
    :Int,
    :Int8,
    :Int16,
    :Int32,
    :Int64,
    :Cint,
    :UInt,
    :UInt8,
    :UInt16,
    :UInt32,
    :UInt64,
    :Cuint,
    :Csize_t,
    :Cssize_t,
    :Float32,
    :Float64,
    :Cfloat,
    :Cdouble,
    :Nothing,
    :Cstring,
    :Cvoid,
    :Number,
    :VersionNumber,
    :AbstractArray,
    :AbstractString,
    :Any,
    :(Vector{Any}),
]

is_ptr_to_ptr(ex) = !isnothing(ptrtype(ptrtype(ex)))
is_ptr(ex) = !isnothing(ptr_type(ex))

ptr_type(ex) = @when :(Ptr{$T}) = ex T

ntuple_type(ex) = @when :(NTuple{$N, $T}) = ex T

is_ntuple(ex) = !isnothing(ntuple_type(ex))

vulkan_type(name) = @switch string(name, "__")[1:2] begin
    @case "vk"; :function
    @case "Vk"; :struct
    @case "VK"; :const
    @case _; nothing
end

inner_type(ex) = @when :($T{$(args...)}) = ex collect(args)

function innermost_type(ex::Expr)
    if is_ntuple(ex)
        innermost_type(ntuple_type(ex))
    else
        t = inner_type(ex)
        if length(t) > 1
            error("Expected 1 inner type for $ex, found $(length(t)) ($t)")
        else
            innermost_type(first(t))
        end
    end
end

innermost_type(sym::Symbol) = sym

is_vulkan_type(name) = !isnothing(vulkan_type(name))
is_vulkan_struct(name) = !is_handle(name) && vulkan_type(name) == :struct
is_extension_type(name) = name ∉ base_types && !is_vulkan_type(name)
is_extension_ptr(name) = is_ptr(name) && is_extension_type(inner_type(name))
is_literal(el) = occursin(r"[\.\"]+", el) || occursin(r"^\d+$", el)
is_base_type(name) = name ∈ base_types
is_abstractarray_type(el) = startswith(el, "AbstractArray")
is_array_type(el) = startswith(el, "Array")
is_array_of_vk_objects(name, type, sname) = is_ptr(type) && is_vulkan_struct(ptr_type(type)) && is_array_variable(name, sname)
is_fn_ptr(type) = startswith(string(type), "PFN")
is_version(name) = occursin("version", lowercase(string(name)))

is_opaque(ptr::Expr) = ptr == :(Ptr{Nothing})
is_opaque(ptr) = ptr == Ptr{Nothing}
