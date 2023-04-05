defmodule BowlingTest do
  use ExUnit.Case

  import Bowling

  test "Roll 0 20 times" do
    score = Bowling.roll(0, 20)
    assert(score === 0)
  end
end
