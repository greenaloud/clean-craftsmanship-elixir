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

  test "Roll spare two times and 3 for 16times" do
    score = %Bowling{}
    |> spare()
    |> spare()
    |> Bowling.roll(3, 16)
    |> Bowling.get_score()

    assert(score === 10 + 5 + 10 + 3 + 3*16)
  end

  test "strike, 2*18" do
    score = %Bowling{}
    |> strike()
    |> Bowling.roll(2, 18)
    |> Bowling.get_score()

    assert(score === 10 + 2 + 2 + 2*18)
  end

  defp strike(%Bowling{} = bowling), do: Bowling.roll(bowling, 10, 1)
  defp spare(%Bowling{} = bowling), do: Bowling.roll(bowling, 5, 2)
end
