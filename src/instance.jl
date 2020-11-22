function_pointer(instance::Instance, name) = vkGetInstanceProcAddr(instance, name)

include("instance/validation.jl")
