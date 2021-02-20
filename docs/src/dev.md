# Developer Documentation

## Generating the wrapper

A large portion of this package relies on static code generation. To re-generate the main wrapper (`generated/vulkan_wrapper.jl`), execute `generator/scripts/generate_wrapper.jl` in the `generator` environment:

```
julia --color=yes --project=generator -e 'using Pkg; Pkg.instantiate(); include("generator/scripts/generate_wrapper.jl")'
```

Note that the `generator` module contains tests, which should be run first to ensure the correctness of the wrapping process.
