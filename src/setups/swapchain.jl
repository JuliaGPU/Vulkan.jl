mutable struct SwapchainSetup <: Setup
    handle::SwapchainKHR
    buffering::Int
    format::Format
    colorspace::ColorSpaceKHR
    extent::Extent2D
    layers::Int
    usage::ImageUsageFlags
    sharing_mode::SharingMode
    present_mode::PresentModeKHR
    clipped::Bool
    images::Array{Image, 1}
    image_views::Array{ImageView, 1}
    function SwapchainSetup(args...)
        ss = new(args...)
        finalizer(ss) do x
            finalize.(x.image_views)
            finalize(x.handle)
        end
    end
end
