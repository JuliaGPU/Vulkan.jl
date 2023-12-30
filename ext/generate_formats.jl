# This file is a generator for ext/VulkanColorTypesExt.jl.

if !isinteractive()
  using Pkg
  Pkg.activate(temp = true); Pkg.add(["ColorTypes", "FixedPointNumbers"]); Pkg.develop(path = dirname(@__DIR__))
end

using Vulkan: Vk
using ColorTypes
using FixedPointNumbers

NUMERIC_FORMATS = [:SNORM, :UNORM, :UFLOAT, :SFLOAT] #, :UINT, :SINT, :USCALED, :SSCALED]

function component_type(width, numeric_format)
  if numeric_format in (:SNORM, :UNORM)
    baseT = getproperty(Base, Symbol(numeric_format == :SNORM ? :Int : :UInt, width))
    T = numeric_format == :SNORM ? Fixed : Normed
    nbits = numeric_format == :SNORM ? width - 1 : width
    T{baseT, nbits}
  else
    width == 8 ? N0f8 : getproperty(Base, Symbol(:Float, width))
  end
end

function generate_color_formats()
  vk_formats = Vk.Format[]
  color_types = Type[]
  for color_width in (8, 16, 32, 64)
    for numeric_format in NUMERIC_FORMATS
      rgb_orders = [[:R, :G, :B], [:B, :G, :R]]
      color_patterns = [rgb_orders; [[:A; order] for order in rgb_orders]; [[order; :A] for order in rgb_orders]]
      T = component_type(color_width, numeric_format)
      for color_pattern in color_patterns
        component_format = join(join.(zip(color_pattern, fill(color_width, 4))))
        format = Symbol(:FORMAT_, component_format, '_', numeric_format)
        if isdefined(Vk, format)
          val = getproperty(Vk, format)
          color_type = getproperty(ColorTypes, Symbol(join(color_pattern)))
          concrete_type = color_type{T}
          push!(vk_formats, val)
          push!(color_types, concrete_type)
        end
      end
    end
  end
  vk_formats, color_types
end

function generate_packed_formats()
  vk_formats = Vk.Format[]
  packed_types = DataType[]
  for format in instances(Vk.Format)
    m = match(r"PACK(8|16|32)", string(format))
    isnothing(m) && continue
    width = m[1]
    T = getproperty(Base, Symbol(:UInt, width))
    push!(vk_formats, format)
    push!(packed_types, T)
  end
  vk_formats, packed_types
end

function generate_other_formats()
  vk_formats = Vk.Format[]
  julia_types = Type[]
  for color_width in (8, 16, 32, 64)
    for numeric_format in NUMERIC_FORMATS
      T = component_type(color_width, numeric_format)
      patterns = [[:R], [:R, :G], [:G, :B, :G, :R], [:B, :G, :R, :G]]
      for pattern in patterns
        component_format = join(join.(zip(pattern, fill(color_width, length(pattern)))))
        format = Symbol(:FORMAT_, component_format, length(pattern) == 4 ? "_422" : "", '_', numeric_format)
        if isdefined(Vk, format)
          val = getproperty(Vk, format)
          julia_type = length(pattern) == 1 ? T : NTuple{length(pattern), T}
          push!(vk_formats, val)
          push!(julia_types, julia_type)
        end
      end
    end
  end
  vk_formats, julia_types
end

function print_mapping(vk_formats, julia_types)
  mapping = sort(collect(Dict(vk_formats .=> julia_types)); by = first)
  for (format, T) in mapping
    println("Vk.Format(::Type{", T, "}) = ", replace(repr(format), "Vulkan" => "Vk"))
  end
  println()
  for (format, T) in mapping
    println("Vk.format_type(::Val{", replace(repr(format), "Vulkan" => "Vk"), "}) = ", T)
  end
end

function main()
  printstyled("\nColor formats:\n"; color = :yellow)
  vk_formats, color_types = generate_color_formats()
  print_mapping(vk_formats, color_types)

  printstyled("\nPacked formats:\n"; color = :yellow)
  vk_formats, packed_types = generate_packed_formats()
  print_mapping(vk_formats, packed_types)

  printstyled("\nOther formats:\n"; color = :yellow)
  vk_formats, julia_types = generate_other_formats()
  print_mapping(vk_formats, julia_types)
end

main()
