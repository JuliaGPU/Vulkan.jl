#=

# Compile SPIR-V shaders

Vulkan requires shaders to be in SPIR-V form. We will showcase how to compile shaders into SPIR-V using `glslang` from Julia.

Let's first define a GLSL shader:

=#

shader_code = """
#version 450

layout(location = 0) in vec2 pos;
layout(location = 0) out vec4 color;

void main() {
    color = vec4(pos, 0.0, 1.0);
}
""";

# We will use `glslang` to compile this code into a SPIR-V binary file. First, get the path to the binary.

using glslang_jll: glslangValidator
glslang = glslangValidator(identity)

# Fill in an `IOBuffer` with the shader code (to be used as standard input).

_stdin = IOBuffer()
write(_stdin, shader_code)
seekstart(_stdin)
flags = ["--stdin"]

# Specify which kind of shader we are compiling. Here, we have Vulkan-flavored GLSL, and we will indicate that it is a vertex shader. If your shader is written in HLSL instead of GLSL, you should also provide an additional `"-D"` flag.

push!(flags, "-V", "-S", "vert");

# Use a temporary file as output, as `glslang` does not yet support outputting code to stdout.

path = tempname()
push!(flags, "-o", path)

# Run `glslang`.

run(pipeline(`$glslang $flags`, stdin = _stdin))

# Read the code and clean the temporary file.

spirv_code = reinterpret(UInt32, read(path))
rm(path)
@assert first(spirv_code) == 0x07230203 # SPIR-V magic number
spirv_code
