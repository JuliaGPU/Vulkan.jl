using Documenter

DocMeta.setdocmeta!(Vulkan, :DocTestSetup, quote
    using Vulkan
    instance = Instance([], [])
    physical_device = first(unwrap(enumerate_physical_devices(instance)))
end)

doctest(Vulkan)
