abstract type ShaderFormat end

abstract type BinaryFormat <: ShaderFormat end
abstract type TextFormat <: ShaderFormat end

struct GLSL <: TextFormat end
struct HLSL <: TextFormat end
struct SPIRV <: BinaryFormat end

function Vulkan.ShaderModule(device, file, ::SPIRV)
    filesize = stat(file).size
    code = Array{UInt8}(undef, cld(filesize, 4))
    open(file) do io
        readbytes!(io, code, filesize)
    end
    # @info code
    ShaderModule(device, ShaderModuleCreateInfo(filesize, reinterpret(UInt32, code)))
end