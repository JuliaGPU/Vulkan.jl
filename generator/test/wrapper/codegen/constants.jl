test_wrap_constant(name, ex) = test_wrap(constant_by_name, name, ex)

@testset "Constants" begin
    test_wrap_constant(:VK_SUBPASS_EXTERNAL, :(const SUBPASS_EXTERNAL = VK_SUBPASS_EXTERNAL))
end
