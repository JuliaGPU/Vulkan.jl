abstract type NamingConvention end

abstract type CamelCase <: NamingConvention end
abstract type SnakeCase <: NamingConvention end

struct SnakeCaseLower <: SnakeCase
    value
    SnakeCaseLower(value) = is_snake_case(value) && lowercase(value) == value ? new(value) : error("Invalid string format $value")
end

struct SnakeCaseUpper <: SnakeCase
    value
    SnakeCaseUpper(value) = is_snake_case(value) && uppercase(value) == value ? new(value) : error("Invalid string format $value")
end

struct CamelCaseLower <: CamelCase
    value
    CamelCaseLower(value) = is_camel_case(value) && uppercase(value[1]) != value[1]  ? new(value) : error("Invalid string format $value")
end

struct CamelCaseUpper <: CamelCase
    value
    CamelCaseUpper(value) = is_camel_case(value) && uppercase(value[1]) == value[1] ? new(value) : error("Invalid string format $value")
end

Base.split(str::SnakeCase) = split(str.value, "_")
function Base.split(str::CamelCase)
    strval = str.value
    lowercase(strval) == strval && return [strval]
    length(strval) > 1 && lowercase(strval[2:end]) == strval[2:end] && return [strval]
    reg_upper = r"(([A-Z]+|\d+)(?=(([A-Z]+|\d+)|$))|([A-Z]{1})[a-z]*?(?=($|([A-Z]|\d))))"
    if uppercase(strval[1]) == strval[1] # CamelCaseUpper
        matches = getproperty.(collect(eachmatch(reg_upper, strval)), :match)
    else
        first = match(r"[a-z]+(?=([A-Z]|\d))", strval).match
        matches = [first, getproperty.(collect(eachmatch(reg_upper, strval)), :match)...]
    end
    matches
end

SnakeCaseLower(parts::AbstractArray) = SnakeCaseLower(lowercase(snake_case(parts)))
SnakeCaseUpper(parts::AbstractArray) = SnakeCaseUpper(uppercase(snake_case(parts)))

CamelCaseLower(parts::AbstractArray) = CamelCaseLower(camel_case(lowercase.(parts)))
CamelCaseUpper(parts::AbstractArray) = CamelCaseUpper(uppercasefirst(camel_case(lowercase.(parts))))

snake_case(parts::AbstractArray) = join(parts, "_")
camel_case(parts::AbstractArray) = length(parts) == 1 ? parts[1] : join([parts[1], uppercasefirst.(parts[2:end])...])

Base.convert(T::Type{SnakeCaseLower}, str::SnakeCaseUpper) = T(lowercase(str.value))
Base.convert(T::Type{SnakeCaseUpper}, str::SnakeCaseLower) = T(uppercase(str.value))
Base.convert(T::Type{CamelCaseLower}, str::CamelCaseUpper) = T(lowercase(str.value[1]) * str.value[2:end])
Base.convert(T::Type{CamelCaseUpper}, str::CamelCaseLower) = T(uppercasefirst(str.value))
Base.convert(T::Type{<: CamelCase}, str::SnakeCase) = T(split(str))
Base.convert(T::Type{<: SnakeCase}, str::CamelCase) = T(split(str))
nc_convert(T::Type{<: NamingConvention}, str::AbstractString) = Base.convert(T, (detect_convention(str, instance=true))).value

is_camel_case(str) = !occursin("_", str)
is_snake_case(str) = lowercase(str) == str || uppercase(str) == str

is_camel_case(str::NamingConvention) = is_camel_case(str.value)
is_snake_case(str::NamingConvention) = is_snake_case(str.value)

function remove_parts(str::T, discarded_parts) where T <: NamingConvention
    splitted_str = split(str)
    parts_to_keep = 1:length(splitted_str) |> x -> filter(y -> y ∉ discarded_parts, x) |> collect
    kept_parts = getindex.(Ref(splitted_str), parts_to_keep)
    T(kept_parts)
end

remove_parts(str; discarded_parts=[1]) = remove_parts(detect_convention(str, instance=true), discarded_parts)

"""Add a prefix following the naming convention present in the name.
"""
prefix(name::T, prefix) where {T <: NamingConvention} =  T([prefix, split(name)...])
remove_prefix(name::T) where {T <: NamingConvention} = T(split(name)[2:end])
remove_prefix(str) = remove_prefix(detect_convention(str, instance=true)).value

function detect_convention(str; instance=false)
    instanced(T, x) = instance ? T(x) : T
    is_camel_case(str) && lowercase(str)[1] == str[1] && return instanced(CamelCaseLower, str)
    is_camel_case(str) && uppercase(str)[1] == str[1] && return instanced(CamelCaseUpper, str)
    is_snake_case(str) && lowercase(str) == str && return instanced(SnakeCaseLower, str)
    is_snake_case(str) && uppercase(str) == str && return instanced(SnakeCaseUpper, str)
    error("No convention detected for string $str")
end


const code_convention_names = [
    :struct,
    :function,
    :variable,
    :constant
]

map_dicts(d1, d2) = Dict(key => obj1 => obj2 for (key, obj1, obj2) in zip(keys(d1), values(d1), values(d2)))

const julia_convention = Dict(
    :struct => CamelCaseUpper,
    :function => SnakeCaseLower,
    :variable => SnakeCaseLower,
    :constant => SnakeCaseLower
)
const vulkan_convention = Dict(
    :struct => CamelCaseUpper,
    :function => CamelCaseLower,
    :variable => CamelCaseLower,
    :constant => SnakeCaseUpper
)

const vulkan_to_julia = map_dicts(vulkan_convention, julia_convention)


function enforce_convention(str, code_convention_mapping, code_object; pickout_parts=nothing)
    old_t, new_t = code_convention_mapping[code_object]
    new_str = convert(new_t, old_t(str))
    (!isnothing(pickout_parts) ? remove_parts(new_str, pickout_parts) : new_str).value
end

enforce_convention(str, old_convention, new_convention, code_object; pickout_parts=nothing) = enforce_convention(str, map_dicts(old_convention, new_convention), code_object; pickout_parts)

function is_code_convention_respected(str, code_object, code_convention)
    try
        code_convention.conventions[code_object](str)
    catch e
        if typeof(e) != ErrorException
            throw(e)
        end
        return false
    end
    true
end