@testset "Overloads" begin
    @testset "Parent navigation" begin
        test_ex(Parent(HandleDefinition(api.handles[:VkDevice])), :(
            parent(device::Device) = device.physical_device
        ))

        test_ex(Parent(HandleDefinition(api.handles[:VkSurfaceKHR])), :(
            parent(surface::SurfaceKHR) = surface.instance
        ))
    end
end;
