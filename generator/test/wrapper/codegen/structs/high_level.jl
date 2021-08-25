@testset "High-level wrapper" begin
    @testset "Generated structs" begin
        test(StructDefinition{true}, struct_by_name, :VkApplicationInfo, :(
            @auto_hash_equals struct ApplicationInfo <: HighLevelStruct
                next::Any
                application_name::String
                application_version::VersionNumber
                engine_name::String
                engine_version::VersionNumber
                api_version::VersionNumber
            end
        ))

        test(StructDefinition{true}, struct_by_name, :VkInstanceCreateInfo, :(
            @auto_hash_equals struct InstanceCreateInfo <: HighLevelStruct
                next::Any
                flags::UInt32
                application_info::OptionalPtr{ApplicationInfo}
                enabled_layer_names::Vector{String}
                enabled_extension_names::Vector{String}
            end
        ))

        test(StructDefinition{true}, struct_by_name, :VkXcbSurfaceCreateInfoKHR, :(
            @auto_hash_equals struct XcbSurfaceCreateInfoKHR <: HighLevelStruct
                next::Any
                flags::UInt32
                connection::Ptr{vk.xcb_connection_t}
                window::vk.xcb_window_t
            end
        ))
    end

    @testset "Conversion to low-level structs" begin
        test_ex(
            Constructor(
                StructDefinition{false}(struct_by_name(:VkApplicationInfo)),
                StructDefinition{true}(struct_by_name(:VkApplicationInfo)),
            ),
            :(
                _ApplicationInfo(x::ApplicationInfo) = _ApplicationInfo(x.application_version, x.engine_version, x.api_version; x.next, x.application_name, x.engine_name)
            ),
        )
        test_ex(
            Constructor(
                StructDefinition{false}(struct_by_name(:VkInstanceCreateInfo)),
                StructDefinition{true}(struct_by_name(:VkInstanceCreateInfo)),
            ),
            :(
                _InstanceCreateInfo(x::InstanceCreateInfo) = _InstanceCreateInfo(x.enabled_layer_names, x.enabled_extension_names; x.next, x.flags, application_info = convert_nonnull(_ApplicationInfo, x.application_info))
            ),
        )
    end

    @testset "Additional constructor" begin
        test(Constructor, StructDefinition{true}(StructDefinition{false}(struct_by_name(:VkApplicationInfo))), :(
            ApplicationInfo(application_version::VersionNumber, engine_version::VersionNumber, api_version::VersionNumber; next = C_NULL, application_name = "", engine_name = "") = ApplicationInfo(next, application_name, application_version, engine_name, engine_version, api_version)
        ))
    end
end
