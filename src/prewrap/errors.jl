"""
Exception type indicating that an API function
returned a non-success code.
"""
struct VulkanError <: Exception
    msg::AbstractString
    code
end

Base.showerror(io::IO, e::VulkanError) = print(io, e.code, ": ", e.msg)

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
        code = $(esc(expr))
        if Int(code) ≠ 0
            return VulkanError($msg, code)
        end
        code
    end
end
