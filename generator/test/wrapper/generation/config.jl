wrapper_config(; kwargs...) = WrapperConfig(; destfile="", kwargs...)

@test isempty(extensions(wrapper_config(wrap_core=false)))
@test length(extensions(wrapper_config())) > 200
@test length(extensions(wrapper_config(wrap_core=false, include_platforms=[PLATFORM_VI]))) < 5
@test length(extensions(wrapper_config(include_provisional_exts=true))) > length(extensions(wrapper_config()))
@test extensions(wrapper_config(include_provisional_exts=true)) == extensions(wrapper_config(include_platforms=[PLATFORM_PROVISIONAL]))
