using Vulkan

split_camel(text) = matchall(r"[A-Z]+[a-z]*", text)



const instance_names = [
    "pSurface",
    "pView",
    "pPipelines",
    "pCallback",
    "pMode",
    "pSurface",
    "pSurface",
    "pSurface",
    "pSetLayout"
]
function get_arg_names(fun::Symbol)
    cfun = vk.api.(fun)
    method = start(methods(cfun))
    tv, decls, file, line = Base.arg_decl_parts(method)
    map(first, decls)
end

function writeout_cmd_funs(
        io, cmd_fun
    )
    arg_names = get_arg_names(cmd_fun)

    type_func_args = map(arg_names) do arg
        arg = lowercase(arg)
        arg == "commandbuffer" && return "$(arg)::CommandBuffer"
        arg
    end
    splitted = split_camel(string(cmd_fun))[2:end] # remove vkCmd
    fun_name = join(map(lowercase, splitted), "_")
    expr = """
\"\"\"
Julian function for `$cmd_fun`.
For further documentation please refer to the documentation of `$cmd_fun`.
\"\"\"
function $(fun_name)($(join(type_func_args, ", ")))
    api.$(cmd_fun)($(join(arg_names, ", ")))
end
"""
    println(io, expr)
end


function writeout_constructors(
        io, create_fun, create_type, type_name
    )

    cfun = vk.api.(create_fun)
    method = start(methods(cfun))
    tv, decls, file, line = Base.arg_decl_parts(method)
    func_arg_names = map(first, decls)
    func_args = filter(func_arg_names) do arg
        !contains(arg, "CreateInfo") && !startswith(arg, "p"*type_name) && !in(arg, instance_names)
    end

    crfun_novk = replace(string(create_fun), "vk", "")
    instance_name = "Vk"*replace(crfun_novk, "Create", "")
    create_args = map(func_arg_names) do arg
        if contains(arg, "CreateInfo")
            return :create_info
        end
        if startswith(arg, "p"*type_name) || in(arg, instance_names)
            return :instance_ptr
        end
        arg
    end
    expr = """
\"\"\"
Convenience constructor function for `$instance_name`.
Instead of passing a reference to `$instance_name`, it will
get returned already dereferenced. You also don't need to supply a create info,
just pass the arguments for it to `create_info_args`.
For further documentation please refer to the documentation of `$create_fun`.
\"\"\"
function $(crfun_novk)($(join(func_args, ", ")), create_info_args::Tuple)
    instance_ptr = Ref{api.$instance_name}(api.VK_NULL_HANDLE)
    create_info = create($create_type, create_info_args)
    err = api.$(create_fun)($(join(create_args, ", ")))
    check(err)
    instance_ptr[]
end
"""
    println(io, expr)
end

exportnames = names(Vulkan.api, true)
create_functions = filter(exportnames) do name
    startswith(string(name), "vkCreate") && isa(vk.api.(name), Function)
end
create_info_types = filter(exportnames) do name
    contains(string(name), "CreateInfo") && isa(vk.api.(name), DataType)
end

commandbuffer_funs = filter(exportnames) do name
    startswith(string(name), "vkCmd") && isa(vk.api.(name), Function)
end



open(Pkg.dir("Vulkan","test", "helper.jl"), "w") do io
println(io, """
using Vulkan

""")
for elem in create_info_types
    typ = vk.api.(elem)
    names = []
    args = map(1:nfields(typ)) do i
        t = fieldtype(typ, i)
        name = fieldnames(typ)[i]
        push!(names, name)
        :($(name) = default($t))
    end
    conv_args = map(1:nfields(typ)) do i
        t = fieldtype(typ, i)
        name = fieldnames(typ)[i]
        :(struct_convert($t, $(name)))
    end
    no_vk = replace(string(elem), "Vk", "")


    tname = replace(no_vk, "CreateInfo", "")
    tname = replace(tname, "KHR", "")
    tname = replace(tname, "EXT", "")
    creatorfun = findfirst(create_functions) do fun
        contains(string(fun), tname)
    end
    if creatorfun > 0
        writeout_constructors(
            io, create_functions[creatorfun], typ, tname
        )
    end
end

for f in commandbuffer_funs
    writeout_cmd_funs(io, f)
end

end
