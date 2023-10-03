mapping_args(ts) = :(@nospecialize(_::Union{$((:(Type{$t}) for t in ts)...)}))

function HLTypeMapping(spec)
    ts = [spec.name]
    has_intermediate_type(spec) && push!(ts, struct_name(spec))
    ex = :(hl_type($(mapping_args(ts))) = $(struct_name(spec, true)))
    HLTypeMapping(spec, ex)
end

function CoreTypeMapping(spec)
    ts = [spec.name, struct_name(spec, true)]
    has_intermediate_type(spec) && push!(ts, struct_name(spec))
    ex = :(core_type($(mapping_args(ts))) = $(spec.name))
    CoreTypeMapping(spec, ex)
end

function IntermediateTypeMapping(spec)
    ts = [struct_name(spec, true), spec.name]
    ex = :(intermediate_type($(mapping_args(ts))) = $(struct_name(spec)))
    IntermediateTypeMapping(spec, ex)
end
