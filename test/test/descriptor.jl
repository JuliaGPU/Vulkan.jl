function setupDescriptorPool(device)
    # We need to tell the API the number of max. requested descriptors per type
    # This example only uses one descriptor type (uniform buffer) and only
    # requests one descriptor of this type
    typeCounts = create(Vector{api.VkDescriptorPoolSize}, (
        :_type, api.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
        :descriptorCount, 1
    ))
    # For additional types you need to add new entries in the type count list
    # E.g. for two combined image samplers :
    # typeCounts[1].type = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER
    # typeCounts[1].descriptorCount = 2

    # Create the global descriptor pool
    # All descriptors used in this example are allocated from this pool

    CreateDescriptorPool(device, C_NULL, (
        :poolSizeCount, 1,
        :pPoolSizes, typeCounts,
        # Set the max. number of sets that can be requested
        # Requesting descriptors beyond maxSets will result in an error
        :maxSets, 1
    ))
end


function setupDescriptorSetLayout(device)
    # Setup layout of descriptors used in this example
    # Basically connects the different shader stages to descriptors
    # for binding uniform buffers, image samplers, etc.
    # So every shader binding should map to one descriptor set layout
    # binding
    # Binding 0 : Uniform buffer (Vertex shader)

    layoutBinding = create(Vector{api.VkDescriptorSetLayoutBinding}, (
        :descriptorType, api.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
        :descriptorCount, 1,
        :stageFlags, api.VK_SHADER_STAGE_VERTEX_BIT,
        :pImmutableSamplers, C_NULL,
        :binding, 0,
    ))

    descriptorSetLayout = [CreateDescriptorSetLayout(device, C_NULL, (
        :bindingCount, 1,
        :pBindings, layoutBinding
    ))]
    # Create the pipeline layout that is used to generate the rendering pipelines that
    # are based on this descriptor set layout
    # In a more complex scenario you would have different pipeline layouts for different
    # descriptor set layouts that could be reused
	pipelineLayout = CreatePipelineLayout(device, C_NULL, (
        :setLayoutCount, 1,
        :pSetLayouts, descriptorSetLayout
    ))
    descriptorSetLayout[], pipelineLayout
end

function allocate_descriptor_set(device, info_args::Tuple)
    descriptorSet_ref = Ref{api.VkDescriptorSet}(C_NULL)
    allocation_info = create(api.VkDescriptorSetAllocateInfo, info_args)
    err = api.vkAllocateDescriptorSets(device, allocation_info, descriptorSet_ref)
    check(err)
    descriptorSet_ref[]
end

function setupDescriptorSet(device, descriptorPool, descriptorSetLayout, ubo)
    # Update descriptor sets determining the shader binding points
    # For every binding point used in a shader there needs to be one
    # descriptor set matching that binding point

    setlayout_ref = [descriptorSetLayout]
    descriptor_set = allocate_descriptor_set(device, (
        :descriptorPool, descriptorPool,
        :descriptorSetCount, 1,
        :pSetLayouts, setlayout_ref,
    ))

    ubo_descriptor_ar = get_descriptor(ubo)
    write_descriptor_set = create(api.VkWriteDescriptorSet, (
        # Binding 0 : Uniform buffer
        :dstSet, descriptor_set,
        :descriptorCount, 1,
        :descriptorType, api.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
        :pBufferInfo, ubo_descriptor_ar,
        # Binds this uniform buffer to binding point 0
        :dstBinding, 0,
    ))

    api.vkUpdateDescriptorSets(device, 1, write_descriptor_set, 0, C_NULL)

    descriptor_set
end
