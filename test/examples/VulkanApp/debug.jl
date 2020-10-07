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

check_struct_ptr(s::Ptr{T}, original_struct::T) where {T} = check_struct_ptr(unsafe_pointer_load(s), original_struct)

function future_cfunc(x)
    # print_fields(x)
    @info "=== Application Info"
    app_info = unsafe_load(x.pApplicationInfo)
    println(app_info)
    println(unsafe_string(app_info.pEngineName))
    println(unsafe_string(app_info.pApplicationName))
    println(app_info.sType)
    println(app_info.pNext)
    println(from_vk(VersionNumber, app_info.apiVersion))
    println(from_vk(VersionNumber, app_info.applicationVersion))
    println(from_vk(VersionNumber, app_info.engineVersion))
    @info "=== Instance"
    
    println(x)
    println(x.sType)
    println(x.pNext)
    println(x.flags)
    println(unsafe_string.(unsafe_pointer_load(x.ppEnabledLayerNames, x.enabledLayerCount)))
    println(unsafe_string.(unsafe_pointer_load(x.ppEnabledExtensionNames, x.enabledExtensionCount)))
    println(x.enabledLayerCount)
    println(x.enabledExtensionCount)
    0
end

cfunc = @cfunction(future_cfunc, Int, (VkInstanceCreateInfo,))

# print_fields(x::VulkanStruct) = (print_fields(x.vks); hasproperty(x, :bag) ? print_fields(x.bag) : nothing)
# function print_fields(x::T) where {T}
#     for (name, type) ∈ zip(fieldnames(T), fieldtypes(T))
#         val = getproperty(x, name)
#         if type <: Ptr && type ≠ Ptr{Nothing}
#             val_deref = unsafe_pointer_load(val)
#             print_fields(val_deref)
#         else
#             println(val)
#         end
#     end
# end