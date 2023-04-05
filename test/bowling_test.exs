defmodule BowlingTest do
  use ExUnit.Case

  import Bowling

  test "Roll 0 20 times" do
    score = Bowling.roll(0, 20)
    assert(score === 0)
  end

  test "Roll 4 20 times" do
    score = Bowling.roll(4, 20)
    assert(score == 80)
  end
end
