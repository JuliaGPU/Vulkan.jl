# Troubleshooting

### VK_ERROR_LAYER_NOT_PRESENT

Most layers are not bundled with the default Vulkan driver. For example, the validation layer `VK_LAYER_KHRONOS_validation` should be installed from [their Github Page](https://github.com/KhronosGroup/Vulkan-ValidationLayers). This specific layer should hopefully be integrated in the artifact system in the future, but other layers may be vendor-dependent, and therefore it is the responsibility of the user to install them before hand.

### Validation layers - 'GLIBCXX_3.4.20' not found

The Khronos validation layer requires a `libstc++` more recent than the old found on Julia binaries. A workaround is to build Julia from source, with an up to date `libstdc++` on the system, as indicated in [this issue on Discourse](https://discourse.julialang.org/t/glibcxx-3-4-26-not-found-in-rcall/29113/10).