"""
Convenience function for setting an ICD (Installable Client Driver) used by Vulkan.
Only SwiftShader is currently supported. To add another ICD, you must do it by hand. You can achieve that by setting the environment variable "VK_ICD_FILENAMES" to point to your own ICD JSON file, as described in https://github.com/KhronosGroup/Vulkan-Loader/blob/master/loader/LoaderAndLayerInterface.md#icd-discovery.

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
                            icd_filenames = split(get(ENV, "VK_ICD_FILENAMES", ""), sep)
                            swiftshader_icd = joinpath(libdir, "vk_swiftshader_icd.json")
                            !in(swiftshader_icd, icd_filenames)
                            push!(icd_filenames, swiftshader_icd)
                            ENV["VK_ICD_FILENAMES"] = join(icd_filenames, sep)
                        end
        _ => error("Backend `$backend` not available. Only 'SwiftShader' is currently supported.")
    end
    nothing
end

macro set_driver(backend) :(set_driver($(esc(backend)))) end
