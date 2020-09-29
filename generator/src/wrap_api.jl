mutable struct WrappedAPI
    source
    structs
    funcs
    consts
    enums
    misc
    bags
    extended_vk_constructors
end

# not efficient
vars(w_api) = OrderedDict([k => v for field ∈ getproperty.(Ref(w_api), [:structs, :funcs, :consts, :enums]) for (k, v) ∈ field])

Base.show(io::IO, w_api::WrappedAPI) = print(io, "Wrapped API with $(length(w_api.structs)) structs, $(length(w_api.funcs)) functions, $(length(w_api.consts)) consts and $(length(w_api.enums)) enums wrapped from $(w_api.source)")

abstract type Wrapper end

default_spacing(::SDefinition) = "\n"^2
default_spacing(decl::FDefinition) = decl.short && length(generate(decl)) < 150 ? "\n" : "\n"^2
default_spacing(::CDefinition) = "\n"
default_spacing(::EDefinition) = "\n"

unsolved_dependencies(sdef, decls) = collect(values(decls)[findall(keys(decl) .== setdiff(type_dependencies(sdef), keys(decls)))])
are_dependencies_solved(def, decls) = isempty(unsolved_dependencies(def, decls))

function write_api!(io::IO, def::Declaration; spacing)
    write(io, generate(def) * spacing(def))
end

exports(symbols) = "export $(join_args(symbols))"

pre_wrap_code = """
abstract type VulkanStruct end
abstract type Handle <: VulkanStruct end
abstract type ReturnedOnly <: VulkanStruct end
abstract type Bag end
struct BagEmpty <: Bag end
const EmptyBag = BagEmpty()

Base.cconvert(T::Type, x::VulkanStruct) = x
Base.cconvert(T::Type{<: Ptr}, x::AbstractArray{<: VulkanStruct}) = getproperty.(x, :vks)
Base.cconvert(T::Type{<: Ptr}, x::AbstractArray{<: Handle}) = getproperty.(x, :handle)
Base.cconvert(T::Type{<: Ptr}, x::VulkanStruct) = Ref(x.vks)
Base.cconvert(T::Type{<: Ptr}, x::Handle) = x
Base.unsafe_convert(T::Type, x::VulkanStruct) = x.vks
Base.unsafe_convert(T::Type{Ptr{Nothing}}, x::Handle) = x.handle

Base.broadcastable(x::VulkanStruct) = Ref(x) # indicate that VulkanStructs behave as scalars for broadcasting

"""

"""Write a wrapped API to files in dest_dir.

Spacing options can be controlled by providing the corresponding argument with a function that takes a Declaration type as argument.
"""
function Base.write(w_api::WrappedAPI, destfile; spacing=default_spacing)
    decls = OrderedDict((vcat(w_api.consts, w_api.enums, w_api.structs, w_api.bags)...)...)
    decls_order = resolve_dependencies(decls)
    check_dependencies(decls, decls_order)
    open(destfile, "w+") do io
        write(io, pre_wrap_code)
    end
    for fdef ∈ values(w_api.extended_vk_constructors)
        open(destfile, "a+") do io
            write_api!(io, fdef; spacing)
        end
    end
    for decl ∈ getindex.(Ref(decls), decls_order)
        open(destfile, "a+") do io
            write_api!(io, decl; spacing)
        end
    end
    open(destfile, "a+") do io
        write(io, "\n\n" * join(w_api.misc, "\n") * "\n\n")
    end
    open(destfile, "a+") do io
        write(io, "\n\n")
        write_api!.(Ref(io), collect(values(w_api.funcs)); spacing)
        write(io, "\n\n" * exports(unique(vcat((map(x -> x.name, filter(x -> x.name ∉ ["Base.convert", "Base", extension_types...], vcat(map(collect ∘ values, [decls, w_api.funcs])...)))), collect(Iterators.flatten(map.(Ref(x -> strip.(first.(split.(x, "=")))), getproperty.(values(w_api.enums), :fields))))))))
    end

    format(destfile)
    nothing
end

stype_splice(fdef) = getproperty(vk, Symbol(stypes[fdef.name]))
name_transform(decl::Declaration) = name_transform(decl.name, typeof(decl))

# arguments whose value is always predetermined by the function signature
# they are dropped as argument and replaced wherever necessary

include("wrapping/struct_logic.jl")
include("wrapping/annotations.jl")
include("wrapping/constructor_logic.jl")
include("wrapping/function_logic.jl")

function wrap!(w_api::WrappedAPI)
    sdefs = collect(values(api.structs))
    errors = OrderedDict()
    wrap!(w_api, sdefs, errors)
    wrap!(w_api, values(api.funcs), errors)
    wrap!(w_api, values(api.consts), errors)
    wrap!(w_api, values(api.enums), errors)
    length(errors) == 0 ? @info("API successfully wrapped.") : @warn("API wrapped with $(length(errors)) errors:")
    for (field, msg) ∈ errors
        println("\t\e[31;1;1m$field: $msg\e[m")
    end
    w_api
end

function wrap!(w_api, objects, errors)
    for obj ∈ objects
        try
            wrap!(w_api, obj)
        catch e
            msg = hasproperty(e, :msg) ? e.msg : "$(typeof(e))"
            errors[obj.name] = msg
            println("\e[31;1;1m$(obj.name): $msg\e[m")
            rethrow(e)
            typeof(e) ∈ [ErrorException, AssertionError] ? continue : rethrow(e)
        end
    end
end

function wrap!(w_api, edef::EDefinition)
    
    new_edef = EDefinition(remove_vk_prefix(edef.name), remove_vk_prefix.(edef.fields), edef.with_begin_block, isnothing(edef.type) ? nothing : remove_vk_prefix(edef.type), edef.enum_macro)
    w_api.enums[new_edef.name] = new_edef
    w_api.funcs["convert_$(edef.name)"] = FDefinition("Base.convert(T::Type{$(new_edef.name)}, e::$(edef.name)) = T(UInt(e))")
    w_api.funcs["convert_$(new_edef.name)"] = FDefinition("Base.convert(T::Type{$(edef.name)}, e::$(new_edef.name)) = T(UInt(e))")
end

function wrap!(w_api, cdef::CDefinition)
    new_cdef = CDefinition(remove_vk_prefix(cdef.name), is_literal(cdef.value) ? cdef.value : remove_vk_prefix(cdef.value))
    w_api.consts[new_cdef.name] = new_cdef
end

function wrap(library_api::API)
    global api = library_api
    w_api = WrappedAPI(api.source, OrderedDict{String, SDefinition}(), OrderedDict{String, FDefinition}(), OrderedDict{String, CDefinition}(), OrderedDict{String, EDefinition}(), String[], OrderedDict{String, SDefinition}(), OrderedDict{String, FDefinition}())
    wrap!(w_api)
end