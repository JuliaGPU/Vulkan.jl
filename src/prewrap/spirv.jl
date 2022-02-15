struct SpecExtensionSPIRV
    "Name of the SPIR-V extension."
    name::String
    "Core version of the Vulkan API in which the extension was promoted, if promoted."
    promoted_to::Optional{VersionNumber}
    "Vulkan extensions that implicitly enable the SPIR-V extension."
    enabling_extensions::Vector{String}
end

struct FeatureCondition
    "Name of the feature structure relevant to the condition."
    type::Symbol
    "Member of the structure which must be set to true to enable the feature."
    member::Symbol
    "Core version corresponding to the structure, if any."
    core_version::Optional{VersionNumber}
    "Extension required for the corresponding structure, if any."
    extension::Optional{String}
end

struct PropertyCondition
    "Name of the property structure relevant to the condition."
    type::Symbol
    "Member of the property structure to be tested."
    member::Symbol
    "Required core version of the Vulkan API, if any."
    core_version::Optional{VersionNumber}
    "Required extension, if any."
    extension::Optional{String}
    "Whether the property to test is a boolean. If not, then it will be a bit from a bitmask."
    is_bool::Bool
    "Name of the bit enum that must be included in the property, if the property is not a boolean."
    bit::Optional{Symbol}
end

struct SpecCapabilitySPIRV
    "Name of the SPIR-V capability."
    name::Symbol
    "Core version of the Vulkan API in which the SPIR-V capability was promoted, if promoted."
    promoted_to::Optional{VersionNumber}
    "Vulkan extensions that implicitly enable the SPIR-V capability."
    enabling_extensions::Vector{String}
    "Vulkan features that implicitly enable the SPIR-V capability."
    enabling_features::Vector{FeatureCondition}
    "Vulkan properties that implicitly enable the SPIR-V capability."
    enabling_properties::Vector{PropertyCondition}
end
