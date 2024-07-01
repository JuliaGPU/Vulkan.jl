# Library loading

Owing to its extensible architecture, Vulkan may require additional libraries to be available during runtime. That will be
notably the case of every layer, and of most [WSI (Window System Integration)](https://registry.khronos.org/vulkan/specs/1.3-extensions/html/chap34.html)
instance extensions which require hooking into the OS' windowing system.

It is important to know where these libraries come from, to avoid crashes and ensure correct behavior.
A notable case for failure is when some code uses a new function exposed in a recent library release, but the loaded library is too old.
In particular, this may occur after updating Vulkan drivers, or upgrading the OS (which in turn updates OS-specific libraries and possibly the Vulkan loader which may then rely on these updates).
Other than that, libraries are generally backward compatible, and compatibility issues are fairly rare.

In Julia, there are two notable systems that may provide them:
- Your operating system, using whatever is available, as matched first by the linker depending on configuration. Version suffixes (e.g. `libvulkan.so.1`) may be used to provide weak compatibility guarantees.
- Pkg's [artifact system](https://pkgdocs.julialang.org/v1/artifacts/), providing libraries and binaries with set versions and stronger compatibility guarantees with semantic versioning. The artifact system explicitly uses libraries from other artifacts, *and not from the system*. Keep that in mind especially if you rely on artifacts for application-level functionality (e.g. GLFW).

When a library is required by a Vulkan feature, extension or layer, it will most likely use the first one already loaded.
That may be an artifact, or a system library. Relying on either comes with caveats:
- Relying on an artifact may incorrectly interface with OS-specific functionality, which requires to match system libraries.
- Relying on system libraries may cause compatibility issues when using artifacts that require specific versions.

A reasonable recommendation would be to go for system libraries for anything that Vulkan heavily relies on (such as WSI functionality), and use artifact libraries for the rest.

It may however happen that you depend on the same library for both Vulkan and artifact functionality: for example, let's say you use [GLFW.jl](https://github.com/JuliaGL/GLFW.jl), which depends on the artifact `GLFW_jll`, and you are using it with Vulkan. The Vulkan loader (usually a system library itself, `libvulkan.so`) will expect a system `libxcb.so`; and `GLFW_jll` will be designed to work with the artifact `libxcb.so`. In theory, it is possible to use different versions of the same library at the same time (see [Overriding libraries](@ref)); if it works, it's probably alright to stick with that. Otherwise, should any issue occur by this mismatch, it might be preferable to use the newest library among both, or decide on a case-by-case basis. Any battle-tested guideline for this would be very welcome!

If you stumble upon an error during instance creation and wonder if it's related to library compatibility issues, these tend to show up when the `VK_LOADER_DEBUG=all` option is set; see [Internal API errors](@ref).

## Overriding libraries

**Vulkan** may be redirected to use a specific system or artifact library. It can be attempted by:
- Forcing the system linker to preload a specific library (e.g. `LD_PRELOAD` for `ld` on linux).
- Emulating such preload using `Libdl.dlopen` before the corresponding library is loaded; that is, before `using Package` where `Package` depends on artifacts (artifacts tend to `dlopen` their library dependencies during [module initialization](https://docs.julialang.org/en/v1/manual/modules/#Module-initialization-and-precompilation)).
- Loading an artifact (either directly or indirectly), triggering the loading of its dependent libraries (which may be redirected too, see below).

**Artifacts** always use artifact libraries by default, but may be redirected toward other libraries via the preferences mechanism:

```julia-repl
julia> using Xorg_libxcb_jll

julia> Xorg_libxcb_jll.set_preferences!(Xorg_libxcb_jll, "libxcb_path" => "/usr/lib/libxcb.so")

# Restart Julia to trigger precompilation, updating artifact settings.
julia> using Xorg_libxcb_jll
```

Note that every artifact may provide many library products, and each one of them will require an explicit preference to opt out of the artifact system. For instance, `Xorg_libxcb_jll` provides `libxcb.so`, but also `libxcb-render.so`, `libxcb-xkb.so`, and many more; `libxcb_path` only affects `libxcb.so`, and to affect these other libraries there exist similar preferences `libxcb_render_path`, `libxcb_xkb_path`, etc.
