function EnumDefinition(spec::SpecEnum)
    p = Dict(
        :category => :enum,
        :macro => Symbol("@cenum"),
        :values => map(unique(spec.enums)) do enum
            :($(remove_vk_prefix(enum.name)) = $(enum.value))
        end,
        :decl => :($(enum_type(spec))::$(enum_val_type(spec))),
    )
    EnumDefinition(spec, p)
end

function Convert(T::EnumDefinition, x)
    p = Dict(
        :category => :function,
        :name => :convert,
        :args => [:(T::Type{$(name(T))}), :(x::$x)],
        :short => true,
        :body => :(Base.bitcast($(name(T)), x)),
    )
    Convert(T, x, p)
end

function Convert(T, def::EnumDefinition)
    p = Dict(
        :category => :function,
        :name => :convert,
        :args => [:(T::Type{$T}), :(x::$(name(def)))],
        :short => true,
        :body => :(Base.bitcast($T, x)),
    )
    Convert(T, def, p)
end

enum_type(spec::Spec) = enum_type(spec.name)
enum_type(type) = remove_vk_prefix(type)

enum_val_type(def::EnumDefinition) = enum_val_type(def.spec)
enum_val_type(spec::Spec) = any(<(0), getproperty.(spec.enums, :value)) ? :Int32 : :UInt32
