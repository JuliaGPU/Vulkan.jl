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
"""
macro check(expr)
    quote
        local msg = string("failed to execute ", $(string(expr)))
        @check $(esc(expr)) msg
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
