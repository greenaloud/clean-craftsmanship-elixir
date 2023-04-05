defmodule Bowling do

  defstruct pins: []

  def roll(%Bowling{} = bowling, _, 0), do: bowling
  def roll(%Bowling{} = bowling, score, roll_count) do
    cur = %Bowling{ pins: bowling.pins ++ [score] }
    roll(cur, score, roll_count - 1)
  end

  def get_score(%Bowling{} = bowling), do: calculate_score(bowling.pins)

  defp calculate_score([]), do: 0
  defp calculate_score([ first, second, third | tail]) when first + second == 10 do
    frame_score = first + second + third
    frame_score + calculate_score([ third | tail ])
  end
  defp calculate_score([ head | tail ]), do: head + calculate_score(tail)

end
