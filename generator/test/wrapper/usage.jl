using VulkanGen

tmp = tempname() * ".jl"

@testset "Generate whole wrapper" begin
    write(VulkanWrapper(), tmp)
    @test stat(tmp).size > 0
end

@eval module Wrapper
    using VulkanCore
    using VulkanCore.vk

    using Base: cconvert, unsafe_convert, RefArray
    include($tmp)
end

"""
Evaluate an expression, finalize it, and reevaluate it again.
"""
macro respawn(expr)
    @assert expr.head == :(=)
    lhs, rhs = expr.args
    quote
        $(esc(expr))
        finalizer(x -> @test(true), $(esc(lhs)))
        finalize($(esc(lhs)))
        $(esc(expr))
    end
end

@testset "Basic API usage" begin
    using .Wrapper
    @respawn instance = Instance(String[], String[]; application_info = ApplicationInfo(v"0.0.1", v"0.0.1", enumerate_instance_version(); application_name="Test", engine_name="Experimental engine"))
    func_ptr = get_instance_proc_addr("vkEnumeratePhysicalDevices"; instance)
    pdevices = enumerate_physical_devices(instance, func_ptr)
    @test all(get_physical_device_properties.(pdevices) .== get_physical_device_properties.(enumerate_physical_devices(instance)))
    if length(pdevices) ≠ 0
        println("$(length(pdevices)) physical device(s) found: $(get_physical_device_properties.(pdevices))")
        @respawn device = Device(first(pdevices), DeviceQueueCreateInfo[], String[], String[])
    end
end
