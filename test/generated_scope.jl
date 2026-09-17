# Every type named in the generated wrapper has to resolve inside `Vulkan`.
#
# The wrapper converts each struct member to its raw type at the construction
# site, which means it NAMES that type -- and a name that is not in scope here is
# an `UndefVarError` raised at call time, not at precompilation, so it hides
# until someone constructs that particular struct. That is how
# `convert(PFN_vkDebugUtilsMessengerCallbackEXT, ...)` shipped: the nine
# `PFN_*` typedefs are VulkanCore names this module never imports.
#
# Parsed rather than grepped, so `convert(T::Type{X}, x)` method definitions and
# the commas inside `NTuple{2, UInt32}` cannot be mistaken for call arguments.
@testset "Generated wrapper names resolve" begin
    generated = joinpath(pkgdir(Vulkan), "generated", Sys.iswindows() ? "windows.jl" :
                                                      Sys.isapple()   ? "macos.jl"   :
                                                      Sys.isbsd()     ? "bsd.jl"     : "linux.jl")
    converted = Set{Any}()
    walk(x) = nothing
    function walk(ex::Expr)
        # `convert(T, value)` as a CALL; a definition has a signature, not two args.
        if ex.head === :call && length(ex.args) == 3 && ex.args[1] === :convert &&
           !(ex.args[2] isa Expr && ex.args[2].head === :(::))
            push!(converted, ex.args[2])
        end
        foreach(walk, ex.args)
    end
    walk(Meta.parseall(read(generated, String); filename = generated))

    @test !isempty(converted)
    unresolvable = filter(collect(converted)) do T
        try
            Core.eval(Vulkan, T)
            false
        catch
            true
        end
    end
    @test unresolvable == []
end
