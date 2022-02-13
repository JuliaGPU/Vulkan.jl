@testset "Overloads" begin
    @testset "Parent navigation" begin
        test_ex(Parent(HandleDefinition(handle_by_name(:VkDevice))), :(
            parent(device::Device) = device.physical_device
        ))

        test_ex(Parent(HandleDefinition(handle_by_name(:VkSurfaceKHR))), :(
            parent(surface::SurfaceKHR) = surface.instance
        ))
    end
end
