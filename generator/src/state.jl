const STATE_FILE = joinpath(pkgdir(@__MODULE__), "State.toml")

function generate_state()
  state = Dict{Symbol,Any}(
    :version => string(api.version),
    :functions => Dict(func.name => Dict(param.name => Dict(:exposed_as_parameter => is_optional(param)) for param in func) for func in api.functions),
    :structs => Dict(strct.name => Dict(member.name => Dict(:exposed_as_parameter => is_optional(member)) for member in strct) for strct in api.structs),
  )
end

function generate_state(prev_state::Dict)
  state = generate_state()
  merge!(state, prev_state)
  state[:version] = string(api.version)
  state
end

function write_state(state::Dict, file::AbstractString = STATE_FILE)
  open(file, "w+") do io
    TOML.print(io, state)
  end
end

keys_to_symbol(d::Dict{String}) = Dict(Symbol(k) => keys_to_symbol(v) for (k, v) in d)
keys_to_symbol(x) = x

read_state(file::AbstractString = STATE_FILE) = keys_to_symbol(TOML.parsefile(file))
