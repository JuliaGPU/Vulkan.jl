abstract type ShaderStage end

Base.broadcastable(x::ShaderStage) = Ref(x)

struct VertexStage <: ShaderStage end
struct TessellationControlStage <: ShaderStage end
struct TessellationEvaluationStage <: ShaderStage end
struct GeometryStage <: ShaderStage end
struct FragmentStage <: ShaderStage end
