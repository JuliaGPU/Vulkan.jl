function test_alias(from, to, ex)
  alias = AliasDeclaration(from => to)
  test_ex(alias, ex)
end

@testset "Alias declarations" begin
  test_alias(:vkCmdSetCullModeEXT, :vkCmdSetCullMode, :(const cmd_set_cull_mode_ext = cmd_set_cull_mode))
  test_alias(:VK_RENDERING_RESUMING_BIT_KHR, :VK_RENDERING_RESUMING_BIT, :(const RENDERING_RESUMING_BIT_KHR = RENDERING_RESUMING_BIT))
  test_alias(:VkPhysicalDeviceImageFormatInfo2KHR, :VkPhysicalDeviceImageFormatInfo2, :(const PhysicalDeviceImageFormatInfo2KHR = PhysicalDeviceImageFormatInfo2))
end
