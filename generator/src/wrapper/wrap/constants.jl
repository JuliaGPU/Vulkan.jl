const excluded_constants = [
    "VK_TRUE",
    "VK_FALSE",
]

function wrap(spec::SpecConstant)
    Dict(
        :category => :const,
        :name => remove_vk_prefix(spec.name),
        :value => spec.name,
    )
end

function include_constant(spec::SpecConstant)
    name = string(spec.name)
    startswith(name, "VK_") && !contains(name, r"(SPEC_VERSION|EXTENSION_NAME)") && name ∉ excluded_constants
end
