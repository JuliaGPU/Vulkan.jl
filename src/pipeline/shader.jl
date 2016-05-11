const shader_cache = []
function loadShaderGLSL(fileName, device::api.VkDevice, stage::api.VkShaderStageFlagBits)
	shaderCode = open(fileName) do io
        readbytes(io)
    end
	if (length(shaderCode) < 1)
        error("$filename is empty and doesn't contain a shader!")
    end
    push!(shaderCode, 0) #append 0 terminator
    # Magic SPV number for shader code header
    pcode = UInt32[0x07230203, 0, stage]

    # now append the shader code to the header
    append!(pcode, reinterpret(UInt32, shaderCode))
    # create the shader
    shadermodule = CreateShaderModule(device, C_NULL;
        sType = api.VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO,
        codeSize = sizeof(pcode),
        pCode = pcode
    )

    shaderStage = create(api.VkPipelineShaderStageCreateInfo,
        sType = api.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
        stage = stage,
        _module = shadermodule,
        pName = "main",
    )
    push!(shader_cache, shadermodule)
    push!(shader_cache, pcode)

	return shaderStage[]
end
function loadShader(fileName, device::Device, stage::api.VkShaderStageFlagBits)
	shaderCode = open(fileName) do io
        readbytes(io)
    end
	if (length(shaderCode) < 1)
        error("$filename is empty and doesn't contain a shader!")
    end
    pcode = reinterpret(UInt32, shaderCode)
    # create the shader
    shadermodule = CreateShaderModule(device, C_NULL, (
        :codeSize, sizeof(pcode),
        :pCode, pcode
    ))
    if shadermodule == C_NULL
        error("Shader module not created successfully")
    end
    shaderStage = create(api.VkPipelineShaderStageCreateInfo, (
        :stage, stage,
        :_module, shadermodule,
        :pName, "main",
    ))
    push!(shader_cache, shadermodule)
    push!(shader_cache, pcode)

	return shaderStage[]
end
