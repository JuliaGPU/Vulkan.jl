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

vars(w_api) = OrderedDict([k => v for field ∈ getproperty.(Ref(w_api), [:structs, :funcs, :consts, :enums]) for (k, v) ∈ field])

Base.show(io::IO, w_api::WrappedAPI) = print(io, "Wrapped API with $(length(w_api.structs)) structs, $(length(w_api.funcs)) functions, $(length(w_api.consts)) consts and $(length(w_api.enums)) enums wrapped from $(w_api.source)")

name_transform(decl::Declaration) = name_transform(decl.name, typeof(decl))

function wrap(library_api::API)
    global api = library_api
    w_api = WrappedAPI(api.source, OrderedDict{String, SDefinition}(), OrderedDict{String, FDefinition}(), OrderedDict{String, CDefinition}(), OrderedDict{String, EDefinition}(), String[], OrderedDict{String, SDefinition}(), OrderedDict{String, FDefinition}())
    wrap!(w_api)
end

function wrap!(w_api::WrappedAPI)
    errors = OrderedDict()
    wrap!(w_api, values(api.structs))
    wrap!(w_api, values(api.funcs))
    wrap!(w_api, values(api.consts))
    wrap!(w_api, values(api.enums))
    @info("API successfully wrapped.")
    w_api
end

function wrap!(w_api, objects)
    foreach(objects) do obj
        try
            wrap!(w_api, obj)
        catch e
            msg = hasproperty(e, :msg) ? e.msg : "$(typeof(e))"
            println("\e[31;1;1m$(obj.name): $msg\e[m")
            rethrow(e)
        end
    end
end

function wrap!(w_api, sdef::SDefinition)
    new_sdef = structure(sdef)
    has_bag(sdef.name) && setindex!(w_api.bags, create_bag(sdef), bagtype(sdef.name))
    wrap_structure!(w_api, new_sdef)
    wrap_constructor!(w_api, new_sdef, sdef)
end

function wrap!(w_api, fdef::FDefinition)
    if is_command_type(fdef.name, ENUMERATE)
        new_fdef = wrap_enumeration_command(typed_fdef(fdef))
    elseif startswith(fdef.name, "vkDestroy")
        return
    elseif !is_command_type(fdef.name, CREATE)
        new_fdef = wrap_generic(typed_fdef(fdef))
    else
        return
    end
    w_api.funcs[new_fdef.name] = new_fdef
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

wrapping_include(x...) = include(joinpath(@__DIR__, "wrapping", x...))

wrapping_include("struct_logic.jl")
wrapping_include("annotations.jl")
wrapping_include("constructor_logic.jl")
wrapping_include("function_logic.jl")
