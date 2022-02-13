#=

# Optional functionality

Vulkan uses a particular functionality mechanism based on [features](https://www.khronos.org/registry/vulkan/specs/1.2/html/vkspec.html#features), [extensions](https://www.khronos.org/registry/vulkan/specs/1.2/html/vkspec.html#extendingvulkan) and properties.

Properties are per-device, and are not specified by the user; instead, they are returned by the Vulkan corresponding driver. Features may be very similar to properties semantically: they may specify whether some functionality is available or not on the device, such as atomic operations. However, features are usually more general than that: the presence or absence of specific features will cause the driver to behave differently. The difference with properties is that enabling a feature may dynamically change the logic of the driver, while properties are static and can only tell whether some functionality is supported or not.

SPIR-V uses a similar mechanism, with capabilities (analogous to features) and extensions. However, one should note that SPIR-V is just a format for GPU code, and not an API in itself; there is no SPIR-V driver of any kind. Therefore, any configuration for SPIR-V will be specified through its execution environment, e.g. OpenCL or Vulkan. This is why Vulkan specifies some features and extensions that are directly related to SPIR-V capabilities and extensions.

As a client API for SPIR-V, Vulkan [establishes](https://www.khronos.org/registry/vulkan/specs/1.2/html/vkspec.html#spirvenv) what SPIR-V capabilities and extensions are enabled given the features and extensions that were enabled for Vulkan. Notably, there is no SPIR-V capability or extension that can be enabled without supporting a Vulkan core version or without having a matching Vulkan feature or extension enabled.

Optional SPIR-V functionality is therefore fully implicit, based on the Vulkan API configuration. Notably, a SPIR-V capability may be enabled by:
- A Vulkan core version
- At least one enabling Vulkan extension
- At least one enabling Vulkan feature

=#
