using SnoopCompile

tinf = @snoopi_deep include("../test/runtests.jl");

fl = flatten(tinf)
