# Choosing which Vulkan implementation to bind to.
#
# OUTSIDE the `HAS_LOADER` gate, deliberately. Everything else in this package is
# compiled only when there is something to bind to; this is what a user reaches
# for when there is NOT. It used to be inside, so on a machine with no driver the
# one escape hatch did not exist.

const VULKANCORE_UUID = Base.UUID("16167f82-ea26-5cba-b1de-ed6fd5e30a11")

"""
    set_driver(name::Symbol)

Bind this package to a Vulkan implementation shipped as a Julia artifact, so that
no system-wide installation is needed.

Takes effect on the next load. The choice is stored as a `VulkanCore` preference,
and a preference is part of the precompile hash, so the bindings are rebuilt
against it automatically -- restart Julia and it is in force. This is why it is a
preference and not `JULIA_VULKAN_LIBNAME`: an `ENV` read is not hashed, so that
variable takes effect only if something else happens to invalidate the cache.

Available:

- `:SwiftShader` -- a CPU implementation, from `SwiftShader_jll`. Reports Vulkan
  1.3 and is slow, but runs wherever the JLL does, macOS included.
- `:Lavapipe` -- Mesa's CPU implementation, from `Lavapipe_jll`, and more current
  than SwiftShader.
- `:Loader` -- the Khronos loader, from `Vulkan_Loader_jll`. Finds system drivers
  itself, and is the only one of these that can offer validation layers.
- `:System` -- undo, and go back to whatever the platform provides.

The named package has to be installed already; this will not add it for you.

`:SwiftShader` and `:Lavapipe` are reached DIRECTLY, with no loader in between --
which is also how MoltenVK is meant to be used. Two things the loader would have
provided are then absent: validation layers, and driver discovery. For those, use
`:Loader` and point `VK_ADD_DRIVER_FILES` at the ICD manifest you want it to
find. `VK_ADD_DRIVER_FILES` adds to what the loader discovers; `VK_DRIVER_FILES`
REPLACES it, which would hide a real GPU behind a CPU one.
"""
function set_driver(name::Symbol)
    lib = driver_library(Val(name))
    Preferences.set_preferences!(VULKANCORE_UUID, "libvulkan" => lib; force = true)
    isnothing(lib) ? @info("Vulkan driver reset to the system default. Restart Julia.") :
                     @info("Vulkan driver set to $name. Restart Julia.", library = lib)
    nothing
end

const DRIVERS = (System = nothing,
                 SwiftShader = ("SwiftShader_jll", (:libvulkan, :libvk_swiftshader)),
                 Lavapipe    = ("Lavapipe_jll", (:libvulkan_lvp, :libvulkan)),
                 Loader      = ("Vulkan_Loader_jll", (:libvulkan,)))

driver_library(::Val{:System}) = nothing
driver_library(::Val{name}) where {name} =
    haskey(DRIVERS, name) ? jll_library(DRIVERS[name]...) :
    error("no driver `$name`. Available: ", join(keys(DRIVERS), ", "))

"""
The Vulkan library a driver package provides.

Resolved through the active environment by NAME rather than by a hard-coded UUID,
because these are not all registered packages -- `Lavapipe_jll` in particular may
be a local build, and inventing a UUID for it would find the wrong package or
none at all.
"""
function jll_library(pkgname::AbstractString, fields::Tuple)
    id = Base.identify_package(pkgname)
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
