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

function extract_type(param)
    type_str = split(replace(param.content, r"(?:const|typedef) " => ""))[1]
    base_type = Symbol(rstrip(type_str, ['*', ' ']))
    type = endswith(type_str, "**") ? :(Ptr{Ptr{$base_type}}) : endswith(type_str, "*") ? :(Ptr{$base_type}) : base_type
    translated_type = translate_c_type(type)
    enum_param = findfirst("./enum", param)
    if !isnothing(enum_param)
        :(NTuple{$(Meta.parse(enum_param.content)), $translated_type})
    else
        translated_type
    end
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
function translate_c_type(ctype)
    @match ctype begin
        :int => :Int
        x::Symbol && if startswith(string(x), "uint") && endswith(string(x), "_t") end => Symbol(replace(string(x)[1:end-2], "uint" => "UInt"))
        x::Symbol && if startswith(string(x), "int") && endswith(string(x), "_t") end => Symbol(replace(string(x)[1:end-2], "int" => "Int"))
        if is_ptr(ctype) end => @match ptr_type(ctype) begin
            :char => :Cstring
            x => :(Ptr{$(translate_c_type(x))})
        end
        :float => :Float32
        :double => :Float64
        :void => :Cvoid
        :size_t => :UInt
        :char => :UInt8
        x => x
    end
end
