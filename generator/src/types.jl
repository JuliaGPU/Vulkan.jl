const ExprLike = Union{Symbol, Expr}
const Optional{T} = Union{Nothing, T}

is_ptr_to_ptr(ex) = !isnothing(ptrtype(ptrtype(ex)))
is_ptr(ex) = !isnothing(ptr_type(ex))

ptr_type(ex) = @when :(Ptr{$T}) = ex T
ntuple_type(ex) = @when :(NTuple{$N, $T}) = ex T

is_ntuple(ex) = !isnothing(ntuple_type(ex))

vulkan_type(name) = @switch string(name, "__")[1:2] begin
    @case "vk"; :function
    @case "Vk"; :struct
    @case "VK"; :const
    @case _; nothing
end

is_vulkan_type(name) = !isnothing(vulkan_type(name))

inner_type(ex) = @when :($T{$(args...)}) = ex collect(args)

function innermost_type(ex::Expr)
    if is_ntuple(ex)
        innermost_type(ntuple_type(ex))
    else
        t = inner_type(ex)
        if length(t) > 1
            error("Expected 1 inner type for $ex, found $(length(t)) ($t)")
        else
            innermost_type(first(t))
        end
    end
end

innermost_type(sym::Symbol) = sym
