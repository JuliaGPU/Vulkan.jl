using Vulkan, Test
using Vulkan: depends_on

mutable struct TestHandleNoParent <: Handle
  vks::Ptr{Cvoid}
  refcount::Vk.RefCounter
  destructor
end
TestHandleNoParent(vks::Ptr{Cvoid}, refcount::Vk.RefCounter) = TestHandleNoParent(vks, refcount, undef)
TestHandleNoParent() = TestHandleNoParent(Ptr{Cvoid}(rand(UInt)), signal_destroyed)

mutable struct TestHandleWithParent <: Handle
  vks::Ptr{Cvoid}
  parent::Handle
  refcount::Vk.RefCounter
  destructor
end
TestHandleWithParent(vks::Ptr{Cvoid}, parent::Handle, refcount::Vk.RefCounter) = TestHandleWithParent(vks, parent, refcount, undef)
TestHandleWithParent(parent) = TestHandleWithParent(Ptr{Cvoid}(rand(UInt)), signal_destroyed, parent)

destroyed = IdDict{Union{TestHandleNoParent,TestHandleWithParent}, Nothing}()
signal_destroyed(x) = setindex!(destroyed, nothing, x)

@testset "Handles" begin
  function test_no_dependency(x, handle)
    @test !haskey(destroyed, x)
    @test !haskey(destroyed, handle)
    finalize(x)
    @test haskey(destroyed, x)
    @test !haskey(destroyed, handle)
    finalize(handle)
    @test haskey(destroyed, handle)
  end

  # Test that `handle` being finalized before `x` doesn't destroy `handle`.
  function test_dependency_respected(x, handle)
    @test !haskey(destroyed, x)
    @test !haskey(destroyed, handle)
    finalize(handle)
    @test !haskey(destroyed, x)
    @test !haskey(destroyed, handle)
    finalize(x)
    @test haskey(destroyed, x)
    @test haskey(destroyed, handle)
  end

  # Test that `x` being finalized acts as if there were no dependency.
  function test_dependency_nonintrusive(x, handle)
    @test !haskey(destroyed, x)
    @test !haskey(destroyed, handle)
    finalize(x)
    @test haskey(destroyed, x)
    @test !haskey(destroyed, handle)
    finalize(handle)
    @test haskey(destroyed, handle)
  end

  handle = TestHandleNoParent()
  x = TestHandleNoParent()
  test_no_dependency(x, handle)

  handle = TestHandleNoParent()
  x = TestHandleNoParent()
  test_no_dependency(handle, x)

  handle = TestHandleNoParent()
  x = TestHandleWithParent(handle)
  test_dependency_respected(x, handle)

  handle = TestHandleNoParent()
  x = TestHandleWithParent(handle)
  test_dependency_nonintrusive(x, handle)

  handle = TestHandleNoParent()
  x = TestHandleNoParent()
  depends_on(x, handle)
  test_dependency_respected(x, handle)

  handle = TestHandleNoParent()
  x = TestHandleNoParent()
  depends_on(x, handle)
  test_dependency_nonintrusive(x, handle)

  handle = TestHandleNoParent()
  x = TestHandleNoParent()
  depends_on(x, handle)
  depends_on(x, handle)
  test_dependency_respected(x, handle)

  handle = TestHandleNoParent()
  x = TestHandleNoParent()
  depends_on(x, handle)
  depends_on(x, handle)
  test_dependency_nonintrusive(x, handle)

  # Circular dependency: no handle in a given dependency chain will ever be destroyed.
  handle = TestHandleNoParent()
  x = TestHandleNoParent()
  depends_on(handle, x)
  depends_on(x, handle)
  finalize(x)
  finalize(handle)
  @test !haskey(destroyed, x)
  @test !haskey(destroyed, handle)
end;
