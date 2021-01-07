mutable struct WrappedAPI
    structs::Vector{Expr}
    funcs::Vector{Expr}
    consts::Vector{Expr}
    enums::Vector{Expr}
    misc
    bags::Vector{Expr}
    extended_vk_constructors::Vector{Expr}
end

Base.show(io::IO, w_api::WrappedAPI) = print(io, "Wrapped API with $(length(w_api.structs)) structs, $(length(w_api.funcs)) functions, $(length(w_api.consts)) consts and $(length(w_api.enums)) enums.")

function ptr_to_handle(sym)
    base = remove_vk_prefix(sym)
    :(mutable struct $base <: Handle
         handle::Ptr{Nothing}
     end)
end

function details(api::API)
    Dict(
        vcat(map(api.structs) do ex
            p = deconstruct(ex)
            p[:name] => StructWrapDetails(p)
        end,
        map(api.consts) do ex
            cname = name(ex)
            if is_handle(ex)
                cname => StructWrapDetails(deconstruct(ex))
            else
                cname => nothing
            end
        end,
        map(api.funcs) do ex
            fname = name(ex)

        end
            ))
    
end

function wrap(api::API)
    w_api = WrappedAPI(Expr[], Expr[], Expr[], Expr[], [], Expr[], Expr[])

    foreach(api.consts) do c
        p = deconstruct(c)
    end

    dict = details(api)
    wrap!(w_api, api.structs, dict, :struct)
    wrap!(w_api, api.funcs,   dict, :function)
    wrap!(w_api, api.consts,  dict, :const)
    wrap!(w_api, api.enums,   dict, :enum)
    @info("API successfully wrapped.")
    w_api
end

function wrap!(w_api, objects, details, symbol)
    symbol ∉ [:struct, :const, :enum] && return
    wrap! = @match symbol begin
        :struct   => wrap_struct!
        :function => wrap_function!
        :const    => wrap_const!
        :enum     => wrap_enum!
    end
    foreach(objects) do obj
        try
            symbol ∈ [:const, :enum] ? wrap!(w_api, obj) : wrap!(w_api, details, details[name(obj)])
        catch e
            msg = hasproperty(e, :msg) ? e.msg : "$(typeof(e))"
            println("\e[31;1;1m$(name(obj)) (wrap $symbol): $msg\e[m")
            rethrow(e)
        end
    end
end

function wrap_struct!(w_api::WrappedAPI, details, sd)
    !sd.is_alias && push!(w_api.structs, wrapped_structure(sd))
    # wrap_constructor!(w_api, pn, sd)
end

MLStyle.is_enum(::COMMAND_TYPE) = true
MLStyle.pattern_uncall(e::COMMAND_TYPE, _, _, _, _) = MLStyle.AbstractPatterns.literal(e)

function wrap_function!(w_api::WrappedAPI, details, fd::Expr)
    p = deconstruct(ex)
    fname = p[:name]
    @switch dfmatch(vulkan_functions, :name, fname).type begin
        @case ENUMERATE
            wrapped_enumeration_command(p)
        @case DESTROY
            return
        @case t && if t ≠ CREATE end
            wrap_generic!(p)
        @case _
            return
    end

    push!(w_api.funcs, reconstruct(p, :function))
end

function wrap_enum!(w_api::WrappedAPI, ex::Expr)
    new_ex = remove_vk_prefix(ex)
    push!(w_api.enums, new_ex)
    old, new = name.((ex, new_ex))
    push!(w_api.funcs, :(Base.convert(T::Type{$new}, e::$old) = T(UInt(e))))
    push!(w_api.funcs, :(Base.convert(T::Type{$old}, e::$new) = T(UInt(e))))
end

function wrap_const!(w_api::WrappedAPI, ex)
    p = deconstruct(ex)
    cname = p[:name]

    if !isalias(cname)
        if is_handle(cname)
            push!(w_api.structs, ptr_to_handle(cname))
        elseif !endswith(string(cname), "_T")
            new_ex = remove_vk_prefix(ex)
            push!(w_api.consts, new_ex)
        end
    end
end

is_optional_parameter(name, sname) = name == :pNext || info(name, sname).param_requirement ∈ [OPTIONAL, POINTER_OPTIONAL]

include("wrapping/struct_logic.jl")
# include("wrapping/constructor_logic.jl")
# include("wrapping/function_logic.jl")
