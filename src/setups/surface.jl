mutable struct SurfaceSetup <: Setup
    handle::SurfaceKHR
    window
    function SurfaceSetup(handle; window = nothing)
        ss = new(handle, window)
        finalizer(ss) do x
            finalize(x.handle)
        end
    end
end
