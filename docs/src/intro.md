# Introduction

## What is Vulkan?

[Vulkan](https://www.khronos.org/vulkan/) is a graphics and compute specification, targeting a broad range of GPUs [and even CPUs](https://github.com/google/swiftshader). It aims to provide a cross-platform API that can be used from PCs, consoles, mobile phones and embedded platforms. It can be thought of as the new generation of [OpenGL](https://www.opengl.org//) with the compute capabilities of [OpenCL](https://www.khronos.org/opencl/). It should be noted that Vulkan is merely a specification and therefore, there does not exist only one Vulkan library but rather multiple device-dependent implementations conforming to a unique standard. The version of the Vulkan implementation you may be using thus depends on the graphics drivers installed on your system.

The power of this standard lies in the genericity it guarantees to anything that builds from it. This is a direct consequence of a thorough testing of vendor implementations, which must be compatible with the specification in every detail. Therefore, tools that are developped for Vulkan can be used throughout the entire ecosystem, available for [all devices that support Vulkan](https://vulkan.gpuinfo.org/).

## Compute and graphics interface

### SPIR-V

To describe how graphics and compute programs should be executed by devices, Vulkan relies on the [Standard Portable Intermediate Representation](https://www.khronos.org/registry/spir-v/) (SPIR-V) format. This is another specification, whose aim is to free hardware vendors from having to build their own compiler for every shading/compute language, whose implementations were not always coherent with one another. It is a binary format, making it easier to generate assembly code from than text-based formats (such as GLSL and HLSL).

SPIR-V is not a language, but rather a binary format that higher level languages can compile to. It can be targeted from shading languages; for example, see Khronos' [glslang](https://github.com/KhronosGroup/glslang) and Google's [shaderc](https://github.com/KhronosGroup/glslang) for GLSL/HLSL. SPIR-V features a large [suite of tools](https://github.com/KhronosGroup/SPIRV-Tools), designed to ease the manipulation of SPIR-V programs. It includes an optimizer, spirv-opt, alleviating the need for hardware vendors to have their own SPIR-V optimizer.

SPIR-V is notably suited to cross-compilation among shading languages (see [SPIR-V Cross](https://github.com/KhronosGroup/SPIRV-Cross)).

### SPIR-V and LLVM

SPIR-V is similar to LLVM IR, for which there exists a [bi-directional translator](https://github.com/KhronosGroup/SPIRV-LLVM-Translator). However, not all SPIR-V concepts are mappable to LLVM IR, so not all of SPIR-V can be translated. Currently, only the OpenCL part of SPIR-V is supported by this translator (see [this issue](https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/369)), missing essential features required by Vulkan. If (or when) Vulkan is supported, Julia code could be compiled to LLVM, translated to SPIR-V and executed from any supported Vulkan device, be it for graphics or compute jobs. For the moment, SPIR-V modules to be consumed by Vulkan are usually compiled from other shading languages.
