@testset "Constants" begin
    test(ConstantDefinition, constant_by_name, :VK_SUBPASS_EXTERNAL, :(const SUBPASS_EXTERNAL = VK_SUBPASS_EXTERNAL))
end
