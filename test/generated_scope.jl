# Every type the generated wrapper NAMES has to be reachable from `Vulkan`.
#
# The wrapper converts each struct member to its raw type at the construction
# site, so it names that type. `Vulkan` sees what `using .vk` brought in, and
# `LibVulkan` exports by PREFIX -- its export loop takes every name starting with
# `VK_`, `Vk`, `vk`, `StdVideo` or `STD_VIDEO` and nothing else. A name outside
# that set, and outside Base, must be written `vk.X` or it is an `UndefVarError`
# raised when that constructor runs, not when the package precompiles. It then
# hides until someone builds that one struct.
#
# Two have already been caught this way: `PFN_vkDebugUtilsMessengerCallbackEXT`
# and, on macOS only, the Metal object types behind `VK_EXT_metal_objects`.
#
# ALL FOUR platform files, not just this machine's. The macOS one was reachable
# from no CI runner and no developer machine here, and an earlier version of this
# test checked only the host and therefore said nothing about it.
#
# Parsed rather than grepped, so `convert(T::Type{X}, x)` method definitions and
# the commas inside `NTuple{2, UInt32}` cannot be mistaken for call arguments.
@testset "Generated wrapper names resolve" begin
    prefixes = ("VK_", "Vk", "vk", "StdVideo", "STD_VIDEO")
    vulkan_own = Set(names(Vulkan; all = true))

    # `convert(T, value)` as a CALL; a definition has a signature, not two args.
    function converted_types(ex)
        out = Set{Any}()
        walk(x) = nothing
        function walk(e::Expr)
            if e.head === :call && length(e.args) == 3 && e.args[1] === :convert &&
               !(e.args[2] isa Expr && e.args[2].head === :(::))
                push!(out, e.args[2])
            end
            foreach(walk, e.args)
        end
        walk(ex)
        out
    end

    # A qualified `vk.X` is reachable whatever the prefix, which is the point of
    # writing it that way; only the module name has to resolve.
    function free_symbols(x, out = Set{Symbol}())
        x isa Symbol && (push!(out, x); return out)
        x isa Expr || return out
        x.head === :. && (free_symbols(x.args[1], out); return out)
        foreach(a -> free_symbols(a, out), x.args)
        out
    end

    # What a file defines itself: the `_X`/`X` wrapper structs and functions.
    function defined_here(ex)
        s = Set{Symbol}()
        add(x::Symbol) = push!(s, x)
        add(x) = nothing
        head(x) = x isa Expr ? head(x.args[1]) : x
        function top(e)
            e isa Expr || return
            if e.head === :struct
                d = e.args[2]
                add(head(d isa Expr && d.head === :<: ? d.args[1] : d))
            elseif e.head === :const && e.args[1] isa Expr && e.args[1].head === :(=)
                add(head(e.args[1].args[1]))
            elseif e.head === :function || (e.head === :(=) && e.args[1] isa Expr && e.args[1].head === :call)
                add(head(e.args[1]))
            elseif e.head in (:macrocall, :block, :toplevel)
                foreach(top, e.args)
            end
        end
        top(ex)
        s
    end

    for platform in ("linux", "macos", "bsd", "windows")
        path = joinpath(pkgdir(Vulkan), "generated", "$platform.jl")
        ex = Meta.parseall(read(path, String); filename = path)
        own = defined_here(ex)
        types = converted_types(ex)
        @test !isempty(types)
        unreachable = sort!(collect(Set(s for t in types for s in free_symbols(t)
                                        if !(s in vulkan_own) && !(s in own) &&
                                           !isdefined(Base, s) && !isdefined(Core, s) &&
                                           !any(p -> startswith(String(s), p), prefixes))))
        @test (platform, unreachable) == (platform, Symbol[])
    end
end
