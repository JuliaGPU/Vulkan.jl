@testset "State" begin
  state = generate_state()
  @test state[:version] == read_state()[:version] == string(api.version)
  @test state[:functions][:vkCreateInstance][:pAllocator][:exposed_as_parameter]

  # Preserve prior parameters when set.
  state[:functions][:vkCreateInstance][:pAllocator][:exposed_as_parameter] = false
  new_state = generate_state(state)
  @test !new_state[:functions][:vkCreateInstance][:pAllocator][:exposed_as_parameter]

  # Recreate parameters for new functions/structs, based on the value of `is_optional`.
  delete!(new_state[:functions], :vkCreateInstance)
  new_state_2 = generate_state(new_state)
  @test new_state_2[:functions][:vkCreateInstance][:pAllocator][:exposed_as_parameter]

  api_1 = VulkanAPI(v"1.3.240")
  api_2 = VulkanAPI(v"1.3.266")
  @test follow_alias(:vkGetImageSubresourceLayout2EXT, api_1.aliases) == :vkGetImageSubresourceLayout2EXT
  @test follow_alias(:vkGetImageSubresourceLayout2EXT, api_2.aliases) == :vkGetImageSubresourceLayout2KHR
  state_1 = generate_state(api_1)
  # Simulate that we had a non-defautl setting for a parameter.
  state_1[:functions][:vkGetImageSubresourceLayout2EXT][:pSubresource][:exposed_as_parameter] = true
  state_2 = generate_state(state_1, api_2)
  @test state_2[:functions][:vkGetImageSubresourceLayout2KHR] == state_1[:functions][:vkGetImageSubresourceLayout2EXT]
  @test !haskey(state_2[:functions], :vkGetImageSubresourceLayout2EXT)
end;
