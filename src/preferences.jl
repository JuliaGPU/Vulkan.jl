@static if VERSION < v"1.6.0-DEV"
    macro load_preference(name, default)
        esc(default)
    end
else
    using Preferences: @load_preference
end

macro pref_log_destruction(expr)
    if @load_preference("LOG_DESTRUCTION", "false") == "true"
        quote
            @ccall jl_safe_printf($(esc(:("Destroying $handle\n")))::Cstring)::Cvoid
            $(esc(expr))
        end
    else
        esc(expr)
    end
end
