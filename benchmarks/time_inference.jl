using SnoopCompile
@time_imports using Vulkan

tinf = @snoopi_deep include("../test/runtests.jl");
fl = flatten(tinf)
summary = last(accumulate_by_source(fl), 10)
accumulate_by_source(fl)
itrigs = inference_triggers(tinf)
filtermod(Vulkan, itrigs)

tinf_load = @snoopi_deep using Vulkan
fl_load = flatten(tinf_load)
summary_load = last(accumulate_by_source(fl_load), 10)
