struct ShaderCompilationError <: Exception
    msg
end

Base.showerror(io::IO, err::ShaderCompilationError) = print(io, "ShaderCompilationError:\n\n$(err.msg)")

function ShaderModule(device, shader::ShaderFile{SPIRV})
    filesize = stat(shader.file).size
    code = Array{UInt8}(undef, cld(filesize, 4))
    open(shader.file) do io
        readbytes!(io, code, filesize)
    end
    ShaderModule(device, ShaderModuleCreateInfo(filesize, reinterpret(UInt32, code)))
end

ShaderModule(device, shader::ShaderFile{<:TextFormat}) = ShaderModule(device, compile(shader))

"""
    compile(shader)

Compile a shader file in text format to SPIR-V.
"""
function compile(shader::ShaderFile{GLSL}; extra_flags=[], validate_spirv=true)::ShaderFile{SPIRV}
    if !isfile(shader.file)
        throw(ArgumentError("File $(shader.file) does not exist"))
    end

    flags = ["-V"]
    validate_spirv && "--spirv-val" ∉ extra_flags ? push!(flags, "--spirv-val") : nothing
    dst = tempname()
    err = IOBuffer()
    try
        run(pipeline(`$glslangValidator $flags -o $dst $(shader.file)`, stdout=err))
    catch e
        e isa ProcessFailedException
        err_str = String(take!(err))
        throw(ShaderCompilationError(err_str))
    end
    ShaderFile(dst, SPIRV(), shader.stage)
end

compile(shader::ShaderFile{HLSL})::ShaderFile{SPIRV} = compile(convert(ShaderFile{GLSL}, shader), extra_flags=["-D"])
