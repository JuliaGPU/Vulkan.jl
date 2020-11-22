abstract type ShaderResource end

Base.broadcastable(x::ShaderResource) = Ref(x)

struct ShaderFile{F<:ShaderFormat} <: ShaderResource
    file::String
    format::F
    stage::ShaderStage
end

ShaderFile(file, format::TextFormat) = ShaderFile(file, format, stage_from_file_ext(last(splitext(file)), format))
ShaderFile(file, stage::ShaderStage) = ShaderFile(file, format_from_file_ext(last(splitext(file))), stage)

