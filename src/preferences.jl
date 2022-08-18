@static if VERSION < v"1.6.0-DEV"
    macro load_preference(name, default)
        esc(default)
    end
else
    using Preferences: Preferences, @load_preference
    set_preferences!(args...; kwargs...) = Preferences.set_preferences!(@__MODULE__, args...; kwargs...)
end

macro pref_log_destruction(handle, ex)
    if @load_preference("LOG_DESTRUCTION", "false") == "true"
        ex = quote
            premsg = string("Finalizing ", $(esc(handle)))
            @ccall jl_safe_printf(premsg::Cstring)::Cvoid
            was_destroyed = $(esc(ex))
            msg =
                was_destroyed ? ":\e[32m destroyed\e[m\n" :
                ":\e[33m nothing to do\e[m\n"
            @ccall jl_safe_printf(msg::Cstring)::Cvoid
        end
    end
    ex
end

macro pref_log_refcount(ex)
    if @load_preference("LOG_REFCOUNT", "false") == "true"
        ex = quote
            val = Int(handle.refcount.value)
            @ccall jl_safe_printf("Refcount: $handle: $val "::Cstring)::Cvoid
            $ex
            val_after = Int(handle.refcount.value)
            if val_after < val
                @ccall jl_safe_printf("\e[31m↓\e[m"::Cstring)::Cvoid
            else
                @ccall jl_safe_printf("\e[32m↑\e[m"::Cstring)::Cvoid
            end
            @ccall jl_safe_printf(" $val_after\n"::Cstring)::Cvoid
        end
    end
    esc(ex)
end
