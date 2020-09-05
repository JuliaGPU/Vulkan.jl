mycont = WeakKeyDict()

struct WrappingStruct
    wrapped_value
end

alive_var = 0

function create_pointer(a)
    ref = Ref(a)
    b = a isa String ? pointer(a) : unsafe_pointer(ref)
    preserve(ref, alive_var, container=mycont)
    WrappingStruct(b)
end

function deref_pointer(w, original_copy)
    val = w.wrapped_value
    a = typeof(original_copy) <: AbstractArray ? unsafe_pointer_load(val, length(original_copy)) : unsafe_pointer_load(val)
    @assert a == original_copy "$original_copy => $a"
    true
end

function test_pointer(a)
    original_copy = deepcopy(a)
    ptr = create_pointer(a)
    deref_pointer(ptr, original_copy)
end

@test test_pointer([10.0])
@test test_pointer(10.0)
@test test_pointer("ho ho")