tmp = tempname() * ".jl"
@testset "Include wrapper" begin
    !write(VulkanWrapper(), tmp; format=false)
end

@eval module Wrapper
    using VulkanCore
    using VulkanCore.vk

    using Base: cconvert, unsafe_convert, RefArray
    include($tmp)
end
