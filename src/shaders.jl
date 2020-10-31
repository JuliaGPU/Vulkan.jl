abstract type ShaderFormat end

abstract type BinaryFormat <: ShaderFormat end
abstract type TextFormat <: ShaderFormat end

struct GLSL <: TextFormat
    stage
end
GLSL() = GLSL(nothing)

struct HLSL <: TextFormat
    stage
end
HLSL() = HLSL(nothing)

struct SPIRV <: BinaryFormat end

struct ShaderCompilationError <: Exception
    msg
end

Base.showerror(io::IO, err::ShaderCompilationError) = print(io, "shader compilation failed:\n\n$(err.msg)")

function ShaderModule(device, file, ::SPIRV)
    filesize = stat(file).size
    code = Array{UInt8}(undef, cld(filesize, 4))
    open(file) do io
        readbytes!(io, code, filesize)
    end
    # @info code
    ShaderModule(device, ShaderModuleCreateInfo(filesize, reinterpret(UInt32, code)))
end
ShaderModule(device, file, format::T) where {T <: TextFormat} = ShaderModule(device, compile(file, format), SPIRV())

function compile(file, T::GLSL; extra_flags=[], validate_spirv=true)
    flags = ["-V"]
    validate_spirv && "--spirv-val" ∉ extra_flags ? push!(flags, "--spirv-val") : nothing
    dst = tempname()
    err = IOBuffer()
    try
        run(pipeline(`$glslangValidator $flags -o $dst $file`, stdout=err))
    catch e
        e isa ProcessFailedException
        err_str = String(take!(err))
        throw(ShaderCompilationError(err_str))
    end
    dst
end
compile(file, ::HLSL) = compile(file, GLSL(), extra_flags=["-D"])

stage_mapping(T::Type{<: TextFormat}, ext) = ".$ext" => T(ext)

const glsl_stage_extensions = [
    "vert",   # vertex shader
    "tesc",   # tessellation control shader
    "tese",   # tessellation evaluation shader
    "geom",   # geometry shader
    "frag",   # fragment shader
    "comp",   # compute shader
    "mesh",   # mesh shader
    "task",   # task shader
    "rgen",   # ray generation shader
    "rint",   # ray intersection shader
    "rahit",  # ray any hit shader
    "rchit",  # ray closest hit shader
    "rmiss",  # ray miss shader
    "rcall",  # ray callable shader
]

const stage_mappings = Dict(
    ".spv" => SPIRV(),
    stage_mapping.(GLSL, glsl_stage_extensions)...
)

function shader_modules(device, files; log_f=nothing)
    modules = ShaderModule[]
    for (i, file) ∈ enumerate(files)
        ext = last(splitext(file))
        format = stage_mappings[ext]
        !isnothing(log_f) && log_f(format, file)
        push!(modules, ShaderModule(device, file, format))
    end
    !isnothing(log_f) && log_f()
    modules
end
