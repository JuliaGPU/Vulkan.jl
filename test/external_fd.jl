# The three POSIX fd exports write a C `int` through `int* pFd`. VulkanSpec's
# semantic translation calls that `Int`, and the generator allocated `Ref{Int}()`,
# which does not convert to VulkanCore's `Ptr{Cint}`: every call threw
# `MethodError: no method matching unsafe_convert(::Type{Ptr{Int32}}, ::RefValue{Int64})`.
# Found exporting Vulkan memory to CUDA and HIP. Runs on the first physical device
# with all three extensions.
using Test, Vulkan

const FD_EXTENSIONS = ["VK_KHR_external_memory_fd", "VK_KHR_external_semaphore_fd", "VK_KHR_external_fence_fd"]

closefd(fd) = ccall(:close, Cint, (Cint,), fd)

@testset "fd exports return the descriptor" begin
    inst = Instance(String[], String[]; application_info = ApplicationInfo(v"1", v"1", v"1.1"))
    has(pd) = issubset(FD_EXTENSIONS, getproperty.(unwrap(enumerate_device_extension_properties(pd)), :extension_name))
    pds = filter(has, unwrap(enumerate_physical_devices(inst)))
    if isempty(pds)
        @test_skip "no physical device with $(join(FD_EXTENSIONS, ", "))"
    else
        pd = first(pds)
        qf = find_queue_family(pd, QUEUE_COMPUTE_BIT)
        dev = Device(pd, [DeviceQueueCreateInfo(qf, [1f0])], String[], FD_EXTENSIONS)

        mem = DeviceMemory(dev, 1 << 16, 0;
                           next = ExportMemoryAllocateInfo(handle_types = EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT))
        fd = unwrap(get_memory_fd_khr(dev, MemoryGetFdInfoKHR(mem, EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT)))
        @test fd isa Int && fd >= 0
        @test closefd(fd) == 0

        sem = Semaphore(dev; next = ExportSemaphoreCreateInfo(handle_types = EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT))
        fd = unwrap(get_semaphore_fd_khr(dev, SemaphoreGetFdInfoKHR(sem, EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT)))
        @test fd isa Int && fd >= 0
        @test closefd(fd) == 0

        fence = Fence(dev; next = ExportFenceCreateInfo(handle_types = EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT))
        fd = unwrap(get_fence_fd_khr(dev, FenceGetFdInfoKHR(fence, EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT)))
        @test fd isa Int && fd >= 0
        @test closefd(fd) == 0
    end
end
