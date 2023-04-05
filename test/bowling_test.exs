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

  test "strike, spare, strike, spare, spare, 4*10" do
    score = %Bowling{}
    |> strike()
    |> spare()
    |> strike()
    |> spare()
    |> spare()
    |> Bowling.roll(4, 10)
    |> Bowling.get_score()

    assert(score === (10 + 5 + 5) + (10 + 10) + (10 + 5 + 5) + (10 + 5) + (10 + 4) + 4*10)
  end

  test "strike all" do
    score = %Bowling{}
    |> twelve_times(&BowlingTest.strike/1)
    |> Bowling.get_score()

    assert(score === 300)
  end

  test "10 strikes, spare" do
    score = %Bowling{}
    |> invoke(&BowlingTest.strike/1, 10)
    |> spare()
    |> Bowling.get_score()

    assert(score === 30*8 + (10 + 10 + 5) + (10 + 5 + 5))
  end

  def strike(%Bowling{} = bowling), do: Bowling.roll(bowling, 10, 1)
  defp spare(%Bowling{} = bowling), do: Bowling.roll(bowling, 5, 2)

  defp twelve_times(param, func), do: invoke(param, func, 12)

  defp invoke(param, func, 0), do: param
  defp invoke(param, func, remaining_invoke_count) do
    func.(param) |> invoke(func, remaining_invoke_count - 1)
  end
end
