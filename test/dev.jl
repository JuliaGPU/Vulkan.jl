using Vulkan
using VulkanCore.vk

v = Vulkan

print_ptr_equal(p1, p2) = println(p1 == p2 ? "\e[32;1;1mValid pointers ✅\e[m" : "\e[31;1;1mPointers are not equal ❌ \e[34;1;1m($p1 ≠ $p2)\e[m")

"Check that pointers have the same values between two instances of the same type"
function check_struct_ptr(s::T, original_struct::T) where {T}
    for (name, type) ∈ zip(fieldnames(T), fieldtypes(T))
        if type <: Ptr
            print_ptr_equal(getproperty(s, name), getproperty(original_struct, name))
        end
    end
end

function check_ptr(s::T, ptrs) where {T}
    for (name, type) ∈ zip(fieldnames(T), fieldtypes(T))
        if type <: Ptr && name ∉ [:pNext, :sType]
            ptr = popfirst!(ptrs)
            print_ptr_equal(getproperty(s, name), ptr)
        end
    end
end

function get_physical_device_properties(pdevices)
    pdps = v.PhysicalDeviceProperties[]
    for pdevice ∈ pdevices
        pdps_ref = Ref{VkPhysicalDeviceProperties}()
        v.get_physical_device_properties(pdevice.handle, pdps_ref)
        push!(pdps, pdps_ref[])
    end
    pdps
end

check_struct_ptr(s::Ptr{T}, original_struct::T) where {T} = check_struct_ptr(unsafe_pointer_load(s), original_struct)

globals = Dict()

preserve_var(x) = globals[x] = x
function clear_vars()
    for k ∈ keys(globals)
        delete!(globals, k)
    end
end

function test()
    app_info = v.ApplicationInfo(v"0", v"0", v"1.2.151", engine_name="CryEngine", application_name="JuliaGameEngine")
    layers = v.enumerate_instance_layer_properties()
    @info join(["Available layers:", string.(layers)...], "\n    ")
    
    ci = v.InstanceCreateInfo(["VK_LAYER_KHRONOS_validation"], [], application_info=app_info)
    instance = v.create_instance(ci)
    preserve_var(instance)
    pdevices = v.enumerate_physical_devices(instance)

    pdps = get_physical_device_properties(pdevices)
    @info join(["Available devices:", pdps...], "\n    ")
    @info "Vulkan application $(app_info.application_name) (engine: $(app_info.engine_name)) successfully created."
    
    dqci = v.DeviceQueueCreateInfo(1, [1.0])
    dci = v.DeviceCreateInfo([dqci], String[], String[]) 
    dev = v.create_device(dci, first(pdevices))
    preserve_var(dev)
    println(dev)
    display(v.enumerate_device_layer_properties(first(pdevices)))
    display(v.enumerate_device_extension_properties(first(pdevices), layer_name="VK_LAYER_KHRONOS_validation"))

    display(REFERENCE_DICT)
    clear_refs()
    clear_vars()
end

test();