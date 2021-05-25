function wrap(spec::SpecEnum)
    values = getproperty.(spec.enums, :value)
    enum_type = any(<(0), values) ? :Int32 : :UInt32
    Dict(
        :category => :enum,
        :macro => Symbol("@cenum"),
        :values => map(unique(spec.enums)) do enum
            :($(remove_vk_prefix(enum.name)) = $(enum.value))
        end,
        :decl => :($(Symbol(:_, remove_vk_prefix(spec.name)))::$enum_type),
    )
end
