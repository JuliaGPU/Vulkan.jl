"""
Exception type indicating that an API function
returned a non-success code.
"""
struct VulkanError <: Exception
    msg::AbstractString
    return_code
end

Base.showerror(io::IO, e::VulkanError) = print(io, e.return_code, ": ", e.msg)

"""
    @check vkCreateInstance(args...)

If the expression does not return `VK_SUCCESS`, raise a [`VulkanError`](@ref) holding the return code.

Requires the `ERROR_CHECKING` preference enabled. Otherwise, it only returns the expression.
"""
macro check(expr)
    @static if ERROR_CHECKING
        quote
            local msg = string("failed to execute ", $(string(expr)))
            @check $(esc(expr)) msg
        end
    else
        esc(expr)
    end
end

macro check(expr, msg)
    quote
        return_code = $(esc(expr))
        if Int(return_code) ≠ 0
            return VulkanError($msg, return_code)
        end
        return_code
    end
end
