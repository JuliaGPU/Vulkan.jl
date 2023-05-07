# This file is a generator for ext/VulkanColorTypesExt.jl.

using Pkg; Pkg.activate(temp = true); Pkg.add(["ColorTypes", "FixedPointNumbers"]); Pkg.develop(path = dirname(@__DIR__))

using Vulkan: Vk
using ColorTypes
using FixedPointNumbers

function main()
  vk_types = []
  color_types = []
  for color_width in (8, 16, 32, 64)
    for numeric_format in (:SNORM, :UNORM, :UFLOAT, :SFLOAT)#, :UINT, :SINT, :USCALED, :SSCALED)
      rgb_orders = [[:R, :G, :B], [:B, :G, :R]]
      color_patterns = [rgb_orders; [[:A; order] for order in rgb_orders]; [[order; :A] for order in rgb_orders]]
      for color_pattern in color_patterns
        component_format = join(join.(zip(color_pattern, fill(color_width, 4))))
        format = Symbol(:FORMAT_, component_format, '_', numeric_format)
        if isdefined(Vk, format)
          val = getproperty(Vk, format)
          color_type = getproperty(ColorTypes, Symbol(join(color_pattern)))
          component_type = if numeric_format in (:SNORM, :UNORM)
            baseT = getproperty(Base, Symbol(numeric_format == :SNORM ? "" : "U", :Int, color_width))
            T = numeric_format == :SNORM ? Fixed : Normed
            nbits = numeric_format == :SNORM ? color_width - 1 : color_width
            T{baseT, nbits}
          else
            color_width == 8 ? N0f8 : getproperty(Base, Symbol(:Float, color_width))
          end
          concrete_type = color_type{component_type}
          push!(color_types, concrete_type)
          push!(vk_types, val)
        end
      end
    end
  end
  vk_types, color_types
end

vk_types, color_types = main()
res = collect(Dict(vk_types .=> color_types))

display(sort(res, by = first))
display(sort(reverse.(res), by = last))
