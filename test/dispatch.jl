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
    else
        @test !haskey(disp.instance_tables, instance)
    end
end
