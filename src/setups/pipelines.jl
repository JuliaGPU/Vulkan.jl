mutable struct PipelineSetup <: Setup
    handle
    shader_modules
    layout
    cache
    stages
    function PipelineSetup(shader_modules, stages; layout = C_NULL, cache = C_NULL)
        ps = new(C_NULL, shader_modules, layout, cache, stages)
        finalizer(ps) do x
            finalize.(x.shader_modules)
            finalize.(getproperty.(x, (:handle, :layout, :cache)))
        end
    end
end

function GraphicsPipelineCreateInfo(ps::PipelineSetup, render_pass, viewport_state)
    s = ps.stages
    @unpack vertex_input_state, input_assembly_state, color_blend_state, multisample_state, dynamic_state = s
    GraphicsPipelineCreateInfo(s.shaders, s.rasterization, ps.layout, render_pass, 0, 0; vertex_input_state, input_assembly_state, color_blend_state, viewport_state, multisample_state, dynamic_state)
end

create_pipeline!(ps::PipelineSetup, device, render_pass, viewport_state) = setproperty!(ps, :handle, first(Pipeline(device, [GraphicsPipelineCreateInfo(ps, render_pass, viewport_state)])))
create_pipelines!(device, render_pass, viewport_state, pss::PipelineSetup...) = setproperty!.(pss, :handle, Pipeline(GraphicsPipelineCreateInfo.(pss, render_pass, viewport_state)))
