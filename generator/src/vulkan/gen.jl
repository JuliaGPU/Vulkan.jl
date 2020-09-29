function statements(ci::CreateInfo)
    stype_arg = stypes[ci.sdef.name]
    args = collect(keys(ci.sdef.fields))
    args_replaced = args |> Map(x -> replace_count_argument(args, x)) |> collect
    [Statement("create_info = $(ci.sdef.name)($stype_arg, $(join_args(args_replaced)))", :create_info, args_replaced),
    Statement("create_info_ptr = Ref(create_info)", :create_info_ptr, [:create_info])]
end

function statements(create::Create)
    type = create.type # e.g. Device
    ptr_type_vk = "p_ " * convert(SnakeCaseLower, "$type ").value # e.g. p_device
    ptr_type = convert(SnakeCaseLower, "$type ").value * "_ptr" # e.g. device_ptr
    s1 = Statement("$ptr_type_sym = Ref{$type }()", ptr_type, [])
    args = argnames(create.f.signature)
    args_with_ci = args |> Map(x -> convert(SnakeCaseLower, CamelCaseLower("$x")).value) |> Map(x -> startswith(x, "p_") ? x * "_ptr" : x) |> collect
    s2 = Statement("@check $(create.f.name)($(join_args(args_with_ci)))", nothing, ["create_info", ptr_type])
    [s1, s2]
end

function statements(f::Finalizer)
    args = argnames(f.f.signature)
    @assert f.x ∈ args "Finalized variable $(f.x) not in method arguments"
    finalizer_args = args |> Map(x -> x == f.x ? "x" : x) |> collect
    [Statement("Base.finalizer(x -> $(f.f.name)($(join_args(finalizer_args))), $(f.x))", nothing, filter(x -> x != f.x, finalizer_args))]
end

function statements(pats::AbstractArray{<: Pattern})
    stmts = Statement[]
    for pat ∈ pats
        append!(stmts, statements(pat))
    end
end