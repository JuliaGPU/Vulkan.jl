# Troubleshooting

Here we list common errors that can be encountered, with common solutions.

##### VK\_ERROR\_LAYER\_NOT\_PRESENT

Most layers are not bundled with the default Vulkan driver. For example, the validation layer `VK_LAYER_KHRONOS_validation` should be installed from [their Github Page](https://github.com/KhronosGroup/Vulkan-ValidationLayers). This specific layer should hopefully be integrated in the artifact system in the future, but other layers may be vendor-dependent, and therefore it is the responsibility of the user to install them before hand.

##### Validation layers - 'GLIBCXX\_X.X.XX' not found

The Khronos validation layer requires a `libstc++` more recent than the old found on Julia binaries. A workaround is to build Julia from source, with an up to date `libstdc++` on the system, as indicated in [this issue on Discourse](https://discourse.julialang.org/t/glibcxx-3-4-26-not-found-in-rcall/29113/10).

##### XCB Window can't open (CONN\_PARSE\_ERR)

Check that your DISPLAY variable is correctly set (`ENV["DISPLAY"]` should typically return `:0` or `:1`, the correct value depends on your setup).

##### 0-based vs 1-based indexing

Vulkan uses a 0-based indexing system, so be careful whenever an index is returned from or requested for a Vulkan function.
