struct APIDispatcher
    global_table::Dict{Symbol,Ptr{Cvoid}}
    instance_table::Dict{Symbol,Ptr{Cvoid}}
    device_tables::Dict{Device,Dict{Symbol,Ptr{Cvoid}}}
    lock::Threads.ReentrantLock
end

APIDispatcher() = APIDispatcher(Dict(), Dict(), Dict(), ReentrantLock())

table(disp::APIDispatcher, ::Nothing) = disp.global_table
table(disp::APIDispatcher, ::Instance) = disp.instance_table
table(disp::APIDispatcher, x) = table(disp, handle(x))

function table(disp::APIDispatcher, device::Device)
    get!(disp.device_tables, device, Dict())
end

table(disp::APIDispatcher, handle::Handle) = table(disp, handle)

function get_fptr(disp::APIDispatcher, handle, key::Symbol)::Ptr{Cvoid}
    val = get(table(disp, handle), key, nothing)
    if isnothing(val) # fetch function pointer
        add_fptr!(disp, handle, key)
    else 
        val
    end
end

function add_fptr!(disp::APIDispatcher, handle, key)
    fptr = if isnothing(handle)
        function_pointer(string(key))
    else
        function_pointer(handle, string(key))
    end
    if fptr == C_NULL
        error("Could not retrieve function pointer for '$key'. This can be caused by an extension not being enabled for a function that needs it; see the help with `?` or the documentation for more information.")
    end
    Base.@lock disp.lock table(disp, handle)[key] = fptr
    fptr
end
