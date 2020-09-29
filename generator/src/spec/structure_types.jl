function fetch_stypes(xroot)
    stype_vals = findall("//member[@values]", xroot)
    res = OrderedDict()
    for stype ∈ stype_vals 
        type = stype.parentnode["name"]
        stype_value = stype["values"]
        res[type] = stype_value
    end
    res
end

stypes = fetch_stypes(xroot)