mutable struct InstanceSetup <: Setup
    handle::Instance
    debug_messenger
    function InstanceSetup(instance::Instance; debug_messenger = nothing)
        instance_setup = new(instance, debug_messenger)
        finalizer(instance_setup) do x
            finalize.(getproperty.(x, (:debug_messenger, :handle)))
        end
    end
end
