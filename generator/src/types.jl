has_deps(x) = !isnothing(match(r"{(.*)}", x))

struct TypeDep
    data
    TypeDep(data) = new(replace(data, " " => ""))
end

function AbstractTrees.children(el::TypeDep)
    !has_deps(el.data) && return []

    dep = match(r"{(.*)}", el.data).captures[1]

    cb_count = 0
    siblings = []
    sibling_chars = Char[]
    for (i, char) ∈ enumerate(dep)
        cb_count += 1 * (char == '{')
        cb_count -= 1 * (char == '}')
        found = ((char == ',' || i == length(dep)) && cb_count == 0)
        if found
            if char == dep[end]
                push!(sibling_chars, char)
            end
            push!(siblings, String(sibling_chars))
            sibling_chars = Char[]
        else
            push!(sibling_chars, char)
        end
    end
    TypeDep.(replace.(siblings, r"<:\s*" => ""))
end

struct Converted
    initial_type
    final_type
end

extension_types = [
    "ANativeWindow",
    "AHardwareBuffer",
    "CAMetalLayer",
    "wl_surface",
    "wl_display",
    "Display",
    "VisualID",
    "xcb_connection_t",
    "xcb_window_t",
    "xcb_visualid_t",
    "MirConnection",
    "MirSurface",
    "HINSTANCE",
    "HWND",
    "RROutput",
]

type_conversions = Dict(
    "Cstring" => "Cstring",
    "Float32" => "Float32",
    "Float64" => "Float64",
    "Int32" => "Int32",
    "Int64" => "Int64",
    "Nothing" => "Nothing",
    "Ptr{Nothing}" => "Ptr{Nothing}",
    "UInt16" => "UInt16",
    "UInt32" => "UInt32",
    "UInt64" => "UInt64",
    "UInt8" => "UInt8",
    "Cdouble" => "Float64",
    "Cfloat" => "Float32",
    "Cint" => "Int32",
    "Csize_t" => "UInt",
    "Cssize_t" => "Int",
    "Cstring" => "String",
    "Cuint" => "UInt32",
    "VkBool32" => "Bool",
    "Ptr{Cstring}" => "Array{String}",
    "NTuple{256, UInt8}" => "String",
    "NTuple{16, UInt8}" => "String",
    "Ptr{Cvoid}" => "Ptr{Cvoid}",
    "Cvoid" => "Cvoid",
    "Ptr{ANativeWindow}" => "Ptr{Cvoid}",
    "Ptr{AHardwareBuffer}" => "Ptr{Cvoid}",
    "Ptr{CAMetalLayer}" => "Ptr{Cvoid}",
    "Ptr{xcb_connection_t}" => "Ptr{Cvoid}",
    "xcb_window_t" => "UInt32",
    "Window" => "UInt32",
    "Ptr{Display}" => "Ptr{Cvoid}",
    "void" => "Any"
    # "Ptr{Cfloat}" => "AbstractArray{<:Number}",
)

base_types = [
    "Bool",
    "String",
    "Function",
    "Int",
    "Int8",
    "Int16",
    "Int32",
    "Int64",
    "Cint",
    "UInt",
    "UInt8",
    "UInt16",
    "UInt32",
    "UInt64",
    "Cuint",
    "Csize_t",
    "Cssize_t",
    "Float32",
    "Float64",
    "Cfloat",
    "Cdouble",
    "Nothing",
    "Cstring",
    "Cvoid",
    "Number",
    "VersionNumber",
    "AbstractArray",
    "AbstractString",
    "Any",
    "",
]

function widen_type(type)
    stype = supertype(eval(Meta.parse(type)))
    stype <: Integer && return "Integer"
    stype <: AbstractFloat && return "Number"
    stype <: AbstractString && return "AbstractString"
    type
end

is_ptr_to_ptr(type) = startswith(type, "Ptr{Ptr{")
is_ptr(type) = startswith(type, "Ptr{")
is_ntuple(type) = startswith(type, "NTuple{")

is_vulkan_type(name) = any(startswith.(Ref(name), ["vk", "Vk", "VK_"]))
is_vulkan_struct(name) = name ∈ keys(api.structs)
is_extension_type(name) = name ∉ base_types && !is_vulkan_type(name)
is_extension_ptr(name) = is_ptr(name) && is_extension_type(inner_type(name))
is_base_type(name) = name ∈ base_types || is_literal(name)
is_literal(el) = occursin(r"[\.\"]+", el) || occursin(r"^\d+$", el)
is_expr(el) = occursin(r"[\(\)~\[\]]", el)
is_abstractarray_type(el) = startswith(el, "AbstractArray")
is_array_type(el) = startswith(el, "Array")
is_array_of_vk_objects(name, type, sname) = !isnothing(type) && is_ptr(type) && is_vulkan_struct(inner_type(type)) && is_array_variable(name, sname)


"Returns all the leaf types that a type depends on, including itself if the type contains no inner type."
function type_dependencies(type; include_type=false)
    deps = getproperty.(collect(Leaves(TypeDep(type))), :data)
end

"""
Take the inner type of a type, returning itself if the provided type has no dependencies.
"""
function inner_type(type)
    type_deps = type_dependencies(type, include_type=true)
    length(type_deps) == 1 && return last(type_deps)
    is_ntuple(type) && return last(type_deps) # ignore number of repetitions at index 1
    error("Cannot take inner type of $type")
end

is_opaque(ptr) = ptr == Ptr{Nothing}