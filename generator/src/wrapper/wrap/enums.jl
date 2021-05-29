function wrap(spec::SpecEnum)
    Dict(
        :category => :enum,
        :macro => Symbol("@cenum"),
        :values => map(unique(spec.enums)) do enum
            :($(remove_vk_prefix(enum.name)) = $(enum.value))
        end,
        :decl => :($(enum_type(spec))::$(enum_val_type(spec))),
    )
end

function convert_overload(spec::SpecEnum)
    Dict(
        :category => :function,
        :name => :convert,
        :args => [:(T::Type{$(spec.name)}), :(x::$(enum_type(spec)))],
        :short => true,
        :body => :(Base.bitcast($(spec.name), x)),
    )
end

function convert_back_overload(spec::SpecEnum)
    Dict(
        :category => :function,
        :name => :convert,
        :args => [:(T::Type{$(enum_type(spec))}), :(x::$(spec.name))],
        :short => true,
        :body => :(Base.bitcast($(enum_type(spec)), x)),
    )
end

enum_type(spec::Spec) = enum_type(spec.name)
enum_type(type) = remove_vk_prefix(type)
enum_val_type(spec::Spec) = any(<(0), getproperty.(spec.enums, :value)) ? :Int32 : :UInt32
