using Preferences: load_preference

@testset "Dispatcher" begin
    if load_preference(Vk, "USE_DISPATCH_TABLE", "true") == "true"
        disp = Vk.global_dispatcher[]
        @test haskey(disp.instance_tables, instance)
        @test haskey(disp.instance_tables[instance].pointers, :vkCreateDevice)
        @test disp.instance_tables[instance].pointers[:vkCreateDevice] ≠ :C_NULL
        @test haskey(disp.device_tables, device)
        @test haskey(disp.device_tables[device].pointers, :vkCreateGraphicsPipelines)
        @test disp.device_tables[device].pointers[:vkCreateGraphicsPipelines] ≠ C_NULL
        @test_throws ErrorException("Could not retrieve function pointer for 'vkCreateSwapchainKHR'. This can be caused by an extension not being enabled for a function that needs it; see the help with `?` or the documentation for more information.") function_pointer(disp, device, :vkCreateSwapchainKHR)
    else
        @test !haskey(disp.instance_tables, instance)
    end
end
