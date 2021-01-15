using VulkanGen

tmp = tempname() * ".jl"

@testset "Generate whole wrapper" begin
    write(VulkanWrapper(), tmp)
    @test stat(tmp).size > 0
end

@info "Generated wrapper at $tmp"

@eval module Wrapper
    using VulkanCore
    using VulkanCore.vk

    using Base: cconvert, unsafe_convert, RefArray
    include("../../../src/prewrap.jl")
    include($tmp)
end

using .Wrapper
const gc = GC.gc

"""
Evaluate an expression, finalize it, and reevaluate it again.
Refcount value is tested before and after finalization.
"""
macro respawn(expr)
    @assert expr.head == :(=)
    lhs, rhs = expr.args
    quote
        $(esc(expr))
        @test $(esc(lhs)).refcount == 1
        finalize($(esc(lhs)))
        @test $(esc(lhs)).refcount == 0
        $(esc(expr))
    end
end

@testset "Basic API usage" begin
    instance = Instance(String[], String[]; application_info = ApplicationInfo(v"0.0.1", v"0.0.1", v"1.2"; application_name="Test", engine_name="Experimental engine"))
    func_ptr = get_instance_proc_addr("vkEnumeratePhysicalDevices"; instance)
    pdevices = enumerate_physical_devices(instance, func_ptr)
    @test all(get_physical_device_properties.(pdevices) .== get_physical_device_properties.(enumerate_physical_devices(instance)))
    if length(pdevices) ≠ 0
        device = Device(first(pdevices), DeviceQueueCreateInfo[], String[], String[])
        @test !isnothing(device)
    end
    finalize(device)
    finalize(instance)
end

@testset "Reference counting" begin
    @respawn instance = Instance(String[], String[]; application_info = ApplicationInfo(v"0.0.1", v"0.0.1", v"1.2"; application_name="Test", engine_name="Experimental engine"))
    func_ptr = get_instance_proc_addr("vkEnumeratePhysicalDevices"; instance)
    pdevices = enumerate_physical_devices(instance, func_ptr)
    @test all(get_physical_device_properties.(pdevices) .== get_physical_device_properties.(enumerate_physical_devices(instance)))
    if length(pdevices) ≠ 0
        @respawn device = Device(first(pdevices), DeviceQueueCreateInfo[], String[], String[])
        @respawn pool = CommandPool(device, 0)
    end
    gc()
end
