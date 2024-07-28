# This file is a generator for ext/VulkanColorTypesExt.jl.

if !isinteractive()
  using Pkg
  Pkg.activate(temp = true); Pkg.add(["ColorTypes", "FixedPointNumbers"]); Pkg.develop(path = dirname(@__DIR__))
end

using Vulkan: Vk
using ColorTypes
using FixedPointNumbers
using StaticArrays

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

function generate_vector_formats()
  vk_formats = Pair{Vk.Format,Type}[]
  vector_types = Pair{Type,Vk.Format}[]
  ispermuted(pattern) = pattern[1] ≠ :R
  for color_width in (8, 16, 32, 64)
    for numeric_format in NUMERIC_FORMATS
      rgb_orders = [[:R, :G], [:R, :G, :B], [:G, :B, :G, :R], [:B, :G, :R, :G]]
      rgb_orders_with_alpha = filter(order -> length(order) == 3, rgb_orders)
      color_patterns = [rgb_orders; [[:A; order] for order in rgb_orders_with_alpha]; [[order; :A] for order in rgb_orders_with_alpha]]
      T = component_type(color_width, numeric_format)
      for color_pattern in color_patterns
        component_format = join(join.(zip(color_pattern, fill(color_width, 4))))
        format = Symbol(:FORMAT_, component_format, !allunique(color_pattern) ? "_422" : "", '_', numeric_format)
        if isdefined(Vk, format)
          val = getproperty(Vk, format)
          N = length(color_pattern)
          concrete_type = SVector{N,T}
          allunique(color_pattern) && push!(vk_formats, val => concrete_type)
          # These color patterns are already mapped to ColorTypes types.
          !in(color_pattern, ([:R, :G, :B], [:R, :G, :B, :A])) && push!(vector_types, concrete_type => val)
        end
      end
    end
  end
  vk_formats, vector_types
end

function generate_single_component_formats()
  vk_formats = Vk.Format[]
  julia_types = Type[]
  for color_width in (8, 16, 32, 64)
    for numeric_format in NUMERIC_FORMATS
      T = component_type(color_width, numeric_format)
      format = Symbol(:FORMAT_R, color_width, '_', numeric_format)
      if isdefined(Vk, format)
        val = getproperty(Vk, format)
        push!(vk_formats, val)
        push!(julia_types, T)
      end
    end
  end
  vk_formats, julia_types
end

function print_mapping(vk_formats, julia_types)
  if !isa(vk_formats, Vector{Pair{Vk.Format, Type}}) && !isa(julia_types, Vector{Pair{Type, Vk.Format}})
    mapping = sort(collect(Dict(vk_formats .=> julia_types)); by = first)
    mapping_formats = mapping
    mapping_types = reverse.(mapping)
  else
    mapping_formats = vk_formats
    mapping_types = julia_types
  end
  for (format, T) in mapping_formats
    println("Vk.Format(::Type{", T, "}) = ", replace(repr(format), "Vulkan" => "Vk"))
  end
  println()
  for (T, format) in mapping_types
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

  printstyled("\nVector formats:\n"; color = :yellow)
  vk_formats, packed_types = generate_vector_formats()
  print_mapping(vk_formats, packed_types)

  printstyled("\nSingle-component formats:\n"; color = :yellow)
  vk_formats, julia_types = generate_single_component_formats()
  print_mapping(vk_formats, julia_types)
end

main()
