defmodule Bowling do

  def roll(_, 0), do: 0
  def roll(score, roll_count), do: score + roll(score, roll_count - 1)

end
