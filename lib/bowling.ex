defmodule Bowling do

  defstruct pins: []

  def roll(%Bowling{} = bowling, _, 0), do: bowling
  def roll(%Bowling{ pins: pins }, score, roll_count) do
    cur = %Bowling{ pins: pins ++ [score] }
    roll(cur, score, roll_count - 1)
  end

  def get_score(%Bowling{ pins: pins }), do: calculate_score(pins)

  defp calculate_score([ first, second | [] ]), do: first + second
  defp calculate_score([ first, second, third | [] ]), do: first + second + third
  defp calculate_score([ first, second, third | tail ]) when first === 10 do
    frame_score = first + second + third
    frame_score + calculate_score([ second, third | tail ])
  end
  defp calculate_score([ first, second, third | tail ]) when first + second == 10 do
    frame_score = first + second + third
    frame_score + calculate_score([ third | tail ])
  end
  defp calculate_score([ first, second | tail ]), do: first + second + calculate_score(tail)

end
