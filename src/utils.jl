"""
Chain all arguments together in a `next` chain. to form a new structure `next` chain.

If `nexts` is empty, `C_NULL` is returned.
"""
function chain(nexts::HighLevelStruct...)
    isempty(nexts) && return C_NULL
    foldr((a, b) -> (@set a.next = b), nexts)
end

"""
Break a `next` chain into its constituents, with all `next` members set to `C_NULL`.
"""
function unchain(x::HighLevelStruct)
    unchained = Any[@set x.next = C_NULL]
    (; next) = x
    while next ≠ C_NULL
        push!(unchained, @set next.next = C_NULL)
        (; next) = next
    end
    unchained
end

"""
    format_type(Vk.FORMAT_R16G16B16A16_SFLOAT) # RGBA{Float16} from ColorTypes.jl

Retrieve a canonical (color) type associated with a Vulkan image format.

Currently requires ColorTypes.jl to be installed as an extension in order to have meaningful methods.
"""
function format_type end

@inline format_type(x) = format_type(Val(x))
format_type(::Val{x}) where {x} = error("No type is known which corresponds to format $x")
