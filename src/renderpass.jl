struct Target{T} end

abstract type RenderPassType end

struct RenderPassPresent{T} <: RenderPassType
    target::T
end

function target! end
