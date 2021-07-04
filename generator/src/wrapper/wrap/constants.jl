const excluded_constants = [
    "VK_TRUE",
    "VK_FALSE",
]

function ConstantDefinition(spec::SpecConstant)
    p = Dict(
        :category => :const,
        :name => remove_vk_prefix(spec.name),
        :value => spec.name,
    )
    ConstantDefinition(spec, p)
end

function include_constant(spec::SpecConstant)
    name = string(spec.name)
    startswith(name, "VK_") && !contains(name, r"(SPEC_VERSION|EXTENSION_NAME)") && name ∉ excluded_constants
end
