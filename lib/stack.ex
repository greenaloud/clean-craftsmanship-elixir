defmodule Stack do
  defstruct [ elements: [] ]

  def new, do: %Stack{}

  def is_empty?(%Stack{ elements: [] }), do: :true
  def is_empty?(%Stack{ elements: [ _head | _tail ] }), do: :false

  def push(stack = %Stack{}, e) do
    %Stack{ elements: [ e | stack.elements ] }
  end

  def pop(%Stack{ elements: [] }) do
    raise("Stack Underflow.")
  end
  def pop(%Stack{ elements: [ head | _tail ]}) do
    head
  end
end
