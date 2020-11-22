abstract type BlendingMode end

struct NoBlending <: BlendingMode end

Base.@kwdef struct AlphaBlending <: BlendingMode
    factor = 1
end

"""
Composition mode for the alpha channel.
Controls the order and fashion in which alpha layers are combined together.
"""
abstract type AlphaCompositing end

"""
Always set alpha to 1 for the top-most layer.
"""
struct AlphaOpaque <: AlphaCompositing end

"""
Always multiply the color by the alpha before compositing.
The color of a given layer is then dependent of the alpha value,
even if no additional layers are put on top of it.
"""
struct AlphaPreMultiplied <: AlphaCompositing end

"""
Standard alpha blending.
It can be interpreted as a linear RGB interpolation between layers,
with the foreground alpha as the weight.
"""
struct AlphaPostMultiplied <: AlphaCompositing end

"""
Inherit the compositing behavior from the surface.
"""
struct AlphaInherit <: AlphaCompositing end

Base.convert(::Type{CompositeAlphaFlagBitsKHR}, ::AlphaOpaque) = COMPOSITE_ALPHA_OPAQUE_BIT_KHR
Base.convert(::Type{CompositeAlphaFlagBitsKHR}, ::AlphaPreMultiplied) = COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR
Base.convert(::Type{CompositeAlphaFlagBitsKHR}, ::AlphaPostMultiplied) = COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR
Base.convert(::Type{CompositeAlphaFlagBitsKHR}, ::AlphaInherit) = COMPOSITE_ALPHA_INHERIT_BIT_KHR

PipelineColorBlendAttachmentState(::Type{NoBlending}; color_write_mask=|(COLOR_COMPONENT_R_BIT, COLOR_COMPONENT_G_BIT, COLOR_COMPONENT_B_BIT, COLOR_COMPONENT_A_BIT)) = PipelineColorBlendAttachmentState(false, BLEND_FACTOR_ONE, BLEND_FACTOR_ZERO, BLEND_OP_ADD, BLEND_FACTOR_ONE, BLEND_FACTOR_ZERO, BLEND_OP_ADD; color_write_mask)

PipelineColorBlendAttachmentState(::Type{AlphaBlending}; color_write_mask=|(COLOR_COMPONENT_R_BIT, COLOR_COMPONENT_G_BIT, COLOR_COMPONENT_B_BIT, COLOR_COMPONENT_A_BIT)) = PipelineColorBlendAttachmentState(true, BLEND_FACTOR_SRC_ALPHA, BLEND_FACTOR_ONE_MINUS_SRC_ALPHA, BLEND_OP_ADD, BLEND_FACTOR_SRC_ALPHA, BLEND_FACTOR_ONE_MINUS_SRC_ALPHA, BLEND_OP_ADD; color_write_mask)

PipelineColorBlendStateCreateInfo(attachments, rgba_blending_constants) = PipelineColorBlendStateCreateInfo(false, LOGIC_OP_COPY, attachments, rgba_blending_constants)
PipelineColorBlendStateCreateInfo(attachments, ::NoBlending) = PipelineColorBlendStateCreateInfo(attachments, (1, 1, 1, 1))
PipelineColorBlendStateCreateInfo(attachments, b::AlphaBlending) = PipelineColorBlendStateCreateInfo(attachments, (1, 1, 1, b.factor))
