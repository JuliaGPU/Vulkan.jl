function member_attr(node::Node, attr)
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

function nested_ntuple(base_type, lengths)
    make_tuple = (x, y) -> :(NTuple{$x,$y})
    foldr(make_tuple, lengths; init = base_type)
end

function extract_type(param)
    base_type = Symbol(findfirst("./type", param).content)

    star_count = count("*", param.content)
    type = star_count == 0 ? base_type : reduce((x, _) -> :(Ptr{$x}), 1:star_count; init = base_type)
    translated_type = translate_c_type(type)
    enum_param = findfirst("./enum", param)
    node_after_name = findfirst("./name", param).nextnode
    bracket_matches = isnothing(node_after_name) ? nothing : collect(eachmatch(r"\[(\d+)\]", node_after_name.content))
    if !isnothing(enum_param) || !isnothing(bracket_matches)
        if !isnothing(enum_param)
            nested_ntuple(translated_type, [Symbol(enum_param.content)])
        elseif !isnothing(bracket_matches)
            nested_ntuple(translated_type, parse.(Int, first.(getproperty.(bracket_matches, :captures))))
        end
    else
        translated_type
    end
end

function extract_identifier(param)
    id = Symbol(findfirst("./name", param).content)
    # Avoid aliasing with Julia built-in identifiers.
    @match id begin
        :module => :_module
        :function => :_function
        _ => id
    end
end
getattr(node::Node, attr; default = nothing, symbol = true) =
    haskey(node, attr) ? (symbol ? Symbol(node[attr]) : node[attr]) : default

function parent_name(node::Node)
    parel = node.parentelement
    parel.name == "command" ? command_name(parel) :
    parel.name == "type" && parel["category"] ∈ ["struct", "union"] ? struct_name(parel) :
    error("Unknown parent element:\n    $parel")
end

function command_name(node::Node)
    isnothing(findfirst("proto", node)) && return command_name(node.parentelement)
    Symbol(findfirst("proto/name", node).content)
end

function struct_name(node::Node)
    (!haskey(node, "category") || node["category"] ∉ ["struct", "union"]) &&
        return Symbol(struct_name(node.parentelement))
    Symbol(node["name"])
end

is_constant(node::Node) = any(split(node.content) .== "const")

name(node::Node) = Symbol(findfirst("./name", node).content)

"""
Semantically translate C types to their Julia counterpart.
Note that since it is a semantic translation, translated types
do not necessarily have the same layout, e.g. VkBool32 => Bool (8 bits).
"""
function translate_c_type(ctype)
    @match ctype begin
        :int => :Int
        x::Symbol && if startswith(string(x), "uint") && endswith(string(x), "_t")
        end => Symbol(replace(string(x)[1:end-2], "uint" => "UInt"))
        x::Symbol && if startswith(string(x), "int") && endswith(string(x), "_t")
        end => Symbol(replace(string(x)[1:end-2], "int" => "Int"))
        :(Ptr{$t}) => @match t begin
            :char => :Cstring
            x => :(Ptr{$(translate_c_type(x))})
        end
        :float => :Float32
        :double => :Float64
        :void => :Cvoid
        :size_t => :UInt
        :char => :Char
        x => x
    end
end

function innermost_type(t)
    @match t begin
        ::Symbol => t
        :($T{$p}) => innermost_type(p)
        _ => error("Cannot take innermost type of $t")
    end
end

is_ptr_to_ptr(ex) = !isnothing(ptrtype(ptrtype(ex)))
is_ptr(ex) = !isnothing(ptr_type(ex))

ptr_type(ex) = @when :(Ptr{$T}) = ex T
ntuple_type(ex) = @when :(NTuple{$N,$T}) = ex T

is_ntuple(ex) = !isnothing(ntuple_type(ex))
