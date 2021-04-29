function retrieve_length(spec)
    chain = length_chain(spec, spec.len)
    @match length(chain) begin
        1 => vk_call(first(chain))
        GuardBy(>(1)) =>
            chain_getproperty(:($(wrap_identifier(first(chain))).vks), getproperty.(chain[2:end], :name))
    end
end

chain_getproperty(ex, props) = foldl((x, y) -> :($x.$y), props; init = ex)

function initialize_ptr(param::SpecFuncParam, count_ptr::SpecFuncParam)
    @assert is_data(param) && is_size(count_ptr)
    :($(param.name) = Libc.malloc($(count_ptr.name)[]))
end

function initialize_ptr(param::SpecFuncParam)
    rhs = @match param begin
        GuardBy(is_arr) => :(Vector{$(ptr_type(param.type))}(undef, $(retrieve_length(param))))
        _ => @match param.type begin
            :(Ptr{Cvoid}) => :(Ref{Ptr{Cvoid}}())
            _ => :(Ref{$(ptr_type(param.type))}())
        end
    end
    :($(param.name) = $rhs)
end

function initialize_array(param::SpecFuncParam, count_ptr::SpecFuncParam)
    :($(param.name) = Vector{$(ptr_type(param.type))}(undef, $(count_ptr.name)[]))
end
