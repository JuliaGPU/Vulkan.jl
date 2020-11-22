Base.convert(::Type{ShaderFile{F1}}, shader::ShaderFile{F2}) where {F1<:TextFormat, F2<:TextFormat} = ShaderFile(shader.file, F1(), shader.stage)
