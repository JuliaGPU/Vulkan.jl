"""
Convenience function for setting an ICD (Installable Client Driver) used by Vulkan.
Only SwiftShader is currently supported. To add another ICD, you must do it by hand. You can achieve that by setting the environment variable "VK_ICD_FILENAMES" to point to your own ICD JSON file, as described in https://github.com/KhronosGroup/Vulkan-Loader/blob/master/loader/LoaderAndLayerInterface.md#icd-discovery.

Available drivers:
- SwiftShader: a CPU implementation of Vulkan. Requires `SwiftShader_jll` to be imported in `Main`.
"""
function set_driver(backend::Symbol)
    @match backend begin
        :SwiftShader => begin
                            libvulkan = Main.SwiftShader_jll.libvulkan
                            ENV["JULIA_VULKAN_LIBNAME"] = basename(libvulkan)
                            libdir = dirname(libvulkan)
                            sep = Sys.iswindows() ? ';' : ':'
                            old_vk_icd_filenames = get(ENV, "VK_ICD_FILENAMES", [])
                            ENV["VK_ICD_FILENAMES"] = join([old_vk_icd_filenames; joinpath(libdir, "vk_swiftshader_icd.json")], sep)
                        end
        _ => error("Backend $backend not available. Only 'SwiftShader' is currently supported.")
    end
end
