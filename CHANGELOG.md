# Changelog for Vulkan.jl

## Version `v

## Version `v0.6`

- ![BREAKING][badge-breaking] The version of the Vulkan API has been updated to 1.3.207. This is breaking because certain function arguments can be annotated as optional in the specification, turning them into keyword arguments in generated code.
- ![Feature][badge-feature] All aliases are now generated to ensure backwards compatibilty with all [promotions](https://www.khronos.org/registry/vulkan/specs/1.3/html/vkspec.html#extendingvulkan-compatibility-promotion) of extensions or extension features.

## Version `v0.5`

Changelog:
- ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] Functions that take arguments in the form of intermediate structures were renamed for consistency. They now start with an underscore, like the intermediate structures. As a result, the dispatch constraints for such functions could be relaxed, and there is no longer a need to explicitly specify array types for intermediate structures.
- ![Feature][badge-feature] Additional arguments were exposed for the functions that wrap API commands that may take empty structures as `next` chain members to be filled for queries (such as `get_physical_device_features_2` which wraps [vkGetPhysicalDeviceFeatures2](https://www.khronos.org/registry/vulkan/specs/1.2/html/vkspec.html#vkGetPhysicalDeviceFeatures2) and can have chains of empty structures as part of its [VkPhysicalDeviceFeatures2](https://www.khronos.org/registry/vulkan/specs/1.2/html/vkspec.html#VkPhysicalDeviceFeatures2) argument). You can do `get_physical_device_properties_2(physical_device, PhysicalDeviceProtectedMemoryProperties, PhysicalDeviceProvokingVertexPropertiesEXT, ...)` to have structures such as  `PhysicalDeviceProtectedMemoryProperties` filled in by the API.
- ![Feature][badge-feature] A new function `initialize` was defined to allow the user to build empty structures that are meant to be filled by Vulkan implementations. This utility is used internally by the feature described above, but should the user need to initialize an empty structure himself, it is available.
- Utility functions `chain(nexts::HighLevelStruct...)` and `unchain(x::HighLevelStruct)` were added to aid in manipulating `next` chains via nesting and flattening chain members, respectively.
- ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] `ReturnedOnly` structures are no longer special-cased. Indeed, these structures may still be required as input to Vulkan functions, notably as part of `next` chains when querying for properties.
- ![Feature][badge-feature] Information for SPIR-V capabilities and extensions are available via `SPIRV_CAPABILITIES` and `SPIRV_EXTENSIONS` respectively. These structures describe how SPIR-V functionalities are implicitly enabled from Vulkan features, extensions and properties.
- ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] If a function returns a struct, and the level of wrapping can't be inferred from the arguments, then the returned type uses a high-level structure instead of an intermediate one.
- ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] The symbol `core` has been removed and the symbol `vk` is no longer exported, in favor of the new exported symbol `VkCore`.
- ![Enhancement][badge-enhancement] An alias named `Vk` for `Vulkan` is now exported.
- ![Feature][badge-feature] Introspection functions `hl_type`, `intermediate_type` and `core_type` were defined to link Vulkan structures between wrapping levels, should the user ever need it. This is mostly used internally.
- ![Enhancement][badge-enhancement] Handles now have additional constructors that accept create info structures, to be more in line with the creation functions `create_...`.
- ![Enhancement][badge-enhancement] Improvements made to generated docstrings and to the package documentation.

TL;DR: here is what you will likely need to do:
- Use `Vulkan.VkCore` instead of `Vulkan.core` where necessary (typically for C-compatible callback functions, such as a validation callback)
- If you used intermediate structures (which start with an underscore; typical applications should not use them except for identified performance reasons):
    - Use underscores in functions that use them (e.g. `get_physical_device_features_2` -> `_get_physical_device_features_2`)

## Version `v0.4`

* ![BREAKING][badge-breaking] ![Feature][badge-feature] Hashing is now defined recursively on high-level structures and equality of high-level structures is defined in terms of equality of hashes. This uses [AutoHashEquals.jl](https://github.com/andrewcooke/AutoHashEquals.jl), see the package documentation for more information.

## Version `v0.3`

* ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] The beta extensions are not wrapped anymore, following their removal from VulkanCore (see [this issue](https://github.com/JuliaGPU/VulkanCore.jl/issues/43) to know why they were removed). This will allow for a more stable library.

* ![BREAKING][badge-breaking] ![Feature][badge-feature] High-level structs were defined that allow for the introspection over their fields. Minimalistic structs (with no introspection capabilities, but slightly more efficient) are still present, but were prefixed with '_'. For example, `InstanceCreateInfo` becomes `_InstanceCreateInfo`, while the new `InstanceCreateInfo` allows for querying its parameters such as extensions, layers, etc. without loading pointers from the API struct. These high-level structs should be a drop-down replacement for API calls and should have the same (or very similar) constructors than the old (minimalistic) ones. Note that this only concerns API data structures, therefore excluding handles which stay the same. Structs that were only returned (and never requested by) the API are unchanged, as they already had the same logic as these high-level structs.

* ![BREAKING][badge-breaking] ![Feature][badge-feature] All enumeration and constant types are now wrapped, with their prefix removed. Bitmasks stay unchanged. As an example, `VK_SHARING_MODE_EXCLUSIVE` must now be replaced by `SHARING_MODE_EXCLUSIVE`. This also holds for constants, e.g. `SUBPASS_EXTERNAL` instead of `VK_SUBPASS_EXTERNAL`.

* ![BREAKING][badge-breaking] ![Feature][badge-feature] The `code` field of `VulkanError` generated ith the `@check` macro (including its uses in wrappers) is now a `Result` (instead of a `VkResult`) adapting from the change above.

* ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] Convenience constructors around device features (like `PhysicalDeviceFeatures`) now accepts feature symbols in `snake_case` convention, instead of lower `camelCase`, for consistency with the rest of the library.

* ![BREAKING][badge-breaking] ![Enhancement][badge-enhancement] The convenience function for setting up a debug messenger replaced its `severity` keyword argument with `min_severity` and all keyword arguments now accept API enums instead of strings. The default debug callback has also been slightly changed to use Julia's logging system in a finalizer-safe manner.

* ![BREAKING][badge-breaking] ![Feature][badge-feature] Wrappers were added for union structs (e.g. VkClearColorValue), which are now used in wrapped structs instead of their lower-level counterparts. For example, instead of using `vk.VkClearColorValue`, you must now use `ClearColorValue` directly.

* ![Feature][badge-feature] An automatic dispatch logic was added to automate the retrieval and use of API function pointers. This means that you don't need to retrieve function pointers manually, including for extension-related functionality.

* ![Enhancement][badge-enhancement] Documentation was improved, and docstrings now list extension requirements.


[badge-breaking]: https://img.shields.io/badge/BREAKING-red.svg
[badge-deprecation]: https://img.shields.io/badge/deprecation-orange.svg
[badge-feature]: https://img.shields.io/badge/feature-green.svg
[badge-enhancement]: https://img.shields.io/badge/enhancement-blue.svg
[badge-bugfix]: https://img.shields.io/badge/bugfix-purple.svg
[badge-security]: https://img.shields.io/badge/security-black.svg
[badge-experimental]: https://img.shields.io/badge/experimental-lightgrey.svg
[badge-maintenance]: https://img.shields.io/badge/maintenance-gray.svg

<!--
# Badges (reused from the CHANGELOG.md of Documenter.jl)

![BREAKING][badge-breaking]
![Deprecation][badge-deprecation]
![Feature][badge-feature]
![Enhancement][badge-enhancement]
![Bugfix][badge-bugfix]
![Security][badge-security]
![Experimental][badge-experimental]
![Maintenance][badge-maintenance]
-->
