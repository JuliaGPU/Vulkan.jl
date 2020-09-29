
AttachedArgument(f, arg::KeywordArgument) = AttachedArgument(f, KeywordArgument(arg.identifier, arg.default))
attach(f, arg::KeywordArgument) = AttachedArgument(f, arg)
iskwarg(arg) = typeof(arg) <: Argument && !isnothing(arg.default)
isarg(arg) = typeof(arg) <: Argument && !iskwarg(arg)

"""Arguments that can be inferred from a function call.
"""
abstract type InferredParameter end

mutable struct StructSType <: InferredParameter
    value
end

struct AttachedArgument <: Argument
    f::Function
    kwarg::KeywordArgument
end
StructSType() = StructSType(nothing)
infer!(ip::StructSType, data::StructDetails) = ip.value = String(Symbol(vk_stype(data.vk_type)))

isspliceable(x) = x ∈ keys(spliced_parameters)

splice(x) = String(x)
splice(x::AbstractString) = x
splice(ip::InferredParameter) = @assert !isnothing(ip.value) && ip.value
splice(fa::KeywordArgument) = isnothing(fa.default) ? "$(fa.symbol)" : "$(fa.symbol)=$(fa.default)"
function splice(s::Symbol, data)
    arg = isspliceable(s) ? spliced_parameters[s] : KeywordArgument(s)
    typeof(arg) <: InferredParameter ? infer!(arg, data) : nothing
    splice(arg)
end
splice(sig::Signature, data) = splice.(argnames(sig), Ref(data))
splice(m::Method, data) = splice(Signature(m), data)

splice!(varnames, arg...) = splice(arg...)
function splice!(varnames, arg::Argument)
    push!(varnames, arg.symbol)
    splice(arg)
end

function splice!(varnames, s::Symbol, data)
    arg = isspliceable(s) ? spliced_parameters[s] : KeywordArgument(s)
    typeof(arg) <: InferredParameter ? infer!(arg, data) : nothing
    splice!(varnames, arg)
end

splice!(varnames, sig::Signature, data) = splice!.(Ref(varnames), argnames(sig), Ref(data))
splice!(varnames, m::Method, data) = splice!(varnames, Signature(m), data)

wrapped_parameters = Dict(
    :pNext => KeywordArgument(:next, "C_NULL"),
    :flags => KeywordArgument(:flags, 0),
    :pAllocator => KeywordArgument(:allocator, "C_NULL")
)

spliced_parameters = Dict(
    :sType => nothing,
)

is_pointer_from_name(x) = !isnothing(match(r"p[p|A-Z]", x))
add_deps!(fields) = any(is_pointer_from_name.(fields)) ? push!(fields, "deps") : nothing

function definition(sd::StructDetails)
    def = (sd.ptrtype ? "mutable struct" : "struct") * " $(sd.vt_base)"
    if sd.ptrtype
        fields = [:handle]
        if !isnothing(sd.create_infos)
            create_info_fields = argnames(Signature(first(match(CreateInfo(), Symbol(sd.vt_base), max_matches=1)))) |> Filter(x -> !(x ∈ keys(spliced_parameters) || x ∈ keys(wrapped_parameters)))
            append!(fields, create_info_fields)
        end
    else
        fields = argnames(Signature(first(methods(sd.vt_eval))))
    end
    fields = String.(fields)
    add_deps!(fields)
    fields_indent = join(indent.(fields), "\n")
    """
    $def
    $fields_indent
    end
    """
end

join_args(args) = join(args, ", ")

abstract type Wrappable end

struct PointerArgument <: Wrappable
    id_sym::Symbol
    value_sym::Symbol
end

struct FetchArray <: Wrappable
    f_sym::Symbol
    type::Symbol
    arg_names
end

struct Finalization <: Wrappable
    vt_base::AbstractString
end

Finalization(sym::Symbol) = Finalization(remove_vk_prefix(String(sym)))

function wrap!(fnames, f::FetchArray)
    fname = String(enforce_convention(f.f_sym, vulkan_to_julia, :function))
    push!(fnames, remove_vk_prefix(fname, SnakeCase))
    body = """
    count = Ref{UInt32}(0)
    @ckeck $(f.f_sym)($(join_args([f.arg_names..., "count", "C_NULL"])))
    arr = Array{$(f.type)}(undef, count[])
    @check $(f.f_sym)($(join_args([f.arg_names..., "count", "arr"])))

    arr"""
    fdef = FD
end

"""Wraps a Vulkan pointer argument to a ref.
"""
function wrap!(varnames, arg::PointerArgument; deps_variable="deps", suffix="_ref")
    varname = String(enforce_convention(arg.id_sym, vulkan_to_julia, :variable, pickout_parts=[1]))
    push!(varnames, Symbol(varname * suffix))
    """
    $varname = $(arg.value_sym)
    $(varname)_ref = Ref($varname)
    push!(deps, $(varname)_ref)"""
end



function generate(sw::StructWrapper)
    vt_base = remove_vk_prefix(String(Symbol(sw.vk_type)))
    def = hasfinalizer(vt_base) ? "mutable struct" : "struct"
    vt_eval = getproperty(vk, sw.vk_type)
    isptr = vt_eval <: Ptr
    if isptr
        create_info_f = first(match(CreateInfo(), vt_base, max_matches=1))
        ci_sig = Signature(Symbol(create_info_f))
        vk_fields = [ci_sig.names..., "handle", "deps"]
    else
        vk_fields = Signature(first(methods(vt_eval))).names
    end

    fields = getproperty.(convert.(Ref(SnakeCaseLower), CamelCaseLower.(vk_fields)), :value)
    """
$def
$(join(indent.(fields), "\n"))
end
"""
end