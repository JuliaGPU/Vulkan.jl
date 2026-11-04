"""
    set_driver(name::Symbol)

Select `:SwiftShader`, `:Loader`, or `:System` (the default). Driver JLLs must
already be installed. The choice is stored as a VulkanCore preference and takes
effect after restarting Julia.

For Lavapipe, load `Lavapipe_jll` before creating an instance. Windows requires
26.2.2+1 or later. The JLL adds its ICD without replacing system drivers.
"""
function set_driver(name::Symbol)
    lib = driver_library(Val(name))
    Preferences.set_preferences!(VulkanCore, "libvulkan" => lib; force = true)
    isnothing(lib) ? @info("Vulkan driver reset to the system default. Restart Julia.") :
                     @info("Vulkan driver set to $name. Restart Julia.", library = lib)
    nothing
end

const DRIVERS = (System = nothing,
                 SwiftShader = ("SwiftShader_jll", (:libvulkan, :libvk_swiftshader)),
                 Loader      = ("Vulkan_Loader_jll", (:libvulkan,)))

driver_library(::Val{:System}) = nothing
driver_library(::Val{name}) where {name} =
    haskey(DRIVERS, name) ? jll_library(DRIVERS[name]...) :
    error("no driver `$name`. Available: ", join(keys(DRIVERS), ", "))

function jll_library(pkgname::AbstractString, fields::Tuple)
    id = Base.identify_package(pkgname)
    isnothing(id) && (id = Base.identify_package(VulkanCore, pkgname))
    isnothing(id) && error("$pkgname is not in this environment. `Pkg.add(\"$pkgname\")` first.")
    mod = get(Base.loaded_modules, id, nothing)
    isnothing(mod) && (mod = Base.require(id))
    for f in fields
        isdefined(mod, f) || continue
        lib = getfield(mod, f)
        lib isa AbstractString && return String(lib)
    end
    error("$pkgname defines none of $(join(fields, ", ")) on this platform, ",
          "so it ships no Vulkan library here.")
end

macro set_driver(name) :(set_driver($(esc(name)))) end
