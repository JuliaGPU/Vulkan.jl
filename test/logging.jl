ENV["JULIA_DEBUG"] = Main

global_logger(TerminalLogger())

const log_term = Terminals.TTYTerminal("", stdin, stdout, stderr)

# Taken from essenciary (Genie.jl)
function replprint(output::String, terminal;
    newline::Int=0, clearline::Int=1, color::Symbol=:white, bold::Bool=false, sleep_time::Float64=0.,
    prefix::String="", prefix_color::Symbol=:green, prefix_bold::Bool=true)
    if clearline > 0
        for i in 1:(clearline + 1)
            REPL.Terminals.clear_line(terminal)
        end
    end

    isempty(prefix) || printstyled(prefix, color=prefix_color, bold=prefix_bold)
    printstyled(output, color=color, bold=bold)

    [println() for _ ∈ 1:newline]

    sleep_time ≠ 0 && sleep(sleep_time)
    nothing
end

function load(; context::Union{Module,Nothing} = nothing) :: Nothing
    t = Terminals.TTYTerminal("", stdin, stdout, stderr)
  
    replprint("initializers", t, clearline = 0, prefix = "Loading ")
    load_initializers(context = context)
  
    replprint("helpers", t, prefix = "Loading ")
    load_helpers()
  
    replprint("lib", t, prefix = "Loading ")
    load_libs()
  
    replprint("resources", t, prefix = "Loading ")
    load_resources()
  
    replprint("plugins", t, prefix = "Loading ")
    load_plugins(context = context)
  
    replprint("routes", t, prefix = "Loading ")
    load_routes_definitions(context = context)
  
    replprint("Ready! ", t, clearline = 2, color = :green, bold = :true)
    println()
end