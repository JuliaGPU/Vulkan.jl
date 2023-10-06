const STATE_FILE = joinpath(pkgdir(@__MODULE__), "State.toml")

function generate_state(api::VulkanAPI = api)
  state = Dict{Symbol,Any}(
    :version => string(api.version),
    :functions => Dict(func.name => Dict(param.name => Dict(:exposed_as_parameter => is_optional(param)) for param in func) for func in api.functions),
    :structs => Dict(strct.name => Dict(member.name => Dict(:exposed_as_parameter => is_optional(member)) for member in strct) for strct in api.structs),
  )
end

merge_innermost!(current::Dict, prev::Dict) = mergewith!(merge_innermost!, current, prev)
merge_innermost!(current, prev) = prev

function generate_state(prev_state::Dict, api::VulkanAPI = api)
  state = generate_state(api)
  mergewith!(merge_innermost!, state, prev_state)
  for category in (:functions, :structs)
    for name in keys(prev_state[category])
      if haskey(api.aliases.dict, name)
        # A symbol present in the state is now an alias (and was not before).
        # In this case, don't keep the alias in the state, and transfer original parameters
        # to the new symbol which replaces the original one.
        symbol = follow_alias(name, api.aliases)
        delete!(state[category], name)
        state[category][symbol] = prev_state[category][name]
      end
    end
  end
  state[:version] = string(api.version)
  state
end

function write_state(state::Dict, file::AbstractString = STATE_FILE)
  open(file, "w+") do io
    TOML.print(io, state, sorted = true)
  end
  @__MODULE__().state[] = read_state()
end

keys_to_symbol(d::Dict{String}) = Dict(Symbol(k) => keys_to_symbol(v) for (k, v) in d)
keys_to_symbol(x) = x

read_state(file::AbstractString = STATE_FILE) = keys_to_symbol(TOML.parsefile(file))
