"""
    set_driver(name::Symbol)

Select the Vulkan loader: `:System` (the default) or `:Loader` for
`Vulkan_Loader_jll`. The choice is stored as a VulkanCore preference and takes
effect after restarting Julia.

Load `Lavapipe_jll` and/or `SwiftShader_jll` before creating an instance to add
software devices alongside hardware devices. Select a physical device when
creating the device; no loader preference or restart is needed.
`set_driver(:SwiftShader)` and `set_driver(:Lavapipe)` load the corresponding JLL.
"""
function set_driver(name::Symbol)
    if name in (:SwiftShader, :Lavapipe)
        pkgname = string(name, "_jll")
        jll_module(pkgname)
        return nothing
    end
    lib = driver_library(Val(name))
    Preferences.set_preferences!(VulkanCore, "libvulkan" => lib; force = true)
    isnothing(lib) ? @info("Vulkan driver reset to the system default. Restart Julia.") :
                     @info("Vulkan driver set to $name. Restart Julia.", library = lib)
    nothing
end

const DRIVERS = (System = nothing,
                 Loader      = ("Vulkan_Loader_jll", (:libvulkan,)))

driver_library(::Val{:System}) = nothing
driver_library(::Val{name}) where {name} =
    haskey(DRIVERS, name) ? jll_library(DRIVERS[name]...) :
    error("no driver `$name`. Available: ", join(keys(DRIVERS), ", "))

function jll_module(pkgname::AbstractString)
    id = Base.identify_package(pkgname)
    isnothing(id) && (id = Base.identify_package(VulkanCore, pkgname))
    isnothing(id) && error("$pkgname is not in this environment. `Pkg.add(\"$pkgname\")` first.")
    mod = get(Base.loaded_modules, id, nothing)
    isnothing(mod) && (mod = Base.require(id))
    Base.invokelatest(mod.is_available) || error("$pkgname is unavailable on this platform.")
    return mod
end

function jll_library(pkgname::AbstractString, fields::Tuple)
    mod = jll_module(pkgname)
    for f in fields
        isdefined(mod, f) || continue
        lib = getfield(mod, f)
        lib isa AbstractString && return String(lib)
    end
    error("$pkgname defines none of $(join(fields, ", ")) on this platform, ",
          "so it ships no Vulkan library here.")
end

function register_icd!(path::AbstractString)
    sep = Sys.iswindows() ? ';' : ':'
    paths = split(get(ENV, "VK_ADD_DRIVER_FILES", ""), sep; keepempty = false)
    path in paths || (ENV["VK_ADD_DRIVER_FILES"] = join([paths; path], sep))
    return nothing
end

macro set_driver(name) :(set_driver($(esc(name)))) end
