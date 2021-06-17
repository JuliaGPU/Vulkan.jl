"""
Exception type indicating that an API function
returned a non-success code.
"""
struct VulkanError <: Exception
    msg::String
    code
end

Base.showerror(io::IO, e::VulkanError) = print(io, e.code, ": ", e.msg)

"""
    @check vkCreateInstance(args...)

Assign the expression to a variable named `_return_code`. Then, if the value is not a success code, return a [`VulkanError`](@ref) holding the return code.

"""
macro check(expr)
    msg = string("failed to execute ", expr)
    esc(:(@check $expr $msg))
end

macro check(expr, msg)
    esc(quote
        _return_code = $expr
        if Int32(_return_code) < 0
            return VulkanError($msg, _return_code)
        end
        _return_code
    end)
end

"""
Evaluate the given expression, and reexecute it while the local variable `_return_code` equals to `VK_INCOMPLETE`.
"""
macro repeat_while_incomplete(expr)
    esc(quote
        $expr
        while _return_code == VK_INCOMPLETE
            $expr
        end
    end)
end
