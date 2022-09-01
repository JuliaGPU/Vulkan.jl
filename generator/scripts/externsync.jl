using Pkg
Pkg.activate(dirname(@__DIR__))
include("../src/spec/VulkanSpec.jl")

using .VulkanSpec

# List all function parameters which require external synchronization.
for f in spec_funcs
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
