"""
A Vulkan application represents any program that uses the Vulkan API. Application goals and setups may vary greatly, but they all require many structures to function. Some may do offline rendering (without presenting the result to a window), or use Vulkan Compute and render directly to a display, but both uses share similarities in that they require an Instance and one (or several) devices.
"""
abstract type VulkanApplication end