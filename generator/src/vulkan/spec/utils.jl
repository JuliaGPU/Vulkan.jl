function member_attr(node::EzXML.Node, attr)
    attr == "name" && haskey(node, "alias") && return node["name"] # special handling for aliases
    val = findfirst(".//$attr", node)
    isnothing(val) && error("Attribute $attr not found in node\n$node")
    val.content
end

function resolve_aliases!(collection::Dict, nodes)
    for node ∈ nodes
        if haskey(node, "alias")
            collection[node["name"]] = collection[node["alias"]]
        end
    end
end

function extract_type(param; include_pointer=true)
    type = split(replace(param.content, "const " => ""))[1]
    type_nostar = translate_c_type(Symbol(rstrip(type, ['*', ' '])))
    endswith(type, "*") && include_pointer ? :(Ptr{$type_nostar}) : type_nostar
end

extract_identifier(param) = Symbol(findfirst("./name", param).content)
getattr(node::EzXML.Node, attr; default = nothing, symbol=true) = haskey(node, attr) ? (symbol ? Symbol(node[attr]) : node[attr]) : default

function parent_name(node::EzXML.Node)
    parel = node.parentelement
    parel.name == "command" ? command_name(parel) : parel.name == "type" && parel["category"] ∈ ["struct", "union"] ? struct_name(parel) : error("Unknown parent element:\n    $parel")
end

function command_name(node::EzXML.Node)
    isnothing(findfirst("proto", node)) && return command_name(node.parentelement)
    Symbol(findfirst("proto/name", node).content)
end

function struct_name(node::EzXML.Node)
    (!haskey(node, "category") || node["category"] ∉ ["struct", "union"]) && return Symbol(struct_name(node.parentelement))
    Symbol(node["name"])
end

is_constant(node::EzXML.Node) = any(split(node.content) .== "const")

name(node::EzXML.Node) = Symbol(findfirst("./name", node).content)

"""
Semantically translate C types to their Julia counterpart.
Note that since it is a semantic translation, translated types
do not necessarily have the same layout, e.g. VkBool32 => Bool (8 bits).
"""
function translate_c_type(base_type::Symbol)
    @match base_type begin
        x::Symbol && if occursin("uint", string(x)) end => Symbol(replace(string(x), "uint" => "UInt"))
        x::Symbol && if occursin("int", string(x)) end => Symbol(replace(string(x), "int" => "Int"))
        :float => :Float32
        :double => :Float64
        :void => :Cvoid
        :VkBool32 => :Bool
        :char => :Char
        :size_t => :UInt
        x::Symbol => x
    end
end
