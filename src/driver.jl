"""
Convenience function for setting a specific driver used by Vulkan.
Only SwiftShader is currently supported. To add another driver, you must specify it by hand. You can achieve that by setting the environment variable `VK_DRIVER_FILES` (formerly `VK_ICD_FILENAMES`) to point to your own driver JSON manifest file, as described in https://github.com/KhronosGroup/Vulkan-Loader/blob/main/docs/LoaderDriverInterface.md#driver-discovery.

Available drivers:
- SwiftShader: a CPU implementation of Vulkan. Requires `SwiftShader_jll` to be imported in `mod`.
"""
function set_driver(backend::Symbol)
    @match backend begin
        :SwiftShader => begin
                            pkg = Base.PkgId(Base.UUID("c404ff5a-e271-5628-8eaa-423d39d64c15"), "SwiftShader_jll")
                            mod = get(Base.loaded_modules, pkg, nothing)
                            if isnothing(mod)
                                try
                                    @eval @__MODULE__() import SwiftShader_jll
                                    mod = get(Base.loaded_modules, pkg, nothing)
                                    isnothing(mod) && error("Another module named `SwiftShader_jll` seems to exist, but is not $pkg")
                                catch
                                    @error "$pkg could not be loaded"
                                    rethrow()
                                end
                            end
                            (; libvulkan) = mod
                            ENV["JULIA_VULKAN_LIBNAME"] = basename(libvulkan)
                            libdir = dirname(libvulkan)
                            sep = Sys.iswindows() ? ';' : ':'
                            # Read/set both `VK_ICD_FILENAMES` and `VK_DRIVER_FILES` for compatibility,
                            # even though `VK_ICD_FILENAMES` has been obsoleted by `VK_DRIVER_FILES`.
                            icd_filenames = split(get(ENV, "VK_ICD_FILENAMES", ""), sep)
                            driver_files = split(get(ENV, "VK_DRIVER_FILES", ""), sep)
                            drivers = [icd_filenames; driver_files]
                            swiftshader_icd = joinpath(libdir, "vk_swiftshader_icd.json")
                            !in(swiftshader_icd, drivers) && push!(drivers, swiftshader_icd)
                            ENV["VK_ICD_FILENAMES"] = join(drivers, sep)
                            ENV["VK_DRIVER_FILES"] = join(drivers, sep)
                        end
        _ => error("Backend `$backend` not available. Only 'SwiftShader' is currently supported.")
    end
    nothing
end

macro set_driver(backend) :(set_driver($(esc(backend)))) end
