defmodule BowlingTest do
  use ExUnit.Case

  import Bowling

  test "Roll 0 20 times" do
    bowling = Bowling.roll(%Bowling{}, 0, 20)
    score = Bowling.get_score(bowling)
    assert(score === 0)
  end

  test "Roll 4 20 times" do
    bowling = Bowling.roll(%Bowling{}, 4, 20)
    score = Bowling.get_score(bowling)
    assert(score == 80)
  end

  test "Roll spare and 4 for 18times" do
  end
end
