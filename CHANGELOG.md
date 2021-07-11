# Changelog for Vulkan.jl

## Version `v0.3`

* ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] The beta extensions are not wrapped anymore, following their removal from VulkanCore (see [this issue](https://github.com/JuliaGPU/VulkanCore.jl/issues/43) to know why they were removed). This will allow for a more stable library.

* ![BREAKING][badge-breaking] ![Feature][badge-feature] High-level structs were defined that allow for the introspection over their fields. Minimalistic structs (with no introspection capabilities, but slightly more efficient) are still present, but were prefixed with '_'. For example, `InstanceCreateInfo` becomes `_InstanceCreateInfo`, while the new `InstanceCreateInfo` allows for querying its parameters such as extensions, layers, etc. without loading pointers from the API struct. These high-level structs should be a drop-down replacement for API calls and should have the same (or very similar) constructors than the old (minimalistic) ones. Note that this only concerns API data structures, therefore excluding handles which stay the same. Structs that were only returned (and never requested by) the API are unchanged, as they already had the same logic as these high-level structs.

* ![BREAKING][badge-breaking] ![Feature][badge-feature] All enumeration and constant types are now wrapped, with their prefix removed. Bitmasks stay unchanged. As an example, `VK_SHARING_MODE_EXCLUSIVE` must now be replaced by `SHARING_MODE_EXCLUSIVE`. This also holds for constants, e.g. `SUBPASS_EXTERNAL` instead of `VK_SUBPASS_EXTERNAL`.

* ![BREAKING][badge-breaking] ![Feature][badge-feature] The `code` field of `VulkanError` generated ith the `@check` macro (including its uses in wrappers) is now a `Result` (instead of a `VkResult`) adapting from the change above.

* ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] Convenience constructors around device features (like `PhysicalDeviceFeatures`) now accepts feature symbols in `snake_case` convention, instead of lower `camelCase`, for consistency with the rest of the library.

* ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] The convenience function for setting up a debug messenger replaced its `severity` keyword argument with `min_severity` and all keyword arguments now accept API enums instead of strings. The default debug callback has also been slightly changed to use Julia's logging system in a finalizer-safe manner.

* ![BREAKING][badge-breaking] ![Feature][badge-feature] Wrappers were added for union structs (e.g. VkClearColorValue), which are now used in wrapped structs instead of their lower-level counterparts. For example, instead of using `vk.VkClearColorValue`, you must now use `ClearColorValue` directly.

* ![Feature][badge-feature] An automatic dispatch logic was added to automate the retrieval and use of API function pointers. This means that you don't need to retrieve function pointers manually, including for extension-related functionality.

* ![Enhancement] Documentation was improved, and docstrings now list extension requirements.


[badge-breaking]: https://img.shields.io/badge/BREAKING-red.svg
[badge-deprecation]: https://img.shields.io/badge/deprecation-orange.svg
[badge-feature]: https://img.shields.io/badge/feature-green.svg
[badge-enhancement]: https://img.shields.io/badge/enhancement-blue.svg
[badge-bugfix]: https://img.shields.io/badge/bugfix-purple.svg
[badge-security]: https://img.shields.io/badge/security-black.svg
[badge-experimental]: https://img.shields.io/badge/experimental-lightgrey.svg
[badge-maintenance]: https://img.shields.io/badge/maintenance-gray.svg

<!--
# Badges

![BREAKING][badge-breaking]
![Deprecation][badge-deprecation]
![Feature][badge-feature]
![Enhancement][badge-enhancement]
![Bugfix][badge-bugfix]
![Security][badge-security]
![Experimental][badge-experimental]
![Maintenance][badge-maintenance]
-->
