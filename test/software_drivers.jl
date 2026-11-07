# Run with both software-driver JLLs installed in the development environment.
using Test, Lavapipe_jll, SwiftShader_jll, Vulkan

@testset "Software drivers share the Vulkan loader" begin
    manifests = split(get(ENV, "VK_ADD_DRIVER_FILES", ""), Sys.iswindows() ? ';' : ':'; keepempty=false)
    @test Lavapipe_jll.lvp_icd in manifests
    @test joinpath(dirname(SwiftShader_jll.libvk_swiftshader_path), "vk_swiftshader_icd.json") in manifests
    @test length(manifests) == length(unique(manifests))
    @test Base.get_extension(Vulkan, :VulkanSwiftShaderExt) !== nothing

    withenv("VK_ADD_DRIVER_FILES" => "existing.json", "VK_DRIVER_FILES" => "selected.json",
            "VK_ICD_FILENAMES" => "legacy.json") do
        Vulkan.register_icd!("additional.json")
        Vulkan.register_icd!("additional.json")
        @test split(ENV["VK_ADD_DRIVER_FILES"], Sys.iswindows() ? ';' : ':') == ["existing.json", "additional.json"]
        @test ENV["VK_DRIVER_FILES"] == "selected.json"
        @test ENV["VK_ICD_FILENAMES"] == "legacy.json"
    end

    application = ApplicationInfo(v"0.0.0", v"0.0.0", v"1.2")
    instance = Instance(String[], String[]; application_info=application)
    properties = get_physical_device_properties.(unwrap(enumerate_physical_devices(instance)))
    names = [String(filter(!=('\0'), collect(p.device_name))) for p in properties]
    @test any(n -> occursin("SwiftShader", n), names)
    @test any(n -> occursin("llvmpipe", lowercase(n)), names)

    preference = Vulkan.Preferences.load_preference(VkCore, "libvulkan", nothing)
    @test isnothing(set_driver(:SwiftShader))
    @test isnothing(set_driver(:Lavapipe))
    @test Vulkan.Preferences.load_preference(VkCore, "libvulkan", nothing) == preference
    @test split(get(ENV, "VK_ADD_DRIVER_FILES", ""), Sys.iswindows() ? ';' : ':'; keepempty=false) == manifests
end
