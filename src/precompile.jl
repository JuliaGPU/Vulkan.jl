@compile_workload begin
    initialize(_PhysicalDeviceFeatures2, _PhysicalDeviceVulkan12Features, _PhysicalDeviceVulkanMemoryModelFeatures)
    f1 = initialize(PhysicalDeviceFeatures2, PhysicalDeviceVulkan12Features, PhysicalDeviceVulkanMemoryModelFeatures)

    chain_args = [PhysicalDeviceFeatures2(PhysicalDeviceFeatures()), PhysicalDeviceVulkan12Features(), PhysicalDeviceVulkanMemoryModelFeatures(false, false, false)]
    chained = chain(chain_args...)
    unchain(chained)

    f2 = _PhysicalDeviceFeatures2(f1)
    from_vk(PhysicalDeviceFeatures2, f2.vks, PhysicalDeviceVulkan12Features, PhysicalDeviceVulkanMemoryModelFeatures)
    f3 = Base.unsafe_convert(VkCore.VkPhysicalDeviceFeatures2, f2)
    f4 = PhysicalDeviceFeatures2(f3, PhysicalDeviceVulkan12Features, PhysicalDeviceVulkanMemoryModelFeatures)

    if in(@load_preference("PRECOMPILE_DEVICE_FUNCTIONS", "auto"), ("true", "auto"))
        include("../test/precompile_workload.jl")
        try
            precompile_workload()
        catch e
            if @load_preference("PRECOMPILE_DEVICE_FUNCTIONS", "auto") == "true"
                if isa(e, PrecompilationError)
                    @error "The precompilation of device functions failed, likely because of an unsupported configuration on the host machine. You may disable this error by setting the preference \"PRECOMPILE_DEVICE_FUNCTIONS\" to \"auto\" or \"false\"."
                else
                    @error "The precompilation of device functions failed unexpectedly. We encourage you to file an issue on https://github.com/JuliaGPU/Vulkan.jl including this logged message."
                end
                rethrow()
            end
        end
    end
end
