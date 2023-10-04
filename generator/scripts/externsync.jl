using Pkg
Pkg.activate(dirname(@__DIR__))

# List all function parameters which require external synchronization.
for f in api.functions
  if any(f.params.is_externsync)
    print("Function: ")
    printstyled(f.name, '\n'; color = :cyan)
    for p in f.params
      if p.is_externsync
        display(p)
      end
    end
    println()
  end
end
