## VulkanGen

VulkanGen, the generator, converts the XML specification into a custom IR, and then generates wrapper code.

### Platform-specific wrapping

Some parts of the Vulkan API depend on system headers that are platform-specific; these notably include WSI (Window System Integration) extensions, which allow the developer to attach Vulkan devices to surfaces like windows.
These platform-specific dependencies can be grouped into operating systems, notably Windows, MacOS, Linux and BSD. Each of these systems is associated with a set of WSI extensions and has a separate wrapper file that with the unsupported extensions removed.

```@index
Modules = [VulkanGen]
```

```@autodocs
Modules = [VulkanGen]
```

