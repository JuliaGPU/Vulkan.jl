@testset "Constants" begin
    test_ex(ConstantDefinition(api.constants[:VK_SUBPASS_EXTERNAL]), :(const SUBPASS_EXTERNAL = VK_SUBPASS_EXTERNAL))
end;
