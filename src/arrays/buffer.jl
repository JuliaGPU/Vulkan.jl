function CreateBuffer(device, container, usage, allocators=C_NULL)
    CreateBuffer(device, allocators, (
        :size, sizeof(container),
        :usage, usage
    ))
end
