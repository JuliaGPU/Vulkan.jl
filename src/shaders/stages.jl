"""
Shader stage in a graphics pipeline.
"""
abstract type ShaderStage end

Base.broadcastable(x::ShaderStage) = Ref(x)

struct VertexStage <: ShaderStage end
struct TessellationControlStage <: ShaderStage end
struct TessellationEvaluationStage <: ShaderStage end
struct GeometryStage <: ShaderStage end
struct FragmentStage <: ShaderStage end

Base.convert(::Type{VkShaderStageFlagBits}, ::VertexStage) = VK_SHADER_STAGE_VERTEX_BIT
Base.convert(::Type{VkShaderStageFlagBits}, ::TessellationControlStage) = VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT
Base.convert(::Type{VkShaderStageFlagBits}, ::TessellationEvaluationStage) = VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT
Base.convert(::Type{VkShaderStageFlagBits}, ::GeometryStage) = VK_SHADER_STAGE_GEOMETRY_BIT
Base.convert(::Type{VkShaderStageFlagBits}, ::FragmentStage) = VK_SHADER_STAGE_FRAGMENT_BIT
Base.convert(::Type{UInt32}, x::ShaderStage) = UInt32(convert(VkShaderStageFlagBits, x))
