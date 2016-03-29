# the c code is much easier to port if we can do setindex on Ref{CompositeType}

"""
Create defaults for most field types encountered with Vulkan.
The second argument is just for generating parent type dependant defaults.
"""
default{T<:Enum}(::Type{T}, struct) = typemin(T)

"""
Recursively constructs default for a composite type
"""
function default{T}(::Type{T}, struct)
    args = [default(fieldtype(T, i), struct) for i=1:nfields(T)]
    T(args...)
end
default{T<:Number}(::Type{T}, struct) = zero(T)
default{T<:Ptr}(::Type{T}, struct) = T(vk.api.VK_NULL_HANDLE)
default{N,T}(::Type{NTuple{N,T}}, struct) = ntuple(x->default(T, struct), N)


"""
Create the sType::VkStructureType default for composite types!
So for e.g. `T` = VkApplicationInfo
it will return VK_STRUCTURE_TYPE_APPLICATION_INFO::VkStructureType.
"""
@generated function default{T}(::Type{api.VkStructureType}, ::Type{T})
    tstring = string(T.name.name)[3:end]
    splitted = ASCIIString[]
    tmp = UInt8[]
    previous_char = first(tstring)
    for elem in tstring
        if isupper(elem) && islower(previous_char)
            !isempty(tmp) && push!(splitted, bytestring(tmp))
            tmp = UInt8[elem]
        else
            push!(tmp, elem)
        end
        previous_char = elem
    end
    !isempty(tmp) && push!(splitted, bytestring(tmp))
    #shift!(splitted) # remove Vk
    sType = symbol("VK_STRUCTURE_TYPE_"*join(map(uppercase, splitted), "_"))
    :(api.$sType)
end
# there are a few exceptions to the general naming scheme!
function default(::Type{api.VkStructureType}, ::Type{api.VkDebugReportCallbackCreateInfoEXT})
    api.VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
end



"""
Creates a type `T` from a keyword tuple referring to the fields.
Converts arrays and refs to pointers correctly and initialises missing keyword
arguments with 0/C_NULL. Just using the usual composite type constructor is a lot
faster, so this is only for convenience.
I tried to optimize this function a bit, but it mostly became ugly! Maybe I shouldn't
jump around as much in the memory.
Usage:
```Julia
create(Ref{VkFenceCreateInfo},(
    :field1, value1,
    :field2, value2
    ...
))
```
"""
function create{T}(::Type{T}, field_values::Tuple)
    create(Ref{T}, field_values)
end
function create{T}(::Type{Ref{T}}, field_values::Tuple)
    fieldcount = nfields(T)
    field_filled = Bool[false for i=1:fieldcount]
    ref_instance = Ref{T}()
    weakref = WeakRef(ref_instance)
    field_offsets = fieldoffsets(T)
    ref_ptr = Ptr{Int8}(Base.unsafe_convert(Ptr{T}, ref_instance))

    if !isempty(field_values)
        fnames = fieldnames(T)
        # find all the given fields and fill them into the fieldref
        length(field_values) % 2 != 0 && error("Fields must contain an even numer of symbol, value pairs. Got $field_values")
        @inbounds for k=1:2:length(field_values)
            name, value = field_values[k], field_values[k+1]
            found = false
            for i=1:fieldcount
                if !field_filled[i] && fnames[i] == name # this means if there are doubles, we choose the first..suboptimal?

                    FT = fieldtype(T, i)
                    try
                        unsafe_store!(Ptr{FT}(ref_ptr+field_offsets[i]), struct_convert(FT, value, weakref))
                        field_filled[i] = true
                        found = true
                    catch e
                        println(STDERR, "Error when writing $value to $name::$FT:")
                        rethrow(e)
                    end
                    break
                end
            end
            if !found
                if name in fnames
                    error("Field $name is given at least two times in: $field_values")
                else
                    error("$name is not a field of $T. Available fields: $fnames")
                end
            end
        end
    end
    # make sure everything is initialized
    @inbounds for i=1:fieldcount
        if !field_filled[i]
            FT = fieldtype(T, i)
            unsafe_store!(Ptr{FT}(ref_ptr+field_offsets[i]), default(FT, T))
        end
    end
    # finalize the reference to free all sup references
    finalizer(ref_instance, inst -> begin
        if haskey(REFERENCE_DICT, weakref)
            delete!(REFERENCE_DICT, weakref)
        end
        nothing
    end)
    ref_instance
end


function create{T}(::Type{Vector{T}}, field_value_list::Tuple...)
    isbits(T) || error("$T is not isbits, but needs to be!")
    fieldcount = nfields(T)
    field_filled_list = [Bool[false for i=1:fieldcount] for i=1:length(field_value_list)]
    ref_instance = Array(T, length(field_value_list))
    weakref = WeakRef(ref_instance)
    field_offsets = fieldoffsets(T)
    ref_ptr = Ptr{Int8}(pointer(ref_instance))
    fnames = fieldnames(T)
    for (field_values, field_filled) in zip(field_value_list, field_filled_list)
        if !isempty(field_values)
            # find all the given fields and fill them into the fieldref
            length(field_values) % 2 != 0 && error("Fields must contain an even numer of symbol, value pairs. Got $field_values")
            @inbounds for k=1:2:length(field_values)
                name, value = field_values[k], field_values[k+1]
                found = false
                for i=1:fieldcount
                    if !field_filled[i] && fnames[i] == name # this means if there are doubles, we choose the first..suboptimal?
                        FT = fieldtype(T, i)
                        unsafe_store!(Ptr{FT}(ref_ptr+field_offsets[i]), struct_convert(FT, value, weakref))
                        field_filled[i] = true
                        found = true
                        break
                    end
                end
                if !found
                    if name in fnames
                        error("Field $name is given at least two times in: $field_values")
                    else
                        error("$name is not a field of $T. Available fields: $fnames")
                    end
                end
            end
        end
        ref_ptr += sizeof(T)
    end
    ref_ptr = Ptr{Int8}(pointer(ref_instance))
    # make sure everything is initialized
    for field_filled in field_filled_list
        @inbounds for i=1:fieldcount
            if !field_filled[i]
                FT = fieldtype(T, i)
                unsafe_store!(Ptr{FT}(ref_ptr+field_offsets[i]), default(FT, T))
            end
        end
        ref_ptr += sizeof(T)
    end
    # finalize the reference to free all sup references
    finalizer(ref_instance, inst -> begin
        if haskey(REFERENCE_DICT, weakref)
            delete!(REFERENCE_DICT, weakref)
        end
        nothing
    end)
    ref_instance
end



"""
Can we get a pointer to `T` savely?
True = yes, false = no!
"""
is_referencable{T<:DenseArray}(x::T) = true
is_referencable{T}(x::T) = !isimmutable(T)

const REFERENCE_DICT = Dict{WeakRef, Vector}()

"""
preserves a ref as long as the parent is alive
"""
function preserve_ref(x, parent::WeakRef)
    refs = get!(REFERENCE_DICT, parent) do
        []
    end
    push!(refs, x)
    nothing
end


"""
Converts field valuues for the C structs.
It should handle pointers correctly and keeps the referenced object alive
as long as `parent` is alive.
"""
function struct_convert(t, value, parent)
	convert(t, value)
end
function struct_convert(t::Type{Ptr{Ptr{Cchar}}}, value::Vector{ASCIIString}, parent::WeakRef)
    preserve_ref(value, parent)
	ref = Ref{Ptr{Cchar}}(value)
    Base.unsafe_convert(t, ref)
end
function struct_convert(t::Type{Ptr{Cchar}}, value::AbstractString, parent::WeakRef)
    asciistr = ascii(value)
    preserve_ref(asciistr, parent)
    Base.unsafe_convert(Ptr{Cchar}, asciistr)
end
function struct_convert{T}(t::Type{Ptr{T}}, value::Union{Array, Ref}, parent::WeakRef)
    preserve_ref(value, parent)
	Base.unsafe_convert(t, value)
end



"""
Returns the index corresponding to a field name
"""
function fieldname2index{T}(::Type{T}, field::Symbol, names = fieldnames(T))
	for i=1:nfields(T)
		if names[i] == field
			return i
		end
	end
	error("field $field not found in $(T)!")
end

function fieldptr{T}(ref::Array{T}, array_index::Integer, field::Symbol)
	i = fieldname2index(T, field)
	fieldptr(ref, array_index, i)
end
function fieldptr{T}(ref::Array{T}, array_index::Integer, field::Integer)
	ptr = Ptr{Int8}(pointer(ref, array_index))
	offset = fieldoffsets(T)[field]
	ptr += offset
	FT = fieldtype(T, field)
	Ptr{FT}(ptr)
end

function fieldptr{T}(ref::Ref{T}, field::Symbol)
	i = fieldname2index(T, field)
	fieldptr(ref, i)
end
"""
this should be named unsafe?
"""
function fieldptr{T}(ref::Ref{T}, field::Integer)
	ptr = Ptr{Int8}(Base.unsafe_convert(Ptr{T}, ref))
	offset = fieldoffsets(T)[field]
	ptr += offset
	FT = fieldtype(T, field)
	Ptr{FT}(ptr)
end
"""
Slow and silly setindex for fields.
"""
function Base.setindex!{T, X}(ref::Ref{T}, value::X, field::Symbol)
	i = fieldname2index(T, field)
	ref[i] = value
end
function Base.setindex!{T, X}(ref::Ref{T}, value::X, field::Integer)
	ptr = fieldptr(ref, field)
	FT = eltype(ptr)
	unsafe_store!(ptr, struct_convert(FT, value, ref))
	value
end
"""
The same for arrays
"""
function Base.setindex!{T, X}(ref::Array{T}, value::X, array_index::Integer, field::Symbol)
	ptr = fieldptr(ref, array_index, field)
	unsafe_store!(ptr, struct_convert(eltype(ptr), value, ref))
	value
end


function memcpy(destination::Union{Ptr, Array}, source::Union{Ptr, Array}, to_copy::Int)
	ccall(:memcpy, Void, (Ptr{Void}, Ptr{Void}, Csize_t), destination, source, to_copy)
end
function memcpy(destination::Array, source::Array)
	memcpy(destination, source, min(sizeof(destination), sizeof(source)))
end
function memcpy(destination, source::Array)
	memcpy(destination, source, sizeof(source))
end

function unsafe_pointer{T}(ref::Ref{T}, ptr_type=T)
	Base.unsafe_convert(Ptr{ptr_type}, ref)
end
function memcpy(destination, source::Array)
	memcpy(destination, source, sizeof(source))
end
function memcpy{T}(destination, source::T)
    isimmutable(T) && error("Type is immutable, meaning it can't be referenced")
    ptr = pointer_from_objref(source)
	memcpy(destination, ptr, sizeof(T))
end
function memcpy{T}(destination, source::Ref{T})
    ptr = Base.unsafe_convert(Ptr{T}, source)
	memcpy(destination, ptr, sizeof(T))
end
"""
Checks the VkResult for errors
"""
function check(err::api.VkResult)
	if err != api.VK_SUCCESS
		error("Vulkan failed you. Why? $err")
	end
	err
end


print_type{T}(x::Ref{T}) = print_type(x[])
function print_type{T}(x::Array{T})
    println("[")
    for elem in x
        println("(")
        print_type(elem, "    ")
        println(")")
    end
    println("]")
end


function print_type{T}(x::T, offset = "")
    println(offset, T.name.name, ":")
    names =
    for name in fieldnames(T)
        println(offset, "   ", name, " ", x.(name))
    end
end
