test_generated_struct(name, ex) = test_ex(hl_wrap(struct_by_name(name)), ex)
test_convert(name, ex) = test_ex(hl_convert(struct_by_name(name)), :($(struct_name(name))(x::$(struct_name(name, true))) = $ex))
test_hl_add_constructor(name, ex) = test_ex(hl_add_constructor(struct_by_name(name)), ex)

@testset "High-level wrapper" begin
    @testset "Generated structs" begin
        test_generated_struct(:VkApplicationInfo, :(
            struct ApplicationInfo <: HighLevelStruct
                next::Any
                application_name::String
                application_version::VersionNumber
                engine_name::String
                engine_version::VersionNumber
                api_version::VersionNumber
            end
        ))

        test_generated_struct(:VkInstanceCreateInfo, :(
            struct InstanceCreateInfo <: HighLevelStruct
                next::Any
                flags::UInt32
                application_info::OptionalPtr{ApplicationInfo}
                enabled_layer_names::Vector{String}
                enabled_extension_names::Vector{String}
            end
        ))
    end

    @testset "Conversion to low-level structs" begin
        test_convert(:VkApplicationInfo, :(_ApplicationInfo(x.application_version, x.engine_version, x.api_version; x.next, x.application_name, x.engine_name)))
        test_convert(:VkInstanceCreateInfo, :(_InstanceCreateInfo(x.enabled_layer_names, x.enabled_extension_names; x.next, x.flags, application_info = convert_nonnull(_ApplicationInfo, x.application_info))))
    end

    @testset "Additional constructor" begin
        test_hl_add_constructor(:VkApplicationInfo, :(
            ApplicationInfo(application_version::VersionNumber, engine_version::VersionNumber, api_version::VersionNumber; next = C_NULL, application_name = "", engine_name = "") = ApplicationInfo(next, application_name, application_version, engine_name, engine_version, api_version)
        ))
    end
end
