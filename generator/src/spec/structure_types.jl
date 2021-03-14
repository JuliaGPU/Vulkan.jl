function fetch_structure_types(xroot)
    stype_vals = findall("//member[@values]", xroot)
    res = Dict()
    for stype ∈ stype_vals
        type = stype.parentnode["name"]
        stype_value = stype["values"]
        res[Symbol(type)] = Symbol(stype_value)
    end
    res
end

const structure_types = fetch_structure_types(xroot)
