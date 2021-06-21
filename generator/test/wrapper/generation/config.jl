@test isempty(extensions(WrapperConfig(wrap_core=false)))
@test length(extensions(WrapperConfig())) > 200
@test length(extensions(WrapperConfig(wrap_core=false, include_platforms=[PLATFORM_VI]))) < 5
@test length(extensions(WrapperConfig(include_provisional_exts=true))) > length(extensions(WrapperConfig()))
@test extensions(WrapperConfig(include_provisional_exts=true)) == extensions(WrapperConfig(include_platforms=[PLATFORM_PROVISIONAL]))
