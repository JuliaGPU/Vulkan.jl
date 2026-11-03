# C int outputs must use Cint storage even when the public return type is Int.
using Test, Vulkan

const FD_EXTENSIONS = ["VK_KHR_external_memory_fd", "VK_KHR_external_semaphore_fd", "VK_KHR_external_fence_fd"]

closefd(fd) = ccall(:close, Cint, (Cint,), fd)

@testset "fd exports return the descriptor" begin
    inst = Instance(String[], String[]; application_info = ApplicationInfo(v"1", v"1", v"1.1"))
    function has(pd)
        issubset(FD_EXTENSIONS, getproperty.(unwrap(enumerate_device_extension_properties(pd)), :extension_name)) || return false
        semaphore = get_physical_device_external_semaphore_properties(pd,
            PhysicalDeviceExternalSemaphoreInfo(EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT))
        fence = get_physical_device_external_fence_properties(pd,
            PhysicalDeviceExternalFenceInfo(EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT))
        !iszero(semaphore.external_semaphore_features & EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT) &&
            !iszero(fence.external_fence_features & EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT)
    end
    pds = filter(has, unwrap(enumerate_physical_devices(inst)))
    if isempty(pds)
        @test_skip "no physical device supports all OPAQUE_FD exports"
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
