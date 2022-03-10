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
