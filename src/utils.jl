"""
Query a function pointer for an API function.

One of `get_instance_proc_addr` or `get_device_proc_addr` will be used depending on the argument types.
"""
function function_pointer end

function_pointer(name::AbstractString) = get_instance_proc_addr(name)
function_pointer(instance::Instance, name::AbstractString) = get_instance_proc_addr(name; instance)
function_pointer(device::Device, name::AbstractString) = get_device_proc_addr(device, name)
function_pointer(x, name::AbstractString) = function_pointer(handle(x), name)

"""
Chain all arguments together in a `next` chain. to form a new structure `next` chain.

If `nexts` is empty, `C_NULL` is returned.
"""
function chain(nexts::HighLevelStruct...)
    isempty(nexts) && return C_NULL
    foldr((a, b) -> (@set a.next = b), nexts)
end

"""
Break a `next` chain into its constituents, with all `next` members set to `C_NULL`.
"""
function unchain(x::HighLevelStruct)
    unchained = Any[@set x.next = C_NULL]
    (; next) = x
    while next ≠ C_NULL
        push!(unchained, @set next.next = C_NULL)
        (; next) = next
    end
    unchained
end
