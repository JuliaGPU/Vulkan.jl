macro sym_str(def)
    esc(:(Symbol($(Meta.parse("\"$(escape_string(def))\"")))))
end

join_args(args) = join(args, ", ")
splitargs(args) = filter(!isempty, strip.(split(args, ",")))
subindex(arr::AbstractArray, indices) = [arr[i] for i ∈ indices]

function splitjoin(str, removed_parts; delim=" ")
    split_str = split(str, delim)
    kept_parts = filter(x -> x ∉ removed_parts, 1:length(split_str))
    join(subindex(split_str, kept_parts), delim)
end

splitstrip(str; delim=" ", stripped_chars=[' ']) = strip.(split(str, delim), Ref(stripped_chars))

macro return_value_if_key_exists(collection, type)
    :($(esc(type)) ∈ keys($(esc(collection))) && return $(esc(collection))[$(esc(type))])
end

"""
Automatically create the pass! argument as an anonymous function from the corresponding pass! method with the other struct fields as kwargs.
"""
macro preprocess_pass(expr)
    # s_name = hasfield(expr.args[2]) 
    s_name = expr.args[2] isa Symbol ? expr.args[2] : first(expr.args[2].args)
    expr_nfields = length(expr.args[3].args)
    fields = getindex.(Ref(expr.args[3].args), 2:2:expr_nfields)
    (isempty(fields) || last(fields) ≠ :pass!) && error("The last field of the struct must be a pass! field")
    nopass_args = filter(x -> x ≠ :pass!, fields)
    quote
        struct $(esc(expr.args[2]))
            $(esc.(fields)...)
            $(esc(s_name))($(esc.(nopass_args)...)) = new($(esc.(nopass_args)...), preprocess_pass($(esc(s_name)); Core.NamedTuple{$(Tuple(nopass_args))}(Tuple([$(esc.(nopass_args)...)]))...))
        end
    end
end

reverse_dict(d::T) where {T <: AbstractDict} = T(v => k for (k, v) ∈ d)