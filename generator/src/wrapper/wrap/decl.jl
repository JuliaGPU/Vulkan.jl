init_wrapper_func(spec::SpecFunc) =
    Dict(:category => :function, :name => nc_convert(SnakeCaseLower, remove_vk_prefix(spec.name)), :short => false)
init_wrapper_func(spec::Spec) = Dict(:category => :function, :name => remove_vk_prefix(spec.name), :short => false)

arg_decl(x::Spec) = :($(wrap_identifier(x))::$(signature_type(nice_julian_type(x))))
kwarg_decl(x::Spec) = Expr(:kw, wrap_identifier(x), default(x))
drop_arg(x::Spec) = is_length(x) && !is_specific_count(x) || is_pointer_start(x) || x.type == :(Ptr{Ptr{Cvoid}})

"""
Function pointer arguments for a handle.
Includes one `fun_ptr_create` for the constructor (if applicable),
and one `fun_ptr_destroy` for the destructor (if applicable).
"""
function func_ptr_args(spec::SpecHandle)
    args = Expr[]
    spec ∈ spec_create_funcs.handle && push!(args, :(fun_ptr_create::FunctionPtr))
    destructor(spec) ≠ :identity && push!(args, :(fun_ptr_destroy::FunctionPtr))
    args
end

"""
Function pointer arguments for a function.
Takes the function pointers arguments of the underlying handle if it is a Vulkan constructor,
or a unique `fun_ptr` if that's just a normal Vulkan function.
"""
function func_ptr_args(spec::SpecFunc)
    if spec.type ∈ [CREATE, ALLOCATE]
        func_ptr_args(create_func(spec).handle)
    else
        [:(fun_ptr::FunctionPtr)]
    end
end

"""
Corresponding pointer argument for a Vulkan function.
"""
func_ptrs(spec::Spec) = name.(func_ptr_args(spec))

function add_func_args!(p::Dict, spec, params; with_func_ptr = false)
    params = filter(!drop_arg, params)
    arg_filter = if spec.type ∈ [DESTROY, FREE]
        destroyed_type = destroy_func(spec).handle.name
        x -> !is_optional(x) || x.type == destroyed_type
    else
        !is_optional
    end

    p[:args] = map(arg_decl, filter(arg_filter, params))
    p[:kwargs] = map(kwarg_decl, filter(!arg_filter, params))

    with_func_ptr && append!(p[:args], func_ptr_args(spec))
end
