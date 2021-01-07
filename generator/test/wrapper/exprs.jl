f = :(f(x, y=3; a, b=5) = 50)
f2 = :(function f(x); println(2); return 5; end)

s = :(mutable struct HandleType
          handle::Ptr{Nothing}
      end)

c = :(const sym = val)

e = :(@enum myenum a b c d)
e2 = :(@cenum myotherenum::Int begin; a=1; b=2; c=3; d=4; end)

@testset "Expressions" begin
    include("exprs/utils.jl")
    include("exprs/deconstruct.jl")
    include("exprs/reconstruct.jl")
end

