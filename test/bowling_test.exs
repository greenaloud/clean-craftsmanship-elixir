defmodule BowlingTest do
  use ExUnit.Case

  import Bowling

  test "Roll 0 20 times" do
    score = %Bowling{}
    |> Bowling.roll(0, 20)
    |> Bowling.get_score()

    assert(score === 0)
  end

  test "Roll 4 20 times" do
    score = %Bowling{}
    |> Bowling.roll(4, 20)
    |> Bowling.get_score()

    assert(score == 80)
  end

  test "Roll spare and 4 for 18times" do
    score = %Bowling{}
    |> Bowling.roll(5, 2)
    |> Bowling.roll(4, 18)
    |> Bowling.get_score()

    assert(score == 82 + 4)
  end
end
