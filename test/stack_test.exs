defmodule StackTest do
  use ExUnit.Case
  doctest CleanCraftsmanship

  import Stack
  test "nothing" do
  end

  test "new stack" do
    assert Stack.new() == %Stack{}
  end

  test "is_empty when first initialized" do
    st = Stack.new()
    assert Stack.is_empty?(st) == :true
  end

  test "can push" do
    st = Stack.new() |> Stack.push(1)
  end

  test "is_not_empty after push" do
    st = Stack.new() |> Stack.push(1)
    assert Stack.is_empty?(st) == :false
  end

  test "can pop" do
    popped = Stack.new() |> Stack.push(1) |> Stack.pop()
    assert popped == 1
  end

  test "pop raise error when stack is empty" do
    assert_raise RuntimeError, fn ->
      Stack.new() |> Stack.pop()
    end
  end

end
