function retrieve_length(spec)
    chain = length_chain(spec.parent, spec.len, api.structs)
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

# VulkanSpec maps C int to Int; output storage must use Cint.
layout_type(T) = T === :Int ? :Cint : T

function initialize_ptr(param::SpecFuncParam)
    rhs = @match param begin
        GuardBy(is_arr) => :(Vector{$(layout_type(ptr_type(param.type)))}(undef, $(retrieve_length(param))))
        _ => @match param.type begin
            :(Ptr{Cvoid}) => :(Ref{Ptr{Cvoid}}())
            _ => begin
                T = layout_type(ptr_type(param.type))
                # An output structure's sType/pNext are still inputs to Vulkan.
                # Initialize singular outputs just as initialize_array does.
                haskey(api.structure_types, T) ? :(Ref(initialize_core($T, []))) : :(Ref{$T}())
            end
        end
    end
    :($(param.name) = $rhs)
end

function initialize_array(param::SpecFuncParam, count_ptr::SpecFuncParam)
    T = ptr_type(param.type)
    # Output headers are inputs to the driver and must be initialized.
    rhs = if haskey(api.structure_types, T)
        :(fill(initialize_core($T, []), $(count_ptr.name)[]))
    else
        :(Vector{$T}(undef, $(count_ptr.name)[]))
    end
    :($(param.name) = $rhs)
end
